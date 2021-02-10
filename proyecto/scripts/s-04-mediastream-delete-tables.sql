-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Eliminacion de tablas

set serveroutput on

drop table admin_multimedia.autor_multimedia;
drop table admin_multimedia.autor;
drop table admin_multimedia.secciones_multimedia;
drop table admin_multimedia.musica;
drop table admin_multimedia.video;

drop table admin_usuario.playlist_usuario_autorizado;
drop table admin_usuario.playlist_contenido;
drop table admin_usuario.playlist;

drop table admin_multimedia.comentario;
drop table admin_multimedia.multimedia;
drop table admin_multimedia.genero_contenido;


drop table admin_usuario.dispositivo_usuario;
drop table admin_usuario.cargo_tarjeta;
drop table admin_usuario.tarjeta;
drop table admin_usuario.streaming;
drop table admin_usuario.usuario_asociado;
drop table admin_usuario.usuario;
drop table admin_usuario.historico_plan_suscriptor;
drop table admin_usuario.plan_suscripcion;
