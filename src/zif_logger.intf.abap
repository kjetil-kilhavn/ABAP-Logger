INTERFACE zif_logger
  PUBLIC.
  DATA handle         TYPE balloghndl READ-ONLY.
  DATA db_number      TYPE balognr    READ-ONLY.
  DATA header         TYPE bal_s_log  READ-ONLY.
  DATA control_handle TYPE balcnthndl READ-ONLY.

  INTERFACES zif_logger_deprecated.

  ALIASES a FOR zif_logger_deprecated~a.
  ALIASES e FOR zif_logger_deprecated~e.
  ALIASES w FOR zif_logger_deprecated~w.
  ALIASES i FOR zif_logger_deprecated~i.
  ALIASES s FOR zif_logger_deprecated~s.

  METHODS add
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              !type               TYPE symsgty   OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS exit
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS abend
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS error
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS warning
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS info
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS success
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS debug
    IMPORTING obj_to_log          TYPE any       DEFAULT sy
              !context            TYPE any       OPTIONAL
              callback_form       TYPE csequence OPTIONAL
              callback_prog       TYPE csequence OPTIONAL
              callback_fm         TYPE csequence OPTIONAL
              callback_parameters TYPE bal_t_par OPTIONAL
              importance          TYPE balprobcl OPTIONAL
              detlevel            TYPE ballevel  OPTIONAL
        PREFERRED PARAMETER obj_to_log
    RETURNING VALUE(self)         TYPE REF TO zif_logger.

  METHODS has_errors
    RETURNING VALUE(rv_yes) TYPE abap_bool.

  METHODS has_warnings
    RETURNING VALUE(rv_yes) TYPE abap_bool.

  METHODS is_empty
    RETURNING VALUE(rv_yes) TYPE abap_bool.

  METHODS length
    RETURNING VALUE(rv_length) TYPE i.

  "! Saves the log on demand. Intended to be called at the
  "! end of the log processing so that logs can be saved depending
  "! on other criteria, like the existence of error messages.
  "! If there are no error messages, it may not be desirable to save
  "! a log.
  "! If auto save is enabled, save will do nothing.
  METHODS save.

  METHODS export_to_table
    RETURNING VALUE(rt_bapiret) TYPE bapirettab.

  METHODS fullscreen. " deprecated, use display_fullscreen

  METHODS display_fullscreen
    IMPORTING profile TYPE bal_s_prof OPTIONAL.

  METHODS popup " deprecated, use display_as_popup
    IMPORTING profile TYPE bal_s_prof OPTIONAL.

  METHODS display_as_popup
    IMPORTING profile TYPE bal_s_prof OPTIONAL.

  METHODS display_in_container
    IMPORTING container TYPE REF TO cl_gui_container
              profile   TYPE bal_s_prof OPTIONAL.

  METHODS set_header
    IMPORTING !description TYPE bal_s_log-extnumber
    RETURNING VALUE(self)  TYPE REF TO zif_logger.

  METHODS free.

ENDINTERFACE.
