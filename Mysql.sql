-- Active: 1696007081420@@127.0.0.1@3306@e_commerce
use sql_avc;
show tables;
describe test_tuto;

-- Alter page 69 -> 79
alter table test_tuto add COLUMN date_d_inscription DATETIME not null;

alter table test_tuto drop COLUMN date_d_inscription;

alter table test_tuto CHANGE nom prenom VARCHAR(50) not NULL

alter table test_tuto MODIFY prenom VARCHAR(100) not null DEFAULT('Rakotonamboarina')

source C:\Users\PERSONNE\Documents\review;

use sql_avc;

SHOW TABLES;

select* from animal;

INSERT INTO Animal (espece, sexe, date_naissance, nom,
commentaires) VALUES
('chien', 'F', '2008-02-20 15:45:00' , 'Canaille', NULL),
('chien', 'F','2009-05-26 08:54:00' , 'Cali', NULL),
('chien', 'F','2007-04-24 12:54:00' , 'Rouquine', NULL),
('chien', 'F','2009-05-26 08:56:00' , 'Fila', NULL),
('chien', 'F','2008-02-20 15:47:00' , 'Anya', NULL),
('chien', 'F','2009-05-26 08:50:00' ,'Louya' , NULL),
('chien', 'F', '2008-03-10 13:45:00','Welva' , NULL),
('chien', 'F','2007-04-24 12:59:00' ,'Zira' , NULL),
('chien', 'F', '2009-05-26 09:02:00','Java' , NULL),
('chien', 'M','2007-04-24 12:45:00' ,'Balou' , NULL),
('chien', 'M','2008-03-10 13:43:00' ,'Pataud' , NULL),
('chien', 'M','2007-04-24 12:42:00' , 'Bouli', NULL),
('chien', 'M', '2009-03-05 13:54:00','Zoulou' , NULL),
('chien', 'M','2007-04-12 05:23:00' ,'Cartouche' , NULL),
('chien', 'M', '2006-05-14 15:50:00', 'Zambo', NULL),
('chien', 'M','2006-05-14 15:48:00' ,'Samba' , NULL),
('chien', 'M', '2008-03-10 13:40:00','Moka' , NULL),
('chien', 'M', '2006-05-14 15:40:00','Pilou' , NULL),
('chat', 'M','2009-05-14 06:30:00' , 'Fiero', NULL),
('chat', 'M','2007-03-12 12:05:00' ,'Zonko', NULL),
('chat', 'M','2008-02-20 15:45:00' , 'Filou', NULL),
('chat', 'M','2007-03-12 12:07:00' , 'Farceur', NULL),
('chat', 'M','2006-05-19 16:17:00' ,'Caribou' , NULL),
('chat', 'M','2008-04-20 03:22:00' , 'Capou', NULL),
('chat', 'M','2006-05-19 16:56:00' , 'Raccou',
'Pas de queue depuis la naissance');

select id, nom,  sexe FROM animal ORDER BY nom;
describe animal;
select* from animal where id=9;

-- Limit + offset

select* from animal limit 15 offset 20;

select* from animal where nom like /*BINARY*/ "%a%" order by nom;


-- I.10.3. Modification page 110

UPDATE Animal
SET sexe='F', nom='Pataude'
WHERE id=21;

