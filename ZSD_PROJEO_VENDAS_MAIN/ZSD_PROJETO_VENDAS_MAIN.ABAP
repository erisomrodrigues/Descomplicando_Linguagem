
REPORT ZSD_PROJETO_VENDAS_MAIN.

* Criação dos tipos
TYPES: BEGIN OF TY_PEDIDOS,
        NUMERO_PEDIDO TYPE I,
        DATA_PEDIDO   TYPE SY-datum,
        VALOR_PEDIDO  TYPE P DECIMALS 2,
  END OF ty_pedidos.

* Criação de uma tabela local e se uma Estrutura ou Work Area
DATA: LT_PEDIDO TYPE TABLE OF TY_PEDIDOS.
DATA: ST_PEDIDO TYPE ty_pedidos.


* Inserido dados na tabela
st_pedido-numero_pedido = 1.
st_pedido-valor_pedido = 350.
st_pedido-data_pedido = '20231020'.
append st_pedido to lt_pedido.

st_pedido-numero_pedido = 4.
st_pedido-valor_pedido = 350.
st_pedido-data_pedido = '20231020'.
append st_pedido to lt_pedido.

st_pedido-numero_pedido = 3.
st_pedido-valor_pedido = 350.
st_pedido-data_pedido = '20231020'.
append st_pedido to lt_pedido.

*Exibindo linha a linha
*write: lt_pedido[ 1 ]-numero_pedido.
*write: lt_pedido[ 2 ]-numero_pedido.
*write: lt_pedido[ 3 ]-numero_pedido.

*Exibindo todos de uma vez
LOOP AT lt_pedido INTO st_pedido.
  WRITE:  st_pedido-numero_pedido.
  WRITE:  st_pedido-valor_pedido.
  WRITE:  st_pedido-data_pedido,/.
ENDLOOP.
