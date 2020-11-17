-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 27/10/2010
-- @Descripcion: Modificacion de los parametros de la BD
whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

-- 1
-- Modificar parametro de fecha
-- @param: nls_date_format
-- @level: sesión
alter session set nls_date_format = 'dd/mm/yyyy hh24:mi:ss';

-- 2
-- Modificar parametro de procesos
-- @param: db_writer_processes
-- @param_type: estatico
-- @newvalue: 2
-- @level: 
alter system set db_writer_processes=2 scope=spfile;

-- 3
-- Modificar parametro de log buffer
-- @param: log_buffer
-- @param_type: estatico
-- @newvalue: 10mb+log_buffer
-- @actualvalue: 7766016
-- @level: 
alter system set log_buffer = 7776256 scope=spfile;

-- 4
-- Modificar parametro de data file abiertos permitidos
-- @@newvalue: 250
-- @param: db_files
-- @param_type: estatico
-- @level: 
alter system set db_files = 250 scope=spfile;

-- 5
-- Modificar parametro de bloqueos en instruccion DML 
-- @newvalue: 2500
-- @param: dml_locks
-- @level: 
alter system set dml_locks = 2500 scope=spfile;

-- 6
-- Modificar parametro de segmentos de rollback
-- @newvalue: 600
-- @param: transactions
-- @level: 
alter system set transactions = 600 scope=spfile;

-- 7*
-- Modificar parametro de tam mem para ejecutar has joins
-- @newvalue: hash_area_size + 5mb
-- @actualvalue: 131072
-- @param: hash_area_size
-- @level: sesion actual y sig reinicio: scope= both
alter session set hash_area_size = 136192;
alter system set hash_area_size = 136192 scope=spfile;

-- 8*
-- Modificar parametro de mem para operaciones sort
-- @newvalue: +5mb
-- @actualvalue: 65536
-- @param: sort_area_size
-- @level: 
alter session set sort_area_size = 70656;

-- 9
-- Modificar parametro de hab salida de datos debug
-- @newvalue: true
-- @param: sql_trace
-- @level: sesion
alter system set sql_trace = true scope=memory;

-- 10
-- Modificar parametro de búsquedas de datos se realicen
-- de la forma más óptima posible para los primeros 100 registros.
-- @param: optimizer_mode
-- @level: forma inmediata y permanente: scope=both
alter system set optimizer_mode = FIRST_ROWS_100 scope=both;

-- 11
-- Modificar parametro de estilo de valid de cursores
-- @newvalue: deferred
-- @param: cursor_invalidation
-- @level: sesion
alter session set cursor_invalidation = deferred;

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0204';
  v_table_name1 varchar2(30) := 'T03_UPDATE_PARAM_SESSION';
  v_table_name2 varchar2(30) := 'T04_UPDATE_PARAM_INSTANCE';
  v_table_name3 varchar2(30) := 'T05_UPDATE_PARAM_SPFILE';

begin

  -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_name1;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_name1;
  end if;

  -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_name2;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_name2;
  end if;

  -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_name3;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_name3;
  end if;  

end;
/

--parametros modificados en la sesión del usuario
create table rodrigo0204.t03_update_param_session as
select name,value
from v$parameter
where name in (
'cursor_invalidation','optimizer_mode',
'sql_trace','sort_area_size','hash_area_size','nls_date_format',
'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
)
and value is not null;

--parametros modificados en la instancia
create table rodrigo0204.t04_update_param_instance as
select name,value
from v$system_parameter
where name in (
'cursor_invalidation','optimizer_mode',
'sql_trace','sort_area_size','hash_area_size','nls_date_format',
'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
)
and value is not null;

--parametros modificados en el spfile
create table rodrigo0204.t05_update_param_spfile as
select name,value
from v$spparameter
where name in (
'cursor_invalidation','optimizer_mode',
'sql_trace','sort_area_size','hash_area_size','nls_date_format',
'db_writer_processes','db_files','dml_locks','log_buffer','transactions'
)
and value is not null;

create 
pfile='/unam-bda/ejercicios-practicos/t0204/e-03-spparameter-pfile.txt' 
from spfile;