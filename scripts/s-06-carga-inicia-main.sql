-- @Autor:            Francisco Pablo Rodrigo
-- @Fecha creacion:   04/02/2021
-- @Descripcion:      Main para carga inicial

set serveroutput on

connect sys/system3 as sysdba
whenever sqlerror exit rollback
@s-06-limpiar-tablas.sql

connect admin_multimedia/admin_multimedia
whenever sqlerror exit rollback
prompt AUTOR
@carga-inicial/autor;
prompt GENERO_CONTENIDO
@carga-inicial/genero_contenido;
prompt MULTIMEDIA;
@carga-inicial/multimedia;
prompt AUTOR_MULTIMEDIA;
@carga-inicial/autor_multimedia;


connect admin_usuario/admin_usuario
whenever sqlerror exit rollback
prompt PLAN_SUSCRIPCION;
@carga-inicial/plan_suscripcion;
prompt USUARIO;
@carga-inicial/usuario;
prompt TARJETA;
@carga-inicial/tarjeta;
prompt CARGO_TARJETA;
@carga-inicial/cargo_tarjeta;
prompt DISPOSITIVO_USUARIO;
@carga-inicial/dispositivo_usuario;
prompt HISTORICO_PLAN_SUSCRIPTOR;
@carga-inicial/historico_plan_suscriptor;


connect admin_multimedia/admin_multimedia
whenever sqlerror exit rollback
prompt MUSICA;
@carga-inicial/musica;


connect admin_usuario/admin_usuario
whenever sqlerror exit rollback
prompt PLAYLIST;
@carga-inicial/playlist;
prompt PLAYLIST_USUARIO_AUTORIZADO;
@carga-inicial/playlist_usuario_autorizado;

connect admin_multimedia/admin_multimedia
whenever sqlerror exit rollback
prompt SECCIONES_MULTIMEDIA;
@carga-inicial/secciones_multimedia;

connect admin_usuario/admin_usuario
whenever sqlerror exit rollback
prompt USUARIO_ASOCIADO;
@carga-inicial/usuario_asociado;

connect admin_multimedia/admin_multimedia
whenever sqlerror exit rollback
prompt VIDEO;
@carga-inicial/video;

connect admin_usuario/admin_usuario
whenever sqlerror exit rollback
prompt PLAYLIST_CONTENIDO;
@carga-inicial/playlist_contenido;

connect admin_multimedia/admin_multimedia
whenever sqlerror exit rollback
prompt COMENTARIO;
@carga-inicial/comentario;

connect admin_usuario/admin_usuario

whenever sqlerror exit rollback
prompt STREAMING;
@carga-inicial/streaming;

whenever sqlerror continue
