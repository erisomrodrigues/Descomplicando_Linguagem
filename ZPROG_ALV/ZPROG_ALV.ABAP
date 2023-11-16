REPORT zprog_alv.

DATA: sflights TYPE TABLE OF sflight,
      sflight  TYPE sflight,
      cl_table TYPE REF TO cl_salv_table.

START-OF-SELECTION.
  PERFORM get_dados.
  PERFORM display_alv.
  PERFORM FEED_FUNCTIONS.

FORM get_dados.

  SELECT *
    FROM sflight
    INTO TABLE sflights.

*  LOOP AT sflights INTO sflight.
*    WRITE sflight-carrid.
*  ENDLOOP.

ENDFORM.

FORM display_alv.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = cl_table
    CHANGING
      t_table      = sflights.

  CALL METHOD cl_table->display.

ENDFORM.

FORM FEED_FUNCTIONS.

  DATA: LC_FUNCTIONS TYPE REF TO cl_salv_functions.

  lc_functions = cl_table->get_functions( ).
  lc_functions->set_all( ABAP_TRUE ).

ENDFORM.
