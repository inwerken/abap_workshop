CLASS zcl_aw_tm_part_value DEFINITION
  INHERITING FROM zcl_aw_test_master
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS structure FOR TESTING.
    METHODS table FOR TESTING.
    METHODS dynamic FOR TESTING.
    methods table_letters for testing.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zif_aw_part_value.
    METHODS setup.
ENDCLASS.



CLASS zcl_aw_tm_part_value IMPLEMENTATION.
  METHOD structure.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE zif_aw_types=>address(
              name      = 'Max Mustermann'
              street    = '2233 Sea way'
              post_code = '12333'
              city      = 'Dunham'
              country   = 'US' )
      act = cut->value_fill_structure(
              i_name      = 'Max Mustermann'
              i_street    = '2233 Sea way'
              i_post_code = '12333'
              i_city      = 'Dunham'
              i_country   = 'US' ) ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW zcl_aw_part_value( ).
  ENDMETHOD.

  METHOD table.

    cl_abap_unit_assert=>assert_true(
        act  = COND #( WHEN lines( cut->value_fill_table_static( ) ) BETWEEN 2 AND 200
                       THEN abap_true
                       ELSE abap_false ) ).
  ENDMETHOD.

  METHOD dynamic.

    "check address type
    DATA(address) = VALUE  zif_aw_types=>address( ).
    cut->value_return_dynamic(
    EXPORTING
      i_return_address = abap_true
    IMPORTING
      e_result = address ).
    "check person type
    DATA(person) = VALUE  zif_aw_types=>person( ).
    cut->value_return_dynamic(
    EXPORTING
      i_return_person = abap_true
    IMPORTING
      e_result = person ).
    "if the right types are not returned, then the test method will break
    "with short dump OBJECTS_MOVE_NOT_SUPPORTED and will not reach this assertion
    cl_abap_unit_assert=>assert_true( abap_true ).

  ENDMETHOD.


  METHOD table_letters.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `A` ) ( `B` ) ( `C` ) ( `D` ) ( `E` ) )
      act = cut->value_fill_table_for_next( ) ).

  ENDMETHOD.

ENDCLASS.
