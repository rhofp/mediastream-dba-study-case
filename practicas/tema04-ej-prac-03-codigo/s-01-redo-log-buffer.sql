-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Scripts para consultar memoria de redo log buffer

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0403';
  v_table_01 varchar2(30) := 'T01_REDO_LOG_BUFFER';
begin
    -- Comprobando la existencia de la tabla    
    select count(*) into v_count    
    from all_tables    
    where table_name = v_table_01;    
             
    -- Eliminando tabla en caso de existir    
    if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_01;    
    end if; 
end;
/

create table rodrigo0403.t01_redo_log_buffer as (
  select 
  ( 
    select value/(1024*1024) 
    from v$parameter 
    where name = 'log_buffer'
  ) redo_buffer_size_param_mb,
  (
    select bytes/(1024*1024) 
    from v$sgainfo 
    where name = 'Redo Buffers'
  ) redo_buffer_sga_info_mb,
  (
    select resizeable 
    from v$sgainfo 
    where name = 'Redo Buffers'
  ) resizeable
  from dual
);

