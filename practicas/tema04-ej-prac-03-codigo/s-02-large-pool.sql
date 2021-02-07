-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: 

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0403';
  v_table_01 varchar2(30) := 'T02_LARGE_POOL';
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

-- TODO:- Checar si se refiere al larga pool o a shared pool
create table rodrigo0403.t02_large_pool as (
  select
    ( 
      select value/(1024*1024) 
      from v$parameter 
      where name = 'large_pool_size'
    ) shared_pool_param_mb,
    (
      select bytes/(1024*1024) 
      from v$sgainfo 
      where name = 'Shared Pool Size'
    ) shared_pool_sga_info_mb,
    (
      select resizeable 
      from v$sgainfo 
      where name = 'Shared Pool Size'
    ) resizeable,
    (
      select count(*)
      from v$sgastat
      where pool = 'shared pool'
    ) shared_pool_component_total,
    (
      select bytes/(1024*1024)
      from v$sgastat
      where name  = 'free memory'
      and pool = 'shared pool'
    ) shared_pool_free_memory 
  from dual
);
