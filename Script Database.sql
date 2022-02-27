create database ZHAIRI_CENTER_DB
on (name='ZHAIRI_CENTER_DB_MDF', filename='D:\MON PROJET DE STAGE\DATABASE\ZHAIRI_CENTER_DB_MDF.mdf',size=13)
log on (name='ZHAIRI_CENTER_DB_LDF', filename='D:\MON PROJET DE STAGE\DATABASE\ZHAIRI_CENTER_DB_LDF.ldf',size=5)

use ZHAIRI_CENTER_DB

create table Professeur( ID_PROF int identity(0,1) primary key, PRENOM_PROF varchar(20) not null, NOM_PROF varchar(20) not null, SEX_PROF varchar(1), ADRESSE_PROF varchar(70), TELE_PROF varchar(15) not null)

create table LesDates( ID_DATE int identity(0,1) primary key, DATE_DEBUT Date, DATE_FIN Date)

create table Matiere(ID_MAT int identity(0,1) primary key, LIBELLE_MAT varchar(20) not null, NIVEAU_SCOLAIRE_MAT varchar(30) not null, PRIX_MAT Money not null)

alter table Matiere
alter Column NIVEAU_SCOLAIRE_MAT varchar(max)

insert into Matiere values ('ccc','vv','13.2')
select * from Classe
create table Classe(ID_CLA int identity(0,1)  primary key, LIBELLE_CLA varchar(28) not null, SOUS_GROUPE char(1))

ALTER TABLE Classe
alter COLUMN LIBELLE_CLA VARCHAR(max)

create table Donner_Cours(ID_PROF int foreign key references Professeur(ID_PROF),ID_CLA int foreign key references Classe(ID_CLA), HEURE_DEBUT Time not null, HEURE_FIN Time not null, JOUR varchar(15) not null, DUREE Time, CONSTRAINT PK primary key(ID_PROF,ID_CLA))

create table Elève(ID int identity(0,1) primary key, ID_CLASSE int foreign key references Classe(ID), PRENOM varchar(20) not null, NOM varchar(20) not null, SEX char(1), DATE_NAISSANCE Date not null, ADRESSE varchar(70), NUMERO_MOBILE varchar(16) not null, EMAIL varchar(18) not null, PHOTO image)

create table Réglement(ID_REG int identity(0,1) primary key,ID_ELE int foreign key references Elève(ID_ELE), ID_MAT int foreign key references Matiere(ID_MAT), MOTIF_REG varchar(50), DATE_REG DATE)

create table INSCRIPTION(ID_MAT int foreign key references Matiere(ID_MAT), ID_ELE int foreign key references Elève(ID_ELE) not null, ID_DATE_INSCRI int foreign key references LesDates(ID_Date) not null, REMISE Money, CONSTRAINT PK_INSCRIPTION primary key(ID_MAT,ID_ELE,ID_DATE_INSCRI))

create table Sabsenter( ID_ELEVE int foreign key references Elève(ID), ID_MATIERE int foreign key references Matiere(ID), ID_DATE_ABSSENCE int foreign key references LesDates(ID) , MOTIF varchar(40), NOMBRE_HEURES int, CONSTRAINT PK_Sabsenter Primary key(ID_ELEVE,ID_MATIERE,ID_DATE_ABSSENCE))

drop table SABSENTER
create table Logins( USERNAME varchar(20) primary key, PASS VARCHAR(15))
select * from Donner_Cours where ID_CLASSE=209 and ID_PROFESSEUR=17


insert into Logins (USERNAME,PASS,PERMISSION) values ('ZHR','123','user')
insert into Logins (USERNAME,PASS,PERMISSION) values ('ZHAIRI','123456','admin')
insert into Logins (USERNAME,PASS,PERMISSION) values ('IMANE','12113','viewer')

sp_rename 'Logins' ,'Utilisateur'
s

SELECT FORMAT (DATE_DEBUT, 'dd/MM/yyyy '),FORMAT (DATE_FIN, 'dd/MM/yyyy ') from LesDates
delete from Logins
alter table Logins
ADD check (PERMISSION in('admin','user','viewer'))










exec Delete_All_Classes
select * from Classe
delete from Classe

INSERT INTO Classe values ('hhhhh','A')
select * from Elève

select PHOTO from Elève 



alter trigger Suppresion_Eleve_Reglement on Elève instead of delete
as
begin


  delete from Réglement where ID_ELEVE=(select ID from deleted)
  delete from INSCRIPTION where ID_ELEVE=(select ID from deleted)
  delete from Elève where ID=(select ID from deleted)
  delete from Sabsenter where ID_ELEVE=(select ID from deleted)

end


ALTER trigger Suppresion_Class_et_Eleve on Classe instead of delete
as
begin
delete from Elève where Elève.ID=(select ID from deleted)
delete from Donner_Cours where Donner_Cours.ID_CLASSE=(select ID from deleted)
delete from Classe where Classe.ID=(select ID from deleted)
end


alter trigger Suppresion_Matier_avec_sont_Reg_et_Inscr on Matiere instead of delete
as
begin
delete from INSCRIPTION where INSCRIPTION.ID_MATIERE=(select ID from deleted)
delete from Réglement where Réglement.ID_MATIERE=(select ID from deleted)
 delete from Sabsenter where ID_MATIERE=(select ID from deleted)
delete from Matiere where ID=(select ID from deleted)
end



alter trigger Suppresion_PROF_avec_Ses_COURS on Professeur instead of delete
as
begin
delete from Donner_Cours where ID_PROFESSEUR=(select ID from deleted)
delete from Professeur WHERE ID=(select ID from deleted)
end


ALTER trigger Suppresion_DATE_avec_Ses_inscription on LesDates instead of delete
as
begin
delete from INSCRIPTION where ID_DATE_INSCRIPTION=(select ID from deleted)
 delete from Sabsenter where ID_DATE_ABSSENCE=(select ID from deleted)
delete from LesDates WHERE ID=(select ID from deleted)
end
SELECT * from Elève

ALTER TABLE Elève
alter COLUMN PHOTO IMAGE
--
update Logins
set PASS_Crypte=ENCRYPTBYPASSPHRASE('AAD8ED7707',PASS) --EN HEXADICIMAL

alter trigger Crypte_PASS_LOGIN on Logins for insert,update
as
begin
update Logins
set MOT_PASS_Crypte=ENCRYPTBYPASSPHRASE('AAD8ED7707',MOT_PASSE)
end




alter trigger VerificationDate on LesDates for insert,update
as
begin
declare @D1 as Date=(select DATE_DEBUT from inserted)
declare @D2 as Date=(select DATE_FIN from inserted)
if (@D1>@D2)
rollback
end

alter table Elève
alter column NUMERO_GSM int

alter table Elève
drop column SEX

insert into Elève(ID_CLASSE,PRENOM,NOM,DATE_NAISSANCE,ADRESSE,NUMERO_GSM,EMAIL) values(220,'zhairi','azzeddine','03/09/2001','HAY ',0673723090,'zhairi.azzeddine@gmail.com')

select * from Elève
delete from Elève

alter table Elève
alter Column EMAIL varchar(50)
alter table Elève
alter column ADRESSE varchar(100)
alter table Elève
add  SEX char(1)
SELECT CONVERT(varchar(50),DecryptByPassPhrase('AAD8ED7707',PASS_Crypte)) from Logins where CONVERT(varchar(50),DecryptByPassPhrase('AAD8ED7707',PASS_Crypte))=22222 

alter table Elève
add  PHOTO  varchar(max)

alter proc Crystal @IDeleve int
as
begin
 select E.PRENOM,E.NOM,E.ADRESSE,E.DATE_NAISSANCE,E.NUMERO_GSM,M.LIBELLE as MATIERE,M.NIVEAU_SCOLAIRE,D.DATE_DEBUT as DATE_INSCRIPTION ,M.PRIX  from INSCRIPTION I,Matiere M, Elève E,LesDates D where I.ID_ELEVE=@IDeleve  and I.ID_ELEVE=E.ID and I.ID_MATIERE=M.ID and I.ID_DATE_INSCRIPTION=D.ID
 select SUM(M.PRIX) as TOTAL from INSCRIPTION I,Matiere M, Elève E,LesDates D where I.ID_ELEVE=@IDeleve  and I.ID_ELEVE=E.ID and I.ID_MATIERE=M.ID and I.ID_DATE_INSCRIPTION=D.ID

end


EXEC dbo.Reg

create proc Reg
as
begin 
select E.PRENOM,E.NOM,M.LIBELLE as Matiere,M.NIVEAU_SCOLAIRE as NiveauScolaire,M.PRIX from Elève E, Matiere M, Réglement R where E.ID=R.ID_ELEVE and M.ID=R.ID_MATIERE

end

SELECT * FROM Utilisateur