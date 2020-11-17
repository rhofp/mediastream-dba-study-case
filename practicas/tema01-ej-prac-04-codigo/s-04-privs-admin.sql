-- @Autor: Francisco Pablo Rodrigo
-- @Fecha creacion: 06/10/2020
-- @Descripcion: Agrega usuarios al archivo de contrasenas

declare
  v_count number;
  v_usuario0105 varchar2(30) := 'RODRIGO0105';
  v_usuario0106 varchar2(30) := 'RODRIGO0106';
begin
  select count(*) into v_count 
  from all_users
  where username = v_usuario0105;
  if v_count = 0 then
    -- Creando usuario
    execute immediate 'create user ' 
      || v_usuario0105 
      || ' identified by rodrigo quota unlimited on users';
  else
    dbms_output.put_line('El usuario '|| v_usuario0105 ||' ya existe');
  end if;

  select count(*) into v_count 
  from all_users
  where username = v_usuario0106;
  if v_count = 0 then
    -- Creando usuario
    execute immediate 'create user ' 
      || v_usuario0106 
      || ' identified by rodrigo quota unlimited on users';
  else
    dbms_output.put_line('El usuario '|| v_usuario0106 ||' ya existe');
  end if;  

  execute immediate 'grant create session to ' || v_usuario0105;
  execute immediate 'grant sysoper to '|| v_usuario0105;
  execute immediate 'grant create session to ' || v_usuario0106;
  execute immediate 'grant sysbackup to '|| v_usuario0106;
  -- El usuario RODRIGO0104 fue creado en el script s-01-version-bd.sql
  execute immediate 'grant sysdba to RODRIGO0104';
end;
/
