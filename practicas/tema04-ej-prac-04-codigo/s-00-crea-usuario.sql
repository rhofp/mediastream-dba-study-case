-- @Autor: Rodrigo Francisco Pablo
-- @Fecha creacion: 01 de eneoro de 2021
-- @Descripcion: Script unicamente para crear usuarios
set serveroutput on
declare
  v_count number;
  v_username varchar2(30) := 'RODRIGO0404';
  v_contrasena varchar2(30):= 'rodrigo';
  v_permisos varchar2(2000) := 'create table, create session, create sequence';
  v_user_creation varchar2(2000);
  v_user_permissions varchar2(2000);
begin

  select count(*) into v_count 
  from all_users
  where username = v_username;
  if v_count = 0 then
    dbms_output.put_line('Creando usuario ...');
   execute immediate 'create user ' 
      || v_username 
      || ' identified by '
      || v_contrasena
      ||' quota unlimited on users';
    execute immediate 'grant '||v_permisos ||' to ' || v_username;
    dbms_output.put_line('Usuario creado con permisos: ' || v_permisos);
  else
    dbms_output.put_line('El usuario '|| v_username||' ya existe');
  end if;

end;
/
show errors
