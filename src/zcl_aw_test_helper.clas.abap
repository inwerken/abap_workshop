
CLASS zcl_aw_test_helper DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mo_class_to_test_generic TYPE REF TO object .

    METHODS constructor .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AW_TEST_HELPER IMPLEMENTATION.


  METHOD constructor.
    TRY.
        DATA(lv_classname) = cl_abap_classdescr=>get_class_name( me ).
        FIND REGEX '\\PROGRAM=([^=]+)' IN lv_classname SUBMATCHES lv_classname ##REGEX_POSIX.
        lv_classname = lv_classname(30).
        CREATE OBJECT me->mo_class_to_test_generic TYPE (lv_classname).
      CATCH cx_root ##NO_HANDLER ##CATCH_ALL.
    ENDTRY.

    IF me->mo_class_to_test_generic IS NOT BOUND.
      MESSAGE a000(oo) WITH 'unable to create class to test' lv_classname ##NO_TEXT.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
