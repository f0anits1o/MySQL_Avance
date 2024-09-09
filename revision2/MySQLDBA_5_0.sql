-- Active: 1723714754998@@127.0.0.1@3306@fiompina
-- ------------ --
-- Transactions --
-- ------------ --

SET NAMES utf8;


DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS Espece;


CREATE 
        TABLE Espece(
                        id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
                        nom_courant varchar(40) NOT NULL,
                        nom_latin varchar(40) NOT NULL,
                        description text,
                        prix decimal(7,2) unsigned DEFAULT NULL,
                    PRIMARY KEY (id),
                    UNIQUE KEY nom_latin (nom_latin)
                    ) 
                    ENGINE=InnoDB 
                    AUTO_INCREMENT=6 
                    DEFAULT CHARSET=latin1;

LOCK TABLES Espece WRITE;


INSERT 
    INTO Espece
        VALUES
            (1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue',200.00),
            (2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres',150.00),
            (3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure',140.00),
            (4,'Perroquet amazone','Alipiopsitta xanthops','Joli oiseau parleur vert et jaune',700.00),
            (5,'Rat brun','Rattus norvegicus','Petite bestiole avec de longues moustaches et une longue queue sans poils',10.00);

UNLOCK TABLES;


CREATE 
   TABLE Race   (
                    id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
                    nom varchar(40) NOT NULL,
                    espece_id smallint(6) unsigned NOT NULL,
                    description text,
                    prix decimal(7,2) unsigned DEFAULT NULL,
                PRIMARY KEY (id)
                ) 
                ENGINE=InnoDB 
                AUTO_INCREMENT=10 
                DEFAULT CHARSET=latin1;

LOCK TABLES Race WRITE;


INSERT 
    INTO Race 
        VALUES
            (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00),(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00),
            (4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.',835.00),(5,'Maine coon',2,'Chat de grande taille, à poils mi-longs.',735.00),(7,'Sphynx',2,'Chat sans poils.',1235.00),
            (8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...',985.00),(9,'Rottweiller',1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.',600.00);
UNLOCK TABLES;


CREATE 
TABLE Animal(
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
            ) 
            ENGINE=InnoDB 
            AUTO_INCREMENT=63 
            DEFAULT CHARSET=utf8;

LOCK TABLES Animal WRITE;


INSERT 
        INTO Animal 
            VALUES
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

ALTER
    TABLE Race
        ADD
            CONSTRAINT fk_race_espece_id 
            FOREIGN KEY (espece_id) 
            REFERENCES Espece (id) 
                ON DELETE CASCADE;

ALTER 
    TABLE Animal 
        ADD 
            CONSTRAINT fk_race_id 
            FOREIGN KEY (race_id)
            REFERENCES Race (id) 
                ON DELETE SET NULL;


ALTER 
    TABLE Animal 
        ADD 
            CONSTRAINT fk_espece_id 
            FOREIGN KEY (espece_id) 
            REFERENCES Espece (id);


ALTER 
    TABLE Animal 
        ADD 
            CONSTRAINT fk_mere_id 
            FOREIGN KEY (mere_id)
            REFERENCES Animal (id) 
                ON DELETE SET NULL;


ALTER 
    TABLE Animal 
        ADD 
            CONSTRAINT fk_pere_id 
            FOREIGN KEY (pere_id)
            REFERENCES Animal (id) 
                ON DELETE SET NULL;



SET autocommit=0;

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Baba', 5, '2012-02-13 15:45:00', 'F');


INSERT
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Bibo', 5, '2012-02-13 15:48:00', 'M');


INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Buba', 5, '2012-02-13 18:32:00', 'F'); -- Insertion de 3 rats bruns

DELETE 
    FROM Animal
        WHERE nom in ( "BaBa", "Bibo", "Buba");

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

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Baba', 5, '2012-02-13 15:45:00', 'F');

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Bibo', 5, '2012-02-13 15:48:00', 'M');


INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
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

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Popi', 5, '2007-03-11 12:45:00', 'M');

SAVEPOINT jalon1;

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
    VALUES ('Momo', 5, '2007-03-12 05:23:00', 'M');

ROLLBACK TO SAVEPOINT jalon1;

INSERT 
    INTO Animal (nom, espece_id, date_naissance, sexe)
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
SHOW TABLES;

DESC CLIENT;
-- Table Client
CREATE 
    TABLE Client(
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
                ) 
                ENGINE = InnoDB;

-- Table Adoption
CREATE 
    TABLE Adoption (
                        client_id SMALLINT UNSIGNED NOT NULL,
                        animal_id SMALLINT UNSIGNED NOT NULL,
                        date_reservation DATE NOT NULL,
                        date_adoption DATE,
                        prix DECIMAL(7,2) UNSIGNED NOT NULL,
                        paye TINYINT(1) NOT NULL DEFAULT 0,
                    PRIMARY KEY (client_id, animal_id), -- Cle composite
                    CONSTRAINT fk_client_id 
                        FOREIGN KEY (client_id) 
                        REFERENCES Client(id),
                    CONSTRAINT fk_adoption_animal_id 
                        FOREIGN KEY (animal_id) 
                        REFERENCES Animal(id),
                    UNIQUE INDEX 
                        ind_uni_animal_id (animal_id)
                    ) 
                    ENGINE = InnoDB;

-- Insertion de quelques clients
INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Jean', 'Dupont', 'Rue du Centre, 5', '45810', 'Houtsiplou', 'France', 'jean.dupont@email.com');

INSERT  INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Marie', 'Boudur', 'Place de la Gare, 2', '35840', 'Troudumonde', 'France', 'marie.boudur@email.com');

INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Fleur', 'Trachon', 'Rue haute, 54b', '3250', 'Belville', 'Belgique', 'fleurtrachon@email.com');

INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Julien', 'Van Piperseel', NULL, NULL, NULL, NULL, 'jeanvp@email.com');

INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Johan', 'Nouvel', NULL, NULL, NULL, NULL, 'johanetpirlouit@email.com');

INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Frank', 'Germain', NULL, NULL, NULL, NULL,'francoisgermain@email.com');

INSERT 
        INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) 
        VALUES ('Maximilien', 'Antoine', 'Rue Moineau, 123', '4580', 'Trocoul', 'Belgique', 'max.antoine@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES
('Hector', 'Di Paolo', NULL, NULL, NULL, NULL,'hectordipao@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Anaelle', 'Corduro', NULL, NULL, NULL, NULL, 'ana.corduro@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Eline', 'Faluche', 'Avenue circulaire, 7', '45870', 'Garduche', 'France', 'elinefaluche@email.com');

INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
('Carine', 'Penni', 'Boulevard Haussman, 85', '1514', 'Plasse', 'Suisse', 'cpenni@email.com');


INSERT INTO Client (prenom, nom, adresse, code_postal, ville, pays, email) VALUES 
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
