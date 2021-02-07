-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Explorando procesos del cliente y servidor

whenever sqlerror exit rollback
set serveroutput on

connect sys as sysdba

prompt Haciendo limpieza
declare
v_count number;
v_username varchar2(30) := 'RODRIGO0501';
v_table_01 varchar2(30) := 'T07_SESSION_INFO_CONTEXT';
v_table_02 varchar2(30) := 'T08_SESSION_INFO_VIEW';
v_table_03 varchar2(30) := 'T09_PROCESS_INFO';
v_table_04 varchar2(30) := 'T10_BACKGROUND_PROCESS';
v_table_05 varchar2(30) := 'T11_FOREGROUND_PROCESS';
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

create table rodrigo0501.t07_session_info_context as (
  select sys_context('USERENV','HOST') as host,
  sys_context('USERENV','OS_USER') as os_user,
  sys_context('USERENV','SESSION_USERID') as user_id,
  sys_context('USERENV','SID') as session_id --
  from dual
);

create table rodrigo0501.t08_session_info_view as (
  select s.sid as session_id,
  s.paddr as process_address,
  s.username bd_username,
  s.status as session_status,
  s.port as client_port,
  s.process as os_client_process_id, --
  s.program as client_program
  from gv$session s
  join v$process p
  on s.paddr = p.addr
  join (
    select 
    sys_context('USERENV','SID') as session_id
    from dual
  ) q
  on s.sid = q.session_id   
  where s.username = 'SYS'
);

create table rodrigo0501.t09_process_info as (
  select p.sosid, --
  p.pname, p.background, p.tracefile
  from v$process p
  join gv$session s
  on s.paddr = p.addr
  join ( 
    select
    sys_context('USERENV','SID') as session_id
    from dual                            
  ) q
  on s.sid = q.session_id 
);

create table rodrigo0501.t10_background_process as (
  select addr, sosid, pname,username os_username, background 
  from v$process
  where background is not null
);

create table rodrigo0501.t11_foreground_process as (
  select p.addr, p.sosid, p.pname,s.username bd_username, 
  p.username os_username, p.background  
  from v$process p
  left join v$session s
  on p.addr = s.saddr  
  where background is null
);

whenever sqlerror continue

