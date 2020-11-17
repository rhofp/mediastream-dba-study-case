-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 15/11/2020
-- @Descripcion: Componentes de la SGA

whenever sqlerror exit rollback
set serveroutput on

connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0401';
  v_table_01 varchar2(30) := 'T01_SGA_COMPONENTS';
  v_table_02 varchar2(30) := 'T02_SGA_DYNAMIC_COMPONENTS';
  v_table_03 varchar2(30) := 'T03_SGA_MAX_DYNAMIC_COMPONENT';
  v_table_04 varchar2(30) := 'T04_SGA_MIN_DYNAMIC_COMPONENT';
  v_table_05 varchar2(30) := 'T05_SGA_MEMORY_INFO';
  v_table_06 varchar2(30) := 'T06_SGA_RESIZEABLE_COMPONENTS';
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

    -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_04;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_04;
  end if;

    -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_05;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_05;
  end if;

    -- Comprobando la existencia de la tabla
  select count(*) into v_count
  from all_tables
  where table_name = v_table_06;

  -- Eliminando tabla en caso de existir
  if v_count > 0 then
    execute immediate 'drop table '|| v_username ||'.'||v_table_06;
  end if;

end;
/

prompt Creando tabla t01_sga_components
create table rodrigo0401.t01_sga_components as (
  select
    (
      select trunc(value/1048576,2) 
      from v$parameter 
      where name='memory_target'
    ) memory_target_param, 
    (
      select trunc(value/1048576,2) 
      from v$sga
      where name = 'Fixed Size'
    ) fixed_size,
    (
      select trunc(value/1048576,2) 
      from v$sga
      where name = 'Variable Size'
    ) Variable_size,
    (
      select trunc(value/1048576,2) 
      from v$sga
      where name = 'Database Buffers'
    ) Database_buffers,      
    (
      select trunc(value/1048576,2) 
      from v$sga
      where name = 'Redo Buffers'
    ) Redo_buffers,
    (
      select sum(trunc(value/1048576,2)) from v$sga
    ) Total_sga
  from dual  
);

prompt Creando tabla t02_sga_dynamic_components
create table rodrigo0401.t02_sga_dynamic_components as ( 
  select component component_name,
    trunc(current_size/1048576,2) current_size_mb,
    oper_count operation_count,
    last_oper_type last_operation_type,
    last_oper_time last_operation_time
  from v$sga_dynamic_components
);

prompt Creando tabla t03_sga_max_dynamic_component
create table rodrigo0401.t03_sga_max_dynamic_component as ( 
  select component component_name,trunc(current_size/1048576,2) current_size_mb
  from v$sga_dynamic_components
  where current_size = (
    select max(current_size) from v$sga_dynamic_components
  )
);

prompt Creando tabla t04_sga_min_dynamic_component
create table rodrigo0401.t04_sga_min_dynamic_component as ( 
  select component component_name,
    trunc(current_size/1048576,2) current_size_mb
  from v$sga_dynamic_components
  where current_size = (
    select min(current_size) from v$sga_dynamic_components
    where current_size > 0
  ) 
  );

prompt Creando tabla t05_sga_memory_info
create table rodrigo0401.t05_sga_memory_info (
  name varchar2(64),
  current_size_mb number(10,2)
);

prompt Realizando inserts a t05_sga_memory_info
insert into rodrigo0401.t05_sga_memory_info (name,current_size_mb) 
select name, trunc(bytes/1048576,2) 
from v$sgainfo
where name = 'Maximum SGA Size';

insert into rodrigo0401.t05_sga_memory_info (name,current_size_mb) 
select name, trunc(bytes/1048576,2) 
from v$sgainfo
where name = 'Free SGA Memory Available';

prompt Creando tabla t06_sga_resizeable_components
create table rodrigo0401.t06_sga_resizeable_components as (
  select name 
  from v$sgainfo
  where resizeable = 'Yes'
);

prompt Listo !
whenever sqlerror continue