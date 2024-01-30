class ZCL_AW_TM_PART_VALUE definition
  public
  inheriting from ZCL_AW_TEST_HELPER
  abstract
  create public
  for testing
  duration short
  risk level harmless .

public section.

  methods CONSTRUCTOR .
protected section.

  methods STRUCTURE
  for testing .
  methods TABLE
  for testing .
  methods DYNAMIC
  for testing .
  methods TABLE_LETTERS
  for testing .
private section.

  data CUT type ref to ZIF_AW_PART_VALUE .
ENDCLASS.



CLASS ZCL_AW_TM_PART_VALUE IMPLEMENTATION.


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


  METHOD constructor.
    super->constructor( ).
    cut ?= mo_class_to_test_generic.
  ENDMETHOD.
ENDCLASS.
