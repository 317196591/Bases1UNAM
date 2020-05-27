CREATE OR REPLACE FUNCTION fn_dise�o_fisico() RETURNS VOID
LANGUAGE SQL
AS
$$
	--================================================================================
	--AUTORES: solucionesTI_AAAA
	--BD:PROYECTO_PAPELERIA
	--DESCRIPCI�N: Dise�o f�sico de la base de datos.
	--FECHA DECREACI�N 
	--================================================================================

	---------------------------------------------------------------------
	CREATE TABLE CATEGORIA( --TABLA_1
		 id_categoria	  INT GENERATED ALWAYS AS IDENTITY NOT NULL
		,nombre_categoria VARCHAR(60)		NOT NULL
		,descripcion      VARCHAR(100) 
		,CONSTRAINT PK_CATEGORIA PRIMARY KEY(id_categoria)
	);
	---------------------------------------------------------------------
	CREATE TABLE PROVEEDORES(--TABLA_2
		 id_proveedor INT GENERATED ALWAYS AS IDENTITY NOT NULL
		,razon_social VARCHAR(100)		NOT NULL
		,domicilio	  VARCHAR(300)		NOT NULL
		,nombre		  VARCHAR(100)		NOT NULL
		,CONSTRAINT PK_PROVEEDORES PRIMARY KEY(id_proveedor)
	);
	---------------------------------------------------------------------
	CREATE TABLE TELEFONO_PROVEEDORES(--TABLA_3
		 id_proveedor INT				NOT NULL
		,telefono	  VARCHAR(48)		NOT NULL
		,CONSTRAINT PK_TELEFONO_PROVEEDORES PRIMARY KEY(id_proveedor,telefono)
		,CONSTRAINT FK_TELEFONO_PROOVEDORES FOREIGN KEY(id_proveedor)
		 REFERENCES PROVEEDORES(id_proveedor)
	);
	---------------------------------------------------------------------
	CREATE TABLE PRODUCTOS( --TABLA_4
		 id_producto        INT GENERATED ALWAYS AS IDENTITY NOT NULL
		,nombre_producto	VARCHAR(50)		  NOT NULL		
		,precio_unitario 	DECIMAL	 		  NOT NULL	
		,id_categoria       INT				  NOT NULL
		,id_proveedor       INT               NOT NULL
		,codigo_barras 	    VARCHAR(100)	  UNIQUE NOT NULL
		,unidades_stock     INT 	 		  NOT NULL
		,marca		        VARCHAR(50)  --PUEDE SER NULL
		,descripcion	    VARCHAR(100) --PUEDE SER NULL
		,CONSTRAINT PK_PRODUCTOS PRIMARY KEY(id_producto,precio_unitario)
		,CONSTRAINT FK_PRODUCTOS_CATEGORIA FOREIGN KEY(id_categoria)
		REFERENCES CATEGORIA(id_categoria)
		,CONSTRAINT FK_PRODUCTOS_PROVEEDORES FOREIGN KEY(id_proveedor)
		REFERENCES PROVEEDORES(id_proveedor)
	);
	---------------------------------------------------------------------
	CREATE TABLE CLIENTES(--TABLA_5
		 id_cliente   INT GENERATED ALWAYS AS IDENTITY NOT NULL
		,razon_social VARCHAR(100)		NOT NULL
		,domicilio    VARCHAR(300)		NOT NULL
		,nombre		  VARCHAR(100)		NOT NULL	  
		,CONSTRAINT PK_CLIENTE PRIMARY KEY(id_cliente)
	);
	---------------------------------------------------------------------
	CREATE TABLE EMAIL_CLIENTES(--TABLA_6
		 id_cliente INT			NOT NULL
		,email		VARCHAR(50)	NOT NULL
		,CONSTRAINT PK_EMAIL_LIENTES PRIMARY KEY(id_cliente,email)
		,CONSTRAINT FK_EMAIL_CLIENTES FOREIGN KEY(id_cliente)
		REFERENCES CLIENTES(id_cliente)
	);
	---------------------------------------------------------------------
	CREATE TABLE VENTAS(--TABLA_7
		 id_venta    VARCHAR(50)	    NOT NULL
		,id_cliente  INT				NOT NULL
		,fecha_venta DATE NOT NULL
		,CONSTRAINT PK_VENTAS PRIMARY KEY(id_venta)
		,CONSTRAINT FK_VENTAS_CLIENTES FOREIGN KEY(id_cliente)
		REFERENCES CLIENTES(id_cliente)
	);
	---------------------------------------------------------------------
	CREATE TABLE VENTA_DETALLES(--TABLA_8
		 id_venta 	        VARCHAR(50)   NOT NULL
		,id_producto 	    INT			  NOT NULL
		,precio_unitario 	DECIMAL		  NOT NULL
		,cantidad			INT			  NOT NULL
		,CONSTRAINT FK_VENTA_DETALLES_VENTAS FOREIGN KEY(id_venta)
		REFERENCES VENTAS(id_venta)
		,CONSTRAINT FK_VENTA_DETALLES_PRODUCTOS FOREIGN KEY(id_producto,precio_unitario)
		REFERENCES PRODUCTOS(id_producto,precio_unitario)
	);
	---------------------------------------------------------------------
	CREATE TABLE FACTURA(
		 id_factura			INT GENERATED ALWAYS AS IDENTITY NOT NULL
		,id_venta			VARCHAR(50)  NOT NULL
		,razon_social		VARCHAR(100) NOT NULL
		,fecha				DATE		 NOT NULL
		,cantidad			INT			 NOT NULL
		,nombre_producto	VARCHAR(50)	 NOT NULL
		,descripcion	    VARCHAR(100)
		,importe/*(total)*/ NUMERIC		 NOT NULL
		,CONSTRAINT PK_FACTURA PRIMARY KEY(id_factura)
		,CONSTRAINT FK_FACTURA_VENTA FOREIGN KEY(id_venta)
		REFERENCES VENTAS(id_venta)
	);
$$;