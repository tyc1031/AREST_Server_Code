# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table abuser (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  address                   varchar(255),
  phone_number              varchar(255),
  relationship_to_victim    varchar(255),
  social                    varchar(255),
  dob                       varchar(255),
  constraint pk_abuser primary key (id))
;

create table collateral_contact (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  address                   varchar(255),
  phone_number              varchar(255),
  constraint pk_collateral_contact primary key (id))
;

create table guardian (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  address                   varchar(255),
  phone_number              varchar(255),
  relationship_to_victim    varchar(255),
  constraint pk_guardian primary key (id))
;

create table report (
  id                        bigint not null,
  date                      varchar(255),
  username                  varchar(255),
  result                    varchar(255),
  status                    varchar(255),
  abuse_descr               varchar(255),
  victim_risk               varchar(255),
  injury_list               varchar(255),
  witnesses                 varchar(255),
  caregiver_rel             varchar(255),
  is_oral_report_filed      boolean,
  oral_report_filed_time    varchar(255),
  is_risk_to_investigator   boolean,
  risk_descr_to_investigator varchar(255),
  reporter_id               bigint,
  victim_id                 bigint,
  abuser_id                 bigint,
  guardian_id               bigint,
  collateral_contact1_id    bigint,
  collateral_contact2_id    bigint,
  collateral_contact3_id    bigint,
  collateral_contact4_id    bigint,
  collateral_contact5_id    bigint,
  constraint pk_report primary key (id))
;

create table reporter (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  address                   varchar(255),
  phone_number              varchar(255),
  mandated                  boolean,
  relationship_to_victim    varchar(255),
  constraint pk_reporter primary key (id))
;

create table user_container (
  id                        bigint not null,
  user_name                 varchar(255),
  first_name                varchar(255),
  last_name                 varchar(255),
  email                     varchar(255),
  is_supervisor             boolean,
  first_logon               boolean,
  password                  varchar(255),
  salt                      integer,
  constraint pk_user_container primary key (id))
;

create table victim (
  id                        bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  address                   varchar(255),
  phone_number              varchar(255),
  sex                       varchar(255),
  dob                       varchar(255),
  age                       varchar(255),
  marital_status            varchar(255),
  disability                varchar(255),
  communication_needs       varchar(255),
  currently_served_by       varchar(255),
  type_of_service           varchar(255),
  ethnicity                 varchar(255),
  awareness_of_report       varchar(255),
  types_of_abuse            varchar(255),
  freq_of_abuse             varchar(255),
  date_of_last_incident     varchar(255),
  constraint pk_victim primary key (id))
;

create sequence abuser_seq;

create sequence collateral_contact_seq;

create sequence guardian_seq;

create sequence report_seq;

create sequence reporter_seq;

create sequence user_container_seq;

create sequence victim_seq;

alter table report add constraint fk_report_reporter_1 foreign key (reporter_id) references reporter (id) on delete restrict on update restrict;
create index ix_report_reporter_1 on report (reporter_id);
alter table report add constraint fk_report_victim_2 foreign key (victim_id) references victim (id) on delete restrict on update restrict;
create index ix_report_victim_2 on report (victim_id);
alter table report add constraint fk_report_abuser_3 foreign key (abuser_id) references abuser (id) on delete restrict on update restrict;
create index ix_report_abuser_3 on report (abuser_id);
alter table report add constraint fk_report_guardian_4 foreign key (guardian_id) references guardian (id) on delete restrict on update restrict;
create index ix_report_guardian_4 on report (guardian_id);
alter table report add constraint fk_report_collateralContact1_5 foreign key (collateral_contact1_id) references collateral_contact (id) on delete restrict on update restrict;
create index ix_report_collateralContact1_5 on report (collateral_contact1_id);
alter table report add constraint fk_report_collateralContact2_6 foreign key (collateral_contact2_id) references collateral_contact (id) on delete restrict on update restrict;
create index ix_report_collateralContact2_6 on report (collateral_contact2_id);
alter table report add constraint fk_report_collateralContact3_7 foreign key (collateral_contact3_id) references collateral_contact (id) on delete restrict on update restrict;
create index ix_report_collateralContact3_7 on report (collateral_contact3_id);
alter table report add constraint fk_report_collateralContact4_8 foreign key (collateral_contact4_id) references collateral_contact (id) on delete restrict on update restrict;
create index ix_report_collateralContact4_8 on report (collateral_contact4_id);
alter table report add constraint fk_report_collateralContact5_9 foreign key (collateral_contact5_id) references collateral_contact (id) on delete restrict on update restrict;
create index ix_report_collateralContact5_9 on report (collateral_contact5_id);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists abuser;

drop table if exists collateral_contact;

drop table if exists guardian;

drop table if exists report;

drop table if exists reporter;

drop table if exists user_container;

drop table if exists victim;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists abuser_seq;

drop sequence if exists collateral_contact_seq;

drop sequence if exists guardian_seq;

drop sequence if exists report_seq;

drop sequence if exists reporter_seq;

drop sequence if exists user_container_seq;

drop sequence if exists victim_seq;

