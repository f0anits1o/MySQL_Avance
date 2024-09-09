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
