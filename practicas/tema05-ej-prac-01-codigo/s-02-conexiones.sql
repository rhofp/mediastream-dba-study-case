-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de enero de 2021
-- @Descripcion: Conexion en modo compartido y dedicado

whenever sqlerror exit rollback
set serveroutput on

-- Conexion en modo dedicado
connect sys/system2 as sysdba

prompt Haciendo limpieza
declare
v_count number;
v_username varchar2(30) := 'RODRIGO0501';
v_table_01 varchar2(30) := 'T01_SESSION_DATA';
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

create table rodrigo0501.t01_session_data as (
  select 1 as id, sid, logon_time, username, status, 
  server,osuser, process,port
  from v$session 
  where username = 'SYS'
);

-- Conexion en modo compartido
connect sys/system2@rfpbda2 as sysdba

insert into rodrigo0501.t01_session_data (
  id, sid, logon_time, username, status,
  server,osuser, process,port
) 
select 2, sid, logon_time, username, status, 
server,osuser, process,port
from v$session 
where username = 'SYS';

-- Conexion en modo dedicado as @rfpbda2_dedicated
connect sys/system2@rfpbda2_dedicated as sysdba

insert into rodrigo0501.t01_session_data (
  id, sid, logon_time, username, status,
  server,osuser, process,port
) 
select 3, sid, logon_time, username, status, 
server,osuser, process,port
from v$session 
where username = 'SYS';

-- Conexion en modo compartido as @rfpbda2_shared
connect sys/system2@rfpbda2_shared as sysdba

insert into rodrigo0501.t01_session_data (
  id, sid, logon_time, username, status,
  server,osuser, process,port
) 
select 4, sid, logon_time, username, status, 
server,osuser, process,port
from v$session 
where username = 'SYS';


whenever sqlerror continue

