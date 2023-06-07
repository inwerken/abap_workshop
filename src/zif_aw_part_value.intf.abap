INTERFACE zif_aw_part_value
  PUBLIC.

  "! <p class="shorttext synchronized" lang="en">Fill the result structure with the given values</p>
  "! use the VALUE statement
  METHODS value_fill_structure
    IMPORTING
      i_name          TYPE clike
      i_street        TYPE string
      i_post_code     TYPE string
      i_city          TYPE string
      i_country       TYPE string
    RETURNING
      VALUE(r_result) TYPE zif_aw_types=>address.

  "! <p class="shorttext synchronized" lang="en">Fill address table</p>
  "! add at least two addresses to the result table.<br/>
  "! all fields must be filled
  "! @parameter r_result | <p class="shorttext synchronized" lang="en">addresses</p>
  METHODS value_fill_table_static
    RETURNING VALUE(r_result) TYPE zif_aw_types=>addresses.

  "! <p class="shorttext synchronized" lang="en">Return values with requested structure </p>
  "! Use VALUE with requested type
  "! @parameter i_return_address | <p class="shorttext synchronized" lang="en">Return values of structure TS_ADDRESS</p>
  "! @parameter i_return_person | <p class="shorttext synchronized" lang="en">Return values of structure TS_PERSON</p>
  "! @parameter e_result | <p class="shorttext synchronized" lang="en">Result</p>
  METHODS value_return_dynamic
    IMPORTING
      i_return_address TYPE abap_bool OPTIONAL
      i_return_person  TYPE abap_bool OPTIONAL
    EXPORTING
      VALUE(e_result)  TYPE any.

  "! <p class="shorttext synchronized" lang="en">Return table with letters from A to E</p>
  "! Hint: use SUBSTRING to access letters of SY-ABCDE
  "! @parameter result | <p class="shorttext synchronized" lang="en">Result</p>
  METHODS value_fill_table_for_next
    RETURNING VALUE(result) TYPE string_table.

ENDINTERFACE.
