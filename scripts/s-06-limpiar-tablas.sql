-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Eliminacion de tablas

set serveroutput on

delete from admin_multimedia.autor_multimedia;
delete from admin_multimedia.autor;
delete from admin_multimedia.secciones_multimedia;
delete from admin_multimedia.musica;
delete from admin_multimedia.video;

delete from admin_usuario.playlist_usuario_autorizado;
delete from admin_usuario.playlist_contenido;
delete from admin_usuario.playlist;

delete from admin_multimedia.comentario;

delete from admin_usuario.cargo_tarjeta;
delete from admin_usuario.tarjeta;
delete from admin_usuario.streaming;
delete from admin_usuario.dispositivo_usuario;

delete from admin_multimedia.multimedia;
delete from admin_multimedia.genero_contenido;

delete from admin_usuario.historico_plan_suscriptor;
delete from admin_usuario.usuario_asociado;
delete from admin_usuario.usuario;
delete from admin_usuario.plan_suscripcion;

commit;

