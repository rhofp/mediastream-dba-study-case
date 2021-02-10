-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion: Creacion del diccionario de datos

prompt =====================================================
prompt Creando el diccionario de datos
prompt =====================================================

connect sys/system3 as sysdba

@@?/rdbms/admin/catalog.sql
@@?/rdbms/admin/catproc.sql
@@?/rdbms/admin/utlrp.sql

connect system/system3

@@?/sqlplus/admin/pupbld.sql
