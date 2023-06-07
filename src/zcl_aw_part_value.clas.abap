CLASS zcl_aw_part_value DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_aw_part_value .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aw_part_value IMPLEMENTATION.

  METHOD zif_aw_part_value~value_fill_structure.
    r_result = VALUE #(
      name      = i_name
      street    = i_street
      post_code = i_post_code
      city      = i_city
      country   = i_country ).

  ENDMETHOD.

  METHOD zif_aw_part_value~value_fill_table_static.
    r_result = VALUE #(
        ( name = 'Freddy Kruger' street = '1428 Elmstreet' city = 'Springwood' country = 'US' )
        ( name = 'Michael Myers' street = '13 Night ave' city = 'Haddonfield' country = 'US' ) ).

  ENDMETHOD.

  METHOD zif_aw_part_value~value_return_dynamic.

    IF i_return_address = abap_true.
      e_result =  VALUE zif_aw_types=>address( ).
    ELSEIF i_return_person = abap_true.
      e_result = VALUE zif_aw_types=>person( ).
    ELSE.
      e_result = VALUE string( ).
    ENDIF.

  ENDMETHOD.

  METHOD zif_aw_part_value~value_fill_table_for_next.
    result = VALUE #( FOR i = 0 WHILE i <= 4 ( substring( off = i val = sy-abcde len = 1 ) ) ).
  ENDMETHOD.

ENDCLASS.
