"! Carga inicial de datos del ejercicio SQL (tablas ZTB_KP_EJNOV_*).
"! Ejecutar con F9 en ADT. Borra y vuelve a cargar todo: se puede correr varias veces.
CLASS zcl_kp_cargaini_nov DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS borrar_datos.
    METHODS cargar_clientes   RETURNING VALUE(rv_cant) TYPE i.
    METHODS cargar_productos  RETURNING VALUE(rv_cant) TYPE i.
    METHODS cargar_vendedores RETURNING VALUE(rv_cant) TYPE i.
    METHODS cargar_pedidos    RETURNING VALUE(rv_cant) TYPE i.
    METHODS cargar_posiciones RETURNING VALUE(rv_cant) TYPE i.
ENDCLASS.



CLASS zcl_kp_cargaini_nov IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    borrar_datos( ).
    out->write( |Clientes     : { cargar_clientes( ) }| ).
    out->write( |Productos    : { cargar_productos( ) }| ).
    out->write( |Vendedores   : { cargar_vendedores( ) }| ).
    out->write( |Pedidos      : { cargar_pedidos( ) }| ).
    out->write( |Posiciones   : { cargar_posiciones( ) }| ).
    COMMIT WORK.
    out->write( 'Carga inicial finalizada.' ).
  ENDMETHOD.


  METHOD borrar_datos.
    DELETE FROM ztb_kp_ejnov_pep.
    DELETE FROM ztb_kp_ejnov_pec.
    DELETE FROM ztb_kp_ejnov_cli.
    DELETE FROM ztb_kp_ejnov_prd.
    DELETE FROM ztb_kp_ejnov_ven.
  ENDMETHOD.


  METHOD cargar_clientes.
    DATA lt_data TYPE STANDARD TABLE OF ztb_kp_ejnov_cli WITH EMPTY KEY.

    lt_data = VALUE #(
      ( cliente = 'C001' nombre = 'Distribuidora Andina SA' pais = 'AR' ciudad = 'Buenos Aires' segmento = 'A' fecha_alta = '20190315' limite_cred = 50000 )
      ( cliente = 'C002' nombre = 'Comercial Pampa SRL'     pais = 'AR' ciudad = 'Rosario'      segmento = 'B' fecha_alta = '20200610' limite_cred = 20000 )
      ( cliente = 'C003' nombre = 'Ferreteria El Tornillo'  pais = 'AR' ciudad = 'Cordoba'      segmento = 'C' fecha_alta = '20210122' limite_cred = 600 )
      ( cliente = 'C004' nombre = 'Importadora Sur Ltda'    pais = 'CL' ciudad = 'Santiago'     segmento = 'A' fecha_alta = '20180904' limite_cred = 60000 )
      ( cliente = 'C005' nombre = 'Tecno Mayorista SA'      pais = 'UY' ciudad = 'Montevideo'   segmento = 'B' fecha_alta = '20220218' limite_cred = 25000 )
      ( cliente = 'C006' nombre = 'Libreria Central'        pais = 'BR' ciudad = 'Sao Paulo'    segmento = 'C' fecha_alta = '20230505' limite_cred = 8000 )
      ( cliente = 'C007' nombre = 'Grupo Retail Norte'      pais = 'MX' ciudad = 'Monterrey'    segmento = 'A' fecha_alta = '20170811' limite_cred = 80000 )
      ( cliente = 'C008' nombre = 'Oficinas Express'        pais = 'CO' ciudad = 'Bogota'       segmento = 'B' fecha_alta = '20210930' limite_cred = 18000 )
      ( cliente = 'C009' nombre = 'Papelera del Plata'      pais = 'AR' ciudad = 'Mendoza'      segmento = 'B' fecha_alta = '20240112' limite_cred = 15000 )
      ( cliente = 'C010' nombre = 'Cliente Sin Pedidos'     pais = 'PE' ciudad = 'Lima'         segmento = 'C' fecha_alta = '20250620' limite_cred = 3000 ) ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls>).
      <ls>-waers = 'USD'.
    ENDLOOP.

    INSERT ztb_kp_ejnov_cli FROM TABLE @lt_data.
    rv_cant = sy-dbcnt.
  ENDMETHOD.


  METHOD cargar_productos.
    DATA lt_data TYPE STANDARD TABLE OF ztb_kp_ejnov_prd WITH EMPTY KEY.

    lt_data = VALUE #(
      ( producto = 'P001' descripcion = 'Notebook 14 pulgadas'  categoria = 'TECNOLOGIA'  precio_lista = 850 costo = 600 stock = 5    activo = 'X' )
      ( producto = 'P002' descripcion = 'Monitor 24 pulgadas'   categoria = 'TECNOLOGIA'  precio_lista = 220 costo = 150 stock = 80   activo = 'X' )
      ( producto = 'P003' descripcion = 'Teclado mecanico'      categoria = 'PERIFERICOS' precio_lista = 60  costo = 35  stock = 150  activo = 'X' )
      ( producto = 'P004' descripcion = 'Mouse inalambrico'     categoria = 'PERIFERICOS' precio_lista = 25  costo = 12  stock = 300  activo = 'X' )
      ( producto = 'P005' descripcion = 'Impresora laser'       categoria = 'OFICINA'     precio_lista = 310 costo = 220 stock = 25   activo = 'X' )
      ( producto = 'P006' descripcion = 'Resma papel A4'        categoria = 'OFICINA'     precio_lista = 6   costo = '3.50' stock = 1000 activo = 'X' )
      ( producto = 'P007' descripcion = 'Silla ergonomica'      categoria = 'MOBILIARIO'  precio_lista = 180 costo = 110 stock = 35   activo = 'X' )
      ( producto = 'P008' descripcion = 'Escritorio 120 cm'     categoria = 'MOBILIARIO'  precio_lista = 240 costo = 160 stock = 1    activo = 'X' )
      ( producto = 'P009' descripcion = 'Auriculares con mic'   categoria = 'PERIFERICOS' precio_lista = 45  costo = 22  stock = 0    activo = ' ' )
      ( producto = 'P010' descripcion = 'Tablet 10 pulgadas'    categoria = 'TECNOLOGIA'  precio_lista = 400 costo = 280 stock = 55   activo = 'X' )
      ( producto = 'P011' descripcion = 'Cartucho de toner'     categoria = 'OFICINA'     precio_lista = 75  costo = 48  stock = 120  activo = 'X' )
      ( producto = 'P012' descripcion = 'Webcam HD'             categoria = 'PERIFERICOS' precio_lista = 38  costo = 20  stock = 90   activo = 'X' ) ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls>).
      <ls>-waers = 'USD'.
    ENDLOOP.

    INSERT ztb_kp_ejnov_prd FROM TABLE @lt_data.
    rv_cant = sy-dbcnt.
  ENDMETHOD.


  METHOD cargar_vendedores.
    DATA lt_data TYPE STANDARD TABLE OF ztb_kp_ejnov_ven WITH EMPTY KEY.

    lt_data = VALUE #(
      ( vendedor = 'V01' nombre = 'Laura Gomez'   region = 'PAMPEANA'    fecha_ingreso = '20180301' comision_pct = '3.00' )
      ( vendedor = 'V02' nombre = 'Martin Perez'  region = 'CENTRO'      fecha_ingreso = '20190715' comision_pct = '2.50' )
      ( vendedor = 'V03' nombre = 'Sofia Ruiz'    region = 'NORTE'       fecha_ingreso = '20210110' comision_pct = '4.00' )
      ( vendedor = 'V04' nombre = 'Diego Torres'  region = 'EXPORTACION' fecha_ingreso = '20200901' comision_pct = '5.00' )
      ( vendedor = 'V05' nombre = 'Valeria Sosa'  region = 'PAMPEANA'    fecha_ingreso = '20230220' comision_pct = '3.50' ) ).

    INSERT ztb_kp_ejnov_ven FROM TABLE @lt_data.
    rv_cant = sy-dbcnt.
  ENDMETHOD.


  METHOD cargar_pedidos.
    DATA lt_data TYPE STANDARD TABLE OF ztb_kp_ejnov_pec WITH EMPTY KEY.

    lt_data = VALUE #(
      ( pedido = 'O001' cliente = 'C001' vendedor = 'V01' fecha_pedido = '20250115' estado = 'E' )
      ( pedido = 'O002' cliente = 'C002' vendedor = 'V01' fecha_pedido = '20250203' estado = 'E' )
      ( pedido = 'O003' cliente = 'C004' vendedor = 'V04' fecha_pedido = '20250220' estado = 'E' )
      ( pedido = 'O004' cliente = 'C007' vendedor = 'V04' fecha_pedido = '20250310' estado = 'E' )
      ( pedido = 'O005' cliente = 'C001' vendedor = 'V02' fecha_pedido = '20250405' estado = 'E' )
      ( pedido = 'O006' cliente = 'C003' vendedor = 'V02' fecha_pedido = '20250418' estado = 'C' )
      ( pedido = 'O007' cliente = 'C005' vendedor = 'V04' fecha_pedido = '20250512' estado = 'E' )
      ( pedido = 'O008' cliente = 'C008' vendedor = 'V03' fecha_pedido = '20250601' estado = 'E' )
      ( pedido = 'O009' cliente = 'C002' vendedor = 'V01' fecha_pedido = '20250625' estado = 'E' )
      ( pedido = 'O010' cliente = 'C007' vendedor = 'V04' fecha_pedido = '20250714' estado = 'E' )
      ( pedido = 'O011' cliente = 'C006' vendedor = 'V03' fecha_pedido = '20250802' estado = 'E' )
      ( pedido = 'O012' cliente = 'C001' vendedor = 'V01' fecha_pedido = '20250915' estado = 'E' )
      ( pedido = 'O013' cliente = 'C004' vendedor = 'V04' fecha_pedido = '20251008' estado = 'E' )
      ( pedido = 'O014' cliente = 'C009' vendedor = 'V02' fecha_pedido = '20251105' estado = 'E' )
      ( pedido = 'O015' cliente = 'C007' vendedor = 'V04' fecha_pedido = '20251201' estado = 'E' )
      ( pedido = 'O016' cliente = 'C001' vendedor = 'V01' fecha_pedido = '20260110' estado = 'E' )
      ( pedido = 'O017' cliente = 'C002' vendedor = 'V02' fecha_pedido = '20260214' estado = 'E' )
      ( pedido = 'O018' cliente = 'C005' vendedor = 'V04' fecha_pedido = '20260305' estado = 'E' )
      ( pedido = 'O019' cliente = 'C008' vendedor = 'V03' fecha_pedido = '20260322' estado = 'C' )
      ( pedido = 'O020' cliente = 'C004' vendedor = 'V04' fecha_pedido = '20260418' estado = 'E' )
      ( pedido = 'O021' cliente = 'C009' vendedor = 'V02' fecha_pedido = '20260510' estado = 'E' )
      ( pedido = 'O022' cliente = 'C007' vendedor = 'V04' fecha_pedido = '20260603' estado = 'P' )
      ( pedido = 'O023' cliente = 'C001' vendedor = 'V01' fecha_pedido = '20260715' estado = 'P' )
      ( pedido = 'O024' cliente = 'C003' vendedor = 'V02' fecha_pedido = '20260801' estado = 'P' ) ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls>).
      <ls>-waers = 'USD'.
    ENDLOOP.

    INSERT ztb_kp_ejnov_pec FROM TABLE @lt_data.
    rv_cant = sy-dbcnt.
  ENDMETHOD.


  METHOD cargar_posiciones.
    DATA lt_data TYPE STANDARD TABLE OF ztb_kp_ejnov_pep WITH EMPTY KEY.

    lt_data = VALUE #(
      ( pedido = 'O001' posicion = '0010' producto = 'P001' cantidad = 5   precio_unit = 850 descuento_pct = 5 )
      ( pedido = 'O001' posicion = '0020' producto = 'P003' cantidad = 10  precio_unit = 60  descuento_pct = 0 )
      ( pedido = 'O002' posicion = '0010' producto = 'P006' cantidad = 200 precio_unit = 6   descuento_pct = 10 )
      ( pedido = 'O002' posicion = '0020' producto = 'P011' cantidad = 10  precio_unit = 75  descuento_pct = 0 )
      ( pedido = 'O003' posicion = '0010' producto = 'P002' cantidad = 20  precio_unit = 215 descuento_pct = 8 )
      ( pedido = 'O003' posicion = '0020' producto = 'P004' cantidad = 40  precio_unit = 25  descuento_pct = 0 )
      ( pedido = 'O003' posicion = '0030' producto = 'P003' cantidad = 20  precio_unit = 58  descuento_pct = 0 )
      ( pedido = 'O004' posicion = '0010' producto = 'P001' cantidad = 15  precio_unit = 830 descuento_pct = 12 )
      ( pedido = 'O004' posicion = '0020' producto = 'P010' cantidad = 20  precio_unit = 390 descuento_pct = 10 )
      ( pedido = 'O004' posicion = '0030' producto = 'P002' cantidad = 10  precio_unit = 220 descuento_pct = 5 )
      ( pedido = 'O005' posicion = '0010' producto = 'P007' cantidad = 8   precio_unit = 180 descuento_pct = 0 )
      ( pedido = 'O005' posicion = '0020' producto = 'P008' cantidad = 4   precio_unit = 240 descuento_pct = 5 )
      ( pedido = 'O006' posicion = '0010' producto = 'P005' cantidad = 2   precio_unit = 310 descuento_pct = 0 )
      ( pedido = 'O007' posicion = '0010' producto = 'P010' cantidad = 10  precio_unit = 400 descuento_pct = 5 )
      ( pedido = 'O007' posicion = '0020' producto = 'P004' cantidad = 25  precio_unit = 25  descuento_pct = 0 )
      ( pedido = 'O008' posicion = '0010' producto = 'P006' cantidad = 100 precio_unit = 6   descuento_pct = 0 )
      ( pedido = 'O008' posicion = '0020' producto = 'P011' cantidad = 6   precio_unit = 75  descuento_pct = 0 )
      ( pedido = 'O008' posicion = '0030' producto = 'P005' cantidad = 1   precio_unit = 310 descuento_pct = 0 )
      ( pedido = 'O009' posicion = '0010' producto = 'P002' cantidad = 5   precio_unit = 220 descuento_pct = 0 )
      ( pedido = 'O009' posicion = '0020' producto = 'P003' cantidad = 5   precio_unit = 60  descuento_pct = 0 )
      ( pedido = 'O010' posicion = '0010' producto = 'P001' cantidad = 10  precio_unit = 850 descuento_pct = 10 )
      ( pedido = 'O010' posicion = '0020' producto = 'P009' cantidad = 30  precio_unit = 45  descuento_pct = 0 )
      ( pedido = 'O011' posicion = '0010' producto = 'P004' cantidad = 10  precio_unit = 25  descuento_pct = 0 )
      ( pedido = 'O011' posicion = '0020' producto = 'P006' cantidad = 50  precio_unit = 6   descuento_pct = 0 )
      ( pedido = 'O012' posicion = '0010' producto = 'P008' cantidad = 3   precio_unit = 240 descuento_pct = 0 )
      ( pedido = 'O012' posicion = '0020' producto = 'P007' cantidad = 5   precio_unit = 180 descuento_pct = 5 )
      ( pedido = 'O012' posicion = '0030' producto = 'P011' cantidad = 4   precio_unit = 75  descuento_pct = 0 )
      ( pedido = 'O013' posicion = '0010' producto = 'P010' cantidad = 15  precio_unit = 400 descuento_pct = 8 )
      ( pedido = 'O013' posicion = '0020' producto = 'P002' cantidad = 12  precio_unit = 220 descuento_pct = 5 )
      ( pedido = 'O014' posicion = '0010' producto = 'P006' cantidad = 150 precio_unit = 6   descuento_pct = 5 )
      ( pedido = 'O014' posicion = '0020' producto = 'P005' cantidad = 2   precio_unit = 310 descuento_pct = 0 )
      ( pedido = 'O015' posicion = '0010' producto = 'P001' cantidad = 8   precio_unit = 850 descuento_pct = 8 )
      ( pedido = 'O015' posicion = '0020' producto = 'P003' cantidad = 15  precio_unit = 60  descuento_pct = 5 )
      ( pedido = 'O015' posicion = '0030' producto = 'P004' cantidad = 30  precio_unit = 25  descuento_pct = 0 )
      ( pedido = 'O016' posicion = '0010' producto = 'P001' cantidad = 4   precio_unit = 870 descuento_pct = 0 )
      ( pedido = 'O016' posicion = '0020' producto = 'P002' cantidad = 6   precio_unit = 225 descuento_pct = 0 )
      ( pedido = 'O017' posicion = '0010' producto = 'P010' cantidad = 5   precio_unit = 400 descuento_pct = 0 )
      ( pedido = 'O017' posicion = '0020' producto = 'P009' cantidad = 12  precio_unit = 45  descuento_pct = 5 )
      ( pedido = 'O018' posicion = '0010' producto = 'P002' cantidad = 25  precio_unit = 220 descuento_pct = 10 )
      ( pedido = 'O018' posicion = '0020' producto = 'P007' cantidad = 10  precio_unit = 180 descuento_pct = 8 )
      ( pedido = 'O019' posicion = '0010' producto = 'P005' cantidad = 3   precio_unit = 310 descuento_pct = 0 )
      ( pedido = 'O020' posicion = '0010' producto = 'P001' cantidad = 12  precio_unit = 870 descuento_pct = 10 )
      ( pedido = 'O020' posicion = '0020' producto = 'P010' cantidad = 8   precio_unit = 410 descuento_pct = 5 )
      ( pedido = 'O020' posicion = '0030' producto = 'P004' cantidad = 20  precio_unit = 25  descuento_pct = 0 )
      ( pedido = 'O021' posicion = '0010' producto = 'P011' cantidad = 15  precio_unit = 75  descuento_pct = 0 )
      ( pedido = 'O021' posicion = '0020' producto = 'P006' cantidad = 120 precio_unit = 6   descuento_pct = 5 )
      ( pedido = 'O022' posicion = '0010' producto = 'P001' cantidad = 6   precio_unit = 870 descuento_pct = 5 )
      ( pedido = 'O022' posicion = '0020' producto = 'P003' cantidad = 20  precio_unit = 62  descuento_pct = 0 )
      ( pedido = 'O023' posicion = '0010' producto = 'P008' cantidad = 2   precio_unit = 240 descuento_pct = 0 )
      ( pedido = 'O023' posicion = '0020' producto = 'P007' cantidad = 6   precio_unit = 185 descuento_pct = 0 )
      ( pedido = 'O024' posicion = '0010' producto = 'P004' cantidad = 15  precio_unit = 26  descuento_pct = 0 ) ).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls>).
      <ls>-waers = 'USD'.
    ENDLOOP.

    INSERT ztb_kp_ejnov_pep FROM TABLE @lt_data.
    rv_cant = sy-dbcnt.
  ENDMETHOD.

ENDCLASS.

