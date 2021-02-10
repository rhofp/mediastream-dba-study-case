--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      unam.fi
-- Project :      media-stream-modelo.DM1
-- Author :       rho
--
-- Date Created : Tuesday, February 09, 2021 16:27:27
-- Target DBMS : Oracle 11g
--

-- NOTE: I SHALL USE UPPER CASE FOR THE AUTOGENERATED CODE FROM ER-STUDIO AND
-- LOWER CASE FOR THE USER MODIFIED VERSION (TABLESPACES)

-- 
-- TABLE: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID         NUMBER(10, 0)    NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    AP_PATERNO       VARCHAR2(40)     NOT NULL,
    AP_MATERNO       VARCHAR2(40)     NOT NULL,
    EMAIL            VARCHAR2(80)     NOT NULL,
    GPO_ARTISTICO    VARCHAR2(40)     NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



-- 
-- TABLE: GENERO_CONTENIDO 
--

CREATE TABLE GENERO_CONTENIDO(
    GENERO_CONTENIDO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE_GENERO          VARCHAR2(20)     NOT NULL,
    DESCRIPCION            VARCHAR2(300)    NOT NULL,
    CONSTRAINT GENERO_CONTENIDO_PK PRIMARY KEY (GENERO_CONTENIDO_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



-- 
-- TABLE: MULTIMEDIA 
--

CREATE TABLE MULTIMEDIA(
    MULTIMEDIA_ID           NUMBER(10, 0)    NOT NULL,
    CLAVE                   VARCHAR2(16)     NOT NULL,
    NOMBRE_CONTENIDO        VARCHAR2(60)     NOT NULL,
    TOTAL_REPRODUCCIONES    NUMBER(8, 0)     NOT NULL,
    DURACION                NUMBER(6, 0)     NOT NULL,
    TIPO                    CHAR(1)          NOT NULL,
    GENERO_CONTENIDO_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MULTIMEDI_PK PRIMARY KEY (MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT MULTIMEDIA_GENERO_CONTENIDO_ID_FK FOREIGN KEY (GENERO_CONTENIDO_ID)
    REFERENCES GENERO_CONTENIDO(GENERO_CONTENIDO_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



-- 
-- TABLE: AUTOR_MULTIMEDIA 
--

CREATE TABLE AUTOR_MULTIMEDIA(
    AUTOR_MULTIMEDIA_ID         NUMBER(10, 0)    NOT NULL,
    PORCENTAJE_PARTCIP_AUTOR    NUMBER(5, 2)     NOT NULL,
    MULTIMEDIA_ID               NUMBER(10, 0)    NOT NULL,
    AUTOR_ID                    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AUTOR_MULTIMEDIA_PK PRIMARY KEY (AUTOR_MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT AUTOR_MULTIMEDIA_AUTOR_ID_FK FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID)
    tablespace indexes_tbs,
    CONSTRAINT AUTOR_MULTIMEDIA_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



-- 
-- TABLE: PLAN_SUSCRIPCION 
--

CREATE TABLE PLAN_SUSCRIPCION(
    PLAN_SUSCRIPCION_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                  VARCHAR2(20)     NOT NULL,
    NOMBRE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION            VARCHAR2(500)    NOT NULL,
    COSTO                  NUMBER(6, 2)     NOT NULL,
    VIGENCIA               DATE             NOT NULL,
    FECHA_FIN              DATE,
    CONSTRAINT PLAN_SUSCRIPCION_PK PRIMARY KEY (PLAN_SUSCRIPCION_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    USUARIO_ID             NUMBER(10, 0)    NOT NULL,
    USERNAME               VARCHAR2(30)     NOT NULL,
    PASSWORD               VARCHAR2(60)     NOT NULL,
    EMAIL                  VARCHAR2(60)     NOT NULL,
    NOMBRE                 VARCHAR2(40)     NOT NULL,
    AP_PATERNO             VARCHAR2(40)     NOT NULL,
    AP_MATERNO             VARCHAR2(40)     NOT NULL,
    RFC                    VARCHAR2(20),
    PLAN_SUSCRIPCION_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT USUARIO_PK PRIMARY KEY (USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT USUARIO_PLAN_SUSCRIPTOR_ID_FK FOREIGN KEY (PLAN_SUSCRIPCION_ID)
    REFERENCES PLAN_SUSCRIPCION(PLAN_SUSCRIPCION_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: TARJETA 
--

CREATE TABLE TARJETA(
    TARJETA_ID       NUMBER(10, 0)    NOT NULL,
    NUM_TARJETA      VARCHAR2(16)     NOT NULL,
    NUM_SEGURIDAD    NUMBER(3, 0)     NOT NULL,
    ANIO_EXPIRA      VARCHAR2(2)      NOT NULL,
    MES_EXPIRA       VARCHAR2(2)      NOT NULL,
    TIPO             CHAR(1)          NOT NULL,
    USUARIO_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT TARJETA_PK PRIMARY KEY (TARJETA_ID)
    tablespace indexes_tbs,
    CONSTRAINT TARJETA_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: CARGO_TARJETA 
--

CREATE TABLE CARGO_TARJETA(
    CARGO_TARJETA_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_CARGO         DATE             NOT NULL,
    FOLIO               VARCHAR2(20)     NOT NULL,
    IMPORTE             NUMBER(6, 2)     NOT NULL,
    TARJETA_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CARGO_TARJETA_PK PRIMARY KEY (CARGO_TARJETA_ID)
    tablespace indexes_tbs,
    CONSTRAINT CARGO_TARJETA_TARJETA_ID_FK FOREIGN KEY (TARJETA_ID)
    REFERENCES TARJETA(TARJETA_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: COMENTARIO 
--

CREATE TABLE COMENTARIO(
    COMENTARIO_ID           NUMBER(10, 0)     NOT NULL,
    COMENTARIO              VARCHAR2(2000)    NOT NULL,
    USUARIO_ID              NUMBER(10, 0)     NOT NULL,
    USUARIO_RESPUESTA_ID    NUMBER(10, 0),
    MULTIMEDIA_ID           NUMBER(10, 0)     NOT NULL,
    CONSTRAINT COMENTARIO_PK PRIMARY KEY (COMENTARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT COMENTARIO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT COMENTARIO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT COMENTARIO_USUARIO_RESPUESTA_ID_FK FOREIGN KEY (USUARIO_RESPUESTA_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs;
;



-- 
-- TABLE: DISPOSITIVO_USUARIO 
--

CREATE TABLE DISPOSITIVO_USUARIO(
    DISPOSITIVO_USUARIO_ID    NUMBER(10, 0)    NOT NULL,
    TIPO_DISPOSITIVO          CHAR(1)          NOT NULL,
    IP                        VARCHAR2(20),
    SISTEMA_OPERATIVO         VARCHAR2(20)     NOT NULL,
    NOMBRE_DISPOSITIVO        VARCHAR2(30)     NOT NULL,
    MARCA                     VARCHAR2(30)     NOT NULL,
    USUARIO_ID                NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISPOSITIVO_USUARIO_PK PRIMARY KEY (DISPOSITIVO_USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT DISPOSITIVO_USUARIO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: HISTORICO_PLAN_SUSCRIPTOR 
--

CREATE TABLE HISTORICO_PLAN_SUSCRIPTOR(
    HISTORICO_PLAN_SUCRIPTOR_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_PLAN                     DATE             NOT NULL,
    FECHA_FIN                      DATE             NOT NULL,
    COSTO                          VARCHAR2(40)     NOT NULL,
    PLAN_SUSCRIPCION_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT HISTORICO_PLAN_SUSCRIPTOR_PK PRIMARY KEY (HISTORICO_PLAN_SUCRIPTOR_ID)
    tablespace indexes_tbs,
    CONSTRAINT HIST_PLAN_SUSCRIP_PLAN_SUSCRIPTOR_IK_FK FOREIGN KEY (PLAN_SUSCRIPCION_ID)
    REFERENCES PLAN_SUSCRIPCION(PLAN_SUSCRIPCION_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: MUSICA 
--

CREATE TABLE MUSICA(
    MULTIMEDIA_ID    NUMBER(10, 0)     NOT NULL,
    LETRA_AUDIO      VARCHAR2(2000)    NOT NULL,
    FORMATO          VARCHAR2(20)      NOT NULL,
    NUM_KBPS         NUMBER(15, 0)     NOT NULL,
    CONSTRAINT MUSICA_PK PRIMARY KEY (MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT RefMULTIMEDIA7 FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



-- 
-- TABLE: PLAYLIST 
--

CREATE TABLE PLAYLIST(
    PLAYLIST_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    USUARIO_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_PK PRIMARY KEY (PLAYLIST_ID)
    tablespace indexes_tbs,
    CONSTRAINT PLAYLIST_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: PLAYLIST_CONTENIDO 
--

CREATE TABLE PLAYLIST_CONTENIDO(
    PLAYLIST_UDUARIO_ID    NUMBER(10, 0)    NOT NULL,
    PLAYLIST_ID            NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_CONTENIDO_PK PRIMARY KEY (PLAYLIST_UDUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT PLAYLIST_CONTENIDO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT PLAYLIST_CONTENIDO_PLAYLIST_ID_FK FOREIGN KEY (PLAYLIST_ID)
    REFERENCES PLAYLIST(PLAYLIST_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: PLAYLIST_USUARIO_AUTORIZADO 
--

CREATE TABLE PLAYLIST_USUARIO_AUTORIZADO(
    PLAYLIST_USUARIO_AUTORIZADO_ID    NUMBER(10, 0)    NOT NULL,
    USUARIO_ASOCIADO_ID               NUMBER(10, 0)    NOT NULL,
    PLAYLIST_ID                       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_AUTORIZADO_PK PRIMARY KEY (PLAYLIST_USUARIO_AUTORIZADO_ID)
    tablespace indexes_tbs,
    CONSTRAINT PLALIST_USU_AUT_USUARIO_ASOCIADO_ID_FK FOREIGN KEY (USUARIO_ASOCIADO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT PLAYLIST_USU_AUT_PLAYLIST_ID_FK FOREIGN KEY (PLAYLIST_ID)
    REFERENCES PLAYLIST(PLAYLIST_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: SECCIONES_MULTIMEDIA 
--

CREATE TABLE SECCIONES_MULTIMEDIA(
    SECCION_MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    NUM_SECUENCIA            NUMBER(8, 0)     NOT NULL,
    MULTIMEDIA_ID            NUMBER(10, 0)    NOT NULL,
    CONTENIDO                BLOB             NOT NULL,
    CONSTRAINT SECCIONES_MULTIMEDIA_PK PRIMARY KEY (SECCION_MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT SECCIONES_MULTIMEDIA_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs
    -- Storing lob in different tablespace space
    lob (contenido) store as basicfile segname(
      tablespace contenido_blob_tbs chunk 4096 
      pctversion 5 
      nocache logging 
      storage (maxextents 5)
    )
) tablespace multimedia_tbs
;



-- 
-- TABLE: STREAMING 
--

CREATE TABLE STREAMING(
    STREAMING_ID               NUMBER(10, 0)    NOT NULL,
    CALIFICACION_CONTENIDO     NUMBER(1, 0)     NOT NULL,
    CONTADOR_REPRODUCCIONES    NUMBER(8, 0)     NOT NULL,
    SEGUNDO_INICIAL            NUMBER(8, 0)     NOT NULL,
    SEGUNDO_FINAL              NUMBER(8, 0)     NOT NULL,
    FECHA_INICIO               DATE             NOT NULL,
    DURACION_REPRODUCCION      NUMBER(8, 0)     NOT NULL,
    VELOCIDAD_CARGA            NUMBER(10, 0)    NOT NULL,
    VELOCIDAD_DESCARGA         NUMBER(10, 0)    NOT NULL,
    LATITUD                    NUMBER(10, 3),
    LONGITUD                   NUMBER(10, 3),
    MULTIMEDIA_ID              NUMBER(10, 0)    NOT NULL,
    USUARIO_ID                 NUMBER(10, 0)    NOT NULL,
    DISPOSITIVO_USUARIO_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT STREAMING_PK PRIMARY KEY (STREAMING_ID)
    tablespace indexes_tbs,
    CONSTRAINT STREAMING_DISPOSITIVO_USUARIO_ID_FK FOREIGN KEY (DISPOSITIVO_USUARIO_ID)
    REFERENCES DISPOSITIVO_USUARIO(DISPOSITIVO_USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT STREAMING_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT STREAMING_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs
)
;



-- 
-- TABLE: USUARIO_ASOCIADO 
--

CREATE TABLE USUARIO_ASOCIADO(
    USUARIO_ASOCIADO_ID    NUMBER(10, 0)    NOT NULL,
    USUARIO_ID             NUMBER(10, 0)    NOT NULL,
    USUARIO_ANEXO_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT USUARIO_ASOCIADO_PK PRIMARY KEY (USUARIO_ASOCIADO_ID)
    tablespace indexes_tbs,
    CONSTRAINT USUARIO_ASOCIADO_USUARIO_ANEXO_ID_FK FOREIGN KEY (USUARIO_ANEXO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs,
    CONSTRAINT USUARIO_ASOCIADO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
    tablespace indexes_tbs,
)
;



-- 
-- TABLE: VIDEO 
--

CREATE TABLE VIDEO(
    MULTIMEDIA_ID            NUMBER(10, 0)    NOT NULL,
    TIPO                     VARCHAR2(20)     NOT NULL,
    CODIFICACION             VARCHAR2(10)     NOT NULL,
    TIPO_TRANSPORTE          VARCHAR2(20)     NOT NULL,
    PROTOCOLO_TRANSMISION    VARCHAR2(20)     NOT NULL,
    CLASIFICACION            CHAR(1)          NOT NULL,
    CONSTRAINT VIDEO_PK PRIMARY KEY (MULTIMEDIA_ID)
    tablespace indexes_tbs,
    CONSTRAINT RefMULTIMEDIA8 FOREIGN KEY (MULTIMEDIA_ID)
    REFERENCES MULTIMEDIA(MULTIMEDIA_ID)
    tablespace indexes_tbs
) tablespace multimedia_tbs
;



