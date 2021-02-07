-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Obtencion de parametros de las estructuras de memoria de la SGA
--               y la PGA

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
v_count number;
:changes

v_table_01 varchar2(30) := 'T01_MEMORY_AREAS';
v_table_02 varchar2(30) := 'T02_MEMORY_PARAM_VALUES';
v_table_03 varchar2(30) := 'T03_MEMORY_PARAM_INFO';
begin
  -- Comprobando la existencia de la tabla    
  select count(*) into v_count    
  from all_tables    
  where table_name = v_table_01;    

  -- Eliminando tabla en caso de existir    
  if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_01;    
  end if; 

  -- Comprobando la existencia de la tabla    
  select count(*) into v_count    
  from all_tables    
  where table_name = v_table_02;    

  -- Eliminando tabla en caso de existir    
  if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_02;    
  end if; 

  -- Comprobando la existencia de la tabla    
  select count(*) into v_count    
  from all_tables    
  where table_name = v_table_03;    

  -- Eliminando tabla en caso de existir    
  if v_count > 0 then    
    execute immediate 'drop table '|| v_username ||'.'||v_table_03;    
  end if; 
end;
/

create table rodrigo0404.t01_memory_areas as (
  select 
  (
    select 1 from dual
  ) id,
  (
    select sysdate from dual
  ) sample_date,
  (
    select trunc(value/(1024*1024),2)
    from v$parameter 
    where name = 'log_buffer'
  ) redo_buffer_size,
  (
    select trunc(value/(1024*1024),2) 
    from v$sga
    where name = 'Database Buffers'
  ) buffer_cache_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Shared Pool Size' 
  ) shared_pool_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Large Pool Size' 
  ) large_pool_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Java Pool Size' 
  ) java_pool_size,
  (
    select trunc(sum(value)/(1024*1024)) 
    from v$sga
  ) sga_size,
  (
    select trunc(bytes/(1024*1024),2)
    from v$sgainfo
    where name = 'Free SGA Memory Available' 
  ) sga_free_memory,
  (
    select trunc(value/1048576,2)
    from v$pgastat
    where name='maximum PGA allocated'
  ) max_pga_allocated,
  (
    select trunc(value/(1024*1024),2)
    from v$pgastat 
    where name = 'aggregate PGA target parameter'
  ) aggregate_pga_target_param
  from dual
);

create table rodrigo0404.t02_memory_param_values as (
  select 
  (
    select 1 from dual
  ) id,
  (
    select sysdate from dual
  ) sample_date,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'memory_target'
  ) memory_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'sga_target' 
  ) sga_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'pga_aggregate_target' 
  ) pga_aggregate_target,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'shared_pool_size' 
  ) shared_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'large_pool_size' 
  ) large_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'java_pool_size' 
  ) java_pool_size,
  (
    select value/(1024*1024) 
    from v$parameter 
    where name = 'db_cache_size' 
  ) db_cache_size
  from dual
);


create table rodrigo0404.t03_memory_param_info as (
  select num, name, value, default_value, isdefault,isses_modifiable,
  issys_modifiable
  from v$parameter
  where name = 'memory_target' 
  or name = 'memory_max_target'
  or name = 'sga_target'
  or name = 'sga_max_size' 
  or name = 'shared_pool_size'
  or name = 'large_pool_size'
  or name = 'java_pool_size'
  or name = 'db_cache_size'
  or name = 'streams_pool_size'
  or name = 'log_buffer'
);

grant select on rodrigo0402.t01_random_data to rodrigo0404;

create or replace procedure rodrigo0404.spv_consulta_random_data is

  cursor cur_rand_data is 
  select * 
  from rodrigo0402.t01_random_data;

  v_total_r_varchar number;
  v_contador_registros number;

  begin
    v_total_r_varchar := 0;
    v_contador_registros := 0;

    for p in cur_rand_data loop
      v_contador_registros := v_contador_registros + 1;
      v_total_r_varchar := v_total_r_varchar + length('r_varchar');
    end loop;

    dbms_output.put_line('Contador:        '|| v_contador_registros);
    dbms_output.put_line('Total r_varchar: '|| v_total_r_varchar);

  end;
/
show errors

whenever sqlerror continue
