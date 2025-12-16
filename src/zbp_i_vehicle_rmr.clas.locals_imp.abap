CLASS lhc_ZI_VEHICLE_RMR DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_vehicle_rmr RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_vehicle_rmr RESULT result.

       METHODS validate_brand FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_vehicle_rmr~validate_brand.

ENDCLASS.

CLASS lhc_ZI_VEHICLE_RMR IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
    result-%create = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD validate_brand.
     READ ENTITIES OF zi_vehicle_rmr
      IN LOCAL MODE
      ENTITY zi_vehicle_rmr
        FIELDS ( Brand )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_vehicle).

    LOOP AT lt_vehicle INTO DATA(ls_vehicle) WHERE Brand IS INITIAL.

      APPEND VALUE #( %tky = ls_vehicle-%tky )
        TO failed-zi_vehicle_rmr.

      APPEND VALUE #(
        %tky = ls_vehicle-%tky
        %msg = new_message_with_text(
                  severity = if_abap_behv_message=>severity-error
                  text     = |Brand es obligatorio|
               )
        %element-Brand = if_abap_behv=>mk-on
      ) TO reported-zi_vehicle_rmr.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
