CLASS zcl_student_crud_22ad39 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.



CLASS zcl_student_crud_22ad39 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: ls_student  TYPE zstudent_22ad39,
          lt_students TYPE STANDARD TABLE OF zstudent_22ad39,
          lv_name     TYPE string,
          lv_marks    TYPE i.

* INSERT
    CLEAR ls_student.
    ls_student-client = sy-mandt.
    ls_student-student_id = 1.
    ls_student-student_name = 'Guruprasanth J'.
    ls_student-marks = 66.

    INSERT zstudent_22ad39 FROM @ls_student.

* SELECT
    SELECT *
      FROM zstudent_22ad39
      WHERE student_id = 1
      INTO TABLE @lt_students.

    LOOP AT lt_students INTO ls_student.
      out->write( |ID: { ls_student-student_id } Name: { ls_student-student_name } Marks: { ls_student-marks }| ).
    ENDLOOP.

* UPDATE
    UPDATE zstudent_22ad39
      SET marks = 99
      WHERE student_id = 1.

* SELECT SINGLE
    SELECT SINGLE student_name, marks
      FROM zstudent_22ad39
      WHERE student_id = 1
      INTO (@lv_name, @lv_marks).

    out->write( |Updated → { lv_name } { lv_marks }| ).

* DELETE
    DELETE FROM zstudent_22ad39
      WHERE student_id = 1.

    out->write( 'Record Deleted' ).

  ENDMETHOD.

ENDCLASS.
