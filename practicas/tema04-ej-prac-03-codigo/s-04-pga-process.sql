-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Proceso y memoria relacionada con la PGA

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0403';
  v_table_01 varchar2(30) := 'T04_PGA_PROCESS';
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

create table rodrigo0403.t04_pga_process as (
  select 
  (
    select 'bkg-processs' from dual
  ) process_type,
  (
    select count(*) 
    from  v$process
    where pname is not null
  ) total_process,
  (
    select trunc(sum(pga_alloc_mem)/(1024*1024),2)
    from v$process
    where pname is not null
  ) total_pga_allocated_mb,
  (
    select trunc(sum(pga_used_mem)/(1024*1024),2)
    from v$process
    where pname is not null
  ) total_pga_used_mb
  from dual
  union
  select 
  (
    select 'other-processs' from dual
  ) process_type,
  (
    select count(*) 
    from  v$process
    where pname is null
  ) total_process,
  (
    select trunc(sum(pga_alloc_mem)/(1024*1024),2)
    from v$process
    where pname is null
  ) total_pga_allocated_mb,
  (
    select trunc(sum(pga_used_mem)/(1024*1024),2)
    from v$process
    where pname is null
  ) total_pga_used_mb
  from dual
);
