-- ------------ --
-- Transactions --
-- ------------ --

SET NAMES utf8;


DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS Espece;


CREATE TABLE Espece (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
nom_courant varchar(40) NOT NULL,
nom_latin varchar(40) NOT NULL,
description text,
prix decimal(7,2) unsigned DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE KEY nom_latin (nom_latin)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

LOCK TABLES Espece WRITE;
INSERT INTO Espece VALUES
(1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue',200.00),(2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres',150.00),(3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure',140.00),
(4,'Perroquet amazone','Alipiopsitta xanthops','Joli oiseau parleur vert et jaune',700.00),(5,'Rat brun','Rattus norvegicus','Petite bestiole avec de longues moustaches et une longue queue sans poils',10.00);
UNLOCK TABLES;


CREATE TABLE Race (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
nom varchar(40) NOT NULL,
espece_id smallint(6) unsigned NOT NULL,
description text,
prix decimal(7,2) unsigned DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES Race WRITE;
INSERT INTO Race VALUES
(1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00),(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00),
(4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.',835.00),(5,'Maine coon',2,'Chat de grande taille, à poils mi-longs.',735.00),(7,'Sphynx',2,'Chat sans poils.',1235.00),
(8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...',985.00),(9,'Rottweiller',1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.',600.00);
UNLOCK TABLES;


CREATE TABLE Animal (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
sexe char(1) DEFAULT NULL,
date_naissance datetime NOT NULL,
nom varchar(30) DEFAULT NULL,
commentaires text,
espece_id smallint(6) unsigned NOT NULL,
race_id smallint(6) unsigned DEFAULT NULL,
mere_id smallint(6) unsigned DEFAULT NULL,
pere_id smallint(6) unsigned DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE KEY ind_uni_nom_espece_id (nom,espece_id)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

LOCK TABLES Animal WRITE;
INSERT INTO Animal VALUES
(1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22),(2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31),
(4,'F','2009-08-03 05:12:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(5,NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche',2,NULL,NULL,NULL),(6,'F','2009-06-13 08:17:00','Bobosse','Carapace bizarre',3,NULL,NULL,NULL),
(7,'F','2008-12-06 05:18:00','Caroline',NULL,1,2,NULL,NULL),(8,'M','2008-09-11 15:38:00','Bagherra',NULL,2,5,NULL,NULL),(9,NULL,'2010-08-23 05:18:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(10,'M','2010-07-21 15:41:00','Bobo',NULL,1,NULL,7,21),(11,'F','2008-02-20 15:45:00','Canaille',NULL,1,NULL,NULL,NULL),(12,'F','2009-05-26 08:54:00','Cali',NULL,1,2,NULL,NULL),
(13,'F','2007-04-24 12:54:00','Rouquine',NULL,1,1,NULL,NULL),(14,'F','2009-05-26 08:56:00','Fila',NULL,1,2,NULL,NULL),(15,'F','2008-02-20 15:47:00','Anya',NULL,1,NULL,NULL,NULL),
(16,'F','2009-05-26 08:50:00','Louya',NULL,1,NULL,NULL,NULL),(17,'F','2008-03-10 13:45:00','Welva',NULL,1,NULL,NULL,NULL),(18,'F','2007-04-24 12:59:00','Zira',NULL,1,1,NULL,NULL),
(19,'F','2009-05-26 09:02:00','Java',NULL,1,2,NULL,NULL),(20,'M','2007-04-24 12:45:00','Balou',NULL,1,1,NULL,NULL),(21,'F','2008-03-10 13:43:00','Pataude',NULL,1,NULL,NULL,NULL),
(22,'M','2007-04-24 12:42:00','Bouli',NULL,1,1,NULL,NULL),(24,'M','2007-04-12 05:23:00','Cartouche',NULL,1,NULL,NULL,NULL),(25,'M','2006-05-14 15:50:00','Zambo',NULL,1,1,NULL,NULL),
(26,'M','2006-05-14 15:48:00','Samba',NULL,1,1,NULL,NULL),(27,'M','2008-03-10 13:40:00','Moka',NULL,1,NULL,NULL,NULL),(28,'M','2006-05-14 15:40:00','Pilou',NULL,1,1,NULL,NULL),
(29,'M','2009-05-14 06:30:00','Fiero',NULL,2,3,NULL,NULL),(30,'M','2007-03-12 12:05:00','Zonko',NULL,2,5,NULL,NULL),(31,'M','2008-02-20 15:45:00','Filou',NULL,2,4,NULL,NULL),
(32,'M','2009-07-26 11:52:00','Spoutnik',NULL,3,NULL,52,NULL),(33,'M','2006-05-19 16:17:00','Caribou',NULL,2,4,NULL,NULL),(34,'M','2008-04-20 03:22:00','Capou',NULL,2,5,NULL,NULL),
(35,'M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance',2,4,NULL,NULL),(36,'M','2009-05-14 06:42:00','Boucan',NULL,2,3,NULL,NULL),(37,'F','2006-05-19 16:06:00','Callune',NULL,2,8,NULL,NULL),
(38,'F','2009-05-14 06:45:00','Boule',NULL,2,3,NULL,NULL),(39,'F','2008-04-20 03:26:00','Zara',NULL,2,5,NULL,NULL),(40,'F','2007-03-12 12:00:00','Milla',NULL,2,5,NULL,NULL),
(41,'F','2006-05-19 15:59:00','Feta',NULL,2,4,NULL,NULL),(42,'F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%',2,5,NULL,NULL),(43,'F','2007-03-12 11:54:00','Cracotte',NULL,2,5,NULL,NULL),
(44,'F','2006-05-19 16:16:00','Cawette',NULL,2,8,NULL,NULL),(45,'F','2007-04-01 18:17:00','Nikki','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(46,'F','2009-03-24 08:23:00','Tortilla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(47,'F','2009-03-26 01:24:00','Scroupy','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(48,'F','2006-03-15 14:56:00','Lulla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(49,'F','2008-03-15 12:02:00','Dana','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(50,'F','2009-05-25 19:57:00','Cheli','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(51,'F','2007-04-01 03:54:00','Chicaca','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(52,'F','2006-03-15 14:26:00','Redbul','Insomniaque',3,NULL,NULL,NULL),
(54,'M','2008-03-16 08:20:00','Bubulle','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(55,'M','2008-03-15 18:45:00','Relou','Surpoids',3,NULL,NULL,NULL),(56,'M','2009-05-25 18:54:00','Bulbizard','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(57,'M','2007-03-04 19:36:00','Safran','Coco veut un gâteau !',4,NULL,NULL,NULL),(58,'M','2008-02-20 02:50:00','Gingko','Coco veut un gâteau !',4,NULL,NULL,NULL),(59,'M','2009-03-26 08:28:00','Bavard','Coco veut un gâteau !',4,NULL,NULL,NULL),
(60,'F','2009-03-26 07:55:00','Parlotte','Coco veut un gâteau !',4,NULL,NULL,NULL),(61,'M','2010-11-09 00:00:00','Yoda',NULL,2,5,NULL,NULL),(62,'M','2010-11-05 00:00:00','Pipo',NULL,1,9,NULL,NULL);
UNLOCK TABLES;

ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY
(espece_id) REFERENCES Espece (id) ON DELETE CASCADE;

ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id)
REFERENCES Race (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id)
REFERENCES Animal (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id)
REFERENCES Animal (id) ON DELETE SET NULL;



SET autocommit=0;

INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Baba', 5, '2012-02-13 15:45:00', 'F');
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Bibo', 5, '2012-02-13 15:48:00', 'M');
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Buba', 5, '2012-02-13 18:32:00', 'F'); -- Insertion de 3 rats bruns

UPDATE Espece
SET prix = 20
WHERE id = 5; -- Les rats bruns coûtent maintenant 20 euros au lieu de 10


SELECT *
FROM Animal
WHERE espece_id = 5;

SELECT *
FROM Espece
WHERE id = 5;

ROLLBACK;

INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Baba', 5, '2012-02-13 15:45:00', 'F');
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Bibo', 5, '2012-02-13 15:48:00', 'M');
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Buba', 5, '2012-02-13 18:32:00', 'F'); -- Insertion de 3 rats bruns

COMMIT;

UPDATE Espece
SET prix = 20
WHERE id = 5; -- Les rats valent 20 euros

ROLLBACK;

UPDATE Animal
SET commentaires = 'Queue coupée'
WHERE nom = 'Bibo' AND espece_id = 5;

SELECT id, sexe, nom, commentaires, espece_id, race_id
FROM Animal
WHERE espece_id = 5;

--  Démarrer explicitement une transaction
SET autocommit=1;

START TRANSACTION;

-- Insertion d'un nouveau rat brun, plus vieux
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Momy', 5, '2008-02-01 02:25:00', 'F');

-- Ouverture d'une transaction
START TRANSACTION;

-- La nouvelle rate est la mère de Buba et Baba
UPDATE Animal
SET mere_id = LAST_INSERT_ID()
WHERE espece_id = 5
AND nom IN ('Baba', 'Buba');

-- On annule les requêtes de la transaction, ce qui termine celle-ci
ROLLBACK;
-- verrification 
select mere_id from animal where espece_id = 5;
-- La nouvelle rate est la mère de Bibo
UPDATE Animal
SET mere_id = LAST_INSERT_ID()
WHERE espece_id = 5
AND nom = 'Bibo';


-- Nouvelle transaction
START TRANSACTION;

 -- Suppression de Buba
DELETE FROM Animal
WHERE espece_id = 5
AND nom = 'Buba';

-- On valide les requêtes de la transaction, ce qui termine celle-ci
COMMIT;

SELECT id, nom, espece_id, mere_id
FROM Animal
WHERE espece_id = 5;

--  Jalon de transaction

-- Syntaxe
SAVEPOINT nom_jalon; -- Crée un jalon avec comme nom "nom_jalon"

ROLLBACK [WORK] TO [SAVEPOINT] nom_jalon; 
-- Annule les requêtesexécutées depuis le jalon "nom_jalon", WORK et SAVEPOINT ne sont pas obligatoires
RELEASE SAVEPOINT nom_jalon; -- Retire le jalon "nom_jalon" (sans annuler, ni valider les requêtes faites depuis
-- fin syntaxe

START TRANSACTION;
INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Popi', 5, '2007-03-11 12:45:00', 'M');

SAVEPOINT jalon1;

INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Momo', 5, '2007-03-12 05:23:00', 'M');

ROLLBACK TO SAVEPOINT jalon1;

INSERT INTO Animal (nom, espece_id, date_naissance, sexe)
VALUES ('Mimi', 5, '2007-03-12 22:03:00', 'F');
COMMIT;

SELECT id, sexe, date_naissance, nom, espece_id, mere_id, pere_id
FROM Animal
WHERE espece_id = 5;

-- ---------------------------------------
-- ACID : Acide Coherence Isolation Durabilite
-- ---------------------------------------

START TRANSACTION; -- On ouvre une transaction

UPDATE Animal -- On modifie Bibo
SET pere_id = 73
WHERE espece_id = 5 AND nom = 'Bibo';


SELECT id, nom, commentaires, pere_id, mere_id
FROM Animal
WHERE espece_id = 5;

START TRANSACTION; -- On ouvre une transaction

SELECT id, nom, commentaires, pere_id, mere_id
FROM Animal
WHERE espece_id = 5;

UPDATE Animal -- On modifie la perruche Bibo
SET commentaires = 'Agressif'
WHERE espece_id = 5 AND nom = 'Bibo';

SELECT id, nom, commentaires, pere_id, mere_id
FROM Animal
WHERE espece_id = 5;

-- VEROUS --
------------

-- Table Client
CREATE TABLE Client (
id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
nom VARCHAR(100) NOT NULL,
prenom VARCHAR(60) NOT NULL,
adresse VARCHAR(200),
code_postal VARCHAR(6),
ville VARCHAR(60),
pays VARCHAR(60),
email VARBINARY(100),
PRIMARY KEY (id),
UNIQUE INDEX ind_uni_email (email)
) ENGINE = InnoDB;

-- Table Adoption
CREATE TABLE Adoption (
client_id SMALLINT UNSIGNED NOT NULL,
animal_id SMALLINT UNSIGNED NOT NULL,
date_reservation DATE NOT NULL,
date_adoption DATE,
prix DECIMAL(7,2) UNSIGNED NOT NULL,
paye TINYINT(1) NOT NULL DEFAULT 0,
PRIMARY KEY (client_id, animal_id),
CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES
Client(id),
CONSTRAINT fk_adoption_animal_id FOREIGN KEY (animal_id) REFERENCES Animal(id),
UNIQUE INDEX ind_uni_animal_id (animal_id)
) ENGINE = InnoDB;

-- Insertion de quelques clients
INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
VALUES ('Jean', 'Dupont', 'Rue du Centre, 5', '45810', 'Houtsiplou', 'France', 'jean.dupont@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Marie', 'Boudur', 'Place de la Gare, 2', '35840', 'Troudumonde', 'France', 'marie.boudur@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES
('Fleur', 'Trachon', 'Rue haute, 54b', '3250', 'Belville', 'Belgique', 'fleurtrachon@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Julien', 'Van Piperseel', NULL, NULL, NULL, NULL, 'jeanvp@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Johan', 'Nouvel', NULL, NULL, NULL, NULL, 'johanetpirlouit@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES
('Frank', 'Germain', NULL, NULL, NULL, NULL,'francoisgermain@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Maximilien', 'Antoine', 'Rue Moineau, 123', '4580', 'Trocoul', 'Belgique', 'max.antoine@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES
('Hector', 'Di Paolo', NULL, NULL, NULL, NULL,'hectordipao@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Anaelle', 'Corduro', NULL, NULL, NULL, NULL, 'ana.corduro@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Eline', 'Faluche', 'Avenue circulaire, 7', '45870', 'Garduche', 'France', 'elinefaluche@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Carine', 'Penni', 'Boulevard Haussman, 85', '1514', 'Plasse', 'Suisse', 'cpenni@email.com');


41 INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Virginie', 'Broussaille', 'Rue du Fleuve, 18', '45810', 'Houtsiplou', 'France', 'vibrousaille@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Hannah', 'Durant', 'Rue des Pendus, 66', '1514', 'Plasse', 'Suisse', 'hhdurant@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Elodie', 'Delfour', 'Rue de Flore, 1', '3250', 'Belville', 'Belgique', 'e.delfour@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Joel', 'Kestau', NULL, NULL, NULL, NULL, 'joel.kestau@email.com');


-- Insertion de quelques adoptions
INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(1, 39, '2008-08-17', '2008-08-17', 735.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(1, 40, '2008-08-17', '2008-08-17', 735.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(2, 18, '2008-06-04', '2008-06-04', 485.00, 1);


INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(3, 27, '2009-11-17', '2009-11-17', 200.00, 1);


INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(4, 26, '2007-02-21', '2007-02-21', 485.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(4, 41, '2007-02-21', '2007-02-21', 835.00, 1);


INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(5, 21, '2009-03-08', '2009-03-08', 200.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(6, 16, '2010-01-27', '2010-01-27', 200.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES (7, 5, '2011-04-05',
'2011-04-05', 150.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(8, 42, '2008-08-16', '2008-08-16', 735.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(9, 55, '2011-02-13', '2011-02-13', 140.00, 1);


INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(9, 54, '2011-02-13', '2011-02-13', 140.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(10, 49, '2010-08-17', '2010-08-17', 140.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(11, 62, '2011-03-01', '2011-03-01', 630.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(12, 69, '2007-09-20', '2007-09-20', 10.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(13, 57, '2012-01-10', '2012-01-10', 700.00, 1);


INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(14, 58, '2012-02-25', '2012-02-25', 700.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(15, 30, '2008-08-17', '2008-08-17', 735.00, 1); -- MISY ERREURS

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(11, 32, '2008-08-17', '2010-03-09', 140.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(9, 33, '2007-02-11','2007-02-11', 835.00, 1);

INSERT INTO Adoption (client_id, animal_id, date_reservation, date_adoption, prix, paye) VALUES 
(2, 3, '2011-03-12', '2011-03-12', 835.00, 1);

--  Syntaxe et utilisation : verrous de table
LOCK TABLES nom_table [AS alias_table] [READ | WRITE] [, ...];

-- Les verrous de table sont les seuls supportés par MyISAM. Ils sont d’ailleurs principalement
-- utilisés pour pallier en partie l’absence de transactions dans MyISAM. Les tables InnoDB peuvent
-- également utiliser ce type de verrou.

UPDATE Adoption AS adopt
SET paye = 0
WHERE client_id = 10 AND animal_id = 49;

UNLOCK TABLES; -- On relâche d'abord les deux verrous précédents

LOCK TABLES Adoption READ;
LOCK TABLES Espece READ, Espece AS table_espece READ;

SELECT id, nom_courant FROM Espece;

SELECT id, nom_courant FROM Espece AS table_espece;

-- Sélection dans Espece, avec mauvais alias.
SELECT id, nom_courant FROM Espece AS table_esp;

-- Sélection dans Adoption, sans alias.
SELECT * FROM Adoption;

-- Le verrou sur Adoption a été relâché lorsque l’on a posé les verrous sur Espece. On ne peut donc
-- pas lire les données d’Adoption (avec ou sans alias).


-- Conséquences pour les autres sessions
-----------------------------------------
-- 1. Sélection sur des tables verrouillées à partir d’une autre session.
-- sesion 1:
LOCK TABLES Client READ, -- Verrou de lecture sur Client
    Adoption WRITE;

-- sesion 2:
SELECT id, nom, prenom, ville, email
FROM Client
WHERE ville = 'Houtsiplou';

-- La sélection sur Client se fait sans problème.

-- Session 2 :
SELECT *
FROM Adoption
WHERE client_id = 4;

-- 2. Modification sur des tables verrouillées à partir d’une autre session
-- Reverrouillez les tables avec la session 1 :
LOCK TABLES Client READ, -- Verrou de lecture sur Client
    Adoption WRITE; -- Verrou d'écriture sur Adoption

-- sesion 2
UPDATE Client
SET pays = 'Suisse'
WHERE id = 5;

UPDATE Adoption
SET paye = 1
WHERE client_id = 3;

-- --------------------------------- --
-- Interaction avec les transactions --
---------------------------------------
SET autocommit = 0;
LOCK TABLES Adoption WRITE; -- La validation implicite ne commite rien puisque aucun changement n'a été fait
UPDATE Adoption SET date_adoption = NOW() WHERE client_id = 9 AND
animal_id = 54;

SELECT client_id, animal_id, date_adoption FROM Adoption WHERE
client_id = 9;

ROLLBACK;

UNLOCK TABLES; -- On a annulé les changements juste avant donc la validation implicite n'a aucune conséquence

SELECT client_id, animal_id, date_adoption FROM Adoption WHERE
client_id = 9;

SET autocommit = 1;

-- V.2.3. Syntaxe et utilisation : verrous de ligne


-- Ces verrous ne peuvent pas être posés sur une table utilisant le moteur MyISAM ! Tout ce
-- qui est dit ici concerne les tables InnoDB uniquement.

-- V.2.3.2. Requêtes de sélection
SELECT * FROM Animal WHERE espece_id = 5 LOCK IN SHARE MODE;

-- V.2.3.2.2. Verrou exclusif
SELECT * FROM Animal WHERE espece_id = 5 FOR UPDATE;

-- V.2.3.4. Exemples
-- V.2.3.4.1. Verrou posé par une requête de modification

-- session
START TRANSACTION;

UPDATE Client SET pays = 'Suisse'
WHERE id = 8; -- un verrou exclusif sera posé sur la ligne avec id = 8

-- session 2
START TRANSACTION;

SELECT * FROM Client
WHERE id = 8; 

SELECT * FROM Client
WHERE id = 8
LOCK IN SHARE MODE; -- on essaye de poser un verrou partagé
desc animal;

-- COMMIT;

START TRANSACTION;

UPDATE Adoption SET paye = 0 WHERE client_id = 11;

START TRANSACTION;

UPDATE Adoption SET paye = 1
WHERE animal_id = 32; -- l'animal 32 a été adopté par le client 11

-- V.2.3.4.2. Verrou posé par une requête d’insertion

-- Session 1 :
START TRANSACTION;

INSERT INTO Adoption (client_id, animal_id, date_reservation, prix)
VALUES (12, 75, NOW(), 10.00); -- misy blem

-- session 2
SELECT * FROM Adoption
WHERE client_id > 13
LOCK IN SHARE MODE; -- misy blem

SELECT * FROM Adoption
WHERE client_id < 13
LOCK IN SHARE MODE;

 COMMIT;

-- V.2.3.4.3. Verrou posé par une requête de sélection

-- session 1
START TRANSACTION;
SELECT * FROM Client
WHERE id < 5
LOCK IN SHARE MODE;


-- Session 2 :
START TRANSACTION;

SELECT * FROM Client
WHERE id BETWEEN 3 AND 8;

SELECT * FROM Client
WHERE id BETWEEN 3 AND 8
LOCK IN SHARE MODE;

SELECT * FROM Client
WHERE id BETWEEN 3 AND 8
FOR UPDATE;

-- session 1
START TRANSACTION;

SELECT * FROM Client
WHERE id < 5
FOR UPDATE;

-- session 2
START TRANSACTION;

SELECT * FROM Client
WHERE id BETWEEN 3 AND 8;

SELECT * FROM Client
WHERE id BETWEEN 3 AND 8
LOCK IN SHARE MODE;

-- V.2.3.6. Rôle des index
-- -----------------------

-- session 1

START TRANSACTION;
UPDATE Animal
SET commentaires = CONCAT_WS(' ', 'Animal fondateur.',
commentaires) -- On ajoute une phrase de commentaire
WHERE date_naissance < '2007-01-01';
-- à tous les animaux nés avant 2007

-- Session 2 :
START TRANSACTION;
UPDATE Animal
SET commentaires = 'Aveugle' -- On modifie les commentaires
WHERE date_naissance = '2008-03-10 13:40:00'; -- De l'animal né le 10 mars 2008 à 13h40

SHOW INDEX FROM Animal;

-- session 1
START TRANSACTION;

UPDATE Animal -- Modification de tous les rats
SET commentaires = CONCAT_WS(' ', 'Très intelligent.',
commentaires)
WHERE espece_id = 5;

-- session 2
START TRANSACTION;

UPDATE Animal
SET commentaires = 'Aveugle'
WHERE id = 34; -- Modification de l'animal 34 (un chat)

UPDATE Animal
SET commentaires = 'Aveugle'
WHERE id = 72;
 -- Modification de l'animal 72 (un rat)

-- V.2.3.7. Lignes fantômes et index de clé suivante
-- -------------------------------------------------

START TRANSACTION;

SELECT * FROM Adoption WHERE client_id > 13 
FOR UPDATE;-- ne pas oublier le FOR UPDATE pour poser le verrou

START TRANSACTION;

INSERT INTO Adoption (client_id, animal_id, date_reservation, prix)
VALUES (15, 61, NOW(), 735.00); -- misy code tsy milamina

START TRANSACTION;

SELECT Animal.id, Animal.nom, Animal.date_naissance, Race.nom as race, COALESCE(Race.prix, Espece.prix) as prix FROM Animal
    INNER JOIN Espece ON Animal.espece_id = Espece.id
        LEFT JOIN Race ON Animal.race_id = Race.id 
        -- Jointure externe, on ne veut pas que les chats de race
            WHERE Espece.nom_courant = 'Chat' -- Uniquement les chats...
            AND Animal.id NOT IN (SELECT animal_id FROM Adoption) -- ... quin'ont pas encore été adoptés
            LOCK IN SHARE MODE;


SELECT Animal.id, Animal.nom, Animal.date_naissance, Race.nom as race, COALESCE(Race.prix, Espece.prix) as prix FROM Animal
    INNER JOIN Espece ON Animal.espece_id = Espece.id
        LEFT JOIN Race ON Animal.race_id = Race.id 
        -- Jointure externe, on ne veut pas que les chats de race
            WHERE Espece.nom_courant = 'Chat' -- Uniquement les chats...
            AND Animal.id NOT IN (SELECT animal_id FROM Adoption) -- ... quin'ont pas encore été adoptés

START TRANSACTION;

SELECT Animal.id, Animal.nom, Animal.date_naissance, Race.nom as race, COALESCE(Race.prix, Espece.prix) as prix FROM Animal
    INNER JOIN Espece ON Animal.espece_id = Espece.id 
        INNER JOIN Race ON Animal.race_id = Race.id -- Jointure interne cette fois 
            WHERE Race.nom = 'Maine Coon' -- Uniquement les Maine Coon... 
            AND Animal.id NOT IN (SELECT animal_id FROM Adoption)  -- ... qui n'ont pas encore été adoptés 
            LOCK IN SHARE MODE ;

SELECT Animal.id, Animal.nom, Animal.date_naissance, Race.nom as race, COALESCE(Race.prix, Espece.prix) as prix FROM Animal
    INNER JOIN Espece ON Animal.espece_id = Espece.id
        INNER JOIN Race ON Animal.race_id = Race.id -- Jointure interne cette fois 
            WHERE Race.nom = 'Maine Coon'-- Uniquement les Maine Coon... 
            AND Animal.id NOT IN (SELECT animal_id FROM Adoption) -- ... qui n'ont pas encore été adoptés 
            
-- verification
select * from race where nom = 'Maine coon';

select * from animal where Animal.id NOT IN (SELECT animal_id FROM Adoption);

-- fin verification

INSERT INTO Adoption (client_id, animal_id, date_reservation, prix, paye)
SELECT id, 8, NOW(), 735.00, 1
FROM Client
WHERE email = 'jean.dupont@email.com';

COMMIT

-- verification
SELECT id, 8, NOW(), 735.00, 1
FROM Client
WHERE email = 'jean.dupont@email.com';

select * from adoption where client_id = 1;

-- fin verification

-- V.2.4. Niveaux d'isolation
-- V.2.4.1 Syntaxe
-- V.2.4.2 les differents niveaux
-- V.2.4.3 En RESUME

-- Syntaxe
SET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL { READ
UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE
}

-- Les differents niveaux
START TRANSACTION;

UPDATE Race
SET prix = 0
WHERE id = 7;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;

SELECT id, nom, espece_id, prix FROM Race;

-- v.3 Requetes prepares
-- ---------------------

    -- V.3.1 Variable Utilisateur
    -- V.3.2 Principe et syntaxe des requetes prepares
    -- V.3.3 Usage et utilite


    -- V.3.1 Variable Utilisateur
    -- ---------------------------

        -- V.3.1.1 Definitions
        -- V.3.1.2 Creer et modifier une variable utilisateur
        -- V.3.1.3 Utilisation d'une variable utilisateur
        -- V.3.2.4 Portee des variables utilisateurs


        -- V.3.1.1 Definitions
        -- -------------------

            -- Une variable utilisateur est une variable, définie par l’utilisateur. Les variables utilisateur
            -- MySQL doivent toujours être précédées du signe @.

        
        -- V.3.1.2 Creer et modifier une variable utilisateur
        -- --------------------------------------------------
            -- V.3.1.2.1. SET
            -- V.3.1.2.2. Opérateur d’assignation

            -- V.3.1.2.1. SET
            -- ---------------
                SET @age = 24;

                SET @salut = 'Hello World !', @poids = 7.8; 
                -- On peut créer plusieurs variables en même temps

                SELECT @age, @poids, @salut;

            -- V.3.1.2.2. Opérateur d’assignation
            -- ----------------------------------

                -- Il est également possible d’assigner une valeur à une variable utilisateur directement dans
                --  une requête, en utilisant l’opérateur d’assignation := (n’oubliez pas les : , sinon il s’agit de
                -- l’opérateur de comparaison de valeurs)

                SELECT @age := 32, @poids := 48.15, @perroquet := 4;

        
        -- V.3.1.3 Utilisation d'une variable utilisateur
        -- ----------------------------------------------
            -- V.3.1.3.1. Ce qu’on peut faire
            -- V.3.1.3.2. Ce qu’on ne peut pas faire

            -- V.3.1.3.1. Ce qu’on peut faire
            -- ------------------------------
                SELECT id, sexe, nom, commentaires, espece_id
                FROM Animal
                WHERE espece_id = @perroquet; -- On sélectionne les perroquets 
                
                SET @conversionDollar = 1.31564; -- On crée une variable contenant le taux de conversion des euros en dollars
                
                SELECT prix AS prix_en_euros, -- On sélectionne le prix des races, en euros et en dollars.
                ROUND(prix * @conversionDollar, 2) AS prix_en_dollars, -- En arrondissant à deux décimales
                nom FROM Race;

            -- V.3.1.3.2. Ce qu’on ne peut pas faire
            -- -------------------------------------
                SET @table_clients = 'Client';
                SELECT * FROM @table_clients;

                SET @colonnes = 'id, nom, description';
                
                SELECT @colonnes FROM Race WHERE espece_id = 1;

                -- session 1
                SET @essai = 3;

                -- session 2
                SELECT @essai;


    -- V.3.2 Principe et syntaxe des requetes prepares
    -- -----------------------------------------------
        -- V.3.2.1 Principe
        -- V.3.2.2 Syntaxe

        -- V.3.2.1 Principe
        -- ----------------
            -- V.3.2.1. Principe
            -- V.3.2.2. Syntaxe

            -- V.3.2.1. Principe
            -- ------------------
                SELECT * FROM Client WHERE email = 'truc@email.com';
                SELECT * FROM Client WHERE email = 'machin@email.com';
                SELECT * FROM Client WHERE email = 'bazar@email.com';
                SELECT * FROM Client WHERE email = 'brol@email.com';
                
                -- exemple de syntaxe
                SELECT * FROM Client WHERE email = ? ;
                
                -- V.3.2.1.1. Portée

            -- V.3.2.2. Syntaxe
            -- ----------------
                -- V.3.2.2.1. Préparation d’une requête
                -- V.3.2.2.2. Exécution d’une requête préparée
                -- V.3.2.2.3. Suppression d’une requête préparée

                -- V.3.2.2.1. Préparation d’une requête
                -- ------------------------------------

                    -- Syntaxe
                    PREPARE nom_requete
                    FROM 'requete_preparable';
                    -- fin syntaxe

                    -- Exemple
                    -- Sans paramètre
                    PREPARE select_race
                    FROM 'SELECT * FROM Race';

                    -- Avec un paramètre
                    PREPARE select_client
                    FROM 
                    'SELECT * FROM Client WHERE email = ?';

                    -- Avec deux paramètres
                    PREPARE select_adoption 
                    FROM
                    'SELECT * FROM Adoption WHERE client_id = ? AND animal_id = ?';

                    SET @req = 'SELECT * FROM Race';

                    PREPARE select_race
                    FROM @req;

                    SET @colonne = 'nom';

                    SET @req_animal = CONCAT('SELECT ', @colonne,
                    ' FROM Animal WHERE id = ?');

                    PREPARE select_col_animal
                    FROM @req_animal;

                -- V.3.2.2.2. Exécution d’une requête préparée
                -- -------------------------------------------

                    -- Syntaxe
                    EXECUTE nom_requete [USING @parametre1, @parametre2, ...];
                    -- fin Syntaxe

                    EXECUTE select_race;

                    SET @id = 3;
                    EXECUTE select_col_animal USING @id;

                    SET @client = 2;
                    EXECUTE select_adoption USING @client, @id;

                    SET @email = 'jean.dupont@email.com';

                    EXECUTE select_client USING @email;

                    SET @email = 'marie.boudur@email.com';

                    EXECUTE select_client USING @email;

                    SET @email = 'fleurtrachon@email.com';
                    EXECUTE select_client USING @email;

                    SET @email = 'jeanvp@email.com';
                    EXECUTE select_client USING @email;

                    SET @email = 'johanetpirlouit@email.com';
                    EXECUTE select_client USING @email;
                
                -- V.3.2.2.3. Suppression d’une requête préparée
                -- ---------------------------------------------
                
                    -- Syntaxe
                    DEALLOCATE PREPARE select_race;
                    -- fin syntaxe

    -- V.3.3 Usage et utilite
    -- ----------------------

        -- V.3.3.1. Usage
        -- V.3.3.2. Utilité
        -- V.3.3.3. En résumé

        -- lesona theorie be
    


-- V.4. Procedures stockees
-- ------------------------

    -- V.4.1. Creation et utilisation
    -- V.4.2. Les parametres d'une procedure stockee
    -- V.4.3. Supression d'une PROCEDURE
    -- v.4.4. Avantages, incovenients et usage des procedures stockees


    -- V.4.1. Creation et utilisation
    -- ------------------------------

        -- V.4.1.1. Procedure avec une seule requete
        -- V.4.1.2. Procedure avec une bloc d'instructions
        -- V.4.1.3. Delimiteur
        -- V.4.1.4. Creation d'une procedure stockee
        -- V.4.1.5. Utilisation d'une procedute stockee

        -- V.4.1.1. Procedure avec une seule requete
        -- -----------------------------------------

            -- Syntaxe
            CREATE PROCEDURE afficher_races_requete() -- pas de paramètres dans les parenthèses
            
            SELECT id, nom, espece_id, prix FROM Race;

            call afficher_races_requete;
            -- Fin syntaxe


        -- V.4.1.2. Procedure avec une bloc d'instructions
        -- -----------------------------------------------

            --syntaxe
                BEGIN
                -- Série d'instructions
                END;
            -- fin syntaxe

            CREATE PROCEDURE afficher_races_bloc() -- pas de paramètres dans les parenthèses
                BEGIN
                SELECT id, nom, espece_id, prix FROM Race;
                END;

            
        -- V.4.1.3. Delimiteur
        -- -------------------

            -- DEFINITION

            -- Ce qu’on appelle délimiteur, c’est tout simplement (par défaut), le caractère ; .

            -- FIN DEFINITION

            -- Pour changer le délimiteur, il suffit d’utiliser cette commande :
            DELIMITER |

            SELECT 'test'|

            SELECT * FROM animal|


        -- V.4.1.4. Creation d'une procedure stockee
            
            DELIMITER |
            -- On change le délimiteur

            CREATE PROCEDURE afficher_races() -- toujours pas de paramètres, toujours des parenthèses 
                BEGIN
                    SELECT id, nom, espece_id, prix
                    FROM Race; -- Cette fois, le ; ne nous embêtera pas 
                END; -- TSY MITOVY AMIN'NY PDF
            -- Et on termine bien sûr la commande CREATE PROCEDURE par notre nouveau délimiteur


        -- V.4.1.5. Utilisation d'une procedute stockee

        CALL afficher_races()| -- le délimiteur est toujours | !!!


    -- V.4.2. Les parametres d'une PROCEDURE
    -- -------------------------------------

        -- V.4.2.1. Sens du parametres (in, out et inout)
        -- V.4.2.2. Syntaxe (lesona be)
        -- V.4.2.3. Exemples

        
        -- V.4.2.3. Exemples
        -- -----------------

            -- V.4.2.3.1. Procédure avec un seul paramètre entrant
            -- V.4.2.3.2. Procédure avec deux paramètres, un entrant et un sortant
            -- V.4.2.3.3. Procédure avec deux paramètres, un entrant et un entrant-sortant


            -- V.4.2.3.1. Procédure avec un seul paramètre entrant
            -- ---------------------------------------------------

                DELIMITER |
                -- Facultatif si votre délimiteur est toujours |

                CREATE PROCEDURE afficher_race_selon_espece (IN p_espece_id INT)
                -- Définition du paramètre p_espece_id
                    BEGIN
                        SELECT id, nom, espece_id, prix
                        FROM Race
                        WHERE espece_id = p_espece_id; -- Utilisation du paramètre
                    END;
                DELIMITER ; -- On remet le délimiteur par défaut


                CALL afficher_race_selon_espece(1);
                SET @espece_id := 2;
                CALL afficher_race_selon_espece(@espece_id);


            -- V.4.2.3.2. Procédure avec deux paramètres, un entrant et un sortant
            -- -------------------------------------------------------------------

                DELIMITER |

                CREATE PROCEDURE compter_races_selon_espece (p_espece_id INT, OUT p_nb_races INT)
                BEGIN
                SELECT COUNT(*) INTO p_nb_races
                FROM Race
                WHERE espece_id = p_espece_id;
                END ;

                DELIMITER ;


                SELECT id, nom INTO @var1, @var2
                FROM Animal
                WHERE id = 7;

                SELECT @var1, @var2;

                CALL compter_races_selon_espece (2, @nb_races_chats);

                SELECT @nb_races_chats;

            -- V.4.2.3.3. Procédure avec deux paramètres, un entrant et un entrant-sortant
            -- ---------------------------------------------------------------------------

            DELIMITER |

            CREATE PROCEDURE calculer_prix (IN p_animal_id INT, INOUT p_prix DECIMAL(7,2))
            BEGIN
            SELECT p_prix + COALESCE(Race.prix, Espece.prix) INTO p_prix
            FROM Animal
            INNER JOIN Espece ON Espece.id = Animal.espece_id
            LEFT JOIN Race ON Race.id = Animal.race_id
            WHERE Animal.id = p_animal_id;
            END;

            DELIMITER ;

            SET @prix = 0; -- On initialise @prix à 0

            CALL calculer_prix (13, @prix); -- Achat de Rouquine
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (24, @prix); -- Achat de Cartouche
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (42, @prix); -- Achat de Bilba
            SELECT @prix AS prix_intermediaire;

            CALL calculer_prix (75, @prix); -- Achat de Mimi
            SELECT @prix AS total;

    -- V.4.3. Supression d'une PROCEDURE
            DROP PROCEDURE afficher_races;

    -- v.4.4. Avantages, incovenients et usage des procedures stockees
    -- ---------------------------------------------------------------
        
        -- V.4.4.1. Avantages(lesona be)
        -- V.4.4.2. Syntaxe  (lesona be)
        -- V.4.4.3. Exemples (lesona be)
        -- V.4.4.4. En RESUME (lesona be)


-- V.5. STRUCTURER SES INSTRUCTIONS
-- --------------------------------

    -- v.5.1. Bloc d'instructions et variable
    -- V.5.2. Structures conditionnelles
    -- V.5.3. Boucles


    -- v.5.1. Bloc d'instructions et variable
    -- ---------------------------------------
        -- V.5.1.1 Blocks d'instructions
        -- V.5.1.2 Variables LOCALes
    
        -- V.5.1.1 Blocks d'instructions
        -- -----------------------------
            -- Syntaxe: structure imbriquer
            BEGIN
                SELECT 'Bloc d''instructions principal';

                BEGIN
                    SELECT
                        'Bloc d''instructions 2, imbriqué dans le bloc principal';
                    BEGIN
                        SELECT
                            'Bloc d''instructions 3, imbriqué dans le bloc d''instructions 2';
                    END;
                END;

                BEGIN
                    SELECT
                    'Bloc d''instructions 4, imbriqué dans le bloc principal';
                END;
            END;

        -- V.5.1.2 Variables LOCALes
        -- -------------------------
            -- V.5.1.2.1. Déclaration d’une variable locale
            -- V.5.1.2.2. Portée des variables locales dans un bloc d’instruction


            -- V.5.1.2.1. Déclaration d’une variable locale
                -- Syntaxe:
                DECLARE nom_variable type_variable [DEFAULT valeur_defaut];

                -- La déclaration d’une variable locale se fait avec l’instruction DECLARE.

                -- Exemple : voici une procédure stockée qui donne la date d’aujourd’hui et de demain

                DELIMITER |
                CREATE PROCEDURE aujourdhui_demain ()
                BEGIN
                    DECLARE v_date DATE DEFAULT CURRENT_DATE(); 
                    -- On déclare une variable locale et on lui met une valeur par défaut
                    

                    SELECT DATE_FORMAT(v_date, '%W %e %M %Y') AS Aujourdhui;

                    SET v_date = v_date + INTERVAL 1 DAY; -- On change la valeur de la variable locale
                    SELECT DATE_FORMAT(v_date, '%W %e %M %Y') AS Demain;
                END;
                DELIMITER ;

                SET lc_time_names = 'fr_FR';
                CALL aujourdhui_demain();


            -- V.5.1.2.2. Portée des variables locales dans un bloc d’instruction
            -- ------------------------------------------------------------------

            -- Les variables locales n’existent que dans le bloc d’instructions dans lequel elles ont été déclarées.
            -- Dès que le mot-clé END est atteint, toutes les variables locales du bloc sont détruites.


            -- Exemple 1 porte variables:

            DELIMITER |
            CREATE PROCEDURE test_portee1()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                SELECT 'Principal' AS Bloc;
                SELECT v_test1, v_test2;

            END;
            DELIMITER ;

            CALL test_portee1();
            

            DELIMITER |
            CREATE PROCEDURE test_portee12()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                SELECT 'Principal' AS Bloc;
                SELECT v_test1;--, v_test2;

            END;
            DELIMITER ;

            CALL test_portee12();


            -- Exemple 2 porte variables:
            DELIMITER |
            CREATE PROCEDURE test_portee2()
            BEGIN
                DECLARE v_test1 INT DEFAULT 1;

                BEGIN
                    DECLARE v_test2 INT DEFAULT 2;

                    SELECT 'Imbriqué' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

                BEGIN
                    SELECT 'Principal' AS Bloc;
                    SELECT v_test1, v_test2;
                END;

            END;
            DELIMITER ;

            CALL test_portee2();

            -- À nouveau, v_test1, déclarée dans le bloc principal,
            -- existe dans les deux blocs imbriqués. 
            -- Par contre, v_test2 n’existe que dans le bloc imbriqué
            -- dans lequel elle est déclarée.

            -- Exemple 3 porte variables:
            DELIMITER |
            CREATE PROCEDURE test_portee3()
            BEGIN
                DECLARE v_test INT DEFAULT 1;

                SELECT v_test AS 'Bloc principal';

                BEGIN
                    DECLARE v_test INT DEFAULT 0;

                    SELECT v_test AS 'Bloc imbriqué';
                    SET v_test = 2;
                    SELECT v_test AS 'Bloc imbriqué après modification';
                END;

                SELECT v_test AS 'Bloc principal';
            END ;
            DELIMITER ;

            CALL test_portee3();
            
    -- V.5.2. Structures conditionnelles
    -- ---------------------------------
        -- V.5.2.1. La structure IF
        -- V.5.2.2. La structure CASE
        -- V.5.2.3. Utiliser une structure conditionnelle directement dans une requetep


        -- V.5.2.1. La structure IF
        -- ------------------------
            -- V.5.2.1.1. Le cas le plus simple : si la condition est vraie, alors on exécute ces instructions
            -- V.5.2.1.2.  Deuxième cas : si ... alors, sinon
            -- V.5.2.1.3. Troisième et dernier cas : plusieurs conditions alternatives

            -- Syntaxe:
            IF condition THEN instructions
                [ELSEIF autre_condition THEN instructions
                [ELSEIF ...]]
                [ELSE instructions]
            END IF;
            -- Fin Syntaxe

            -- V.5.2.1.1. Le cas le plus simple : si la condition est vraie, alors on exécute ces instructions
            -- -----------------------------------------------------------------------------------------------
                IF condition THEN
                    instructions
                END IF;

                -- Exemple:
                DELIMITER |
                CREATE PROCEDURE est_adopte(IN p_animal_id INT)
                BEGIN
                    DECLARE v_nb INT DEFAULT 0; -- On crée une variable locale

                    SELECT COUNT(*) INTO v_nb -- On met le nombre de lignes correspondant à l'animal
                    FROM Adoption -- dans Adoption dans notre variable locale
                    WHERE animal_id = p_animal_id;

                    IF v_nb > 0 THEN -- On teste si v_nb est supérieur à 0 (donc si l'animal a été adopté)
                    SELECT 'J''ai déjà été adopté !';
                    END IF; -- Et on n'oublie surtout pas le END IF et le ; final
                END ;
                DELIMITER ;

                CALL est_adopte(3);
                CALL est_adopte(28);

                -- Seul le premier appel à la procédure va afficher 'J''ai déjà été adopté !', puisque l’animal
                -- 3 est présent dans la table Adoption, contrairement à l’animal 28.


            -- V.5.2.1.2.  Deuxième cas : si ... alors, sinon
            -- ----------------------------------------------

            -- exemple:  la procédure suivante affiche 'Je suis né avant 2010' ou 'Je suis né après
            -- 2010', selon la date de naissance de l’animal transmis en paramètre.

            DELIMITER |
            CREATE PROCEDURE avant_apres_2010(IN p_animal_id INT)
            BEGIN
                DECLARE v_annee INT;

                SELECT YEAR(date_naissance) INTO v_annee
                FROM Animal
                WHERE id = p_animal_id;

                IF v_annee < 2010 THEN
                    SELECT 'Je suis né avant 2010' AS naissance;
                ELSE -- Pas de THEN
                    SELECT 'Je suis né après 2010' AS naissance;
                END IF; -- Toujours obligatoire

            END ;
            DELIMITER ;

            CALL avant_apres_2010(34); -- Né le 20/04/2008
            CALL avant_apres_2010(62); --  Né le 13/02/2012

            -- Tandremo: ELSE ne doit pas être suivi de THEN.


            -- V.5.2.1.3. Troisième et dernier cas : plusieurs conditions alternatives
            -- -----------------------------------------------------------------------
             DELIMITER |
            CREATE PROCEDURE message_sexe(IN p_animal_id INT)
            BEGIN
                DECLARE v_sexe VARCHAR(10);

                SELECT sexe INTO v_sexe
                FROM Animal
                WHERE id = p_animal_id;

                IF (v_sexe = 'F') THEN -- Première possibilité
                SELECT 'Je suis une femelle !' AS sexe;
                ELSEIF (v_sexe = 'M') THEN -- Deuxième possibilité
                SELECT 'Je suis un mâle !' AS sexe;
                ELSE -- Défaut
                SELECT 'Je suis en plein questionnement existentiel...' AS sexe;
                END IF;
            END;
            DELIMITER ;

            CALL message_sexe(8); -- Mâle
            CALL message_sexe(6); -- Femelle

            CALL message_sexe(9); -- Ni l'un ni l'autre
            

        -- V.5.2.2. La structure CASE
        -- --------------------------
            -- V.5.2.2.1. Première syntaxe : conditions d’égalité
            -- V.5.2.2.2. Seconde syntaxe : toutes conditions
            

            # Deux syntaxes sont possibles pour utiliser CASE.

            -- V.5.2.2.1. Première syntaxe : conditions d’égalité
            -- --------------------------------------------------

                CASE valeur_a_comparer
                    WHEN possibilite1 THEN instructions
                    [WHEN possibilite2 THEN instructions] ...
                    [ELSE instructions]
                END CASE;

                -- Exemple:
                DELIMITER |
                CREATE PROCEDURE message_sexe2(IN p_animal_id INT)
                BEGIN
                    DECLARE v_sexe VARCHAR(10);

                    SELECT sexe INTO v_sexe
                    FROM Animal
                    WHERE id = p_animal_id;

                    CASE v_sexe
                        WHEN 'F' THEN -- Première possibilité
                            SELECT 'Je suis une femelle !' AS sexe;
                        WHEN 'M' THEN -- Deuxième possibilité
                            SELECT 'Je suis un mâle !' AS sexe;
                        ELSE -- Défaut
                            SELECT 'Je suis en plein questionnement existentiel...' AS sexe;
                    END CASE;
                END;
                DELIMITER ;

                CALL message_sexe2(8); -- Mâle
                CALL message_sexe2(6); -- Femelle

                CALL message_sexe2(9);


            -- V.5.2.2.2. Seconde syntaxe : toutes conditions
            -- ----------------------------------------------

                CASE
                    WHEN condition THEN instructions
                    [WHEN condition THEN instructions] ...
                    [ELSE instructions]
                END CASE


                -- Exemple : on reprend la procédure avant_apres_2010(), qu’on réécrit avec CASE, et en donnant
                -- une possibilité en plus. De plus, on passe le message en paramètre OUT pour changer un peu.

                DELIMITER |
                CREATE PROCEDURE avant_apres_2010_case (IN p_animal_id INT, OUT p_message VARCHAR(100))
                BEGIN
                    DECLARE v_annee INT;

                    SELECT YEAR(date_naissance) INTO v_annee
                    FROM Animal
                    WHERE id = p_animal_id;

                    CASE
                        WHEN v_annee < 2010 THEN
                            SET p_message = 'Je suis né avant 2010.';
                        WHEN v_annee = 2010 THEN
                            SET p_message = 'Je suis né en 2010.';
                        ELSE
                        SET p_message = 'Je suis né après 2010.';
                    END CASE;
                END ;
                DELIMITER ;

                CALL avant_apres_2010_case(59, @message);
                SELECT @message;

                CALL avant_apres_2010_case(62, @message);
                SELECT @message;

                CALL avant_apres_2010_case(63, @message);
                SELECT @message;


        -- V.5.2.3. Utiliser une structure conditionnelle directement dans une requete 
        -- ---------------------------------------------------------------------------

        # exemple 1:
            SELECT id, nom, CASE
                WHEN sexe = 'M' THEN 'Je suis un mâle !'
                WHEN sexe = 'F' THEN 'Je suis une femelle !'
                ELSE 'Je suis en plein questionnement existentiel...'
                END AS message
            FROM Animal
            WHERE id IN (9, 8, 6);

        # exemple 2:
            SELECT nom, IF(sexe = 'M', 'Je suis un mâle', 'Je ne suis pas un mâle') AS sexe
            FROM Animal # exemple 2:
            WHERE espece_id = 5;



    -- V.5.3. Boucles
    -- --------------
        -- V.5.3.1. La boucle WHILE
        -- V.5.3.2. La boucle REPEAT
        -- V.5.3.3. Donner une label a  une boucle
        -- V.5.3.4. Les instructions LEAVES et ITERATES
        -- V.5.3.5. La boucle LOOP
        -- V.5.3.6. En resumee
        
        # Une boucle est une structure qui permet de répéter plusieurs fois une série d’instructions. Il
        # existe trois types de boucles en MySQL : WHILE, LOOP et REPEAT.

        
        -- V.5.3.1. La boucle WHILE
        -- ------------------------
            -- Syntaxe
            WHILE condition DO -- Attention de ne pas oublier le DO, erreur classique
                instructions
            END WHILE

            -- Exemple : la procédure suivante affiche les nombres entiers de 1 à p_nombre (passé en
            -- paramètre).

            DELIMITER |
            CREATE PROCEDURE compter_jusque_while(IN p_nombre INT)
            BEGIN
                DECLARE v_i INT DEFAULT 1;

                WHILE v_i <= p_nombre DO
                    SELECT v_i AS nombre;

                    SET v_i = v_i + 1; -- À ne surtout pas oublier, sinon la condition restera vraie
                END WHILE;
            END ;
            DELIMITER ;    

            CALL compter_jusque_while(3);


        -- V.5.3.2. La boucle REPEAT
        -- -------------------------
            # La boucle REPEAT travaille en quelque sorte de manière opposée à WHILE, puisqu’elle exécute
            # des instructions de la boucle jusqu’à ce que la condition donnée devienne vraie.


            # Exemple : voici la même procédure écrite avec une boucle REPEAT

            DELIMITER |
            CREATE PROCEDURE compter_jusque_repeat(IN p_nombre INT)
            BEGIN       
                DECLARE v_i INT DEFAULT 1;

                REPEAT
                    SELECT v_i AS nombre;

                    SET v_i = v_i + 1; -- À ne surtout pas oublier, sinon la condition restera vraie
                UNTIL v_i > p_nombre END REPEAT;
            END ;
            DELIMITER ;

            CALL compter_jusque_repeat(3);


            -- Condition fausse dès le départ, on ne rentre pas dans la boucle
            CALL compter_jusque_while(0);

            -- Condition fausse dès le départ, on rentre quand même une fois dans la boucle
            CALL compter_jusque_repeat(0);


        -- V.5.3.3. Donner une label a  une boucle
        -- ---------------------------------------
            
            -- Syntaxe

            -- Boucle WHILE
            -- ------------
            super_while: WHILE condition DO -- La boucle a pour label "super_while"
            instructions
            END WHILE super_while; -- On ferme en donnant le label de la boucle (facultatif)

            -- Boucle REPEAT
            -- -------------
            repeat_genial: REPEAT -- La boucle s'appelle "repeat_genial"
            instructions
            UNTIL condition END REPEAT; -- Cette fois, on choisit de ne pas faire référence au label lors de la fermeture
            
            -- Bloc d'instructions
            -- -------------------
            bloc_extra: BEGIN -- Le bloc a pour label "bloc_extra"
            instructions
            END bloc_extra;

            #####################################################################################################
            #                                                                                                   #
            #                               Mais en quoi cela peut-il être utile ?                              #   
            #                                                                                                   #
            # D’une part, cela peut permettre de clarifier le code lorsqu’il y a beaucoup de boucles et de      #
            # blocs d’instructions imbriqués. D’autre part, il est nécessaire de donner un label aux boucles et #
            #aux blocs d’instructions pour lesquels on veut pouvoir utiliser les instructions ITERATE et LEAVE. #
            #                                                                                                   #
            #####################################################################################################



        -- V.5.3.4. Les instructions LEAVES et ITERATES
        -- --------------------------------------------

            -- V.5.3.4.1. LEAVE : quitter la boucle ou le bloc d’instructions
            -- V.5.3.4.2. ITERATE : déclencher une nouvelle itération de la boucle


            -- V.5.3.4.1. LEAVE : quitter la boucle ou le bloc d’instructions
            -- --------------------------------------------------------------

                -- Syntaxe:
                LEAVE label_structure;

                -- Exemple : cette procédure incrémente de 1, et affiche, un nombre entier passé en paramètre.
                -- Et cela, 4 fois maximum. Mais si l’on trouve un multiple de 10, la boucle s’arrête.

                DELIMITER |
                CREATE PROCEDURE test_leave1(IN p_nombre INT)
                BEGIN

                    DECLARE v_i INT DEFAULT 4;

                    SELECT 'Avant la boucle WHILE';

                    while1: WHILE v_i > 0 DO

                        SET p_nombre = p_nombre + 1; -- On incrémente le nombre de 1

                        IF p_nombre%10 = 0 THEN -- Si p_nombre est divisible par 10,
                            SELECT 'Stop !' AS 'Multiple de 10';
                            LEAVE while1; -- On quitte la boucle WHILE.
                        END IF;

                        SELECT p_nombre; -- On affiche p_nombre
                        SET v_i = v_i - 1; -- Attention de ne pas l'oublier

                END WHILE while1;

                SELECT 'Après la boucle WHILE';
                END;
                DELIMITER ;

                CALL test_leave1(3); -- La boucle s'exécutera 4 fois

                CALL test_leave1(8); -- La boucle s'arrêtera dès qu'on atteint 10


                # Exemple : voici la même procédure. Cette fois-ci un multiple de 10 provoque l’arrêt de toute
                # la procédure, pas seulement de la boucle WHILE.

                DELIMITER |
                CREATE PROCEDURE test_leave2(IN p_nombre INT)
                corps_procedure: BEGIN -- On donne un label au bloc d'instructions principal
                    DECLARE v_i INT DEFAULT 4;

                    SELECT 'Avant la boucle WHILE';
                    while1: WHILE v_i > 0 DO
                        SET p_nombre = p_nombre + 1; -- On incrémente le nombre de 1
                            IF p_nombre%10 = 0 THEN -- Si p_nombre est divisible par 10,
                            SELECT 'Stop !' AS 'Multiple de 10';
                        LEAVE corps_procedure; -- je quitte la procédure.
                        END IF;

                        SELECT p_nombre; -- On affiche p_nombre
                        SET v_i = v_i - 1; -- Attention de ne pas l'oublier
                    END WHILE while1;

                    SELECT 'Après la boucle WHILE';
                    END;
                DELIMITER ;

                CALL test_leave2(8);


                # Exemple : la procédure suivante affiche les nombres de 4 à 1, en précisant s’ils sont pairs. Sauf
                # pour le nombre 2, pour lequel une instruction LEAVE empêche l’affichage habituel.


                DELIMITER |
                CREATE PROCEDURE test_leave3()
                BEGIN
                DECLARE v_i INT DEFAULT 4;

                WHILE v_i > 0 DO

                    IF v_i%2 = 0 THEN
                        if_pair: BEGIN
                            IF v_i = 2 THEN -- Si v_i vaut 2
                                LEAVE if_pair; -- On quitte le bloc "if_pair", ce qui revient à quitter la structure IF v_i%2 = 0
                            END IF;
                            SELECT CONCAT(v_i, ' est pair') AS message;
                        END if_pair;
                    ELSE
                        if_impair: BEGIN
                            SELECT CONCAT(v_i, ' est impair') AS message;
                        END if_impair;
                    END IF;

                    SET v_i = v_i - 1;
                END WHILE;
                END;
                DELIMITER ;

                CALL test_leave3();


            -- V.5.3.4.2. ITERATE : déclencher une nouvelle itération de la boucle
            -- -------------------------------------------------------------------

                # Exemple : la procédure suivante affiche les nombres de 1 à 3, avec un message avant le IF et
                # après le IF. Sauf pour le nombre 2, qui relance une itération de la boucle dans le IF.

                DELIMITER |
                CREATE PROCEDURE test_iterate()
                BEGIN
                 DECLARE v_i INT DEFAULT 0;

                 boucle_while: WHILE v_i < 3 DO
                    SET v_i = v_i + 1;
                    SELECT v_i, 'Avant IF' AS message;

                    IF v_i = 2 THEN
                    ITERATE boucle_while;

                    END IF;
                    SELECT v_i, 'Après IF' AS message; -- Ne sera pas exécuté pour v_i = 2
                 END WHILE;
                END ;
                DELIMITER ;

                CALL test_iterate();


        -- V.5.3.5. La boucle LOOP
        -- -----------------------

            -- Syntaxe
            [label:] LOOP
            instructions
            END LOOP [label]

            # Exemple : à nouveau une procédure qui affiche les nombres entiers de 1 à p_nombre.

            DELIMITER |
            CREATE PROCEDURE compter_jusque_loop(IN p_nombre INT)
            BEGIN
                DECLARE v_i INT DEFAULT 1;

                boucle_loop: LOOP
                    SELECT v_i AS nombre;
    
                    SET v_i = v_i + 1;
    
                    IF v_i > p_nombre THEN
                    LEAVE boucle_loop;
                    END IF;
                END LOOP;
            END ;
            DELIMITER ;

            CALL compter_jusque_loop(3);



-- V.6. Gestion d'erreurs, curseurs et utilisations avancees:
-- ----------------------------------------------------------

    -- V.6.1. Gestion des erreurs
    -- V.6.2. Curseurs
    -- V.6.3. Utilisation avancees des blocs d'instructions

    
    -- V.6.1. Gestion des erreurs
    -- --------------------------
        -- V.6.1.1. Creation d'un gestionnaire d'erreure
        -- V.6.1.2. Definition de l'erreur geree
        -- V.6.1.3. Declarer plusieurs gestionnaires, gerer plusieurs erreurs par gestionnaire
        
            DELIMITER |
            CREATE PROCEDURE ajouter_adoption(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
            BEGIN
                DECLARE v_prix DECIMAL(7,2);

                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                LEFT JOIN Race ON Race.id = Animal.race_id
                WHERE Animal.id = p_animal_id;

                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);


                SELECT 'Adoption correctement ajoutée' AS message;
            END;
            DELIMITER ;

            # Plusieurs erreurs sont susceptibles de se déclencher selon les paramètres passés à cette procédure

            # Exemple 1 : le client n’existe pas.
            SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;

            CALL ajouter_adoption(18, 6, @date_adoption, 1);


            # Exemple 2 : l’animal a déjà été adopté.
            CALL ajouter_adoption(12, 21, @date_adoption, 1);


            # Exemple 3 : l’animal n’existe pas, v_prix est donc NULL
            CALL ajouter_adoption(12, 102, @date_adoption, 1);

#####################################################################################################
#                                                                                                   #
#               Pour empêcher ces erreurs intempestives, deux solutions :                           #
#                                                                                                   #
#    — vérifier chaque paramètre pouvant poser problème (p_animal_id et p_client_id ne sont         #
#    pas NULL et correspondent à quelque chose dans les tables Animal et Client, p_animal_id        #
#    ne correspond pas à un animal déjà adopté, etc.) ;                                             #
#                                                                                                   #
#    — utiliser un gestionnaire d’erreur : c’est ce que nous allons apprendre à faire ici           #
#                                                                                                   #
#####################################################################################################


        -- V.6.1.1. Creation d'un gestionnaire d'erreure
        -- ---------------------------------------------
            -- Syntaxe:
                DECLARE { EXIT | CONTINUE } HANDLER FOR { numero_erreur | {
                            SQLSTATE identifiant_erreur } | condition }
                instruction -- ou bloc d'instructions

######################################################################################################
#                                                                                                    #
#   — Un gestionnaire d’erreur définit une instruction (une seule !), ou un bloc d’instructions      #
#       (BEGIN ... END;), qui va être exécuté en cas d’erreur correspondant au gestionnaire.         #
#   — Tous les gestionnaires d’erreur doivent être déclarés au même endroit : après la déclaration   #
#       des variables locales, mais avant les instructions de la procédure.                          #
#   — Un gestionnaire peut, soit provoquer l’arrêt de la procédure (EXIT), soit faire reprendre      #
#       la procédure après avoir géré l’erreur (CONTINUE).                                           #
#   — On peut identifier le type d’erreur que le gestionnaire va reconnaître de trois manières       #
#       différentes : un numéro d’erreur, un identifiant, ou une CONDITION.                          #
#   — Un gestionnaire étant défini grâce au mot-clé DECLARE, comme les variables locales, il a       #
#       exactement la même portée que celles-ci.                                                     #
#                                                                                                    #
######################################################################################################


            -- Exemples : ces deux procédures enregistrent une adoption en gérant les erreurs, l’une arrêtant
            -- la procédure, l’autre relançant celle-ci :

                DELIMITER |
                CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                BEGIN
                    DECLARE v_prix DECIMAL(7,2);
                    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
                        BEGIN
                            SELECT 'Une erreur est survenue...';
                            SELECT 'Arrêt prématuré de la procédure';
                        END;

                        SELECT 'Début procédure';

                            SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                            FROM Animal
                            INNER JOIN Espece ON Espece.id = Animal.espece_id
                            LEFT JOIN Race ON Race.id = Animal.race_id
                            WHERE Animal.id = p_animal_id;

                            INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                            VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                        SELECT 'Fin procédure' AS message;
                END;

                
                CREATE PROCEDURE ajouter_adoption_continue(IN p_client_id INT, IN
                p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)

                BEGIN
                    DECLARE v_prix DECIMAL(7,2);
                    DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Une erreur est survenue...';

                        SELECT 'Début procédure';

                            SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                            FROM Animal
                            INNER JOIN Espece ON Espece.id = Animal.espece_id
                            LEFT JOIN Race ON Race.id = Animal.race_id
                            WHERE Animal.id = p_animal_id;

                            INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                            VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                        SELECT 'Fin procédure';
                END;
                DELIMITER ;

                SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;               
                CALL ajouter_adoption_exit(18, 6, @date_adoption, 1);
                CALL ajouter_adoption_continue(18, 6, @date_adoption, 1);



        -- V.6.1.2. Definition de l'erreur geree
        -- -------------------------------------
            -- V.6.1.2.1. Identifiant ou numéro MySQL de l’erreur
            -- V.6.1.2.2. Utilisation d’une CONDITION
            -- V.6.1.2.3. Conditions prédéfinies


            -- V.6.1.2.1. Identifiant ou numéro MySQL de l’erreur
            -- --------------------------------------------------
                DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SELECT 'Une erreur est survenue...';

#####################################################################################################
#                                                                                                   #
#              Le message d’erreur est constitué de trois éléments importants :                     #
#                                                                                                   #
#       — 1062 : le numéro d’erreur MySQL (un nombre entier) ;                                      #
#       — 23000 : l’identifiant de l’état SQL (une chaîne de 5 caractères) ;                        #
#       — Duplicate entry ’21’ for key ’ind_uni_animal_id’ : un message donnant le détail de        #
#           l’erreur.                                                                               #
#                                                                                                   #
#   Identifiant de l’état SQL:                                                                      #
#   Dans la procédure ajouter_adoption_continue(), c’est l’identifiant de l’état SQL ('23000')      #
#   qui a été utilisé. Il s’agit d’une chaîne de 5 caractères, renvoyée par le serveur au client    # 
#   pour informer de la réussite ou de l’échec d’une instruction. Un identifiant commençant par     #
#   '00' par exemple, signifie que l’instruction a réussi.                                          #
#                                                                                                   #
#   '23000' est l’identifiant renvoyé lorsqu’une erreur concernant une contrainte                   #
#   (NOT NULL, unicité, clé primaire ou secondaire,…) a été déclenchée.                             #
#   Pour utiliser cet identifiant dans un gestionnaire d’erreur, il faut le faire précéder          #
#   de SQLSTATE                                                                                     #
#                                                                                                   #
#    Numéro d’erreur MySQL                                                                          #
#    Pour utiliser le numéro d’erreur SQL, par contre, il suffit de l’indiquer, comme un nombre     #
#    entier                                                                                       #
#                                                                                                   #
#####################################################################################################

                DECLARE CONTINUE HANDLER FOR 1062 SELECT 'Une erreur est survenue...';


                -- V.6.1.2.2. Utilisation d’une CONDITION
                -- --------------------------------------
                    -- Syntaxe:
                    DECLARE nom_erreur CONDITION FOR { SQLSTATE identifiant_SQL |numero_erreur_MySQL };
    
                    -- Exemple : réécrivons la procédure ajouter_adoption_exit() en nommant l’erreur 
    
                    DROP PROCEDURE ajouter_adoption_exit;
                    DELIMITER |
                    CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                    BEGIN
                        DECLARE v_prix DECIMAL(7,2);
    
                        DECLARE violation_contrainte CONDITION FOR SQLSTATE '23000'; -- On nomme l'erreur dont l'identifiant est 23000 "violation_contrainte"
    
                        DECLARE EXIT HANDLER FOR violation_contrainte -- Le gestionnaire sert donc à intercepter
                            BEGIN -- les erreurs de type "violation_contrainte"
                                SELECT 'Une erreur est survenue...';
                                SELECT 'Arrêt prématuré de la procédure';
                            END;
    
                            SELECT 'Début procédure';
    
                                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                                FROM Animal
                                INNER JOIN Espece ON Espece.id = Animal.espece_id
                                LEFT JOIN Race ON Race.id = Animal.race_id
                                WHERE Animal.id = p_animal_id;
    
                                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);
    
                            SELECT 'Fin procédure';
                    END;
                    DELIMITER ;  
    
    
                -- V.6.1.2.3. Conditions prédéfinies:
                -- ----------------------------------

######################################################################################################## 
#                                                                                                      #
#                       Il existe trois conditions prédéfinies dans MySQL :                            #
#                                                                                                      #
#     — SQLWARNING : tous les identifiants SQL commençant par ’01’, c’est-à-dire les avertissements    #
#                    et les notes ;                                                                    #
#     — NOT FOUND : tous les identifiants SQL commençant par ’02’, et que nous verrons plus en         #
#                   détail avec les curseurs ;                                                         #
#     — SQLEXCEPTION : tous les identifiants SQL ne commençant ni par ’00’, ni par ’01’, ni par        #
#                      ’02’, donc les erreurs.                                                         #
#                                                                                                      #
######################################################################################################## 

                    -- Exemple : réécriture de la procédure ajouter_adoption_exit(), de façon à ce que le gestionnaire
                    --           intercepte toutes les erreurs SQL.

                    DROP PROCEDURE ajouter_adoption_exit;
                    DELIMITER |
                    CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
                    BEGIN
                        DECLARE v_prix DECIMAL(7,2);

                        DECLARE EXIT HANDLER FOR SQLEXCEPTION 
                            BEGIN -- les erreurs de type "violation_contrainte"
                                SELECT 'Une erreur est survenue...';
                                SELECT 'Arrêt prématuré de la procédure';
                            END;

                            SELECT 'Début procédure';

                                SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                                FROM Animal
                                INNER JOIN Espece ON Espece.id = Animal.espece_id
                                LEFT JOIN Race ON Race.id = Animal.race_id
                                WHERE Animal.id = p_animal_id;

                                INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                                VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                            SELECT 'Fin procédure';
                    END;
                    DELIMITER ;


        -- V.6.1.3. Declarer plusieurs gestionnaires, gerer plusieurs erreurs par gestionnaire
        -- -----------------------------------------------------------------------------------
            # Exemple : toujours avec la procédure ajouter_adoption_exit(). On peut l’écrire en détaillant
            # différentes erreurs possibles, puis en ajoutant un gestionnaire général qui reconnaîtra les SQLEX
            # CEPTION et les SQLWARNING, pour tous les cas qu’on ne traite pas dans les autres gestionnaires.
            # Ce qui donne:

        DROP PROCEDURE ajouter_adoption_exit;
        DELIMITER |
        CREATE PROCEDURE ajouter_adoption_exit(IN p_client_id INT, IN p_animal_id INT, IN p_date DATE, IN p_paye TINYINT)
        BEGIN
            DECLARE v_prix DECIMAL(7,2);

            DECLARE violation_cle_etrangere CONDITION FOR 1452; -- Déclaration des CONDITIONS
            DECLARE violation_unicite CONDITION FOR 1062;

            DECLARE EXIT HANDLER FOR violation_cle_etrangere -- Déclaration du gestionnaire pour
                BEGIN -- les erreurs de clés étrangères
                    SELECT 'Erreur : violation de clé étrangère.';
                END;

                DECLARE EXIT HANDLER FOR violation_unicite -- Déclaration du gestionnaire pour
                BEGIN -- les erreurs d'index unique
                    SELECT 'Erreur : violation de contrainte d''unicité.';
                END;

                DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING -- Déclaration du gestionnaire pour
                BEGIN -- toutes les autres erreurs ou avertissements
                    SELECT 'Une erreur est survenue...';
                END;

                SELECT 'Début procédure';

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id, p_client_id, CURRENT_DATE(), p_date, v_prix, p_paye);

                SELECT 'Fin procédure';
        END;
        DELIMITER ;

        SET @date_adoption = CURRENT_DATE() + INTERVAL 7 DAY;

        CALL ajouter_adoption_exit(12, 3, @date_adoption, 1); -- Violation unicité (animal 3 est déjà adopté)
        
        CALL ajouter_adoption_exit(133, 6, @date_adoption, 1); -- Violation clé étrangère (client 133 n'existe pas)
        
        CALL ajouter_adoption_exit(NULL, 6, @date_adoption, 1); -- Violation de contrainte NOT NULL


    -- V.6.2. Curseurs
    -- ---------------
        -- V.6.2.1. Syntaxe
        -- V.6.2.2. Restrictions
        -- V.6.2.3. Parcourir intelligement tous les resultats d'un curseur

#########################################################################################
#                                                                                       #
#               Quatre étapes sont nécessaires pour utiliser un curseur.                #
#                                                                                       #
#    — Déclaration du curseur : avec une instruction DECLARE.                           #
#    — Ouverture du curseur : on exécute la requête SELECT du curseur et on stocke      #
#        le résultat dans celui-ci.                                                     #
#                                                                                       #
#    — Parcours du curseur : on parcourt une à une les lignes.                          #
#    — Fermeture du curseur.                                                            #
#                                                                                       #
#########################################################################################




        -- V.6.2.1. Syntaxe
        -- ----------------
            -- V.6.2.1.1. Déclaration du curseur
            -- V.6.2.1.2. Ouverture et fermeture du curseur
            -- V.6.2.1.3. Parcours du curseur

            -- V.6.2.1.1. Déclaration du curseur:
            -- ---------------------------------
                DECLARE nom_curseur CURSOR FOR requete_select;

                -- Exemple :
                DECLARE curseur_client CURSOR
                FOR SELECT *
                FROM Client;


            -- V.6.2.1.2. Ouverture et fermeture du curseur
            -- --------------------------------------------
                OPEN nom_curseur;
                -- Parcours du curseur et instructions diverses
                CLOSE nom_curseur;


            -- V.6.2.1.3. Parcours du curseur
            -- ------------------------------
                FETCH nom_curseur INTO variable(s);

                -- Exemple : la procédure suivante parcourt les deux premières lignes de la table Client
                -- avec un curseur.
                
                DELIMITER |
                CREATE PROCEDURE parcours_deux_clients()
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);

                    DECLARE curs_clients CURSOR
                    FOR SELECT nom, prenom -- Le SELECT récupère deux colonnes
                    FROM Client
                    ORDER BY nom, prenom; -- On trie les clients par ordre alphabétique

                    OPEN curs_clients; -- Ouverture du curseur

                        FETCH curs_clients INTO v_nom, v_prenom; -- On récupère la première ligne et on assigne les valeur               récupérées à nos variables locales
                        SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Premier client';

                        FETCH curs_clients INTO v_nom, v_prenom; -- On récupère la seconde ligne et on assigne les valeur               -- récupérées à nos variables locales
                        SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Second client';

                    CLOSE curs_clients; -- Fermeture du curseur
                END;
                DELIMITER ;

                CALL parcours_deux_clients();



        -- V.6.2.2. Restrictions:
        -- ---------------------
            # jereo ny lesona fa faibless MySQL io.



        -- V.6.2.3. Parcourir intelligement tous les resultats d'un curseur
        -- ----------------------------------------------------------------

            -- V.6.2.3.1. Condition d’arrêt
            -- V.6.2.3.2. Le cas des booléens chez MySQL
            

            -- V.6.2.3.1. Condition d’arrêt
            -- ----------------------------
                 DELIMITER |
                CREATE PROCEDURE test_condition(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    OPEN curs_clients;

                        LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;
                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;

                CALL test_condition('Houtsiplou');

                # Exemple : la procédure test_condition2() ci-dessous fait la même chose que test_condition(),
                # mais inclut le gestionnaire d’erreur et le IF nécessaires pour stopper la boucle dès que toutes les
                # lignes sélectionnées ont été parcourues :             DELIMITER |
                
                Delimiter |
                CREATE PROCEDURE test_condition2(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);
                    DECLARE fin TINYINT DEFAULT 0; -- Variable locale utilisée pour stopper la boucle

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1; -- Gestionnaire d'erreur pour la condition NOT FOUND

                    OPEN curs_clients;

                        loop_curseur: LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;

                            IF fin = 1 THEN -- Structure IF pour quitter la boucle à la fin des résultats
                                LEAVE loop_curseur;
                            END IF;

                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;

                CALL test_condition2('Houtsiplou');
                CALL test_condition2('Bruxelles');



            -- V.6.2.3.2. Le cas des booléens chez MySQL
            -- -----------------------------------------
                SELECT 1 = 1, 1 = 2; -- 1 = 1 est vrai, bien sûr. Contrairement à 1 = 2 (si si !                DROP PROCEDURE test_condition2;
                

                DROP PROCEDURE test_condition2;

                DELIMITER |
                CREATE PROCEDURE test_condition2(IN p_ville VARCHAR(100))
                BEGIN
                    DECLARE v_nom, v_prenom VARCHAR(100);
                    DECLARE fin BOOLEAN DEFAULT FALSE; -- On déclare fin comme un BOOLEAN, avec FALSE pour défaut

                    DECLARE curs_clients CURSOR
                        FOR SELECT nom, prenom
                        FROM Client
                        WHERE ville = p_ville;

                    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE; -- On utilise TRUE au lieu de 1

                    OPEN curs_clients;

                        loop_curseur: LOOP
                            FETCH curs_clients INTO v_nom, v_prenom;

                            IF fin THEN -- Plus besoin de "= 1"
                            LEAVE loop_curseur;
                            END IF;

                            SELECT CONCAT(v_prenom, ' ', v_nom) AS 'Client';
                        END LOOP;

                    CLOSE curs_clients;
                END;
                DELIMITER ;



    -- V.6.3. Utilisation avancees des blocs d'instructions
    -- ----------------------------------------------------
        -- V.6.3.1. Utiliser des variables utilisateur dans un bloc d'instructions
        -- V.6.3.2. Utiliser un procedure dans un bloc
        -- V.6.3.3. Transactions et gestion d'erreurs
        -- V.6.3.4. Preparer une requete dans un bloc d'instructions
        -- V.6.3.5. En resumee


        -- V.6.3.1. Utiliser des variables utilisateur dans un bloc d'instructions
        -- -----------------------------------------------------------------------
        DELIMITER |
        CREATE PROCEDURE test_vu()
        BEGIN
            SET @var = 15;
        END;
        DELIMITER ;

        SELECT @var; -- @var n'existe pas encore, on ne l'a pas définie
        CALL test_vu(); -- On exécute la procédure
        SELECT @var; -- @var vaut maintenant 15, même en dehors de la procédure, puisqu'elle est définie partout dans la session

        SET @var = 'Bonjour';
        CALL test_vu();
        SELECT @var; -- Donne 15 !  


        -- V.6.3.2. Utiliser un procedure dans un bloc
        -- -------------------------------------------

            DELIMITER |
            CREATE PROCEDURE carre(INOUT p_nb FLOAT) SET p_nb = p_nb * p_nb;
                    CREATE PROCEDURE surface_cercle(IN p_rayon FLOAT, OUT p_surface FLOAT)
            BEGIN
                CALL carre(p_rayon);
                        SET p_surface = p_rayon * PI();
            END;
            DELIMITER ;
                    CALL surface_cercle(1, @surface); -- Donne environ pi (3,14...)
            SELECT @surface;
            CALL surface_cercle(2, @surface); -- Donne environ 12,57...
            SELECT @surface;


        -- V.6.3.3. Transactions et gestion d'erreurs
        -- ----------------------------------------                  
            DELIMITER |
            
            CREATE PROCEDURE adoption_deux_ou_rien(p_client_id INT, p_animal_id_1 INT, p_animal_id_2 INT)
            BEGIN
                DECLARE v_prix DECIMAL(7,2);

                DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK; -- Gestionnaire qui annule la transaction et termine la procédure

                START TRANSACTION;

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id_1;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id_1, p_client_id, CURRENT_DATE(), CURRENT_DATE(), v_prix, TRUE);

                    SELECT 'Adoption animal 1 réussie' AS message;

                    SELECT COALESCE(Race.prix, Espece.prix) INTO v_prix
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Animal.id = p_animal_id_2;

                    INSERT INTO Adoption (animal_id, client_id, date_reservation, date_adoption, prix, paye)
                    VALUES (p_animal_id_2, p_client_id, CURRENT_DATE(), CURRENT_DATE(), v_prix, TRUE);

                    SELECT 'Adoption animal 2 réussie' AS message;

                COMMIT;
            END;
            DELIMITER ;

            CALL adoption_deux_ou_rien(2, 43, 55); -- L'animal 55 a déjà été adopté


        -- V.6.3.4. Preparer une requete dans un bloc d'instructions
        -- ---------------------------------------------------------

            -- Exemple : la procédure suivante ajoute la ou les clauses que l’on veut à une simple requête
            DELIMITER |
            CREATE PROCEDURE select_race_dynamique(p_clause VARCHAR(255))
            BEGIN
                SET @sql = CONCAT('SELECT nom, description FROM Race ', p_clause);

                PREPARE requete FROM @sql;
                EXECUTE requete;
            END;
            DELIMITER ;

            CALL select_race_dynamique('WHERE espece_id = 2'); -- Affichera les races de chats
            CALL select_race_dynamique('ORDER BY nom LIMIT 2'); -- Affichera les deux premières races par ordre alphabétique de leur nom



-- V.7. Trigers
-- ------------
    -- V.7.1. Principe et usage
    -- V.7.2. Creation des triggers
    -- V.7.3. Suppression des triggers
    -- V.7.4. Exemples
    -- V.7.5. Restrictions


    -- V.7.1. Principe et usage
    -- ------------------------
        -- V.7.1.1. Qu'est-ce qu'un trigget?
        -- V.7.1.2. A quoi sert un trigger?

    
    -- V.7.2. Creation des triggers
        -- V.7.2.1. Syntaxe
        -- V.7.2.2. Regle et convention
        -- V.7.2.3. OLD et NEW
        -- V.7.2.4. Erreur declenchee pendant un TRIGGER


        -- V.7.2.1. Syntaxe
        -- ----------------
            CREATE TRIGGER nom_trigger moment_trigger evenement_trigger
            ON nom_table FOR EACH ROW
            corps_trigger;

            #— CREATE TRIGGER nom_trigger : les triggers ont donc un nom.
            #— moment_trigger evenement_trigger : servent à définir quand et comment le trigger est déclenché.
            #— ON nom_table : c’est là qu’on définit à quelle table le trigger est attaché.
            #— FOR EACH ROW : signifie littéralement ”pour chaque ligne”, sous-entendu ”pour chaque
            #                ligne insérée/supprimée/modifiée” selon ce qui a déclenché le trigger.
            #— corps_trigger : c’est le contenu du trigger. Comme pour les procédures stockées, il
            #               peut s’agir soit d’une seule instruction, soit d’un bloc d’instructions.

        -- V.7.2.1.3. Exemple

            CREATE TRIGGER after_insert_animal AFTER INSERT
            ON Animal FOR EACH ROW
            corps_trigger ;


        -- V.7.2.3. OLD et NEW

            # — OLD : représente les valeurs des colonnes de la ligne traitée avant qu’elle ne soit modifiée par l’événement déclencheur. Ces valeurs peuvent être lues, mais pas modifiées.
            # — NEW : représente les valeurs des colonnes de la ligne traitée après qu’elle a été modifiée
            #         par l’événement déclencheur. Ces valeurs peuvent être lues et modifiées.

            INSERT INTO Adoption (client_id, animal_id, date_reservation, prix, paye)
            VALUES (12, 15, NOW(), 200.00, FALSE);

            UPDATE Adoption
            SET paye = TRUE
            WHERE client_id = 12 AND animal_id = 15;



    -- V.7.3. Suppression des triggers
        DROP TRIGGER nom_trigger;



    -- V.7.4. Exemples
        -- V.7.4.1. Contraintes et verification des donnees
        -- V.7.4.2. Mise a jour d'informations dependant d'autres donnees
        -- V.7.4.3. Historisation


        -- V.7.4.1. Contraintes et verification des donnees
        -- ------------------------------------------------
            -- V.7.4.1.1. Verification du sexe des animaux
            -- -------------------------------------------
                -- Trigger déclenché par l'insertion
                    DELIMITER |
                    CREATE TRIGGER before_insert_animal BEFORE INSERT
                        ON Animal FOR EACH ROW
                    BEGIN
                    -- Instructions
                    END ;

                    -- Trigger déclenché par la modification
                    CREATE TRIGGER before_update_animal BEFORE UPDATE
                    ON Animal FOR EACH ROW
                    BEGIN
                    -- Instructions
                    END ;
                    DELIMITER ;

                    DROP TRIGGER before_update_animal;

                    DELIMITER |
                    CREATE TRIGGER before_update_animal BEFORE UPDATE
                        ON Animal FOR EACH ROW
                        BEGIN
                        IF NEW.sexe IS NOT NULL -- le sexe n'est ni NULL
                            AND NEW.sexe != 'M' -- ni "M"
                            AND NEW.sexe != 'F' -- ni "F"
                        THEN
                            SET NEW.sexe = NULL;
                        END IF;
                    END ;
                    DELIMITER ;

                    # Test
                    UPDATE Animal
                    SET sexe = 'A'
                    WHERE id = 20; -- l'animal 20 est Balou, un mâle
                    
                    SELECT id, sexe, date_naissance, nom
                    FROM Animal
                    WHERE id = 20;
    -- V.7.5. Restrictions
        -- V.7.5.1. En resume