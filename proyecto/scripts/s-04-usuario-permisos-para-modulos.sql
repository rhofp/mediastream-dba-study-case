--@Author:              Rodrigo Francisco Pablo 
--@Fecha de creacion:   14/02/2021
--@Descripcion:         Eliminacion y creacion de usuarios

connect sys/system3 as sysdba

Prompt Otorgando privilegios para comunicacion entre modulos
grant select on admin_multimedia.multimedia to admin_usuario;
grant references on admin_multimedia.multimedia to admin_usuario;

grant select, references on admin_usuario.usuario to admin_multimedia;

