/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     4/9/2019 23:03:02                            */
/*==============================================================*/


drop index TIPO_DOCUMENTO_CONTRIB_FK;

drop index LUGAR_EXPEDICION_CONTRIB_FK;

drop index CONTRIBUYENTE_PK;

drop table CONTRIBUYENTE;

drop index EMPLEADOR_PK;

drop table EMPLEADOR;

drop index EMPLEADOR_FORMULARIO_FK;

drop index CONTRIBUYENTE_FORMULARIO_FK;

drop index TIPO_FORMULARIO_FK;

drop index LUGAR_FORMULARIO_FK;

drop index FORMULARIO_PK;

drop table FORMULARIO;

drop index FORMULARIO_DETALLE_FK;

drop index FORMULARIO_DETALLE_PK;

drop table FORMULARIO_DETALLE;

drop index LUGAR_PK;

drop table LUGAR;

drop index LUGAR_EXPEDICION_PK;

drop table LUGAR_EXPEDICION;

drop index TIPO_DOCUMENTO_PK;

drop table TIPO_DOCUMENTO;

drop index TIPO_FORMULARIO_PK;

drop table TIPO_FORMULARIO;

/*==============================================================*/
/* Table: CONTRIBUYENTE                                         */
/*==============================================================*/
create table CONTRIBUYENTE (
   ID_CONTRIBUYENTE     SERIAL               not null,
   ID_LUGAR_EXPEDICION  INT4                 null,
   ID_TIPO_DOCUMENTO    INT4                 null,
   NOMBRE               VARCHAR(250)         null,
   APELLIDO_PATERNO     VARCHAR(250)         null,
   APELLIDO_MATERNO     VARCHAR(250)         null,
   APELLIDO_CASADA      VARCHAR(250)         null,
   DOMICILIO            TEXT                 null,
   NUMERO_DOCUMENTO     INT4                 null,
   constraint PK_CONTRIBUYENTE primary key (ID_CONTRIBUYENTE)
);

/*==============================================================*/
/* Index: CONTRIBUYENTE_PK                                      */
/*==============================================================*/
create unique index CONTRIBUYENTE_PK on CONTRIBUYENTE (
ID_CONTRIBUYENTE
);

/*==============================================================*/
/* Index: LUGAR_EXPEDICION_CONTRIB_FK                           */
/*==============================================================*/
create  index LUGAR_EXPEDICION_CONTRIB_FK on CONTRIBUYENTE (
ID_LUGAR_EXPEDICION
);

/*==============================================================*/
/* Index: TIPO_DOCUMENTO_CONTRIB_FK                             */
/*==============================================================*/
create  index TIPO_DOCUMENTO_CONTRIB_FK on CONTRIBUYENTE (
ID_TIPO_DOCUMENTO
);

/*==============================================================*/
/* Table: EMPLEADOR                                             */
/*==============================================================*/
create table EMPLEADOR (
   ID_EMPLEADOR         SERIAL               not null,
   NIT_EMPLEADOR        INT8                 null,
   RAZON_SOCIAL         TEXT                 null,
   DOMICILIO_EMPLEADOR  TEXT                 null,
   constraint PK_EMPLEADOR primary key (ID_EMPLEADOR)
);

/*==============================================================*/
/* Index: EMPLEADOR_PK                                          */
/*==============================================================*/
create unique index EMPLEADOR_PK on EMPLEADOR (
ID_EMPLEADOR
);

/*==============================================================*/
/* Table: FORMULARIO                                            */
/*==============================================================*/
create table FORMULARIO (
   ID_FORMULARIO        SERIAL               not null,
   ID_CONTRIBUYENTE     INT4                 null,
   ID_LUGAR             INT4                 null,
   ID_EMPLEADOR         INT4                 null,
   ID_TIPO_FORMULARIO   INT4                 null,
   FECHA_PRESENTACION   DATE                 null,
   NUMERO_ORDEN         VARCHAR(500)         null,
   NIT                  INT8                 null,
   MES                  INT4                 null,
   ANIO                 INT4                 null,
   IMPORTE_TOTAL        INT8                 null,
   PAGO_CUENTA          INT8                 null,
   constraint PK_FORMULARIO primary key (ID_FORMULARIO)
);

/*==============================================================*/
/* Index: FORMULARIO_PK                                         */
/*==============================================================*/
create unique index FORMULARIO_PK on FORMULARIO (
ID_FORMULARIO
);

/*==============================================================*/
/* Index: LUGAR_FORMULARIO_FK                                   */
/*==============================================================*/
create  index LUGAR_FORMULARIO_FK on FORMULARIO (
ID_LUGAR
);

/*==============================================================*/
/* Index: TIPO_FORMULARIO_FK                                    */
/*==============================================================*/
create  index TIPO_FORMULARIO_FK on FORMULARIO (
ID_TIPO_FORMULARIO
);

/*==============================================================*/
/* Index: CONTRIBUYENTE_FORMULARIO_FK                           */
/*==============================================================*/
create  index CONTRIBUYENTE_FORMULARIO_FK on FORMULARIO (
ID_CONTRIBUYENTE
);

/*==============================================================*/
/* Index: EMPLEADOR_FORMULARIO_FK                               */
/*==============================================================*/
create  index EMPLEADOR_FORMULARIO_FK on FORMULARIO (
ID_EMPLEADOR
);

/*==============================================================*/
/* Table: FORMULARIO_DETALLE                                    */
/*==============================================================*/
create table FORMULARIO_DETALLE (
   ID_FORMULARIO_DETALLE SERIAL               not null,
   ID_FORMULARIO        INT4                 null,
   NIT_FACTURA          INT8                 null,
   NUMERO_FACTURA       INT4                 null,
   NUMERO_AUTORIZACION  INT8                 null,
   FECHA_FACTURA        DATE                 null,
   IMPORTE_FACTURA      INT8                 null,
   CODIGO_CONTROL       VARCHAR(15)          null,
   FACTURA_ELECTRONICA  CHAR(1)              null,
   constraint PK_FORMULARIO_DETALLE primary key (ID_FORMULARIO_DETALLE)
);

/*==============================================================*/
/* Index: FORMULARIO_DETALLE_PK                                 */
/*==============================================================*/
create unique index FORMULARIO_DETALLE_PK on FORMULARIO_DETALLE (
ID_FORMULARIO_DETALLE
);

/*==============================================================*/
/* Index: FORMULARIO_DETALLE_FK                                 */
/*==============================================================*/
create  index FORMULARIO_DETALLE_FK on FORMULARIO_DETALLE (
ID_FORMULARIO
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   ID_LUGAR             SERIAL               not null,
   DENOMINACION_LUGAR   VARCHAR(250)         null,
   ESTADO               INT4                 null,
   constraint PK_LUGAR primary key (ID_LUGAR)
);

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
ID_LUGAR
);

/*==============================================================*/
/* Table: LUGAR_EXPEDICION                                      */
/*==============================================================*/
create table LUGAR_EXPEDICION (
   ID_LUGAR_EXPEDICION  SERIAL               not null,
   DENOMINACION_LUGAR_EXPEDICION VARCHAR(250)         null,
   ESTADO               INT4                 null,
   constraint PK_LUGAR_EXPEDICION primary key (ID_LUGAR_EXPEDICION)
);

/*==============================================================*/
/* Index: LUGAR_EXPEDICION_PK                                   */
/*==============================================================*/
create unique index LUGAR_EXPEDICION_PK on LUGAR_EXPEDICION (
ID_LUGAR_EXPEDICION
);

/*==============================================================*/
/* Table: TIPO_DOCUMENTO                                        */
/*==============================================================*/
create table TIPO_DOCUMENTO (
   ID_TIPO_DOCUMENTO    SERIAL               not null,
   DENOMINACION_DOCUMENTO VARCHAR(500)         null,
   ESTADO               INT4                 null,
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPO_DOCUMENTO)
);

/*==============================================================*/
/* Index: TIPO_DOCUMENTO_PK                                     */
/*==============================================================*/
create unique index TIPO_DOCUMENTO_PK on TIPO_DOCUMENTO (
ID_TIPO_DOCUMENTO
);

/*==============================================================*/
/* Table: TIPO_FORMULARIO                                       */
/*==============================================================*/
create table TIPO_FORMULARIO (
   ID_TIPO_FORMULARIO   SERIAL               not null,
   DENOMINACION_TIPO    VARCHAR(250)         null,
   ESTADO               INT4                 null,
   constraint PK_TIPO_FORMULARIO primary key (ID_TIPO_FORMULARIO)
);

/*==============================================================*/
/* Index: TIPO_FORMULARIO_PK                                    */
/*==============================================================*/
create unique index TIPO_FORMULARIO_PK on TIPO_FORMULARIO (
ID_TIPO_FORMULARIO
);

alter table CONTRIBUYENTE
   add constraint FK_CONTRIBU_LUGAR_EXP_LUGAR_EX foreign key (ID_LUGAR_EXPEDICION)
      references LUGAR_EXPEDICION (ID_LUGAR_EXPEDICION)
      on delete restrict on update restrict;

alter table CONTRIBUYENTE
   add constraint FK_CONTRIBU_TIPO_DOCU_TIPO_DOC foreign key (ID_TIPO_DOCUMENTO)
      references TIPO_DOCUMENTO (ID_TIPO_DOCUMENTO)
      on delete restrict on update restrict;

alter table FORMULARIO
   add constraint FK_FORMULAR_CONTRIBUY_CONTRIBU foreign key (ID_CONTRIBUYENTE)
      references CONTRIBUYENTE (ID_CONTRIBUYENTE)
      on delete restrict on update restrict;

alter table FORMULARIO
   add constraint FK_FORMULAR_EMPLEADOR_EMPLEADO foreign key (ID_EMPLEADOR)
      references EMPLEADOR (ID_EMPLEADOR)
      on delete restrict on update restrict;

alter table FORMULARIO
   add constraint FK_FORMULAR_LUGAR_FOR_LUGAR foreign key (ID_LUGAR)
      references LUGAR (ID_LUGAR)
      on delete restrict on update restrict;

alter table FORMULARIO
   add constraint FK_FORMULAR_TIPO_FORM_TIPO_FOR foreign key (ID_TIPO_FORMULARIO)
      references TIPO_FORMULARIO (ID_TIPO_FORMULARIO)
      on delete restrict on update restrict;

alter table FORMULARIO_DETALLE
   add constraint FK_FORMULAR_FORMULARI_FORMULAR foreign key (ID_FORMULARIO)
      references FORMULARIO (ID_FORMULARIO)
      on delete restrict on update restrict;

