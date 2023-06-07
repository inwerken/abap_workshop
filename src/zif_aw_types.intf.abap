INTERFACE zif_aw_types
  PUBLIC.
  TYPES: BEGIN OF address,
           name      TYPE string,
           street    TYPE string,
           post_code TYPE string,
           city      TYPE string,
           country   TYPE string,
         END OF address,
         addresses TYPE STANDARD TABLE OF address WITH DEFAULT KEY.
  TYPES: BEGIN OF person,
           first_name     TYPE string,
           last_name      TYPE string,
           nick_name      TYPE string,
           birthday       TYPE d,
           place_of_birth TYPE string,
         END OF person,
         persons TYPE STANDARD TABLE OF person WITH DEFAULT KEY.

  TYPES: BEGIN OF name,
           first TYPE string,
           last  TYPE string,
         END OF name,
         names TYPE STANDARD TABLE OF name WITH DEFAULT KEY.

ENDINTERFACE.
