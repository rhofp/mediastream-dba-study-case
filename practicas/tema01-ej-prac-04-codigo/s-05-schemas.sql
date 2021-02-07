-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 06/10/2010
-- @Descripcion: Verificacion de esquemas
-- whenever sqlerror exit rollback;

prompt Conectandose al usuario rodrigo0104:
connect rodrigo0104/rodrigo

declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0104';
  v_schema_table_name varchar2(30) := 'T04_MY_SCHEMA';
begin
  select count(*) into v_count
  from all_tables
  where table_name = v_schema_table_name;

  if v_count > 0 then
    execute immediate 'drop table '
      || v_username || '.'
      || v_schema_table_name;
  end if;

  execute immediate 'create table ' || v_username || '.' 
    || v_schema_table_name || '(
      username varchar2(128),
      schema_name varchar2(128)
    )';
end;
/ 

-- Agregar permisos a los 3 usuarios 
-- Uno podria pensar que se asigna permisos a los usuarios rodrigo010[5|6]:
--   grant insert on rodrigo0104.t04_my_schema to rodrigo0105, rodrigo0106;  
-- Sin embargo, se debe asignar permisos a los usuarios administradores
--    Al conectarse como sysdba el usuario es sys
--    Al conectarse como sysoper el usuario es public
--    Al conectarse como sysbackup el usuario es sysbackup
grant insert on rodrigo0104.t04_my_schema to public, sysbackup;  

-- hacer insert con su priv de ADMIN
prompt Conectandose al usuario rodrigo0104 con sysdba:
connect rodrigo0104/rodrigo as sysdba

insert into rodrigo0104.t04_my_schema (username, schema_name)
SELECT
  sys_context('USERENV','SESSION_USER') as "USER NAME", 
  sys_context('USERENV', 'CURRENT_SCHEMA') as "CURRENT SCHEMA" 
FROM dual;

commit;

prompt Conectandose al usuario rodrigo0105 con sysoper:
connect rodrigo0105/rodrigo as sysoper

insert into rodrigo0104.t04_my_schema (username, schema_name)
SELECT
  sys_context('USERENV','SESSION_USER') as "USER NAME", 
  sys_context('USERENV', 'CURRENT_SCHEMA') as "CURRENT SCHEMA" 
FROM dual;

commit;

prompt Conectandose al usuario rodrigo0106 con sysbackup:
connect rodrigo0106/rodrigo as sysbackup

insert into rodrigo0104.t04_my_schema (username, schema_name)
SELECT
  sys_context('USERENV','SESSION_USER') as "USER NAME", 
  sys_context('USERENV', 'CURRENT_SCHEMA') as "CURRENT SCHEMA" 
FROM dual;

commit;

connect sys/Hola1234# as sysdba

col username format a20
select username, sysdba, sysoper, sysbackup from v$pwfile_users;

-- Regresando contrasena original del usuario SYS
alter user sys identified by "system1";
