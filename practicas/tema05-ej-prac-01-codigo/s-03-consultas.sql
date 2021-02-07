-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Consultas de las vistas para modo compartido

whenever sqlerror exit rollback
set serveroutput on

connect sys@rfpbda2 as sysdba

prompt Haciendo limpieza
declare
v_count number;
v_username varchar2(30) := 'RODRIGO0501';
v_table_01 varchar2(30) := 'T02_DISPATCHER_CONFIG';
v_table_02 varchar2(30) := 'T03_DISPATCHER';
v_table_03 varchar2(30) := 'T04_SHARED_SERVER';
v_table_04 varchar2(30) := 'T05_QUEUE';
v_table_05 varchar2(30) := 'T06_VIRTUAL_CIRCUIT';
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

end;
/

create table rodrigo0501.t02_dispatcher_config as (
  select 1 as id, 
  dispatchers,
  connections,
  sessions,
  service  
  from v$dispatcher_config
);


create table rodrigo0501.t03_dispatcher as (
  select 1 as id,
  name, network, status,messages,
  trunc(bytes/(1024*1024),2) messages_mb, 
  ( --
    select count(*) from v$circuit
  ) circuits_created,
  idle/(60*60) idle_min
  from v$dispatcher
);


create table rodrigo0501.t04_shared_server as (
  select 1 as id,
  name, status,messages,
  trunc(bytes/(1024*1024),2) messages_mb, 
  requests,
  idle/(60*60) idle_min,
  busy/(60*60) busy_min
  from v$shared_server
);

create table rodrigo0501.t05_queue as (
  select 1 as id, queued,wait,totalq
  from v$queue
);


create table rodrigo0501.t06_virtual_circuit as (
  select 1 as id, 
  c.circuit, d.name, c.server,c.status, c.queue
  from v$circuit c
  join v$dispatcher d
  on c.dispatcher = d.paddr --
);

whenever sqlerror continue

