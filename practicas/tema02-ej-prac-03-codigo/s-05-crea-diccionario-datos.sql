-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 15/10/2010
-- @Descripcion: Creacion del diccionario de datos
set serveroutput on

connect sys/system2 as sysdba

@@?/rdbms/admin/catalog.sql
@@?/rdbms/admin/catproc.sql
@@?/rdbms/admin/utlrp.sql

connect system/system2

@@?/sqlplus/admin/pupbld.sql
