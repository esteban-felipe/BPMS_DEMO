drop index if exists primary_key_client;
drop index if exists primary_key_78;
DROP TABLE IF EXISTS "bpms"."Client";
CREATE TABLE "bpms"."Client"
(
   client_id integer PRIMARY KEY NOT NULL,
   client_name varchar(100) NOT NULL
);
CREATE UNIQUE INDEX primary_key_client ON "bpms"."Client"(client_id);

drop index if exists primary_key_9be
;
drop index if exists primary_key_contact
;
DROP TABLE IF EXISTS "bpms"."Contact"
;
CREATE TABLE "bpms"."Contact"
(
   ContactId integer PRIMARY KEY NOT NULL,
   Name varchar(100) NOT NULL,
   Email varchar(100) NOT NULL,
   Phone varchar(100) NOT NULL,
   ClientId integer NOT NULL
)
;
CREATE UNIQUE INDEX primary_key_contact ON "bpms"."Contact"(ContactId)
;
INSERT INTO "bpms"."Client" 
(client_id,client_name) VALUES
(1        ,'Intalio'  )
;
INSERT INTO "bpms"."Client" 
(client_id,client_name) VALUES
(2        ,'ACME'     )
;
INSERT INTO "bpms"."Client" 
(client_id,client_name   ) VALUES
(3        ,'Another Acme')
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name            ,Email               ,Phone       ,ClientId) VALUES
(1        ,'Esteban Felipe','felipe@intalio.com','3057675141',1       )
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name              ,Email                 ,Phone      ,ClientId) VALUES
(2        ,'Sebastian Felipe','sebas@sebastianf.com','123123123',1       )
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name          ,Email             ,Phone    ,ClientId) VALUES
(3        ,'Sofia Felipe','sofia@sofiaf.com','1231232',2       )
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name         ,Email             ,Phone      ,ClientId) VALUES
(4        ,'Milvia Cruz','milvia@gmail.com','123123123',3       )
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name           ,Email               ,Phone   ,ClientId) VALUES
(5        ,'Blacky Felipe','blacky@iamadog.com','123123',3       )
;
INSERT INTO "bpms"."Contact" 
(ContactId,Name      ,Email           ,Phone   ,ClientId) VALUES
(6        ,'John Doe','doe@whoami.com','123545',3       )
;
