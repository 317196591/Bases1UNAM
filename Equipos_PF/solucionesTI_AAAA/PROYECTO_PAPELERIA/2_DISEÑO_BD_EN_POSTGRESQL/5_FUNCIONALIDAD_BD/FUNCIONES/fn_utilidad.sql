CREATE OR REPLACE FUNCTION fn_utilidad(ps_codigo_barras VARCHAR(50))
RETURNS NUMERIC LANGUAGE plpgsql
--===========================================================================================
--AUTORES: solucionesTI_AAAA
--BD:PROYECTO_PAPELERIA
--DESCRIPCI�N: Funci�n que retorna la utilidad de un producto al recibir el c�digo de barras
--FECHA DE CREACI�N 
--===========================================================================================
AS $$
DECLARE
		precio_venta 	  NUMERIC;
		costo_adquisicion NUMERIC;
		utilidad 		  NUMERIC;
		ganancia		  NUMERIC;
BEGIN
	SELECT precio_unitario
	FROM PRODUCTOS
	WHERE codigo_barras=ps_codigo_barras
	INTO precio_venta; --Obtenemos el precio de venta del producto deseado (del cat�logo).
	
	SELECT 0.30*precio_venta
	INTO ganancia; --Obtenemos la ganancia del articulo.
	
	costo_adquisicion:=precio_venta-ganancia;--costo_adquisicion=precio_venta-ganancia.
	utilidad:=precio_venta-costo_adquisicion;--Utilidad es resultado de esta resta.
	
	RETURN utilidad;
END
--SELECT fn_utilidad('A-0100-R') Ejemplo de invocaci�n de la utilidad de la pluma.
--select * from productos;Para ver el cat�logo.
$$;

