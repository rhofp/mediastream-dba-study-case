-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 27/10/2010
-- @Descripcion: Restauracion de parametros de la BD
set serveroutput on

connect sys/system2 as sysdba

prompt 'Apagando la BD'
shutdown immediate
prompt 'Inciando en modo no mount'
startup nomount pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt'
prompt 'Creando spfile'
create spfile from 
  pfile='/unam-bda/ejercicios-practicos/t0204/e-02-spparameter-pfile.txt';
prompt 'Apagando de nuevo'
shutdown immediate
prompt 'Inciando con el spfile'
startup
