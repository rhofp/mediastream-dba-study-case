-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Memoria usada, reservada y maxima de la PGA

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0403';
  v_table_01 varchar2(30) := 'T03_PGA_STATS';
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

  create table rodrigo0403.t03_pga_stats as (
    select
    ( 
      select value/1048576
      from v$pgastat
      where name='maximum PGA allocated'
    ) max_pga_mb,
    (
      select value/1048576
      from v$pgastat
      where name='aggregate PGA target parameter'
    ) pga_target_parameter_mb,
    (
      select value/1048576
      from v$pgastat
      where name='total PGA allocated'
    ) pga_total_actual_mb,
    (
      select value/1048576
      from v$pgastat
      where name='total PGA inuse'
    ) pga_in_use_actual_mb,
    (
      select value/1048576
      from v$pgastat
      where name='total freeable PGA memory'
    ) pga_free_memory_mb,
    (
      select value
      from v$pgastat
      where name='process count'
    ) pga_process_count,
    (
      select value/1048576
      from v$pgastat
      where name='total PGA used for auto workareas'
    ) pga_in_use_workareas_auto
    from dual
  );
