--==================================================================================
--AUTORES: solucionesTI_AAAA
--BD:PROYECTO_PAPELERIA
--DESCRIPCI�N:Script que muestra el primer registro de cada tabla.
--===================================================================================

--�REA_NEGOCIO
SELECT * FROM CATEGORIA LIMIT 1;			--TABLA_1
SELECT * FROM PROVEEDORES LIMIT 1;			--TABLA_2
SELECT * FROM TELEFONO_PROVEEDORES LIMIT 1;	--TABLA_3
SELECT * FROM PRODUCTOS LIMIT 1;			--TABLA_4	
------------------------------------------------------------------------------------
--�REA_VENTA
SELECT * FROM CLIENTES LIMIT 1;				--TABLA_5
SELECT * FROM EMAIL_CLIENTES LIMIT 1;		--TABLA_6 	
SELECT * FROM VENTAS LIMIT 1;				--TABLA_7
SELECT * FROM VENTA_DETALLES LIMIT 1;		--TABLA_8	
SELECT * FROM FACTURA LIMIT 1;				--TABLA_9
