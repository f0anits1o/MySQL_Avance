-- Active: 1706076126421@@127.0.0.1@3306@mysqladminpdf
create database mysqladminpdf;

use mysqladminpdf;

set names 'utf8';

create table animal (
  id smallint unsigned not null auto_increment,
  espece varchar(40) not null,
  sex char(1),
  date_naissance datetime not null,
  nom varchar(30),
  commentaires text,
  primary key(id)
)
engine = innodb;

show tables;

desc animal; -- desc is a short for describe

-- Modification d'une TABLE avec alter TABLE

create table test_tuto(
  id int not null,
  nom varchar(10) not null,
  primary key(id)
);


alter table test_tuto add column date_insertion date not null after id ;

describe test_tuto;

alter table test_tuto add column adresse varchar(50)  unique first;


-- modification nom attribut
alter table test_tuto change nom prenom varchar(10) not null;

-- changement du type de donnee
alter table test_tuto modify prenom varchar(40) unique not null default "rakoto";

-- 1.7 Insertion de donnee page 73
--  Insertion sans préciser les colonnes
INSERT INTO Animal
VALUES (2, 'chat', NULL, '2010-03-24 02:23:00', 'Roucky', NULL);

INSERT INTO Animal 
VALUES (1, 'chien', 'M', '2010-04-05 13:43:00', 'Rox',
'Mordille beaucoup');

INSERT INTO Animal
VALUES (NULL , 'chat', 'F', '2010-09-13 15:02:00',
'Schtroumpfette', NULL);

select * from animal;

--  Insertion en précisant les colonnes

alter table animal change sex sexe char(1);
INSERT INTO Animal (espece, sexe, date_naissance)
VALUES ('tortue', 'F', '2009-08-03 05:12:00');
INSERT INTO Animal (nom, commentaires, date_naissance, espece)
VALUES ('Choupi', 'Né sans oreille gauche',
'2010-10-03 16:44:00', 'chat');
INSERT INTO Animal (espece, date_naissance, commentaires, nom,
sexe)
VALUES ('tortue', '2009-06-13 08:17:00', 'Carapace bizarre',
'Bobosse', 'F');

--  Insertion multiple
INSERT INTO Animal (espece, sexe, date_naissance, nom)
VALUES ('chien', 'F', '2008-12-06 05:18:00', 'Caroline'),
('chat', 'M', '2008-09-11 15:38:00', 'Bagherra'),
('tortue', NULL, '2010-08-23 05:18:00', NULL);

select * from animal;

-- Operateur
select * from animal where espece <> 'chat';
-- <> ~ != ~ different

-- operateur AND: and ~ &&
select * from animal where espece = "chat" and sexe='F';

select * from animal where espece = 'chat' && sexe = 'F';

-- operateur or: or ~ ||
select * from animal where espece = 'peroquet'
or espece = 'tortue';

select * from animal where espece = 'tortue' || espece = 'perroquet';

-- Je vous conseille d’utiliser plutôt OR que ||, car dans la majorité des SGBDR (et dans la
-- norme SQL), l’opérateur || sert à la concaténation. C’est-à-dire à rassembler plusieurs
-- chaînes de caractères en une seule. Il vaut donc mieux prendre l’habitude d’utiliser OR, au
-- cas où vous changeriez un jour de SGBDR (ou tout simplement parce que c’est une bonne
-- habitude).

-- operateur NOT
select * from animal where sexe = 'F' and not espece = 'chien';

-- tsy mandeha intsony io syntaxe io => select * from animal where sexe = 'F' and ! espece = 'chien';

-- operateur XOR
select * from animal where sexe = 'M' XOR espece = 'perroquet';
-- Sélection des animaux qui sont soit des mâles, soit des perroquets (mais pas les deux) 

-- NULL
SELECT *
FROM Animal
WHERE nom = NULL; -- sélection des animaux sans nom

SELECT *
FROM Animal WHERE commentaires <> NULL; -- sélection des animaux pour lesquels un commentaire existe
-- code tsy mandeha io fa aleo ihany mampiasa an'ilay in not null eo ambany

SELECT *
FROM Animal
WHERE nom <=> NULL;

-- OU
SELECT *
FROM Animal
WHERE nom IS NULL;

SELECT *
FROM Animal
WHERE commentaires IS NOT NULL; -- sélection des animaux pour lesquels un commentaire existe

-- Tri des donnees
select * from animal where espece = 'chien' order by date_naissance;

-- par defaut order by => ascendant

-- Tri ascendant et descendant
select * from animal where espece = 'chien' and nom is not NULL
order by nom desc;

select * from animal where espece = 'chien' and nom is not NULL
order by nom asc;

-- Trier sur plusieurs colonnes

select * from animal order by espece, date_naissance;

-- Eliminer les doublons
select espece from animal;

select distinct espece from animal;

-- RESTREINDRE LES RESULTATS
select * from animal order by id limit 6;

select * from animal order by id limit 6 offset 6;

select * from animal order by id limit 6 offset 0;

select *  from animal where 
date_naissance > '2009-12-31'
or (espece='chat' and (
  sexe='M' or (sexe='F' and date_naissance <'2007-06-01') 
));


-- JOKER _ and % (\ ~ echapement)
desc animal;
insert into animal value
(35, 'chat', 
'F', 
'2008-04-20 03:20:00','
bibla', 
'Sourde de l\'oreille droite 80%' );

select * from animal where commentaires like '%\%%';

select * from animal where nom not like '%a%';

--  Sensibilité à la casse
select * from animal where nom like '%ou%'; -- insensative case

select * from animal where nom like binary '%Ou%'; -- sensative case

-- RECHERCHE DANS LE nUMERIQUE
select * from animal
where id like "1%";

select count(*) from animal where id like '1%';

-- Recherche dans un intervalle
select * from animal
    where date_naissance <= '2009-03-23' AND
    date_naissance >= '2008-01-05';

select * from animal where date_naissance between '2008-01-05' and '2009-03-23';

-- BETWEEN peut s’utiliser avec des dates, mais aussi avec des nombres (BETWEEN 0 AND 100) ou
-- avec des chaînes de caractères (BETWEEN 'a' AND 'd') auquel cas c’est l’ordre alphabétique
-- qui sera utilisé (toujours insensible à la casse sauf si l’on utilise des chaînes binaires : BETWEEN
-- BINARY 'a' AND BINARY 'd'). Bien évidemment, on peut aussi exclure un intervalle avec NOT
-- BETWEEN.

select * from animal where nom in ('Moka', 'Bilba', 'Tortilla', 'Balou', 'Dana', 'Redbul', 'Gingko');


-- sauvegarde base de donnee: Syntaxe
-- PS C:\Program Files\MySQL\MySQL Server 8.0\bin> mysqldump -u root -p e_commerce > c:\db\e_commerce.sql
--Enter password: *********

-- Suppession (delete)
delete from animal where nom = 'Zoulou';

-- Modification (update)

update animal set sexe='F', nom='Pataude' where id=21;

 -- Deuxieme partie
 -- Index, jointures et sous-requetes

-- INDEX

SET NAMES utf8;

--  les tables de test ne sont pas reprises

DROP TABLE IF EXISTS Animal;
CREATE TABLE Animal (
id smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
espece varchar(40) NOT NULL,
sexe char(1) DEFAULT NULL,
date_naissance datetime NOT NULL,
nom varchar(30) DEFAULT NULL,
commentaires text,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
LOCK TABLES Animal WRITE;
INSERT INTO Animal VALUES
(1,'chien','M','2010-04-05 13:43:00','Rox','Mordille beaucoup'),(2,'chat',NULL,'2010-03-24 02:23:00','Roucky',NULL),(3,'chat','F','2010-09-13 15:02:00','Schtroumpfette',NULL),
(4,'tortue','F','2009-08-03 05:12:00',NULL,NULL),(5,'chat',NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche'),(6,'tortue','F','2009-06-13 08:17:00','Bobosse','Carapace bizarre'),
(7,'chien','F','2008-12-06 05:18:00','Caroline',NULL),(8,'chat','M','2008-09-11 15:38:00','Bagherra',NULL),(9,'tortue',NULL,'2010-08-23 05:18:00',NULL,NULL),
(10,'chien','M','2010-07-21 15:41:00','Bobo',NULL),(11,'chien','F','2008-02-20 15:45:00','Canaille',NULL),(12,'chien','F','2009-05-26 08:54:00','Cali',NULL),
(13,'chien','F','2007-04-24 12:54:00','Rouquine',NULL),(14,'chien','F','2009-05-26 08:56:00','Fila',NULL),(15,'chien','F','2008-02-20 15:47:00','Anya',NULL),
(16,'chien','F','2009-05-26 08:50:00','Louya',NULL),(17,'chien','F','2008-03-10 13:45:00','Welva',NULL),(18,'chien','F','2007-04-24 12:59:00','Zira',NULL),
(19,'chien','F','2009-05-26 09:02:00','Java',NULL),(20,'chien','M','2007-04-24 12:45:00','Balou',NULL),(21,'chien','F','2008-03-10 13:43:00','Pataude',NULL),
(22,'chien','M','2007-04-24 12:42:00','Bouli',NULL),(24,'chien','M','2007-04-12 05:23:00','Cartouche',NULL),(25,'chien','M','2006-05-14 15:50:00','Zambo',NULL),
(26,'chien','M','2006-05-14 15:48:00','Samba',NULL),(27,'chien','M','2008-03-10 13:40:00','Moka',NULL),(28,'chien','M','2006-05-14 15:40:00','Pilou',NULL),
(29,'chat','M','2009-05-14 06:30:00','Fiero',NULL),(30,'chat','M','2007-03-12 12:05:00','Zonko',NULL),(31,'chat','M','2008-02-20 15:45:00','Filou',NULL),
(32,'chat','M','2007-03-12 12:07:00','Farceur',NULL),(33,'chat','M','2006-05-19 16:17:00','Caribou',NULL),(34,'chat','M','2008-04-20 03:22:00','Capou',NULL),
(35,'chat','M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance'),(36,'chat','M','2009-05-14 06:42:00','Boucan',NULL),(37,'chat','F','2006-05-19 16:06:00','Callune',NULL),
(38,'chat','F','2009-05-14 06:45:00','Boule',NULL),(39,'chat','F','2008-04-20 03:26:00','Zara',NULL),(40,'chat','F','2007-03-12 12:00:00','Milla',NULL),
(41,'chat','F','2006-05-19 15:59:00','Feta',NULL),(42,'chat','F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%'),(43,'chat','F','2007-03-12 11:54:00','Cracotte',NULL),
(44,'chat','F','2006-05-19 16:16:00','Cawette',NULL),(45,'tortue','F','2007-04-01 18:17:00','Nikki',NULL),(46,'tortue','F','2009-03-24 08:23:00','Tortilla',NULL),
(47,'tortue','F','2009-03-26 01:24:00','Scroupy',NULL),(48,'tortue','F','2006-03-15 14:56:00','Lulla',NULL),(49,'tortue','F','2008-03-15 12:02:00','Dana',NULL),
(50,'tortue','F','2009-05-25 19:57:00','Cheli',NULL),(51,'tortue','F','2007-04-01 03:54:00','Chicaca',NULL),(52,'tortue','F','2006-03-15 14:26:00','Redbul','Insomniaque'),
(53,'tortue','M','2007-04-02 01:45:00','Spoutnik',NULL),(54,'tortue','M','2008-03-16 08:20:00','Bubulle',NULL),(55,'tortue','M','2008-03-15 18:45:00','Relou','Surpoids'),
(56,'tortue','M','2009-05-25 18:54:00','Bulbizard',NULL),(57,'perroquet','M','2007-03-04 19:36:00','Safran',NULL),(58,'perroquet','M','2008-02-20 02:50:00','Gingko',NULL),
(59,'perroquet','M','2009-03-26 08:28:00','Bavard',NULL),(60,'perroquet','F','2009-03-26 07:55:00','Parlotte',NULL);

UNLOCK TABLES;

-- Type INDEX
-- Unique, fulltext and spatial
-- (mila manao recherche momba anio index spatial io)
-- index Fulltext => MyIsam ihany afaka mampiasa azy (varchar, char and text)

-- CREATION INDEX
CREATE TABLE Animal2 (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
espece VARCHAR(40) NOT NULL,
sexe CHAR(1),
date_naissance DATETIME NOT NULL,
nom VARCHAR(30),
commentaires TEXT,
PRIMARY KEY (id),
INDEX ind_date_naissance (date_naissance), -- index sur la date de naissance
INDEX ind_nom (nom(10)) -- index sur le nom (le chiffre entre parenthèses étant le nombre de caractères pris en compte)
)
ENGINE=INNODB;

CREATE TABLE Animal3 (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
espece VARCHAR(40) NOT NULL,
sexe CHAR(1),
date_naissance DATETIME NOT NULL,
nom VARCHAR(30),
commentaires TEXT,
PRIMARY KEY (id),
INDEX ind_date_naissance (date_naissance),
INDEX ind_nom (nom(10)),
UNIQUE INDEX ind_uni_nom_espece (nom, espece) -- Index sur le nom et l'espece
)
ENGINE=INNODB;


-- Ajout des index après création de la table

ALTER TABLE test_tuto ADD COLUMN NOM VARCHAR(50) NOT NULL AFTER PRENOM;
ALTER TABLE Test_tuto ADD INDEX ind_nom (nom);
DESC TEST_TUTO;

--  Ajout avec CREATE INDEX
-- SYNTAXE
CREATE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée unindex simple

CREATE UNIQUE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée un index UNIQUE

CREATE FULLTEXT INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée un index FULLTEXT

CREATE INDEX ind_prenom ON Test_tuto (prenom);

-- syntaxe UNIQUE
CREATE TABLE nom_table (
colonne1 INT NOT NULL,
colonne2 VARCHAR(40),
colonne3 TEXT,
CONSTRAINT [symbole_contrainte] UNIQUE [INDEX] ind_uni_col2
(colonne2)
);

ALTER TABLE nom_table
ADD CONSTRAINT [symbole_contrainte] UNIQUE ind_uni_col2 (colonne2);

-- Suppression d’un index
ALTER TABLE nom_table
DROP INDEX nom_index;


CREATE TABLE Livre (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
auteur VARCHAR(50),
titre VARCHAR(200)
) ENGINE = MyISAM;
INSERT INTO Livre (auteur, titre)
VALUES ('Daniel Pennac', 'Au bonheur des ogres'),
('Daniel Pennac', 'La Fée Carabine'),
('Daniel Pennac', 'Comme un roman'),
('Daniel Pennac', 'La Petite marchande de prose'),
('Jacqueline Harpman', 'Le Bonheur est dans le crime'),
('Jacqueline Harpman', 'La Dormition des amants'),
('Jacqueline Harpman', 'La Plage d''Ostende'),
('Jacqueline Harpman', 'Histoire de Jenny'),
('Terry Pratchett', 'Les Petits Dieux'),
('Terry Pratchett', 'Le Cinquième éléphant'),
('Terry Pratchett', 'La Vérité'),
('Terry Pratchett', 'Le Dernier héros'),
('Terry Goodkind', 'Le Temple des vents'),
('Jules Verne', 'De la Terre à la Lune'),
('Jules Verne', 'Voyage au centre de la Terre'),
('Henri-Pierre Roché', 'Jules et Jim');

CREATE FULLTEXT INDEX ind_full_titre
ON Livre (titre);
CREATE FULLTEXT INDEX ind_full_aut
ON Livre (auteur);
CREATE FULLTEXT INDEX ind_full_titre_aut
ON Livre (titre, auteur);

-- Il existe trois types de recherche FULLTEXT : 
-- la recherche naturelle, 
-- la recherche avec booléen,
-- et enfin la recherche avec extension de requête.

--  Recherche naturelle
-- Syntaxe
SELECT *
FROM nom_table
WHERE MATCH(colonne1[, colonne2, ...])
AGAINST ('chaîne recherchée' IN NATURAL LANGUAGE MODE);
-- fin syntaxe

SELECT *
FROM Livre
WHERE MATCH(auteur)
AGAINST ('Terry');

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('Petite');

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('Petit');

SELECT *
FROM Livre
WHERE MATCH(auteur)
AGAINST ('Henri');

SELECT *
FROM Livre
WHERE MATCH(auteur, titre)
AGAINST ('Jules');

SELECT *
FROM Livre
WHERE MATCH(titre, auteur)
AGAINST ('Jules');

SELECT *
FROM Livre
WHERE MATCH(titre, auteur)
AGAINST ('Jules Verne');

SELECT *, MATCH(titre, auteur) AGAINST ('Jules Verne Lune') as pertinance
FROM Livre;

--  Recherche avec booléens
SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('+bonheur -ogres' IN BOOLEAN MODE);

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('"Terre à la Lune"' IN BOOLEAN MODE);

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('"Lune à la Terre"' IN BOOLEAN MODE);

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('"Terre la Lune"' IN BOOLEAN MODE);

-- Pour spécifier un groupe de mots exigés, on utilise les doubles guillemets. Tous les mots entre
-- doubles guillemets devront non seulement être présents mais également apparaître dans l’ordre
-- donné, et sans rien entre eux. Il faudra donc que l’on retrouve exactement ces mots pour avoir
-- un résultat.

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('petit*' IN BOOLEAN MODE);

-- recherche sur titre et auteur, de tous les mots commençant par ”d”
SELECT *
FROM Livre
WHERE MATCH(titre, auteur)
AGAINST ('d*' IN BOOLEAN MODE);

SELECT *
FROM Livre
WHERE MATCH(titre)
AGAINST ('+petit* -prose' IN BOOLEAN MODE); -- mix d'un astérisque avec les + et -

SELECT *
FROM Livre
WHERE MATCH(titre, auteur)
AGAINST ('Daniel');

SELECT *
FROM Livre
WHERE MATCH(titre, auteur)
AGAINST ('Daniel' WITH QUERY EXPANSION);

-- cle primaire et etrangere
CREATE TABLE Espece (
id SMALLINT UNSIGNED AUTO_INCREMENT,
nom_courant VARCHAR(40) NOT NULL,
nom_latin VARCHAR(40) NOT NULL UNIQUE,
description TEXT,
PRIMARY KEY(id)
)
ENGINE=InnoDB;

INSERT INTO Espece (nom_courant, nom_latin, description) VALUES
('Chien', 'Canis canis', 'Bestiole à quatre pattes qui aime les caresses et tire souvent la langue'),
('Chat', 'Felis silvestris', 'Bestiole à quatre pattes qui saute très haut et grimpe aux arbres'),
('Tortue d''Hermann', 'Testudo hermanni', 'Bestiole avec une carapace très dure'),
('Perroquet amazone', 'Alipiopsitta xanthops', 'Joli oiseau parleur vert et jaune');

alter table Animal add column espece_id smallint unsigned;

update animal set espece_id = 1 where espece = 'chien';
update animal set espece_id = 2 where espece = 'chat';
update animal set espece_id = 3 where espece = 'tortue';
update animal set espece_id = 4 where espece = 'perroquet';

alter table animal drop column espece;

alter table animal add constraint fk_espece_id foreign key (espece_id) references espece(id);

-- test Puissance foreign key ary ny moteur Innodb
INSERT INTO Animal (nom, espece_id, date_naissance) VALUES ('Caouette', 5, '2009-02-15 12:45:00');

desc espece;

ALTER TABLE Animal MODIFY espece_id SMALLINT UNSIGNED NOT NULL;

CREATE UNIQUE INDEX ind_uni_nom_espece_id ON Animal (nom,
espece_id);


CREATE TABLE Race (
id SMALLINT UNSIGNED AUTO_INCREMENT,
nom VARCHAR(40) NOT NULL,
espece_id SMALLINT UNSIGNED NOT NULL, -- pas de nom latin, mais une référence vers l'espèce
description TEXT,
PRIMARY KEY(id),
CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES
Espece(id) -- pour assurer l'intégrité de la référence
)
ENGINE = InnoDB;

-- -----------------------
-- REMPLISSAGE DE LA TABLE
-- -----------------------
INSERT INTO Race (nom, espece_id, description)
VALUES ('Berger allemand', 1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.'),
('Berger blanc suisse', 1, 'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.'),
('Boxer', 1, 'Chien de taille moyenne, au poil ras de couleur fauve ou bringé avec quelques marques blanches.'),
('Bleu russe', 2, 'Chat aux yeux verts et à la robe épaisse et argentée.'),
('Maine coon', 2, 'Chat de grande taille, à poils mi-longs.'),
('Singapura', 2, 'Chat de petite taille aux grands yeux en amandes.'),
('Sphynx', 2, 'Chat sans poils.');

-- ---------------------------------------------
-- AJOUT DE LA COLONNE race_id A LA TABLE Animal
-- ---------------------------------------------
ALTER TABLE Animal ADD COLUMN race_id SMALLINT UNSIGNED;

ALTER TABLE Animal
ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race(id);

-- -------------------------
-- REMPLISSAGE DE LA COLONNE
-- -------------------------
UPDATE Animal SET race_id = 1 WHERE id IN (1, 13, 20, 18, 22, 25, 26, 28);
UPDATE Animal SET race_id = 2 WHERE id IN (12, 14, 19, 7);
UPDATE Animal SET race_id = 3 WHERE id IN (23, 17, 21, 27);
UPDATE Animal SET race_id = 4 WHERE id IN (33, 35, 37, 41, 44, 31, 3);
UPDATE Animal SET race_id = 5 WHERE id IN (43, 40, 30, 32, 42, 34, 39, 8);
UPDATE Animal SET race_id = 6 WHERE id IN (29, 36, 38);


-- -------------------------------------------------------
-- AJOUT DES COLONNES mere_id ET pere_id A LA TABLE Animal
-- -------------------------------------------------------
ALTER TABLE Animal ADD COLUMN mere_id SMALLINT UNSIGNED;

ALTER TABLE Animal
ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES
Animal(id);

ALTER TABLE Animal ADD COLUMN pere_id SMALLINT UNSIGNED;
ALTER TABLE Animal
ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES
Animal(id);
-- -------------------------------------------
-- REMPLISSAGE DES COLONNES mere_id ET pere_id
-- -------------------------------------------
UPDATE Animal SET mere_id = 18, pere_id = 22 WHERE id = 1;
UPDATE Animal SET mere_id = 7, pere_id = 21 WHERE id = 10;
UPDATE Animal SET mere_id = 41, pere_id = 31 WHERE id = 3;
UPDATE Animal SET mere_id = 40, pere_id = 30 WHERE id = 2;

select * from animal;

-- JOINTURE
SELECT Espece.description
FROM Espece
INNER JOIN Animal
ON Espece.id = Animal.espece_id
WHERE Animal.nom = 'Cartouche';

-- SELECT Espece.description : je sélectionne la colonne description de la table Espece.
-- FROM Espece : je travaille sur la table Espece.
-- INNER JOIN Animal : je la joins (avec une jointure interne) à la table Animal.
-- ON Espece.id = Animal.espece_id : la jointure se fait sur les colonnes id de la table
-- Espece et espece_id de la table Animal, qui doivent donc correspondre.
-- WHERE Animal.nom = 'Cartouche' : dans la table résultant de la jointure, je sélectionne
-- les lignes qui ont la valeur ”Cartouche” dans la colonne nom venant de la table Animal.

-- SYNTAXE JOINTURE INTERNE
 SELECT * -- comme d'habitude, vous sélectionnez les colonnes que vous voulez
FROM nom_table1
[INNER] JOIN nom_table2 -- INNER explicite le fait qu'il s'agit d'une jointure interne, mais c'est facultatif
ON colonne_table1 = colonne_table2 -- sur quelles colonnes se fait la jointure
-- vous pouvez mettre colonne_table2 = colonne_table1, l'ordre n'a pasd'importance
[WHERE ...]
[ORDER BY ...] -- les clauses habituelles sont bien sûr utilisables !
[LIMIT ...]
--FIN SYNTAXE


SELECT Espece.id, -- ici, pas le choix, il fautNpréciser
Espece.description, -- ici, on pourrait mettre juste description
Animal.nom -- idem, la précision n'est pas obligatoire. C'est cependant plus clair puisque les espèces ont un nom aussi
FROM Espece
INNER JOIN Animal
ON Espece.id = Animal.espece_id
WHERE Animal.nom LIKE 'Ch%';


SELECT e.id,
e.description,
a.nom
FROM Espece AS e -- On donne l'alias "e" à Espece
INNER JOIN Animal AS a -- et l'alias "a" à Animal.
ON e.id = a.espece_id
WHERE a.nom LIKE 'Ch%';

-- MITOVY IREO SYNTAXE ROA IREO

SELECT e.id,
e.description,
a.nom
FROM Espece e -- On donne l'alias "e" à Espece
INNER JOIN Animal a -- et l'alias "a" à Animal.
ON e.id = a.espece_id
WHERE a.nom LIKE 'Ch%';

SELECT e.id as id_espece,
e.description as description_espece,
a.nom as nom_bestiole
FROM Espece AS e -- On donne l'alias "e" à Espece
INNER JOIN Animal AS a -- et l'alias "a" à Animal.
ON e.id = a.espece_id
WHERE a.nom LIKE 'Ch%';

SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal
INNER JOIN Race
ON Animal.race_id = Race.id
WHERE Animal.espece_id = 2 -- ceci correspond aux chats
ORDER BY Race.nom, Animal.nom;

-- -------------------------
-- JOINTURE EXTERNE
-- -------------------------

-- JOINTURE PAR LA GAUCHE (LEFT JOIN)
SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal -- Table de gauche
LEFT JOIN Race -- Table de droite
ON Animal.race_id = Race.id
WHERE Animal.espece_id = 2
AND Animal.nom LIKE 'C%'
ORDER BY Race.nom, Animal.nom;

-- OU

SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal -- Tablegauche
LEFT OUTER JOIN Race -- Table droite
ON Animal.race_id = Race.id
WHERE Animal.espece_id = 2
AND Animal.nom LIKE 'C%'
ORDER BY Race.nom, Animal.nom;

-- Jointures par la droite
SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal -- Table de gauche
RIGHT JOIN Race -- Table de droite
ON Animal.race_id = Race.id
WHERE Race.espece_id = 2
ORDER BY Race.nom, Animal.nom;

-- OU

SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Animal -- TablE de gauche
RIGHT OUTER JOIN Race -- Table de droite
ON Animal.race_id = Race.id
WHERE Race.espece_id = 2
ORDER BY Race.nom, Animal.nom;


SELECT Animal.nom AS nom_animal, Race.nom AS race
FROM Race -- Table de gauche
LEFT JOIN Animal -- Table de droite
ON Animal.race_id = Race.id
WHERE Race.espece_id = 2
ORDER BY Race.nom, Animal.nom;


--  Syntaxes alternatives: jointur avec USING
SELECT *
FROM table1
[INNER | LEFT | RIGHT] JOIN table2 USING (colonneJ); -- colonneJ est présente dans les deux tables

-- équivalent à

SELECT *
FROM table1
[INNER | LEFT | RIGHT] JOIN table2 ON Table1.colonneJ = table2.colonneJ;

--  Syntaxes alternatives: jointur NATURAL JOIN

-- jointure de table1 et table2 (une colonne ayant le même nom : B)
SELECT *
FROM table1
NATURAL JOIN table2;

-- EST ÉQUIVALENT À
SELECT *
FROM table1
INNER JOIN table2
ON table1.B = table2.B;

-- jointure de table1 et table3 (deux colonnes ayant le même nom : A et C)
SELECT *
FROM table1
NATURAL JOIN table3;

-- EST ÉQUIVALENT À

SELECT *
FROM table1
INNER JOIN table3
ON table1.A = table3.A AND table1.C = table3.C;

-- Pour utiliser ce type de jointure, il faut donc être certain que toutes les colonnes nécessaires
-- à la jointure ont le même nom dans les deux tables, mais aussi que les colonnes ayant le même
-- nom sont uniquement celles qui servent à la jointure.

-- Notez que vous pouvez également réaliser une jointure externe par la gauche avec les jointures
-- naturelles à l’aide de NATURAL LEFT JOIN.

-- ------------------------------------------
-- Syntaxes alternatives: Jointures sans JOIN
-- ------------------------------------------

SELECT *
FROM table1, table2
WHERE table1.colonne1 = table2.colonne2;

-- équivalent à

SELECT *
FROM table1
[INNER] JOIN table2
ON table1.colonne1 = table2.colonne2;

-- VAKIRAOKA
DESC ANIMAL;
DESC ESPECE;
SELECT NOM_COURANT FROM ESPECE;

SELECT * FROM ANIMAL WHERE NOM='BERGER';
-- ---------------------------
-- MINI TP
-- ---------------------------

-- Vous devez obtenir la liste des races de chiens qui sont des chiens de berger.
SELECT Race.nom AS Race
FROM Race
INNER JOIN Espece ON Espece.id = Race.espece_id
WHERE Espece.nom_courant = 'chien' AND Race.nom LIKE '%berger%';

-- Vous devez obtenir la liste des animaux (leur nom, date de naissance et race) pour
-- lesquels nous n’avons aucune information sur la couleur que devrait avoir leur
-- pelage

SELECT Animal.nom AS nom_animal, Animal.date_naissance, Race.nom AS race FROM Animal
    LEFT JOIN Race
        ON Animal.race_id = Race.id
          WHERE (Race.description NOT LIKE '%poil%'
              AND Race.description NOT LIKE '%robe%'
              AND Race.description NOT LIKE '%pelage%'
                )
          OR Race.id IS NULL;


-- Vous devez obtenir la liste des chats et des perroquets amazones, avec leur sexe,
-- leur espèce (nom latin) et leur race s’ils en ont une. Regroupez les chats ensemble,
-- les perroquets ensemble et, au sein de l’espèce, regroupez les races.

SELECT Animal.nom as nom_animal, Animal.sexe, Espece.nom_latin as
espece, Race.nom as race
FROM Animal
INNER JOIN Espece
ON Animal.espece_id = Espece.id
LEFT JOIN Race
ON Animal.race_id = Race.id
WHERE Espece.nom_courant IN ('Perroquet amazone', 'Chat')
ORDER BY Espece.nom_latin, Race.nom;

-- Vous devez obtenir la liste des chiennes dont on connaît la race, et qui sont en
-- âge de procréer (c’est-à-dire nées avant juillet 2010). Affichez leur nom, date de
-- naissance et race.

SELECT Animal.nom AS nom_chienne, Animal.date_naissance, Race.nom
AS race
FROM Animal
INNER JOIN Espece
ON Animal.espece_id = Espece.id
INNER JOIN Race
ON Animal.race_id = Race.id
WHERE Espece.nom_courant = 'chien'
AND Animal.date_naissance < '2010-07-01'
AND Animal.sexe = 'F';

-- Vous devez obtenir la liste des chats dont on connaît les parents, ainsi que le nom de ces parents.
SELECT Animal.nom, Pere.nom AS Papa, Mere.nom AS Maman FROM Animal
    INNER JOIN Animal AS Pere
        ON Animal.pere_id = Pere.id
    INNER JOIN Animal AS Mere
        ON Animal.mere_id = Mere.id
    INNER JOIN Espece
        ON Animal.espece_id = Espece.id
    WHERE Espece.nom_courant = 'chat';


-- Vous devez obtenir la liste des animaux dont on connaît le père, la mère, la race,
-- la race du père, la race de la mère. Affichez le nom et la race de l’animal et de ses
-- parents, ainsi que l’espèce de l’animal (pas des parents).

SELECT Espece.nom_courant AS espece, Animal.nom AS nom_animal,
Race.nom AS race_animal,
Pere.nom AS papa, Race_pere.nom AS race_papa,
Mere.nom AS maman, Race_mere.nom AS race_maman
FROM Animal
    INNER JOIN Espece
        ON Animal.espece_id = Espece.id
    INNER JOIN Race
        ON Animal.race_id = Race.id
    INNER JOIN Animal AS Pere
        ON Animal.pere_id = Pere.id
    INNER JOIN Race AS Race_pere
        ON Pere.race_id = Race_pere.id
    INNER JOIN Animal AS Mere
        ON Animal.mere_id = Mere.id
    INNER JOIN Race AS Race_mere
        ON Mere.race_id = Race_mere.id;


-- --------------------------------------
-- Sous requete
-- --------------------------------------

--  Sous-requêtes dans le FROM
SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.espece_id
FROM Animal
INNER JOIN Espece
ON Espece.id = Animal.espece_id
WHERE sexe = 'F'
AND Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone');

SELECT MIN(date_naissance) FROM (
SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.espece_id
FROM Animal
INNER JOIN Espece
ON Espece.id = Animal.espece_id
WHERE sexe = 'F'
AND Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
) AS tortues_perroquets_F;


--  Sous-requêtes dans les conditions

SELECT id, sexe, nom, commentaires, espece_id, race_id
FROM Animal
WHERE race_id = (SELECT id FROM Race WHERE nom = 'Berger Allemand'); -- la sous-requête renvoie simplement 1

-- afaka atao amin'ny inner join io requette io 
SELECT Animal.id, sexe, Animal.nom, commentaires, Animal.espece_id, race_id FROM Animal
    INNER JOIN Race 
        ON Race.id = Animal.race_id
        WHERE Race.nom = 'Berger Allemand';

SELECT id, nom, espece_id
FROM Race
WHERE espece_id = (
SELECT MIN(id) 
-- Je rappelle que MIN() permet de récupérer id
-- la plus petite valeur de la colonne parmi les lignes
-- sélectionnées
FROM Espece);

SELECT id, nom, espece_id FROM Race
    WHERE espece_id < (
        SELECT id
        FROM Espece
        WHERE nom_courant = 'Tortue d''Hermann');

-- --------------------------------
-- Sous-requête renvoyant une ligne
-- --------------------------------

-- Seuls les opérateurs = et != (ou <>) sont utilisables avec une sous-requête de ligne, toutes
-- les comparaisons de type ”plus grand” ou ”plus petit” ne sont pas supportées.

-- Syntax

SELECT * FROM nom_table1
    WHERE [ROW](colonne1, colonne2) = ( -- le ROW n'est pas obligatoire
        SELECT colonneX, colonneY FROM nom_table2
            WHERE...); -- Condition qui ne retourne qu'UNE SEULE LIGNE
-- fin Syntaxe

SELECT id, sexe, nom, espece_id, race_id FROM Animal
    WHERE (id, race_id) = (
        SELECT id, espece_id FROM Race 
            WHERE id = 7);

-- Conditions avec IN et NOT IN

-- IN
SELECT Animal.id, Animal.nom, Animal.espece_id FROM Animal
INNER JOIN Espece
ON Espece.id = Animal.espece_id
WHERE Espece.nom_courant IN ('Tortue d''Hermann',
'Perroquet amazone');

-- Cet opérateur peut également s’utiliser avec une sous-requête dont le résultat est une colonne
-- ou une valeur. On peut donc réécrire la requête ci-dessus en utilisant une sous-requête plutôt
-- qu’une jointure :

SELECT id, nom, espece_id FROM Animal
    WHERE espece_id IN (
        SELECT id FROM Espece
            WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
);

SELECT id -- On ne sélectionne bien qu'UNE SEULE COLONNE.
FROM Espece
WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone');

-- NOT IN
SELECT id, nom, espece_id FROM Animal
    WHERE espece_id NOT IN (
        SELECT id FROM Espece
            WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
);

-- 
--  Conditions avec ANY, SOME et ALL
--

-- ANY (ou SOME)
SELECT * FROM Animal
    WHERE espece_id < ANY (
        SELECT id FROM Espece
            WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
);

-- ALL
SELECT *
FROM Animal
WHERE espece_id < ALL (
SELECT id
FROM Espece
WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
);

--  Sous-requêtes corrélées
-- Syntaxe
SELECT colonne1 FROM tableA
    WHERE colonne2 IN (
        SELECT colonne3 FROM tableB
            WHERE tableB.colonne4 = tableA.colonne5
);


--  Conditions avec EXISTS et NOT EXISTS
-- syntaxe
SELECT * FROM nom_table WHERE [NOT] EXISTS (sous-requête)

SELECT id, nom, espece_id FROM Race WHERE EXISTS (SELECT * FROM Animal WHERE nom = 'Balou');

--  on sélectionne les races s’il existe un animal qui s’appelle Balou
SELECT * FROM Animal WHERE nom = 'Balou';

--  je veux sélectionner toutes les races dont on ne possède aucun animal
SELECT * FROM Race WHERE NOT EXISTS (SELECT * FROM Animal WHERE Animal.race_id = Race.id);

-- ----------------------------------------------------
-- Jointures et sous-requêtes :
-- modification de données
-- ----------------------------------------------------

--  Insertion
-- -- Sous-requête pour l’insertion
INSERT INTO Animal (nom, sexe, date_naissance, race_id, espece_id) 
-- -- -- Je précise les colonnes puisque je ne donne pas une valeur pour toutes.
SELECT 'Yoda', 'M', '2010-11-09', id AS race_id, espece_id -- Attention à l'ordre !
FROM Race WHERE nom = 'Maine coon';

-- -- -- verification insertion
SELECT Animal.id, Animal.sexe, Animal.nom, Race.nom AS race,
Espece.nom_courant as espece
FROM Animal
INNER JOIN Race ON Animal.race_id = Race.id
INNER JOIN Espece ON Race.espece_id = Espece.id
WHERE Race.nom = 'Maine coon';


-- -- Modification: utilisation sous requette
UPDATE Animal SET commentaires = 'Coco veut un gâteau' WHERE espece_id = 4;

UPDATE Animal SET commentaires = 'Coco veut un gâteau !' WHERE
espece_id = (SELECT id FROM Espece WHERE nom_courant LIKE 'Perroquet%');

-- --  Pour l’élément à modifier
INSERT INTO Race (nom, espece_id, description) VALUES ('Nebelung', 2,
'Chat bleu russe, mais avec des poils longs...');

-- -- -- misy diso io code eo ambany io
UPDATE Animal SET race_id = (SELECT id FROM Race WHERE nom = 'Nebelung' AND espece_id = 2) WHERE nom = 'Cawette';

SELECT id FROM Race WHERE nom = 'Nebelung' AND espece_id = 2;
select * from animal where race_id in (8, 9);

-- -- Modification avec jointure
UPDATE Animal
-- Classique !
INNER JOIN Espece
-- Jointure.
ON Animal.espece_id = Espece.id
-- Condition de la jointure.
SET Animal.commentaires = Espece.description
-- Ensuite, la modification voulue.
WHERE Animal.commentaires IS NULL
-- Seulement s'il n'y a pas encore de commentaire.
AND Espece.nom_courant IN ('Perroquet amazone', 'Tortue d''Hermann'); 
-- Et seulement pour les perroquets et les tortues.

-- -- Suppression: Utilisation des sous-requêtes
DELETE FROM Animal WHERE nom = 'Carabistouille';

DELETE FROM Animal
    WHERE nom = 'Carabistouille' AND espece_id =
        (SELECT id FROM Espece WHERE nom_courant = 'Chat');


-- --  Suppression avec jointure
DELETE Animal -- Je précise de quelles tables les données doivent être supprimées
FROM Animal -- Table principale
INNER JOIN Espece ON Animal.espece_id = Espece.id -- Jointure
WHERE Animal.nom = 'Carabistouille' AND Espece.nom_courant = 'Chat';

-- Union de plusieurs requette;

-- -- Syntaxe
SELECT ...
UNION
SELECT ...


SELECT ...
UNION
SELECT ...
UNION
SELECT ...
....
UNION
SELECT ...

-- fin Syntaxe

-- -- Les règles: Nombre de colonnes (diso io code eo ambany satria tsy nanaraka regle)
-- Pas le même nombre de colonnes 

SELECT Animal.id, Animal.nom, Espece.nom_courant
-- 3 colonnes sélectionnées
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Chat'
UNION
SELECT Animal.id, Animal.nom, Espece.nom_courant, Animal.espece_id
-- 4 colonnes sélectionnées
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Tortue d''Hermann';

-- --  Les règles: Type et ordre des colonnes => jereo tsara io colonne 3 io
SELECT Animal.id, Animal.nom, Espece.nom_courant -- 3e colonne : nom_courant VARCHAR
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Chat' AND Animal.nom LIKE 'C%'
UNION
SELECT Animal.id, Animal.nom, Espece.id -- 3e colonne :id SMALLINT
FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Tortue d''Hermann' AND Animal.nom LIKE
'C%';

-- jereo ny ordre colonne
SELECT Animal.id, Animal.nom, Espece.nom_courant FROM Animal
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Chat' AND Animal.nom LIKE 'C%'
UNION
SELECT Animal.nom, Animal.id, Espece.nom_courant FROM Animal 
-- 1e et 2e colonnes inversées par rapport à la première requête
INNER JOIN Espece ON Animal.espece_id = Espece.id
WHERE Espece.nom_courant = 'Tortue d''Hermann' AND Animal.nom LIKE
'C%';

-- -- -- Union ALL
SELECT * FROM Espece
UNION
SELECT * FROM Espece

-- Chaque résultat n’apparaît qu’une seule fois. Pour la simple et bonne raison que lorsque vous
-- faites UNION, les doublons sont effacés. En fait, UNION est équivalent à UNION DISTINCT. Si
-- vous voulez conserver les doublons, vous devez utiliser UNION ALL.

SELECT * FROM Espece
UNION ALL
SELECT * FROM Espece;


-- limit and order BY
SELECT id, nom, 'Race' AS table_origine FROM Race
UNION
SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece;

SELECT id, nom, 'Race' AS table_origine FROM Race
UNION
SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT 2;

SELECT id, nom, 'Race' AS table_origine FROM Race
UNION
(SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT
2);

-- -- -- -- ORDER BY
SELECT id, nom, 'Race' AS table_origine FROM Race
UNION
SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece
ORDER BY nom DESC;

-- -- -- -- --  Exception pour les tris sur les requêtes intermédiaires
(SELECT id, nom, 'Race' AS table_origine FROM Race LIMIT 6)
UNION
(SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT
3);


(SELECT id, nom, 'Race' AS table_origine FROM Race ORDER BY nom DESC LIMIT 6)
UNION
(SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT 3);

-- -- Option des cles etrangere

-- -- --  Option sur suppression des clés étrangères
-
-- Lorsque je vous ai parlé des clés étrangères, et que je vous ai donné la syntaxe pour les créer,
-- j’ai omis de vous parler des deux options fort utiles :

-- — ON DELETE, qui permet de déterminer le comportement de MySQL en cas de suppression d’une référence ;
-- — ON UPDATE, qui permet de déterminer le comportement de MySQL en cas de modification d’une référence

-- -- --  Syntaxe
ALTER TABLE nom_table
ADD [CONSTRAINT fk_col_ref]
FOREIGN KEY (colonne)
REFERENCES table_ref(col_ref)
ON DELETE {RESTRICT | NO ACTION | SET NULL | CASCADE}; -- <-- Nouvelle option 

-- -- -- fin syntaxe

ALTER TABLE Animal DROP FOREIGN KEY fk_race_id;

ALTER TABLE Animal
ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race(id)
ON DELETE SET NULL;

-- Affichons d'abord tous les animaux, avec leur race --
-- -----------------------------------------------------
SELECT Animal.nom, Animal.race_id, Race.nom as race FROM Animal
LEFT JOIN Race ON Animal.race_id = Race.id
ORDER BY race;

-- Supprimons ensuite la race 'Boxer' --
-- -------------------------------------
DELETE FROM Race WHERE nom = 'Boxer';

-- Réaffichons les animaux --
-- --------------------------
SELECT Animal.nom, Animal.race_id, Race.nom as race FROM Animal
LEFT JOIN Race ON Animal.race_id = Race.id
ORDER BY race;

-- Option sur modification des clés étrangères --
-------------------------------------------------
UPDATE Race SET id = 3 WHERE nom = 'Singapura';

--  Petite explication à propos de CASCADE

-- Suppression de la clé --
-- ------------------------
ALTER TABLE Animal DROP FOREIGN KEY fk_race_id;
-- Recréation de la clé avec les bonnes options --
-- -----------------------------------------------
ALTER TABLE Animal
ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race(id)
ON DELETE SET NULL -- N'oublions pas de remettre le ON DELETE!
ON UPDATE CASCADE;

-- Modification de l'id des Singapura --
-- -------------------------------------
UPDATE Race SET id = 3 WHERE nom = 'Singapura';

ALTER TABLE Animal DROP FOREIGN KEY fk_race_id;

ALTER TABLE Animal
ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race(id)
ON DELETE SET NULL;

-- exercice
-- Animal.mere_id --
-- -----------------
ALTER TABLE Animal DROP FOREIGN KEY fk_mere_id;

ALTER TABLE Animal
ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES
Animal(id) ON DELETE SET NULL;

-- Animal.pere_id --
-- -----------------
ALTER TABLE Animal DROP FOREIGN KEY fk_pere_id;

ALTER TABLE Animal
ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES
Animal(id) ON DELETE SET NULL;

-- Race.espece_id --
-- -----------------
ALTER TABLE Race DROP FOREIGN KEY fk_race_espece_id;

ALTER TABLE Race
ADD CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES
Espece(id) ON DELETE CASCADE;


--  Violation de contrainte d’unicité --
----------------------------------------

--  INsertion => demonstration
INSERT INTO Espece (nom_courant, nom_latin, description)
VALUES ('Chien en peluche', 'Canis canis', 'Tout doux, propre et silencieux');

-- Par contre, si l’on utilise le mot-clé IGNORE
INSERT IGNORE INTO Espece (nom_courant, nom_latin, description)
VALUES ('Chien en peluche', 'C
anis canis', 'Tout doux, propre et silencieux');

-- Modification => demonstration
UPDATE Espece SET nom_latin = 'Canis canis' WHERE nom_courant = 'Chat'

UPDATE IGNORE Espece SET nom_latin = 'Canis canis' WHERE nom_courant = 'Chat';

-- mila mianatra miload DATA

-- -- --  Remplacer l’ancienne ligne -- -- --
---------------------------------------------

SELECT id, sexe, date_naissance, nom, espece_id FROM Animal WHERE nom = 'Spoutnik';

INSERT INTO Animal (sexe, nom, date_naissance, espece_id)
VALUES ('F', 'Spoutnik', '2010-08-06 15:05:00', 3);

REPLACE INTO Animal (sexe, nom, date_naissance, espece_id)
VALUES ('F', 'Spoutnik', '2010-08-06 15:05:00', 3);

SELECT id, sexe, date_naissance, nom, espece_id FROM Animal WHERE
nom = 'Spoutnik';

-- -- --  Remplacement de plusieurs lignes -- -- --
---------------------------------------------------
REPLACE INTO Animal (id, sexe, nom, date_naissance, espece_id) -- Je donne moi-même un id, qui existe déjà !
VALUES (32, 'M', 'Spoutnik', '2009-07-26 11:52:00', 3); -- Et Spoutnik est mon souffre-douleur du jour.

-- -- --  Modifier l’ancienne ligne -- -- --
--------------------------------------------

-- syntaxe
INSERT INTO nom_table [(colonne1, colonne2, colonne3)]
VALUES (valeur1, valeur2, valeur3)
ON DUPLICATE KEY UPDATE colonne2 = valeur2 [, colonne3 = valeur3];
-- fin syntaxe

SELECT id, sexe, date_naissance, nom, espece_id, mere_id, pere_id
FROM Animal
WHERE nom = 'Spoutnik';

INSERT INTO Animal (sexe, date_naissance, espece_id, nom, mere_id)
VALUES ('M', '2010-05-27 11:38:00', 3, 'Spoutnik', 52) -- date_naissance et mere_id sont différents du Spoutnik existant
ON DUPLICATE KEY UPDATE mere_id = 52;

SELECT id, sexe, date_naissance, nom, espece_id, mere_id, pere_id
FROM Animal
WHERE nom = 'Spoutnik';


UPDATE Animal
SET mere_id = 52
WHERE nom = 'Spoutnik'
AND espece_id = 3;




####################################################
#                                                  #
#              TROISIEME PARTIE                    #
#     FONCTION: NOMBRES, CHAINES ET AGREGATS       #
#                                                  #
####################################################


-- II. Fonctions: nombres, chaines et aggregats
-- --------------------------------------------
    -- III.1. Rappels et introduction
    -- III.2. Fonctions scalaires
    -- III.3. Fonctions d'agregation
    -- III.4. Regroupement
    -- III.5. Exercice sur les agregats



    -- III.1.0.1. Etat actuel de la base de données
    -- --------------------------------------------
        SET NAMES utf8;
        
        Drop table if EXISTS adoption;
        DROP TABLE IF EXISTS Animal;

        DROP TABLE IF EXISTS Race;

        Drop table if exists vm_revenus_annee_espece;
        DROP TABLE IF EXISTS Espece;
        
        
        CREATE TABLE Espece (
        id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
        nom_courant varchar(40) NOT NULL,
        nom_latin varchar(40) NOT NULL,
        description text,
        PRIMARY KEY (id),
        UNIQUE KEY nom_latin (nom_latin)
        ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1; 

        LOCK TABLES Espece WRITE;

        INSERT INTO Espece VALUES (1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue'),(2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres'),(3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure'),
        (4,'Perroquet amazone','Alipiopsitta xanthops','Joli oiseau parleur vert et jaune');
        
        UNLOCK TABLES;
        
        
        CREATE TABLE Race (
        id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
        nom varchar(40) NOT NULL,
        espece_id smallint(6) unsigned NOT NULL,
        description text,
        PRIMARY KEY (id)
        ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
        
        LOCK TABLES Race WRITE;

        INSERT INTO Race VALUES (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.'),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.'),
        (3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.'),(4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.'),(5,'Maine coon',2,'Chat de grande taille, à poils mi-longs.'),
        (7,'Sphynx',2,'Chat sans poils.'),(8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...');
        
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
        ) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
        
        LOCK TABLES Animal WRITE;

        INSERT INTO Animal VALUES (1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22),
        (2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31),(4,'F','2009-08-03 05:12:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
        (5,NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche',2,NULL,NULL,NULL),(6,'F','2009-06-13 08:17:00','Bobosse','Carapace bizarre',3,NULL,NULL,NULL),(7,'F','2008-12-06 05:18:00','Caroline',NULL,1,2,NULL,NULL),
        (8,'M','2008-09-11 15:38:00','Bagherra',NULL,2,5,NULL,NULL),(9,NULL,'2010-08-23 05:18:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(10,'M','2010-07-21 15:41:00','Bobo',NULL,1,NULL,7,21),
        (11,'F','2008-02-20 15:45:00','Canaille',NULL,1,NULL,NULL,NULL),(12,'F','2009-05-26 08:54:00','Cali',NULL,1,2,NULL,NULL),(13,'F','2007-04-24 12:54:00','Rouquine',NULL,1,1,NULL,NULL),
        (14,'F','2009-05-26 08:56:00','Fila',NULL,1,2,NULL,NULL),(15,'F','2008-02-20 15:47:00','Anya',NULL,1,NULL,NULL,NULL),(16,'F','2009-05-26 08:50:00','Louya',NULL,1,NULL,NULL,NULL),
        (17,'F','2008-03-10 13:45:00','Welva',NULL,1,NULL,NULL,NULL),(18,'F','2007-04-24 12:59:00','Zira',NULL,1,1,NULL,NULL),(19,'F','2009-05-26 09:02:00','Java',NULL,1,2,NULL,NULL),
        (20,'M','2007-04-24 12:45:00','Balou',NULL,1,1,NULL,NULL),(21,'F','2008-03-10 13:43:00','Pataude',NULL,1,NULL,NULL,NULL),(22,'M','2007-04-24 12:42:00','Bouli',NULL,1,1,NULL,NULL),
        (24,'M','2007-04-12 05:23:00','Cartouche',NULL,1,NULL,NULL,NULL),(25,'M','2006-05-14 15:50:00','Zambo',NULL,1,1,NULL,NULL),(26,'M','2006-05-14 15:48:00','Samba',NULL,1,1,NULL,NULL),
        (27,'M','2008-03-10 13:40:00','Moka',NULL,1,NULL,NULL,NULL),(28,'M','2006-05-14 15:40:00','Pilou',NULL,1,1,NULL,NULL),(29,'M','2009-05-14 06:30:00','Fiero',NULL,2,3,NULL,NULL),
        (30,'M','2007-03-12 12:05:00','Zonko',NULL,2,5,NULL,NULL),(31,'M','2008-02-20 15:45:00','Filou',NULL,2,4,NULL,NULL),(32,'M','2009-07-26 11:52:00','Spoutnik',NULL,3,NULL,52,NULL),
        (33,'M','2006-05-19 16:17:00','Caribou',NULL,2,4,NULL,NULL),(34,'M','2008-04-20 03:22:00','Capou',NULL,2,5,NULL,NULL),(35,'M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance',2,4,NULL,NULL),
        (36,'M','2009-05-14 06:42:00','Boucan',NULL,2,3,NULL,NULL),(37,'F','2006-05-19 16:06:00','Callune',NULL,2,8,NULL,NULL),(38,'F','2009-05-14 06:45:00','Boule',NULL,2,3,NULL,NULL),
        (39,'F','2008-04-20 03:26:00','Zara',NULL,2,5,NULL,NULL),(40,'F','2007-03-12 12:00:00','Milla',NULL,2,5,NULL,NULL),(41,'F','2006-05-19 15:59:00','Feta',NULL,2,4,NULL,NULL),
        (42,'F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%',2,5,NULL,NULL),(43,'F','2007-03-12 11:54:00','Cracotte',NULL,2,5,NULL,NULL),(44,'F','2006-05-19 16:16:00','Cawette',NULL,2,8,NULL,NULL),
        (45,'F','2007-04-01 18:17:00','Nikki','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(46,'F','2009-03-24 08:23:00','Tortilla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(47,'F','2009-03-26 01:24:00','Scroupy','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
        (48,'F','2006-03-15 14:56:00','Lulla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(49,'F','2008-03-15 12:02:00','Dana','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(50,'F','2009-05-25 19:57:00','Cheli','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
        (51,'F','2007-04-01 03:54:00','Chicaca','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(52,'F','2006-03-15 14:26:00','Redbul','Insomniaque',3,NULL,NULL,NULL),(54,'M','2008-03-16 08:20:00','Bubulle','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
        (55,'M','2008-03-15 18:45:00','Relou','Surpoids',3,NULL,NULL,NULL),(56,'M','2009-05-25 18:54:00','Bulbizard','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(57,'M','2007-03-04 19:36:00','Safran','Coco veut un gâteau !',4,NULL,NULL,NULL),
        (58,'M','2008-02-20 02:50:00','Gingko','Coco veut un gâteau !',4,NULL,NULL,NULL),(59,'M','2009-03-26 08:28:00','Bavard','Coco veut un gâteau !',4,NULL,NULL,NULL),(60,'F','2009-03-26 07:55:00','Parlotte','Coco veut un gâteau !',4,NULL,NULL,NULL),
        (61,'M','2010-11-09 00:00:00','Yoda',NULL,2,5,NULL,NULL);
        
        UNLOCK TABLES;
        
        
        ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id) ON DELETE CASCADE;
        
        ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES Animal (id) ON DELETE SET NULL;
        ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
        ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES Animal (id) ON DELETE SET NULL;
        ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race (id) ON DELETE SET NULL;




    -- III.1. Rappels et introduction
    -- -------------------------------
        -- III.1.1. Rappels et manipulation simple de nombres
        -- III.1.2. Definition d'une fonction
        -- III.1.3. Quelques fonctions generales


        -- III.1.1. Rappels et manipulation simple de nombres
        -- --------------------------------------------------
            -- III.1.1.1. Rappels (lesona be)
            -- III.1.1.2. Combiner les donnees avec des operateurs mathematiques


            -- III.1.1.2. Combiner les donnees avec des operateurs mathematiques
            -- -----------------------------------------------------------------
                -- addition (+)
                -- soustraction (-)
                -- multiplication (*)
                -- division (/)
                -- division entiere (div)
                -- modulo (% ou mod)

                -- Exemple : les six opérateurs mathématiques.
                SELECT 1+1, 4-2, 3*6, 5/2, 5 DIV 2, 5 % 2, 5 MOD 2;


            -- III.1.1.2. Combiner les donnees avec des operateurs mathematiques
            -- -----------------------------------------------------------------
                -- III.1.1.2.1. Modification de notre base de données
                -- III.1.1.2.2. Opérations sur données sélectionnée
                -- III.1.1.2.3. Modification de données grâce à des opérations mathématiques


                -- III.1.1.2.1. Modification de notre base de données
                -- --------------------------------------------------

                    ALTER TABLE Race
                    ADD COLUMN prix DECIMAL(7,2) UNSIGNED;

                    ALTER TABLE Espece
                    ADD COLUMN prix DECIMAL(7,2) UNSIGNED;

                    -- Remplissage des colonnes "prix"
                    UPDATE Espece SET prix = 200 WHERE id = 1;
                    UPDATE Espece SET prix = 150 WHERE id = 2;
                    UPDATE Espece SET prix = 140 WHERE id = 3;
                    UPDATE Espece SET prix = 700 WHERE id = 4;
                    UPDATE Espece SET prix = 10 WHERE id = 5;
                    UPDATE Espece SET prix = 75 WHERE id = 6;

                    UPDATE Race SET prix = 450 WHERE id = 1;
                    UPDATE Race SET prix = 900 WHERE id = 2;
                    UPDATE Race SET prix = 950 WHERE id = 3;
                    UPDATE Race SET prix = 800 WHERE id = 4;
                    UPDATE Race SET prix = 700 WHERE id = 5;
                    UPDATE Race SET prix = 1200 WHERE id = 7;
                    UPDATE Race SET prix = 950 WHERE id = 8;
                    UPDATE Race SET prix = 600 WHERE id = 9;                   



                -- III.1.1.2.2. Opérations sur données sélectionnée
                -- ------------------------------------------------
                    # Exemple 1 : Imaginons que nous voulions savoir le prix à payer pour acheter 3 individus de la
                    # même espèce (sans considérer la race). Facile, il suffit de multiplier le prix de chaque espèce par

                    SELECT nom_courant, prix*3 AS prix_trio
                    FROM Espece; 


                    # Exemple 2 : toutes les opérations courantes peuvent bien entendu être utilisées.
                    
                    SELECT nom_courant, prix,
                    prix+100 AS addition, prix/2 AS division,
                    prix-50.5 AS soustraction, prix%3 AS modulo
                    FROM Espece;


                -- III.1.1.2.3. Modification de données grâce à des opérations mathématiques
                -- -------------------------------------------------------------------------
                    # Exemple : la commande suivante va augmenter le prix de toutes les races de 35 :
                    UPDATE Race
                    SET prix = prix + 35;


        -- III.1.2. Definition d'une fonction
        -- ----------------------------------
            -- III.1.2.1. Fonction scalaire vs fonctions d'agregation
        
            SELECT MIN(date_naissance) -- On utilise ici une fonction !
            FROM (
            SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.espece_id
            FROM Animal
            INNER JOIN Espece
            ON Espece.id = Animal.espece_id
            WHERE Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
            ) AS tortues_perroquets;        


            # III.1.2.0.4. Exemples
                -- Fonction sans paramètre
                SELECT PI(); -- renvoie le nombre Pi, avec 5 décimales

                -- Fonction avec un paramètre
                SELECT MIN(prix) AS minimum -- il est bien sûr possible d'utiliser les alias !
                FROM Espece;

                -- Fonction avec plusieurs paramètres
                SELECT REPEAT('fort ! Trop ', 4); -- répète une chaîne (ici : 'fort ! Trop ', répété 4 fois)                
                -- Même chose qu'au-dessus, mais avec les paramètres dans le mauvais ordre
                SELECT REPEAT(4, 'fort ! Trop '); -- la chaîne de caractères 'fort! Trop ' va être convertie en entier par MySQL, ce qui donne 0."4" va donc être répété zéro fois...



            -- III.1.2.1. Fonction scalaire vs fonctions d'agregation
            -- ------------------------------------------------------
                -- III.1.2.1.1. Fonction scalaire
                -- III.1.2.1.2. Fonction d’agrégation
                


                -- III.1.2.1.1. Fonction scalaire
                -- ------------------------------
                    SELECT nom, prix, ROUND(prix)
                    FROM Race;


                -- III.1.2.1.2. Fonction d’agrégation
                -- ----------------------------------
                    SELECT MIN(prix)
                    FROM Race;

   

        -- III.1.3. Quelques fonctions generales
        -- -------------------------------------
            -- III.1.3.1. Informations sur l'environnement actuel
            -- III.1.3.2. Informations sur la derniere requete
            -- III.1.3.3. Convertir le type de donnees
            -- III.1.3.4. En resume



            -- III.1.3.1. Informations sur l'environnement actuel
            -- -------------------------------------------------
                -- III.1.3.1.1. Version de MySQL
                -- III.1.3.1.2. Où suis-je? Qui suis-je?


                -- III.1.3.1.1. Version de MySQL
                -- -----------------------------
                    SELECT VERSION();


                -- III.1.3.1.2. Où suis-je? Qui suis-je?
                -- -------------------------------------
                    SELECT CURRENT_USER(), USER();

                    
            -- III.1.3.2. Informations sur la derniere requete
            -- -----------------------------------------------
                -- III.1.3.2.1. Dernier ID généré par auto-incrémentation
                -- III.1.3.2.2. Nombre de lignes renvoyées par la requête


                -- III.1.3.2.1. Dernier ID généré par auto-incrémentation
                -- ------------------------------------------------------
                    INSERT INTO Race (nom, espece_id, description, prix)
                    VALUES ('Rottweiller', 1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.', 600.00);

                    INSERT INTO Animal (sexe, date_naissance, nom, espece_id, race_id)
                    VALUES ('M', '2010-11-05', 'Pipo', 1, LAST_INSERT_ID()); -- LAST_INSERT_ID() renverra ici l'id de la race Rottweiller
                    


                -- III.1.3.2.2. Nombre de lignes renvoyées par la requête
                -- ------------------------------------------------------
                    SELECT id, nom, espece_id, prix
                    FROM Race;

                    SELECT FOUND_ROWS();


                    SELECT id, nom, espece_id, prix -- Sans option
                    FROM Race
                    LIMIT 3;

                    SELECT FOUND_ROWS() AS sans_option;

                    SELECT SQL_CALC_FOUND_ROWS id, nom, espece_id, prix -- Avec option
                    FROM Race
                    LIMIT 3;

                    SELECT FOUND_ROWS() AS avec_option;
               


            -- III.1.3.3. Convertir le type de donnees
            -- ---------------------------------------
                # Exemple : conversions automatiques
                    SELECT *
                    FROM Espece
                    WHERE id = '3';

                    INSERT INTO Espece (nom_latin, nom_courant, description, prix)
                    VALUES ('Rattus norvegicus', 'Rat brun', 'Petite bestiole avec de longues moustaches et une longue queue sans poils', '10.00');
                

                # Exemple : conversion d’une chaîne de caractère en date
                    SELECT CAST('870303' AS DATE);

    
    
    -- III.2. Fonctions scalaires
    -- --------------------------
        -- III.2.1. Manipulation de nombres
        -- III.2.2. Manipulation de chaines de caracteres
        -- III.2.3. Exemple d'application et exercice


        -- III.2.1. Manipulation de nombres
        -- --------------------------------
            -- III.2.1.1. Arrondis
            -- III.2.1.2. Exposants et racines
            -- III.2.1.3. Hasard
            -- III.2.1.4. Divers



            -- III.2.1.1. Arrondis
            -- -------------------
                -- III.2.1.1.1. CEIL()
                -- III.2.1.1.2. FLOOR()
                -- III.2.1.1.3. ROUND()
                -- III.2.1.1.4. TRUNCATE()


                -- III.2.1.1.1. CEIL()
                -- -------------------
                    #CEIL(n) ou CEILING(n) arrondit au nombre entier supérieur.
                    SELECT CEIL(3.2), CEIL(3.7);


                -- III.2.1.1.2. FLOOR()
                -- --------------------
                    # FLOOR(n) arrondit au nombre entier inférieur.
                    SELECT FLOOR(3.2), FLOOR(3.7); 



                -- III.2.1.1.3. ROUND()
                -- --------------------
                    # ROUND(n, d) arrondit au nombre à d décimales le plus proche. ROUND(n) équivaut à écrire
                    # ROUND(n, 0), donc arrondit à l’entier le plus proche.
                    SELECT ROUND(3.22, 1), ROUND(3.55, 1), ROUND(3.77, 1);

                    SELECT ROUND(3.2), ROUND(3.5), ROUND(3.7); 



                -- III.2.1.1.4. TRUNCATE()
                -- -----------------------
                    # TRUNCATE(n, d) arrondit en enlevant purement et simplement les décimales en trop (donc
                    # arrondi à l’inférieur pour les nombres positifs, au supérieur pour les nombres négatifs).
                    SELECT TRUNCATE(3.2, 0), TRUNCATE(3.5, 0), TRUNCATE(3.7, 0);

                    SELECT TRUNCATE(3.22, 1), TRUNCATE(3.55, 1), TRUNCATE(3.77, 1);



            -- III.2.1.2. Exposants et racines
            -- -------------------------------
                -- III.2.1.2.1. Exposants
                -- III.2.1.2.2. Racines

    
                -- III.2.1.2.1. Exposants
                -- ----------------------
                    SELECT POW(2, 5), POWER(5, 2);


                -- III.2.1.2.2. Racines
                -- --------------------
                    SELECT SQRT(4);

                    SELECT POW(32, 1/5);

                    SELECT POW(4, 1/2);



            -- III.2.1.3. Hasard
            -- -----------------
                SELECT RAND();

                SELECT *
                FROM Race
                ORDER BY RAND();

            
            -- III.2.1.4. Divers
            -- -----------------
                -- III.2.1.4.1. SIGN()
                -- III.2.1.4.2. ABS()
                -- III.2.1.4.3. MOD()


                -- III.2.1.4.1. SIGN()
                -- -------------------
                    SELECT SIGN(-43), SIGN(0), SIGN(37); 


                -- III.2.1.4.2. ABS()
                -- ------------------
                    SELECT ABS(-43), ABS(0), ABS(37);


                -- III.2.1.4.3. MOD()
                -- ------------------
                    SELECT MOD(56, 10);




        -- III.2.2. Manipulation de chaines de caracteres
        -- ----------------------------------------------
            -- III.2.2.1. Longueur et comparaison
            -- III.2.2.2. Retrait et ajout de caracteres
            -- III.2.2.3. Recherche et remplacement
            -- III.2.2.4. Concatenation
            -- III.2.2.5. FIELD(), une bien utile pour le tri
            -- III.2.2.6. Code ASCII



            -- III.2.2.1. Longueur et comparaison
            -- ----------------------------------
                -- III.2.2.1.1. Connaître la longueur d’une chaîne
                -- III.2.2.1.2. Comparer deux chaînes
                    

                -- III.2.2.1.1. Connaître la longueur d’une chaîne
                -- -----------------------------------------------
                    SELECT BIT_LENGTH('élevage'),
                    CHAR_LENGTH('élevage'),
                    LENGTH('élevage'); -- Les caractères accentués sont codés sur 2 octets en UTF-8        


                -- III.2.2.1.2. Comparer deux chaînes
                -- -----------------------------------
                    SELECT STRCMP('texte', 'texte') AS 'texte=texte',
                        STRCMP('texte','texte2') AS 'texte<texte2',
                        STRCMP('chaine','texte') AS 'chaine<texte',
                        STRCMP('texte', 'chaine') AS 'texte>chaine',
                        STRCMP('texte3','texte24') AS 'texte3>texte24'; -- 3 est après 24 dans l'ordre alphabétique                   



            -- III.2.2.2. Retrait et ajout de caracteres
            -- -----------------------------------------

                -- III.2.2.2.1. Répéter une chaîne
                -- III.2.2.2.2. Compléter/réduire une chaîne
                -- III.2.2.2.3. Ôter les caractères inutiles
                -- III.2.2.2.4. Récupérer une sous-chaîne


                -- III.2.2.2.1. Répéter une chaîne
                -- -------------------------------
                    SELECT REPEAT('Ok ', 3);


                -- III.2.2.2.2. Compléter/réduire une chaîne
                -- -----------------------------------------
                    SELECT LPAD('texte', 3, '@') AS '3_gauche_@',
                    LPAD('texte', 7, '$') AS '7_gauche_$',
                    RPAD('texte', 5, 'u') AS '5_droite_u',
                    RPAD('texte', 7, '*') AS '7_droite_*',
                    RPAD('texte', 3, '-') AS '3_droite_-';     


                -- III.2.2.2.3. Ôter les caractères inutiles
                -- -----------------------------------------
                    SELECT TRIM(' Tralala ') AS both_espace,
                        TRIM(LEADING FROM ' Tralala ') AS lead_espace,
                        TRIM(TRAILING FROM ' Tralala ') AS trail_espace,

                        TRIM('e' FROM 'eeeBouHeee') AS both_e,
                        TRIM(LEADING 'e' FROM 'eeeBouHeee') AS lead_e,
                        TRIM(BOTH 'e' FROM 'eeeBouHeee') AS both_e,

                        TRIM('123' FROM '1234ABCD4321') AS both_123;
    


                -- III.2.2.2.4. Récupérer une sous-chaîne
                -- --------------------------------------
                    SELECT SUBSTRING('texte', 2) AS from2,
                        SUBSTRING('texte' FROM 3) AS from3,
                        SUBSTRING('texte', 2, 3) AS from2long3,
                        SUBSTRING('texte' FROM 3 FOR 1) AS from3long1;



            -- III.2.2.3. Recherche et remplacement
            -- ------------------------------------
                -- III.2.2.3.1. Rechercher une chaîne de caractères
                -- III.2.2.3.2. Changer la casse des chaînes
                -- III.2.2.3.3. Récupérer la partie gauche ou droite
                -- III.2.2.3.4. Inverser une chaîne
                -- III.2.2.3.5. Remplacer une partie par autre chose



                -- III.2.2.3.1. Rechercher une chaîne de caractères
                -- ------------------------------------------------

                    SELECT INSTR('tralala', 'la') AS fct_INSTR,
                        POSITION('la' IN 'tralala') AS fct_POSITION,
                        LOCATE('la', 'tralala') AS fct_LOCATE,
                        LOCATE('la', 'tralala', 5) AS fct_LOCATE2;


                -- III.2.2.3.2. Changer la casse des chaînes
                -- -----------------------------------------
                    SELECT LOWER('AhAh') AS minuscule,
                        LCASE('AhAh') AS minuscule2,
                        UPPER('AhAh') AS majuscule,
                        UCASE('AhAh') AS majuscule2;


                -- III.2.2.3.3. Récupérer la partie gauche ou droite
                -- -------------------------------------------------
                    SELECT LEFT('123456789', 5), RIGHT('123456789', 5);
   

                -- III.2.2.3.4. Inverser une chaîne
                -- --------------------------------
                    SELECT REVERSE('abcde');


                -- III.2.2.3.5. Remplacer une partie par autre chose
                -- -------------------------------------------------
                    SELECT INSERT('texte', 3, 2, 'blabla') AS fct_INSERT,
                    REPLACE('texte', 'e', 'a') AS fct_REPLACE,
                    REPLACE('texte', 'ex', 'ou') AS fct_REPLACE2;



            -- III.2.2.4. Concatenation
            -- ------------------------
                SELECT CONCAT('My', 'SQL', '!'), CONCAT_WS('-', 'My', 'SQL', '!');


            -- III.2.2.5. FIELD(), une fonction bien utile pour le tri
            -- -------------------------------------------------------
                SELECT FIELD('Bonjour', 'Bonjour !', 'Au revoir', 'Bonjour', 'Au revoir !') AS field_bonjour;

                # Exemple : ordonnons les espèces selon un ordre arbitraire. La fonction FIELD() dans la clause
                #           SELECT n’est là que pour illustrer la façon dont ce tri fonctionne.

                SELECT nom_courant, nom_latin, FIELD(nom_courant, 'Rat brun', 'Chat', 'Tortue d''Hermann', 'Chien', 'Perroquet amazone') AS resultat_field
                FROM Espece
                ORDER BY FIELD(nom_courant, 'Rat brun', 'Chat', 'Tortue d''Hermann', 'Chien', 'Perroquet amazone');


            -- III.2.2.6. Code ASCII
            -- ---------------------
                SELECT ASCII('T'), CHAR(84), CHAR('84', 84+32, 84.2);


        -- III.2.3. Exemple d'application et exercice
        -- ------------------------------------------
            -- III.2.3.1. On commence par du facile
            -- III.2.3.2. Puis on corse un peu
            -- III.2.3.3. En resume


            -- III.2.3.1. On commence par du facile
            -- ------------------------------------
                -- III.2.3.1.1. 1. Afficher une phrase donnant le prix de l’espèce, pour chaque espèce
                -- III.2.3.1.2. 2. Afficher les chats dont la deuxième lettre du nom est un ”a”


                -- III.2.3.1.1. 1. Afficher une phrase donnant le prix de l’espèce, pour chaque espèce
                -- -----------------------------------------------------------------------------------
                    SELECT CONCAT('Un(e) ', nom_courant, ' coûte ', prix, ' euros.') AS Solution
                    FROM Espece;

                    -- OU

                    SELECT CONCAT_WS(' ','Un(e)', nom_courant, 'coûte', prix, 'euros.') AS Solution
                    FROM Espece;


                -- III.2.3.1.2. 2. Afficher les chats dont la deuxième lettre du nom est un ”a”
                -- ----------------------------------------------------------------------------
                    SELECT Animal.nom, Espece.nom_courant
                    FROM Animal
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                    WHERE Espece.nom_courant = 'Chat'
                    AND SUBSTRING(nom, 2, 1) = 'a';



            
            
            -- III.2.3.2. Puis on corse un peu
            -- -------------------------------
                -- III.2.3.2.1. 1. Afficher les noms des perroquets en remplaçant les ”a” par ”@” et les ”e” par ”3” pour en faire des perroquets Kikoolol
                -- III.2.3.2.2. 2. Afficher les chiens dont le nom a un nombre pair de lettres


                -- III.2.3.2.1. 1. Afficher les noms des perroquets en remplaçant les ”a” par ”@” et les ”e” par ”3” pour en faire des perroquets Kikoolol
                -- ---------------------------------------------------------------------------------------------------------------------------------------
                    SELECT REPLACE(REPLACE(nom, 'a', '@'), 'e', '3') AS Solution
                    FROM Animal
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                    WHERE Espece.nom_courant LIKE 'Perroquet%';


                -- III.2.3.2.2. 2. Afficher les chiens dont le nom a un nombre pair de lettres
                -- ---------------------------------------------------------------------------
                    SELECT nom, nom_courant
                    FROM Animal
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                    WHERE nom_courant = 'Chien'
                    AND CHAR_LENGTH(nom)%2 = 0;

                    -- OU

                    SELECT nom, nom_courant
                    FROM Animal
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                    WHERE nom_courant = 'Chien'
                    AND CHAR_LENGTH(nom) MOD 2 = 0;

                    -- OU

                    SELECT nom, nom_courant
                    FROM Animal
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                    WHERE nom_courant = 'Chien'
                    AND MOD(CHAR_LENGTH(nom),2) = 0; 



    -- III.3. Fonctions d'agregation
    -- -----------------------------
        -- III.3.1. Fonctions statistiques
        -- III.3.2. Concatenation


        -- III.3.1. Fonctions statistiques
        -- -------------------------------
            -- III.3.1.1. Nombre de lines
            -- III.3.1.2. Minimum et maximum
            -- III.3.1.3. Somme et moyenne


            -- III.3.1.1. Nombre de lines
            -- --------------------------
                -- III.3.1.1.1. COUNT(*) ou COUNT(colonne)
                -- III.3.1.1.2. Doublons


                    -- Combien de races avons-nous ? --
                    -- ---------------------------------
                    SELECT COUNT(*) AS nb_races
                    FROM Race;

                    -- Combien de chiens avons-nous ? --
                    -- ---------------------------------
                    SELECT COUNT(*) AS nb_chiens
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    WHERE Espece.nom_courant = 'Chien';
     

                -- III.3.1.1.1. COUNT(*) ou COUNT(colonne)
                -- ---------------------------------------
                    # Exemple : comptons les lignes de la table Animal, avec COUNT(*) et COUNT(race_id).
                        SELECT COUNT(race_id), COUNT(*)
                        FROM Animal;


                -- III.3.1.1.2. Doublons
                -- ---------------------
                    # Exemple : comptons le nombre de races distinctes définies dans la table Animal.
                        SELECT COUNT(DISTINCT race_id)
                        FROM Animal;


            -- III.3.1.2. Minimum et maximum
            -- -----------------------------

                SELECT MIN(prix), MAX(prix)
                FROM Race;

                # Exemple :
                    SELECT MIN(nom), MAX(nom), MIN(date_naissance), MAX(date_naissance)
                    FROM Animal;



            -- III.3.1.3. Somme et moyenne
            -- ---------------------------
                -- III.3.1.3.1. Somme
                -- III.3.1.3.2. Moyenne


                -- III.3.1.3.1. Somme
                -- ------------------
                    SELECT SUM(prix)
                    FROM Espece;


                -- III.3.1.3.2. Moyenne
                -- --------------------
                    SELECT AVG(prix)
                    FROM Espece;


        -- III.3.2. Concatenation
        -- ----------------------
            -- III.3.2.1. Principe
            -- III.3.2.2. Syntaxe
            -- III.3.2.3. Exemples
            -- III.3.2.4. En resume

        
            -- III.3.2.1. Principe
            -- -------------------
                # Exemple : on récupère la somme des prix de chaque espèce, et on affiche les espèces concernées par la même occasion.
                    SELECT SUM(prix), GROUP_CONCAT(nom_courant)
                    FROM Espece;


            -- III.3.2.2. Syntaxe
            -- ------------------
                GROUP_CONCAT(
                [DISTINCT] col1 [, col2, ...]
                [ORDER BY col [ASC | DESC]]
                [SEPARATOR sep]
                )

            -- III.3.2.3. Exemples
            -- -------------------
                -- --------------------------------------
                -- CONCATENATION DE PLUSIEURS COLONNES --
                -- --------------------------------------
                SELECT SUM(Race.prix), GROUP_CONCAT(Race.nom, Espece.nom_courant)
                FROM Race
                INNER JOIN Espece ON Espece.id = Race.espece_id;

                -- ---------------------------------------------------
                -- CONCATENATION DE PLUSIEURS COLONNES EN PLUS JOLI --
                -- ---------------------------------------------------
                SELECT SUM(Race.prix), GROUP_CONCAT(Race.nom, ' (', Espece.nom_courant, ')')
                FROM Race
                INNER JOIN Espece ON Espece.id = Race.espece_id;

                -- ---------------------------
                -- ELIMINATION DES DOUBLONS --
                -- ---------------------------
                SELECT SUM(Espece.prix), GROUP_CONCAT(DISTINCT Espece.nom_courant)
                -- Essayez sans le DISTINCT pour voir
                FROM Espece
                INNER JOIN Race ON Race.espece_id = Espece.id;

                -- --------------------------
                -- UTILISATION DE ORDER BY --
                -- --------------------------
                SELECT SUM(Race.prix), GROUP_CONCAT(Race.nom, ' (', Espece.nom_courant, ')' ORDER BY Race.nom DESC)
                FROM Race
                INNER JOIN Espece ON Espece.id = Race.espece_id;

                -- ----------------------------
                -- CHANGEMENT DE SEPARATEUR --
                -- ----------------------------
                SELECT SUM(Race.prix), GROUP_CONCAT(Race.nom, ' (', Espece.nom_courant, ')' SEPARATOR ' - ')
                FROM Race
                INNER JOIN Espece ON Espece.id = Race.espece_id;


    -- III.4. Regroupement
    -- -------------------
        -- III.4.1. Regroupement sur un critere
        -- III.4.2. Regroupement sur un plusieurs criteres
        -- III.4.3. Super-agregats
        -- III.4.4. Conditions sur les fonctions d'agregation


        -- III.4.1. Regroupement sur un critere
        -- ------------------------------------
            -- III.4.1.1. Voir d'autres colonnes
            -- III.4.1.2. Colonnes selectionnees
            -- III.4.1.3. Tri de donnees
            -- III.2.1.4. Et les autres especes?


            -- Syntaxe:
                SELECT ...
                FROM nom_table
                [WHERE condition]
                GROUP BY nom_colonne;   

                # Exemple 1 : comptons les lignes dans la table Animal, en regroupant sur le critère de l’espèce
                # (donc avec la colonne espece_id).
                    SELECT COUNT(*) AS nb_animaux
                    FROM Animal
                    GROUP BY espece_id;

                # Exemple 2 : Même chose, mais on ne prend que les mâles cette fois-ci.
                    SELECT COUNT(*) AS nb_males
                    FROM Animal
                    WHERE sexe = 'M'
                    GROUP BY espece_id;

                
            -- III.4.1.1. Voir d'autres colonnes
            -- ---------------------------------
                SELECT espece_id, COUNT(*) AS nb_animaux
                FROM Animal
                GROUP BY espece_id;

                SELECT nom_courant, COUNT(*) AS nb_animaux
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY nom_courant;


            -- III.4.1.2. Colonnes selectionnees
            -- ---------------------------------
                -- III.4.1.2.1. La règle SQL
                -- III.4.1.2.2. Le cas MySQL


                -- III.4.1.2.1. La règle SQL
                -- -------------------------

                    # Lorsque l’on fait un groupement dans une requête, avec GROUP BY, on ne peut sélectionner que
                    # deux types d’éléments dans la clause SELECT :
                    # — une ou des colonnes ayant servi de critère pour le regroupement ;
                    # — une fonction d’agrégation (agissant sur n’importe quelle colonne).

                    # Cette règle est d’ailleurs logique. Imaginez la requête suivante :
                        SELECT nom_courant, COUNT(*) AS nb_animaux -- , date_naissance
                        FROM Animal
                        INNER JOIN Espece ON Animal.espece_id = Espece.id
                        GROUP BY nom_courant;

                        SELECT Espece.id, nom_courant, nom_latin, COUNT(*) AS nb_animaux
                        FROM Animal
                        INNER JOIN Espece ON Animal.espece_id = Espece.id
                        GROUP BY nom_courant, Espece.id, nom_latin;


                -- III.4.1.2.2. Le cas MySQL (tsy mandeha amin'ny version recent mysql intsony io code io)
                -- -------------------------

                    

            -- III.4.1.3. Tri de donnees
            -- -------------------------
                SELECT Espece.id, nom_courant, nom_latin, COUNT(*) AS nb_animaux
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY nom_courant desc Espece.id, nom_latin; -- On trie par ordre anti-alphabétique sur le nom_courant

                SELECT Espece.id, nom_courant, nom_latin, COUNT(*) AS nb_animaux
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY nom_courant, Espece.id, nom_latin
                ORDER BY nb_animaux;


            -- III.2.1.4. Et les autres especes?
            -- --------------------------------
                SELECT Espece.nom_courant, COUNT(*) AS nb_animaux
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY nom_courant;

                SELECT Espece.nom_courant, COUNT(*) AS nb_animaux
                FROM Animal
                RIGHT JOIN Espece ON Animal.espece_id = Espece.id -- RIGHT puisque la table Espece est à droite.
                GROUP BY nom_courant;


                SELECT Espece.nom_courant, COUNT(Animal.espece_id) AS nb_animaux
                FROM Animal
                RIGHT JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY nom_courant;




        -- III.4.2. Regroupement sur un plusieurs criteres
        -- -----------------------------------------------
            # Les deux requêtes suivantes permettent de savoir combien d’animaux de chaque espèce vous avez
            # dans la table Animal, ainsi que combien de mâles et de femelles, toutes espèces confondues.
                SELECT nom_courant, COUNT(*) as nb_animaux
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id 
                GROUP BY nom_courant;

                SELECT sexe, COUNT(*) as nb_animaux
                FROM Animal
                GROUP BY sexe;


                # Exemple 1 : on regroupe d’abord sur l’espèce, puis sur le sexe.
                    SELECT nom_courant, sexe, COUNT(*) as nb_animaux
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    GROUP BY nom_courant, sexe;


                # Exemple 2 : on regroupe d’abord sur le sexe, puis sur l’espèce.
                    SELECT nom_courant, sexe, COUNT(*) as nb_animaux
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    GROUP BY sexe,nom_courant;


        -- III.4.3. Super-agregats
        -- -----------------------
            -- III.4.3.0.1. Exemple avec un critère de regroupement
            -- III.4.3.0.2. Exemple avec deux critères de regroupement
            -- III.4.3.0.3. NULL, c’est pas joli


            -- III.4.3.0.1. Exemple avec un critère de regroupement
            -- ----------------------------------------------------
                SELECT nom_courant, COUNT(*) as nb_animaux
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                GROUP BY nom_courant WITH ROLLUP;                
        

            -- III.4.3.0.2. Exemple avec deux critères de regroupement
            -- -------------------------------------------------------
                SELECT nom_courant, sexe, COUNT(*) as nb_animaux
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                WHERE sexe IS NOT NULL
                GROUP BY nom_courant, sexe WITH ROLLUP;


                SELECT nom_courant, sexe, COUNT(*) as nb_animaux
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                WHERE sexe IS NOT NULL
                GROUP BY sexe, nom_courant WITH ROLLUP;



            -- III.4.3.0.3. NULL, c’est pas joli
            -- ---------------------------------
                -- Exemples :
                SELECT COALESCE(1, NULL, 3, 4); -- 1
                SELECT COALESCE(NULL, 2); -- 2
                SELECT COALESCE(NULL, NULL, 3); -- 3 
                
                -- Voici comment l’utiliser dans le cas des super-agrégats.

                SELECT COALESCE(nom_courant, 'Total'), COUNT(*) as nb_animaux
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                GROUP BY nom_courant WITH ROLLUP;

                -- Exemple : groupons sur le sexe, sans éliminer les lignes pour lesquelles le sexe n’est pas défini.
                    SELECT COALESCE(sexe, 'Total'), COUNT(*) as nb_animaux
                    FROM Animal
                    INNER JOIN Espece ON Espece.id = Animal.espece_id
                    GROUP BY sexe WITH ROLLUP;



        -- III.4.4. Conditions sur les fonctions d'agregation
        -- --------------------------------------------------
            -- III.4.4.1. Optimisation
            -- III.4.4.2. En resume
                SELECT nom_courant, COUNT(*)
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                WHERE COUNT(*) > 15
                GROUP BY nom_courant;

                -- Il faut utiliser une clause spéciale : HAVING. Cette clause se place juste après le GROUP BY.

                SELECT nom_courant, COUNT(*)
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                GROUP BY nom_courant
                HAVING COUNT(*) > 15;
                

                SELECT nom_courant, COUNT(*) as nombre
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                GROUP BY nom_courant
                HAVING nombre > 15;


            -- III.4.4.1. Optimisation
            -- -----------------------
                SELECT nom_courant, COUNT(*) as nombre
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                GROUP BY nom_courant
                HAVING nombre > 6 AND SUBSTRING(nom_courant, 1, 1) = 'C'; -- Deux conditions dans HAVING
                
                SELECT nom_courant, COUNT(*) as nombre
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                WHERE SUBSTRING(nom_courant, 1, 1) = 'C' -- Une condition dans WHERE
                GROUP BY nom_courant
                HAVING nombre > 6; -- Et une dans HAVING




    -- III.5. Exercice sur les agregats
    -- --------------------------------
        -- III.5.1. Du simple
        -- III.5.2. Vers le complexe


        -- III.5.1. Du simple
        -- ------------------
            -- III.5.1.1. 1. Combien de races avons-nous dans la table race?
            -- III.5.1.2. 2. De combien de chiens connaissons-nous le pere?
            -- III.5.1.3. 3. Quelle est la date de naissance de notre plus jeune femelle?
            -- III.5.1.4. 4. En moyenne, quel est le prix d'un chien ou d'un chat de race, par espece et en general?
            -- III.5.1.5. 5. Combien avons-nous de perroquets male et femelles, et quels sont leurs noms (en une seule requete bien sur)?


            -- III.5.1.1. 1. Combien de races avons-nous dans la table race?
            -- -------------------------------------------------------------
                SELECT COUNT(*)
                FROM Race;
   

            -- III.5.1.2. 2. De combien de chiens connaissons-nous le pere?
            -- ------------------------------------------------------------
                SELECT COUNT(pere_id)
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                WHERE Espece.nom_courant = 'Chien';


            -- III.5.1.3. 3. Quelle est la date de naissance de notre plus jeune femelle?
            -- --------------------------------------------------------------------------
                SELECT MAX(date_naissance)
                FROM Animal
                WHERE sexe = 'F';


            -- III.5.1.4. 4. En moyenne, quel est le prix d'un chien ou d'un chat de race, par espece et en general?
            -- -----------------------------------------------------------------------------------------------------
                SELECT nom_courant AS Espece, AVG(Race.prix) AS prix_moyen
                FROM Race
                INNER JOIN Espece ON Race.espece_id = Espece.id
                WHERE Espece.nom_courant IN ('Chat', 'Chien')
                GROUP BY Espece.nom_courant WITH ROLLUP;


            -- III.5.1.5. 5. Combien avons-nous de perroquets male et femelles, et quels sont leurs noms (en une seule requete bien sur)?
            -- --------------------------------------------------------------------------------------------------------------------------
                SELECT sexe, COUNT(*), GROUP_CONCAT(nom SEPARATOR ', ')
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                WHERE nom_courant = 'Perroquet amazone'
                GROUP BY sexe;


        -- III.5.2. Vers le complexe
        -- -------------------------
            -- III.5.2.1. 1. Quelles sont les races dont nous ne possedons aucun individu?
            -- III.5.2.2. 2. Quelles sont les especes (triees par ordre alphabetique du nom latin) dont nous possedons moins de cinq males?
            -- III.5.2.3. 3. Combien de males et de femelles de chaque avons-nous, avec un compt total intermediaire pour les races (males et femelles confondues) et pour les especes ? Afficher le nom de la race et le nom courant de l'espece.
            -- III.5.2.4. 4. Quel serait le cout, par espece et au total, de l'adoption de Parlotte, Spoutnik, Caribou, Cartouche, Cali, Canaille, Yoda, Zambo, et Lulla?


            -- III.5.2.1. 1. Quelles sont les races dont nous ne possedons aucun individu?
            -- ---------------------------------------------------------------------------
                SELECT Race.nom, COUNT(Animal.race_id) AS nombre
                FROM Race
                LEFT JOIN Animal ON Animal.race_id = Race.id
                GROUP BY Race.nom
                HAVING nombre = 0;    
        
        
            -- III.5.2.2. 2. Quelles sont les especes (triees par ordre alphabetique du nom latin) dont nous possedons moins de cinq males?
            -- ----------------------------------------------------------------------------------------------------------------------------
                SELECT Espece.nom_latin, COUNT(espece_id) AS nombre
                FROM Espece
                LEFT JOIN Animal ON Animal.espece_id = Espece.id
                WHERE sexe = 'M' OR Animal.id IS NULL
                GROUP BY Espece.nom_latin
                HAVING nombre < 5;

        
        
            -- III.5.2.3. 3. Combien de males et de femelles de chaque avons-nous, avec un compt total intermediaire pour les races (males et femelles confondues) et pour les especes ? Afficher le nom de la race et le nom courant de l'espece.
            -- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                SELECT Animal.sexe, Race.nom, Espece.nom_courant, COUNT(*) AS nombre
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                INNER JOIN Race ON Animal.race_id = Race.id
                WHERE Animal.sexe IS NOT NULL
                GROUP BY Espece.nom_courant, Race.nom, sexe WITH ROLLUP;

        
        
            -- III.5.2.4. 4. Quel serait le cout, par espece et au total, de l'adoption de Parlotte, Spoutnik, Caribou, Cartouche, Cali, Canaille, Yoda, Zambo, et Lulla?
            -- ----------------------------------------------------------------------------------------------------------------------------------------------------------
                SELECT Espece.nom_courant, SUM(COALESCE(Race.prix, Espece.prix)) AS somme
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id
                LEFT JOIN Race ON Race.id = Animal.race_id
                WHERE Animal.nom IN ('Parlotte', 'Spoutnik', 'Caribou', 'Cartouche', 'Cali', 'Canaille', 'Yoda', 'Zambo', 'Lulla')
                GROUP BY Espece.nom_courant WITH ROLLUP;


#########################################
#                                       #
#           Quatrième partie            #
#                                       #
#    Fonctions : manipuler les dates    #
#                                       #
#########################################


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
INSERT INTO Espece VALUES (1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue',200.00),(2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres',150.00),(3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure',140.00),
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

INSERT INTO Race VALUES (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00),(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00),
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

INSERT INTO Animal VALUES (1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22),(2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31),
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


ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id) ON DELETE CASCADE;

ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES Animal (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES Animal (id) ON DELETE SET NULL;


-- V. Fonctions: manipuler les dates
-- ---------------------------------
    -- IV.1. Obtenir la date/l'heure actuelle
    -- IV.2. Formater une donnees temporelle
    -- IV.3. Calculs sur les donnees temporelles
    -- IV.4. Exercices


    -- IV.1. Obtenir la date/l'heure actuelle
    -- --------------------------------------
        -- IV.1.1. Rappels
        -- IV.1.2. Date actuelle
        -- IV.1.3. Heure actuelle
        -- IV.1.4. Date et heure actuelle

    
        -- IV.1.1. Rappels
        -- ---------------
            -- IV.1.1.1. Date ('1001-01-01' à '9999-12-31')
            -- IV.1.1.2. Heure
            -- IV.1.1.3. Date et heure
            -- IV.1.1.4. Timestamp
            -- IV.1.1.5. Annee

            # lesona be

        -- IV.1.2. Date actuelle
        -- ---------------------
            select curdate(), current_date(), current_date;



        -- IV.1.3. Heure actuelle
        -- ----------------------
            select curtime(), current_time(), current_time;
        

        -- IV.1.4. Date et heure actuelle
        -- ------------------------------
            -- IV.1.4.1. Les fonctions
            -- IV.1.4.2. Qui peut le plus, peut le moins
            -- IV.1.4.3. Timestamp Unix
            -- IV.1.4.4. En resume


            -- IV.1.4.1. Les fonctions
            -- -----------------------
                -- IV.1.4.1.1. Now et sysdate()
                -- IV.1.4.1.2. Et les autres


                -- IV.1.4.1.1. Now et sysdate()
                -- ----------------------------
                    select now(), sysdate();


                -- IV.1.4.1.2. Et les autres
                -- -------------------------
                    select localtime, current_timestamp(), localtimestamp;



            -- IV.1.4.2. Qui peut le plus, peut le moins
            -- -----------------------------------------
                -- IV.1.4.2.1. Exemple

                -- IV.1.4.2.1. Exemple
                -- -------------------
                
                -- Création d'une table de test toute simple
                CREATE TABLE testDate (
                dateActu DATE,
                timeActu TIME,
                datetimeActu DATETIME
                );

                INSERT INTO testDate VALUES (NOW(), NOW(), NOW());

                SELECT *
                FROM testDate;


            -- IV.1.4.3. Timestamp Unix
            -- ------------------------
                 SELECT UNIX_TIMESTAMP();

            -- IV.1.4.4. En resume
            -- -------------------
                # lesona be


    -- IV.2. Formater une donnees temporelle
    -- -------------------------------------
        -- IV.2.1. Extraire une information precise
        -- IV.2.2. Formater une date facilement
        -- IV.2.3. Creer une date a partir d'une chaine de caracteres


        -- IV.2.1. Extraire une information precise
        -- ----------------------------------------
            -- IV.2.1.1. Informations sur la date
            -- IV.2.1.2. Information sur l'heure
            -- IV.1.4.3. Timestamp Unix

        
            -- IV.2.1.1. Informations sur la date
            -- ----------------------------------
                -- IV.2.1.1.1. Extraire la partie DATE
                -- IV.2.1.1.2. Le jour  
                -- IV.2.1.1.3. La semaine
                -- IV.2.1.1.4. Le mois
                -- IV.2.1.1.5. L’année


                -- IV.2.1.1.1. Extraire la partie DATE
                -- -----------------------------------
                    SELECT nom, date_naissance,
                    DATE(date_naissance) AS uniquementDate
                    FROM Animal
                    WHERE espece_id = 4;


                -- IV.2.1.1.2. Le jour 
                -- -------------------
                    SELECT nom, DATE(date_naissance) AS date_naiss,
                    DAY(date_naissance) AS jour,
                    DAYOFMONTH(date_naissance) AS jour,
                    DAYOFWEEK(date_naissance) AS jour_sem,
                    WEEKDAY(date_naissance) AS jour_sem2,
                    DAYNAME(date_naissance) AS nom_jour,
                    DAYOFYEAR(date_naissance) AS jour_annee
                    FROM Animal
                    WHERE espece_id = 4;


                    SET lc_time_names = 'fr_FR';

                    SELECT nom, date_naissance,
                    DAYNAME(date_naissance) AS jour_semaine
                    FROM Animal
                    WHERE espece_id = 4;


                -- IV.2.1.1.3. La semaine
                -- ----------------------
                    SELECT nom, date_naissance, WEEK(date_naissance) AS semaine, WEEKOFYEAR(date_naissance) AS semaine2, YEARWEEK(date_naissance) AS semaine_annee
                    FROM Animal
                    WHERE espece_id = 4;



                -- IV.2.1.1.4. Le mois
                -- -------------------
                    SELECT nom, date_naissance, MONTH(date_naissance) AS numero_mois,
                    MONTHNAME(date_naissance) AS nom_mois
                    FROM Animal
                    WHERE espece_id = 4;


                -- IV.2.1.1.5. L’année
                -- -------------------
                    SELECT nom, date_naissance, YEAR(date_naissance)
                    FROM Animal
                    WHERE espece_id = 4;


                
            -- IV.2.1.2. Information sur l'heure
            -- ---------------------------------
                SELECT nom, date_naissance,
                TIME(date_naissance) AS time_complet,
                HOUR(date_naissance) AS heure,
                MINUTE(date_naissance) AS minutes,
                SECOND(date_naissance) AS secondes
                FROM Animal
                WHERE espece_id = 4;


        -- IV.2.2. Formater une date facilement
        -- -----------------------------------
            -- IV.2.2.1. Format 
            -- IV.2.2.2. Exemples
            -- IV.2.2.3. Fonction supplementaire pour l'heure
            -- IV.2.2.4. Fonction standards


                SELECT nom, date_naissance, CONCAT_WS(' ', 'le', DAYNAME(date_naissance), DAY(date_naissance), MONTHNAME(date_naissance), YEAR(date_naissance)) AS jolie_date
                FROM Animal
                WHERE espece_id = 4;

            -- IV.2.2.1. Format (lesona be)
            -- ----------------------------

            -- IV.2.2.2. Exemples
            -- ------------------
                -- IV.2.2.2.1. Même résultat que précédemment…
                -- IV.2.2.2.2. Autres exemples


                -- IV.2.2.2.1. Même résultat que précédemment…
                -- -------------------------------------------
                    SELECT nom, date_naissance, DATE_FORMAT(date_naissance, 'le %W %e %M %Y') AS jolie_date
                    FROM Animal
                    WHERE espece_id = 4;


                -- IV.2.2.2.2. Autres exemples
                -- ---------------------------
                    SELECT DATE_FORMAT(NOW(), "Nous sommes aujourd'hui le %d %M de l'année %Y. Il est actuellement %l heures et %i minutes.") AS Top_date_longue;

                    SELECT DATE_FORMAT(NOW(), '%d %b. %y - %r') AS Top_date_courte;



            -- IV.2.2.3. Fonction supplementaire pour l'heure
            -- ----------------------------------------------
                -- Sur une DATETIME
                SELECT TIME_FORMAT(NOW(), '%r') AS sur_datetime,
                TIME_FORMAT(CURTIME(), '%r') AS sur_time,
                TIME_FORMAT(NOW(), '%M %r') AS mauvais_specificateur,
                TIME_FORMAT(CURDATE(), '%r') AS sur_date;


            -- IV.2.2.4. Fonction standards
            -- ----------------------------
                SELECT DATE_FORMAT(NOW(), GET_FORMAT(DATE, 'EUR')) AS date_eur,
                DATE_FORMAT(NOW(), GET_FORMAT(TIME, 'JIS')) AS heure_jis,
                DATE_FORMAT(NOW(), GET_FORMAT(DATETIME, 'USA')) AS date_heure_usa;


        -- IV.2.3. Creer une date a partir d'une chaine de caracteres
        -- ----------------------------------------------------------
            -- IV.2.3.1. En resume (lesona be)

                SELECT STR_TO_DATE('03/04/2011 à 09h17', '%d/%m/%Y à %Hh%i') AS StrDate,
                STR_TO_DATE('15blabla', '%Hblabla') as StrTime;

                SELECT STR_TO_DATE('11.21.2011', GET_FORMAT(DATE, 'USA')) AS date_usa,
                STR_TO_DATE('12.34.45', GET_FORMAT(TIME, 'EUR')) AS heure_eur,
                STR_TO_DATE('20111027133056', GET_FORMAT(TIMESTAMP, 'INTERNAL')) AS date_heure_int;





    -- IV.3. Calculs sur les donnees temporelles
    -- -----------------------------------------
        -- IV.3.1. Difference entre deux dates/heures
        -- IV.3.2. Ajout et retrait d'une intervalle de temps
        -- IV.3.3. Divers


        -- IV.3.1. Difference entre deux dates/heures
        -- ------------------------------------------
            -- IV.3.1.0.1. DATEDIFF()
            -- IV.3.1.0.2. TIMEDIFF()
            -- IV.3.1.0.3. TIMESTAMPDIFF()


            -- IV.3.1.0.1. DATEDIFF()
            -- ----------------------
                SELECT TIMESTAMPDIFF(DAY, '2011-11-10', '2011-12-25') AS nb_jours,
                TIMESTAMPDIFF(HOUR,'2011-11-10', '2011-12-25 22:00:00') AS nb_heures_def,
                TIMESTAMPDIFF(HOUR,'2011-11-10 14:00:00', '2011-12-25 22:00:00') AS nb_heures,
                TIMESTAMPDIFF(QUARTER,'2011-11-10 14:00:00', '2012-08-25 22:00:00') AS nb_trimestres;



        -- IV.3.2. Ajout et retrait d'une intervalle de temps
        -- --------------------------------------------------
            -- IV.3.2.1. Ajout d'un intervalle de temps
            -- IV.3.2.2. Soustraction d'un intervalle de temps


            -- IV.3.2.1. Ajout d'un intervalle de temps
            -- ----------------------------------------
                -- IV.3.2.1.1. ADDDATE()
                -- IV.3.2.1.2. DATE_ADD()
                -- IV.3.2.1.3. Opérateur +
                -- IV.3.2.1.4. TIMESTAMPADD()
                -- IV.3.2.1.5. ADDTIME()
                


                -- IV.3.2.1.1. ADDDATE()
                -- ---------------------
                    SELECT ADDDATE('2011-05-21', INTERVAL 3 MONTH) AS date_interval, -- Avec DATE et INTERVAL
                    ADDDATE('2011-05-21 12:15:56', INTERVAL '3 02:10:32' DAY_SECOND) AS datetime_interval, -- Avec DATETIME et INTERVAL
                    ADDDATE('2011-05-21', 12) AS date_nombre_jours, -- Avec DATE et nombre de jours
                    ADDDATE('2011-05-21 12:15:56', 42) AS datetime_nombre_jours; -- Avec DATETIME et nombre de jours    


                -- IV.3.2.1.2. DATE_ADD()
                -- ----------------------
                    SELECT 
                    DATE_ADD ('2011-05-21', INTERVAL 3 MONTH) AS avec_date, -- Avec DATE
                    DATE_ADD('2011-05-21 12:15:56', INTERVAL '3 02:10:32' DAY_SECOND) AS avec_datetime; -- Avec DATETIME                    


                -- IV.3.2.1.3. Opérateur +
                -- -----------------------
                    SELECT '2011-05-21' + INTERVAL 5 DAY AS droite,
                    -- Avec DATE et intervalle à droite
                    INTERVAL '3 12' DAY_HOUR + '2011-05-21 12:15:56' AS gauche;
                    -- Avec DATETIME et intervalle à gauche


                -- IV.3.2.1.4. TIMESTAMPADD()
                -- --------------------------
                    SELECT TIMESTAMPADD(DAY, 5, '2011-05-21') AS avec_date,
                    -- Avec DATE
                    TIMESTAMPADD(MINUTE, 34, '2011-05-21 12:15:56') AS avec_datetime; -- Avec DATETIME                   


                -- IV.3.2.1.5. ADDTIME()
                -- ---------------------
                    SELECT NOW() AS Maintenant, ADDTIME(NOW(), '01:00:00') AS DansUneHeure, -- Avec un DATETIME
                    CURRENT_TIME() AS HeureCourante, ADDTIME(CURRENT_TIME(), '03:20:02') AS PlusTard; -- Avec un TIME


            -- IV.3.2.2. Soustraction d'un intervalle de temps
            -- -----------------------------------------------
                -- IV.3.2.2.1. SUBDATE(), DATE_SUB() et SUBTIME()
                -- IV.3.2.2.2. Operateur -
                -- IV.3.2.2.3. Soustraire, c’est ajouter un négatif


                -- IV.3.2.2.1. SUBDATE(), DATE_SUB() et SUBTIME()
                -- ---------------------------------------------
                    SELECT SUBDATE('2011-05-21 12:15:56', INTERVAL '3 02:10:32' DAY_SECOND) AS SUBDATE1,
                    SUBDATE('2011-05-21', 12) AS SUBDATE2,
                    DATE_SUB('2011-05-21', INTERVAL 3 MONTH) AS DATE_SUB;

                    SELECT SUBTIME('2011-05-21 12:15:56', '18:35:15') AS SUBTIME1,
                    SUBTIME('12:15:56', '8:35:15') AS SUBTIME2;



                -- IV.3.2.2.2. Operateur -
                -- -----------------------
                    SELECT '2011-05-21' - INTERVAL 5 DAY;


                -- IV.3.2.2.3. Soustraire, c’est ajouter un négatif
                -- ------------------------------------------------
                    SELECT ADDDATE(NOW(), INTERVAL -3 MONTH) AS ajout_negatif, SUBDATE(NOW(), INTERVAL 3 MONTH) AS retrait_positif;
                    
                    SELECT DATE_ADD(NOW(), INTERVAL 4 HOUR) AS ajout_positif, DATE_SUB(NOW(), INTERVAL -4 HOUR) AS retrait_negatif;
                    
                    SELECT NOW() + INTERVAL -15 MINUTE AS ajout_negatif, NOW() -INTERVAL 15 MINUTE AS retrait_positif;
  


        -- IV.3.3. Divers
        -- --------------
            -- IV.3.3.1. Creer une date/heure a partir d'autres informations
            -- IV.3.3.2. Convertir un time en secondes et vice versa.
            -- IV.3.3.3. Dernier jour du mois
            -- IV.3.3.4. En resume


            -- IV.3.3.1. Creer une date/heure a partir d'autres informations
            -- -------------------------------------------------------------
                -- IV.3.3.1.1. À partir d’un timestamp Unix
                -- IV.3.3.1.2. À partir de différents éléments d’une date/heure
                       

                -- IV.3.3.1.1. À partir d’un timestamp Unix
                -- ----------------------------------------
                    SELECT FROM_UNIXTIME(1325595287);

                    SELECT UNIX_TIMESTAMP('2012-01-03 13:54:47');


                -- IV.3.3.1.2. À partir de différents éléments d’une date/heure
                -- ------------------------------------------------------------
                    SELECT MAKEDATE(2012, 60) AS 60eJour2012, MAKETIME(3, 45, 34) AS
heureCree;

            -- IV.3.3.2. Convertir un time en secondes et vice versa.
            -- -----------------------------------------------------
                SELECT SEC_TO_TIME(102569), TIME_TO_SEC('01:00:30');


            -- IV.3.3.3. Dernier jour du mois
            -- ------------------------------
                SELECT LAST_DAY('2012-02-03') AS fevrier2012,
                LAST_DAY('2100-02-03') AS fevrier2100;



            -- IV.3.3.4. En resume (lesona be)
            -- -------------------



    -- IV.4. Exercices
    -- ---------------
        -- IV.4.1. Commencons par le format
        -- IV.4.2. Passons aux calculs
        -- IV.4.3. Et pour finir, melangons le tout


        -- IV.4.1. Commencons par le format
        -- --------------------------------
            -- IV.4.1.0.1. 1. Sélectionner tous les animaux nés en juin.
            -- IV.4.1.0.2. 2. Sélectionner tous les animaux nés dans les huit premières semaines d’une année.
            -- IV.4.1.0.3. 3. Afficher le jour (en chiffres) et le mois de naissance (en toutes lettres) des tortues et des chats nés avant 2007 (en deux colonnes).
            -- IV.4.1.0.4. 4. Même chose qu’à la question précédente, mais en une seule colonne.
            -- IV.4.1.0.5. 5. Sélectionner tous les animaux nés en avril, mais pas un 24 avril, triés par
                              # heure de naissance décroissante (heure dans le sens commun du terme, donc
                              # heure, minutes, secondes) et afficher leur date de naissance suivant le même
                              # format que l’exemple ci-dessous.



            -- IV.4.1.0.1. 1. Sélectionner tous les animaux nés en juin.
            -- --------------------------------------------------------
                SELECT id, date_naissance, nom
                FROM Animal
                WHERE MONTH(date_naissance) = 6;
               

            -- IV.4.1.0.2. 2. Sélectionner tous les animaux nés dans les huit premières semaines d’une année.
            -- ---------------------------------------------------------------------------------------------
                SELECT id, date_naissance, nom
                FROM Animal
                WHERE WEEKOFYEAR(date_naissance) < 9;
            
            
            -- IV.4.1.0.3. 3. Afficher le jour (en chiffres) et le mois de naissance (en toutes lettres) des tortues et des chats nés avant 2007 (en deux colonnes).
            -- -----------------------------------------------------------------------------------------------------------------------------------------------------
                SELECT DAY(date_naissance), MONTHNAME(date_naissance)
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                WHERE Espece.nom_courant IN ('Chat', 'Tortue d''Hermann')
                AND YEAR(date_naissance) < 2007;
            
            
            -- IV.4.1.0.4. 4. Même chose qu’à la question précédente, mais en une seule colonne.
            -- --------------------------------------------------------------------------------
                SELECT DATE_FORMAT(date_naissance, '%e %M')
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                WHERE Espece.nom_courant IN ('Chat', 'Tortue d''Hermann')
                AND YEAR(date_naissance) < 2007;            
            

            -- IV.4.1.0.5. 5. Sélectionner tous les animaux nés en avril, mais pas un 24 avril, triés par
                              # heure de naissance décroissante (heure dans le sens commun du terme, donc
                              # heure, minutes, secondes) et afficher leur date de naissance suivant le même
                              # format que l’exemple ci-dessous.
                SELECT DATE_FORMAT(date_naissance, '%e %M, à %lh%i%p, en l''an %Y après J.C.') AS jolie_date
                FROM Animal
                WHERE MONTH(date_naissance) = 4
                AND DAY(date_naissance) <> 24
                ORDER BY TIME(date_naissance) DESC;


        -- IV.4.2. Passons aux calculs
        -- ---------------------------
            -- IV.4.2.0.1. 1. Moka était censé naître le 27 février 2008. Calculer le nombre de jours de
                              # retard de sa naissance.
            -- IV.4.2.0.2. 2. Afficher la date à laquelle chaque perroquet (espece_id = 4) fêtera son 25e
                              # anniversaire.
            -- IV.4.2.0.3. 3. Sélectionner les animaux nés dans un mois contenant exactement 29 jours.

            -- IV.4.2.0.4. 4. Après douze semaines, un chaton est sevré (sauf exception bien sûr). Afficher
                              # la date à partir de laquelle les chats (espece_id = 2) de l’élevage peuvent être
                              # adoptés (qu’il s’agisse d’une date dans le passé ou dans le futur).
            -- IV.4.2.0.5. 5. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie
                              # de la même portée. Calculer combien de temps, en minutes, Balou est né avant
                              # Zira.



            -- IV.4.2.0.1. 1. Moka était censé naître le 27 février 2008. Calculer le nombre de jours de
                              # retard de sa naissance.
                SELECT DATEDIFF(date_naissance, '2008-02-27') AS retard
                FROM Animal
                WHERE nom = 'Moka';                             

            
            -- IV.4.2.0.2. 2. Afficher la date à laquelle chaque perroquet (espece_id = 4) fêtera son 25e
                              # anniversaire.
                SELECT DATE(ADDDATE(date_naissance, INTERVAL 25 YEAR)) AS Anniversaire
                FROM Animal
                WHERE espece_id = 4;            
            
            
            -- IV.4.2.0.3. 3. Sélectionner les animaux nés dans un mois contenant exactement 29 jours.
                SELECT id, date_naissance, nom
                FROM Animal
                WHERE DAY(LAST_DAY(date_naissance)) = 29;            
            
            
            
            -- IV.4.2.0.4. 4. Après douze semaines, un chaton est sevré (sauf exception bien sûr). Afficher
                              # la date à partir de laquelle les chats (espece_id = 2) de l’élevage peuvent être
                              # adoptés (qu’il s’agisse d’une date dans le passé ou dans le futur).
                SELECT id, nom, DATE(DATE_ADD(date_naissance, INTERVAL 12 WEEK)) AS sevrage
                FROM Animal
                WHERE espece_id = 2;


            
            -- IV.4.2.0.5. 5. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie
                              # de la même portée. Calculer combien de temps, en minutes, Balou est né avant
                              # Zira.
                SELECT TIMESTAMPDIFF(MINUTE,
                (SELECT date_naissance
                FROM Animal
                WHERE nom = 'Balou'),
                (SELECT date_naissance
                FROM Animal
                WHERE nom = 'Zira'))
                AS nb_minutes;



        -- IV.4.3. Et pour finir, melangons le tout
        -- ----------------------------------------
            -- IV.4.3.0.1. 1. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie
                              # de la même portée. Calculer combien de temps, en minutes, s’est écoulé entre le
                              # premier né et le dernier né de la portée            
            -- IV.4.3.0.2. 2. Calculer combien d’animaux sont nés durant un mois pendant lequel les
                              # moules sont les plus consommables (c’est-à-dire les mois finissant en ”bre”).
            -- IV.4.3.0.3. 3. Pour les chiens et les chats (espece_id = 1 et espece_id = 2 respectivement),
                              # afficher les différentes dates de naissance des portées d’au moins deux
                              # individus (format JJ/MM/AAAA), ainsi que le nombre d’individus pour chacune
                              # de ces portées. Attention, il n’est pas impossible qu’une portée de chats soit née
                              # le même jour qu’une portée de chiens (il n’est pas non plus impossible que deux
                              # portées de chiens naissent le même jour, mais on considère que ce n’est pas le
                              # cas).  
            -- IV.4.3.0.4. 4. Calculer combien de chiens (espece_id = 1) sont nés en moyenne chaque
                              # année entre 2006 et 2010 (sachant qu’on a eu au moins une naissance chaque
                              # année).
            -- IV.4.3.0.5. 5. Afficher la date au format ISO du 5e anniversaire des animaux dont on connaît
                              # soit le père, soit la mère.



            -- IV.4.3.0.1. 1. Rouquine, Zira, Bouli et Balou (id 13, 18, 20 et 22 respectivement) font partie
                              # de la même portée. Calculer combien de temps, en minutes, s’est écoulé entre le
                              # premier né et le dernier né de la portée   
                                    SELECT TIMESTAMPDIFF(MINUTE,
                                    (
                                    SELECT MIN(date_naissance)
                                    FROM Animal
                                    WHERE id IN (13, 18, 20, 22)
                                    ),
                                    (
                                    SELECT MAX(date_naissance)
                                    FROM Animal
                                    WHERE id IN (13, 18, 20, 22)
                                    )
                                    ) AS nb_minutes;



            -- IV.4.3.0.2. 2. Calculer combien d’animaux sont nés durant un mois pendant lequel les
                              # moules sont les plus consommables (c’est-à-dire les mois finissant en ”bre”).
                                    SELECT COUNT(*)
                                    FROM Animal
                                    WHERE MONTHNAME(date_naissance) LIKE '%bre';
            
  

            -- IV.4.3.0.3. 3. Pour les chiens et les chats (espece_id = 1 et espece_id = 2 respectivement),
                              # afficher les différentes dates de naissance des portées d’au moins deux
                              # individus (format JJ/MM/AAAA), ainsi que le nombre d’individus pour chacune
                              # de ces portées. Attention, il n’est pas impossible qu’une portée de chats soit née
                              # le même jour qu’une portée de chiens (il n’est pas non plus impossible que deux
                              # portées de chiens naissent le même jour, mais on considère que ce n’est pas le
                              # cas). 

                                    SELECT DATE_FORMAT(date_naissance, '%d/%m/%Y'), COUNT(*) as nb_individus
                                    FROM Animal
                                    WHERE espece_id IN (1, 2)
                                    GROUP BY DATE(date_naissance), espece_id
                                    HAVING nb_individus > 1;






            -- IV.4.3.0.4. 4. Calculer combien de chiens (espece_id = 1) sont nés en moyenne chaque
                              # année entre 2006 et 2010 (sachant qu’on a eu au moins une naissance chaque
                              # année).
                                SELECT AVG(nb)
                                FROM (
                                SELECT COUNT(*) AS nb
                                FROM Animal
                                WHERE espece_id = 1
                                AND YEAR(date_naissance) >= 2006
                                AND YEAR(date_naissance) <= 2010
                                GROUP BY YEAR(date_naissance)
                                ) AS tableIntermedaire;



            -- IV.4.3.0.5. 5. Afficher la date au format ISO du 5e anniversaire des animaux dont on connaît
                              # soit le père, soit la mère.
                                SELECT DATE_FORMAT(DATE_ADD(date_naissance, INTERVAL 5 YEAR), GET_FORMAT(DATE, 'ISO')) AS dateIso
                                FROM Animal
                                WHERE pere_id IS NOT NULL
                                OR mere_id IS NOT NULL;


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
   


#############################################################################################
#                                                                                           #
#                                       Sixième partie                                      #
#       Au-delà des tables classiques : vues, tables temporaires et vues matérialisées      #
#                                                                                           #
#############################################################################################

-- VI.1. Vues
-- VI.2. Table temporaires
-- VI.3. Vues materialisees


-- VI.1. Vues
-- ----------

    -- VI.1.1. Creation d'une vue
    -- VI.1.2. Selection des donnees de la vue
    -- VI.1.3. Modification et suppression d'une vue
    -- VI.1.4. Utilite des vues
    -- VI.1.5. Algorithmes
    -- VI.1.6. Modification des donnees d'une vue  

            SET NAMES utf8;
            DROP TABLE IF EXISTS Erreur;
            DROP TABLE IF EXISTS Animal_histo;

            DROP TABLE IF EXISTS Adoption;
            DROP TABLE IF EXISTS Animal;
            DROP TABLE IF EXISTS Race;
            DROP TABLE IF EXISTS Espece;
            DROP TABLE IF EXISTS Client;


            CREATE TABLE Client (
            id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
            nom varchar(100) NOT NULL,
            prenom varchar(60) NOT NULL,
            adresse varchar(200) DEFAULT NULL,
            code_postal varchar(6) DEFAULT NULL,
            ville varchar(60) DEFAULT NULL,
            pays varchar(60) DEFAULT NULL,
            email varbinary(100) DEFAULT NULL,
            PRIMARY KEY (id),
            UNIQUE KEY ind_uni_email (email)
            ) ENGINE=InnoDB AUTO_INCREMENT=17;

            desc Client;

            LOCK TABLES Client WRITE;
            INSERT INTO Client VALUES
            (1,'Dupont','Jean','Rue du Centre, 5','45810','Houtsiplou','France','jean.dupont@email.com'),(2,'Boudur','Marie','Place de la Gare, 2','35840','Troudumonde','France','marie.boudur@email.com'),(3,'Trachon','Fleur','Rue haute, 54b','3250','Belville','Belgique','fleurtrachon@email.com'),
            (4,'Van Piperseel','Julien',NULL,NULL,NULL,NULL,'jeanvp@email.com'),(5,'Nouvel','Johan',NULL,NULL,NULL,'Suisse','johanetpirlouit@email.com'),(6,'Germain','Frank',NULL,NULL,NULL,NULL,'francoisgermain@email.com'),
            (7,'Antoine','Maximilien','Rue Moineau, 123','4580','Trocoul','Belgique','max.antoine@email.com'),(8,'Di Paolo','Hector',NULL,NULL,NULL,'Suisse','hectordipao@email.com'),(9,'Corduro','Anaelle',NULL,NULL,NULL,NULL,'ana.corduro@email.com'),
            (10,'Faluche','Eline','Avenue circulaire, 7','45870','Garduche','France','elinefaluche@email.com'),(11,'Penni','Carine','Boulevard Haussman, 85','1514','Plasse','Suisse','cpenni@email.com'),(12,'Broussaille','Virginie','Rue du Fleuve, 18','45810','Houtsiplou','France','vibrousaille@email.com'),
            (13,'Durant','Hannah','Rue des Pendus, 66','1514','Plasse','Suisse','hhdurant@email.com'),(14,'Delfour','Elodie','Rue de Flore, 1','3250','Belville','Belgique','e.delfour@email.com'),(15,'Kestau','Joel',NULL,NULL,NULL,NULL,'joel.kestau@email.com');
            UNLOCK TABLES;


            CREATE TABLE Espece (
            id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
            nom_courant varchar(40) NOT NULL,
            nom_latin varchar(40) NOT NULL,
            description text,
            prix decimal(7,2) unsigned DEFAULT NULL,
            PRIMARY KEY (id),
            UNIQUE KEY nom_latin (nom_latin)
            ) ENGINE=InnoDB AUTO_INCREMENT=6;

            desc espece;

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
            date_insertion datetime DEFAULT NULL,
            utilisateur_insertion varchar(20) DEFAULT NULL,
            date_modification datetime DEFAULT NULL,
            utilisateur_modification varchar(20) DEFAULT NULL,
            PRIMARY KEY (id)
            ) ENGINE=InnoDB AUTO_INCREMENT=11;

            LOCK TABLES Race WRITE;
            INSERT INTO Race VALUES
            (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
            (4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.',835.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(5,'Maine coon',2,'Chat de grande taille, à poils mi-longs.',735.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(7,'Sphynx',2,'Chat sans poils.',1235.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
            (8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...',985.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(9,'Rottweiller',1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.',630.00,'2012-05-21 00:53:36','Test','2012-05-22 00:54:13','sdz@localhost'),(10,'Yorkshire terrier',1,'Chien de petite taille au pelage long et soyeux de couleur bleu et feu.',700.00,'2012-05-22 00:58:25','sdz@localhost','2012-05-22 00:58:25','sdz@localhost');
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
            disponible tinyint(1) DEFAULT 1,
            PRIMARY KEY (id),
            UNIQUE KEY ind_uni_nom_espece_id (nom,espece_id)
            ) ENGINE=InnoDB AUTO_INCREMENT=76;

            LOCK TABLES Animal WRITE;
            INSERT INTO Animal VALUES
            (1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22,1),(2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30,1),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31,0),
            (4,'F','2009-08-03 05:12:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(5,NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche',2,NULL,NULL,NULL,0),(6,'F','2009-06-13 08:17:00','Bobosse','Carapace bizarre',3,NULL,NULL,NULL,1),
            (7,'F','2008-12-06 05:18:00','Caroline',NULL,1,2,NULL,NULL,1),(8,'M','2008-09-11 15:38:00','Bagherra',NULL,2,5,NULL,NULL,0),(9,NULL,'2010-08-23 05:18:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
            (10,'M','2010-07-21 15:41:00','Bobo','Petit pour son âge',1,NULL,7,21,1),(11,'F','2008-02-20 15:45:00','Canaille',NULL,1,NULL,NULL,NULL,1),(12,'F','2009-05-26 08:54:00','Cali',NULL,1,2,NULL,NULL,1),
            (13,'F','2007-04-24 12:54:00','Rouquine',NULL,1,1,NULL,NULL,1),(14,'F','2009-05-26 08:56:00','Fila',NULL,1,2,NULL,NULL,1),(15,'F','2008-02-20 15:47:00','Anya',NULL,1,NULL,NULL,NULL,0),
            (16,'F','2009-05-26 08:50:00','Louya',NULL,1,NULL,NULL,NULL,0),(17,'F','2008-03-10 13:45:00','Welva',NULL,1,NULL,NULL,NULL,1),(18,'F','2007-04-24 12:59:00','Zira',NULL,1,1,NULL,NULL,0),
            (19,'F','2009-05-26 09:02:00','Java',NULL,1,2,NULL,NULL,1),(20,NULL,'2007-04-24 12:45:00','Balou',NULL,1,1,NULL,NULL,1),(21,'F','2008-03-10 13:43:00','Pataude',NULL,1,NULL,NULL,NULL,0),
            (22,'M','2007-04-24 12:42:00','Bouli',NULL,1,1,NULL,NULL,1),(24,'M','2007-04-12 05:23:00','Cartouche',NULL,1,NULL,NULL,NULL,1),(25,'M','2006-05-14 15:50:00','Zambo',NULL,1,1,NULL,NULL,1),
            (26,'M','2006-05-14 15:48:00','Samba',NULL,1,1,NULL,NULL,0),(27,'M','2008-03-10 13:40:00','Moka',NULL,1,NULL,NULL,NULL,0),(28,'M','2006-05-14 15:40:00','Pilou',NULL,1,1,NULL,NULL,1),
            (29,'M','2009-05-14 06:30:00','Fiero',NULL,2,3,NULL,NULL,1),(30,'M','2007-03-12 12:05:00','Zonko',NULL,2,5,NULL,NULL,0),(31,'M','2008-02-20 15:45:00','Filou',NULL,2,4,NULL,NULL,1),
            (32,'M','2009-07-26 11:52:00','Spoutnik',NULL,3,NULL,52,NULL,0),(33,'M','2006-05-19 16:17:00','Caribou',NULL,2,4,NULL,NULL,1),(34,'M','2008-04-20 03:22:00','Capou',NULL,2,5,NULL,NULL,1),
            (35,'M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance',2,4,NULL,NULL,1),(36,'M','2009-05-14 06:42:00','Boucan',NULL,2,3,NULL,NULL,1),(37,'F','2006-05-19 16:06:00','Callune',NULL,2,8,NULL,NULL,1),
            (38,'F','2009-05-14 06:45:00','Boule',NULL,2,3,NULL,NULL,0),(39,'F','2008-04-20 03:26:00','Zara',NULL,2,5,NULL,NULL,0),(40,'F','2007-03-12 12:00:00','Milla',NULL,2,5,NULL,NULL,0),
            (41,'F','2006-05-19 15:59:00','Feta',NULL,2,4,NULL,NULL,0),(42,'F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%',2,5,NULL,NULL,0),(43,'F','2007-03-12 11:54:00','Cracotte',NULL,2,5,NULL,NULL,1),
            (44,'F','2006-05-19 16:16:00','Cawette',NULL,2,8,NULL,NULL,1),(45,'F','2007-04-01 18:17:00','Nikki','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(46,'F','2009-03-24 08:23:00','Tortilla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
            (48,'F','2006-03-15 14:56:00','Lulla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(49,'F','2008-03-15 12:02:00','Dana','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,0),(50,'F','2009-05-25 19:57:00','Cheli','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
            (51,'F','2007-04-01 03:54:00','Chicaca','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(52,'F','2006-03-15 14:26:00','Redbul','Insomniaque',3,NULL,NULL,NULL,1),(54,'M','2008-03-16 08:20:00','Bubulle','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
            (55,'M','2008-03-15 18:45:00','Relou','Surpoids',3,NULL,NULL,NULL,0),(56,'M','2009-05-25 18:54:00','Bulbizard','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(57,'M','2007-03-04 19:36:00','Safran','Coco veut un gâteau !',4,NULL,NULL,NULL,0),
            (58,'M','2008-02-20 02:50:00','Gingko','Coco veut un gâteau !',4,NULL,NULL,NULL,0),(59,'M','2009-03-26 08:28:00','Bavard','Coco veut un gâteau !',4,NULL,NULL,NULL,0),(60,'F','2009-03-26 07:55:00','Parlotte','Coco veut un gâteau !',4,NULL,NULL,NULL,1),
            (61,'M','2010-11-09 00:00:00','Yoda',NULL,2,5,NULL,NULL,1),(62,'M','2010-11-05 00:00:00','Pipo',NULL,1,9,NULL,NULL,0),(69,'F','2012-02-13 15:45:00','Baba',NULL,5,NULL,NULL,NULL,0),
            (70,'M','2012-02-13 15:48:00','Bibo','Agressif',5,NULL,72,73,1),(72,'F','2008-02-01 02:25:00','Momy',NULL,5,NULL,NULL,NULL,1),(73,'M','2007-03-11 12:45:00','Popi',NULL,5,NULL,NULL,NULL,1),
            (75,'F','2007-03-12 22:03:00','Mimi',NULL,5,NULL,NULL,NULL,0);
            UNLOCK TABLES;


            CREATE TABLE Adoption (
            client_id smallint(5) unsigned NOT NULL,
            animal_id smallint(5) unsigned NOT NULL,
            date_reservation date NOT NULL,
            date_adoption date DEFAULT NULL,
            prix decimal(7,2) unsigned NOT NULL,
            paye tinyint(1) NOT NULL DEFAULT '0',
            PRIMARY KEY (client_id,animal_id),
            UNIQUE KEY ind_uni_animal_id (animal_id)
            ) ENGINE=InnoDB;


            LOCK TABLES Adoption WRITE;
            INSERT INTO Adoption VALUES
            (1,8,'2012-05-21',NULL,735.00,1),(1,39,'2008-08-17','2008-08-17',735.00,1),(1,40,'2008-08-17','2008-08-17',735.00,1),
            (2,3,'2011-03-12','2011-03-12',835.00,1),(2,18,'2008-06-04','2008-06-04',485.00,1),(3,27,'2009-11-17','2009-11-17',200.00,1),
            (4,26,'2007-02-21','2007-02-21',485.00,1),(4,41,'2007-02-21','2007-02-21',835.00,1),(5,21,'2009-03-08','2009-03-08',200.00,1),
            (6,16,'2010-01-27','2010-01-27',200.00,1),(7,5,'2011-04-05','2011-04-05',150.00,1),(8,42,'2008-08-16','2008-08-16',735.00,1),
            (9,38,'2007-02-11','2007-02-11',985.00,1),(9,55,'2011-02-13','2011-02-13',140.00,1),(9,59,'2012-05-22',NULL,700.00,0),
            (10,49,'2010-08-17','2010-08-17',140.00,0),(11,32,'2008-08-17','2010-03-09',140.00,1),(11,62,'2011-03-01','2011-03-01',630.00,0),
            (12,15,'2012-05-22',NULL,200.00,1),(12,69,'2007-09-20','2007-09-20',10.00,1),(12,75,'2012-05-21',NULL,10.00,0),
            (13,57,'2012-01-10','2012-01-10',700.00,1),(14,58,'2012-02-25','2012-02-25',700.00,1),(15,30,'2008-08-17','2008-08-17',735.00,1);
            UNLOCK TABLES;

            ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY
            (espece_id) REFERENCES Espece (id);

            ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race (id);
            ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES Animal (id);
            ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES Animal (id);
            ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);

            ALTER TABLE Adoption ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES Client (id);
            ALTER TABLE Adoption ADD CONSTRAINT fk_adoption_animal_id FOREIGN KEY (animal_id) REFERENCES Animal (id);


            CREATE TABLE Animal_histo (
            id smallint(6) unsigned NOT NULL,
            sexe char(1) DEFAULT NULL,
            date_naissance datetime NOT NULL,
            nom varchar(30) DEFAULT NULL,
            commentaires text,
            espece_id smallint(6) unsigned NOT NULL,
            race_id smallint(6) unsigned DEFAULT NULL,
            mere_id smallint(6) unsigned DEFAULT NULL,
            pere_id smallint(6) unsigned DEFAULT NULL,
            disponible tinyint(1) DEFAULT 1,
            date_histo datetime NOT NULL,
            utilisateur_histo varchar(20) NOT NULL,
            evenement_histo char(6) NOT NULL,
            PRIMARY KEY (id,date_histo)
            ) ENGINE=InnoDB;

            LOCK TABLES Animal_histo WRITE;
            INSERT INTO Animal_histo VALUES
            (10,'M','2010-07-21 15:41:00','Bobo',NULL,1,NULL,7,21,1,'2012-05-22 01:00:34','sdz@localhost','UPDATE'),(47,'F','2009-03-26 01:24:00','Scroupy','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1,'2012-05-22 01:00:34','sdz@localhost','DELETE');
            UNLOCK TABLES;


            CREATE TABLE Erreur (
            id tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
            erreur varchar(255) DEFAULT NULL,
            PRIMARY KEY (id),
            UNIQUE KEY erreur (erreur)
            ) ENGINE=InnoDB AUTO_INCREMENT=8;

            LOCK TABLES Erreur WRITE;
            INSERT INTO Erreur VALUES
            (5,'Erreur : date_adoption doit être >= à date_reservation.'),(3,'Erreur : paye doit valoir TRUE (1) ou FALSE (0).'),(1,'Erreur : sexe doit valoir \"M\", \"F\" ou NULL.');
            UNLOCK TABLES;

            -- -------- --
            -- TRIGGERS --
            -- -------- --
            DELIMITER |
            CREATE TRIGGER before_insert_adoption BEFORE INSERT
            ON Adoption FOR EACH ROW
            BEGIN
            IF NEW.paye != TRUE
            AND NEW.paye != FALSE
            THEN
            INSERT INTO Erreur (erreur) VALUES
            ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');

            ELSEIF NEW.date_adoption < NEW.date_reservation THEN
            INSERT INTO Erreur (erreur) VALUES
            ('Erreur : date_adoption doit être >= à date_reservation.');
            END IF;
            END ;

            CREATE TRIGGER after_insert_adoption AFTER INSERT
            ON Adoption FOR EACH ROW
            BEGIN
            UPDATE Animal
            SET disponible = FALSE
            WHERE id = NEW.animal_id;
            END ;

            CREATE TRIGGER before_update_adoption BEFORE UPDATE
            ON Adoption FOR EACH ROW
            BEGIN
            IF NEW.paye != TRUE
            AND NEW.paye != FALSE
            THEN
            INSERT INTO Erreur (erreur) VALUES
            ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');

            ELSEIF NEW.date_adoption < NEW.date_reservation THEN
            INSERT INTO Erreur (erreur) VALUES
            ('Erreur : date_adoption doit être >= à date_reservation.');
            END IF;
            END ;

            CREATE TRIGGER after_update_adoption AFTER UPDATE
            ON Adoption FOR EACH ROW
            BEGIN
            IF OLD.animal_id <> NEW.animal_id THEN
            UPDATE Animal
            SET disponible = TRUE
            WHERE id = OLD.animal_id;

            UPDATE Animal
            SET disponible = FALSE
            WHERE id = NEW.animal_id;
            END IF;
            END ;

            CREATE TRIGGER after_delete_adoption AFTER DELETE
            ON Adoption FOR EACH ROW
            BEGIN
            UPDATE Animal
            SET disponible = TRUE
            WHERE id = OLD.animal_id;
            END ;

            CREATE TRIGGER before_insert_animal BEFORE INSERT
            ON Animal FOR EACH ROW
            BEGIN
            IF NEW.sexe IS NOT NULL
            AND NEW.sexe != 'M'
            AND NEW.sexe != 'F'
            THEN
            INSERT INTO Erreur (erreur) VALUES
            ('Erreur : sexe doit valoir "M", "F" ou NULL.');
            END IF;
            END ;

            CREATE TRIGGER before_update_animal BEFORE UPDATE
            ON Animal FOR EACH ROW
            BEGIN
            IF NEW.sexe IS NOT NULL
            AND NEW.sexe != 'M'
            AND NEW.sexe != 'F'
            THEN
            SET NEW.sexe = NULL;
            END IF;
            END ;

            CREATE TRIGGER after_update_animal AFTER UPDATE
            ON Animal FOR EACH ROW
            BEGIN
            INSERT INTO Animal_histo (
            id, sexe, date_naissance, nom, commentaires, espece_id, race_id,
            mere_id, pere_id, disponible, date_histo, utilisateur_histo, evenement_histo)
            VALUES (
            OLD.id, OLD.sexe, OLD.date_naissance, OLD.nom, OLD.commentaires, OLD.espece_id, OLD.race_id,
            OLD.mere_id, OLD.pere_id, OLD.disponible, NOW(), CURRENT_USER(), 'UPDATE');
            END ;

            CREATE TRIGGER after_delete_animal AFTER DELETE
            ON Animal FOR EACH ROW
            BEGIN
            INSERT INTO Animal_histo (
            id, sexe, date_naissance, nom, commentaires, espece_id, race_id,
            mere_id, pere_id, disponible, date_histo, utilisateur_histo, evenement_histo)
            VALUES (
            OLD.id, OLD.sexe, OLD.date_naissance, OLD.nom, OLD.commentaires, OLD.espece_id, OLD.race_id,
            OLD.mere_id, OLD.pere_id, OLD.disponible, NOW(), CURRENT_USER(), 'DELETE');
            END ;

            CREATE TRIGGER before_delete_espece BEFORE DELETE
            ON Espece FOR EACH ROW
            BEGIN
            DELETE FROM Race
            WHERE espece_id = OLD.id;
            END ;

            CREATE TRIGGER before_insert_race BEFORE INSERT
            ON Race FOR EACH ROW
            BEGIN
            SET NEW.date_insertion = NOW();
            SET NEW.utilisateur_insertion = CURRENT_USER();
            SET NEW.date_modification = NOW();
            SET NEW.utilisateur_modification = CURRENT_USER();
            END ;

            CREATE TRIGGER before_update_race BEFORE UPDATE
            ON Race FOR EACH ROW
            BEGIN
            SET NEW.date_modification = NOW();
            SET NEW.utilisateur_modification = CURRENT_USER();
            END ;

            CREATE TRIGGER before_delete_race BEFORE DELETE 
            ON Race FOR EACH ROW
            BEGIN
            UPDATE Animal
            SET race_id = NULL
            WHERE race_id = OLD.id;
            END ;
            
            DELIMITER ;   

    -- VI.1.1. Creation d'une vue
    -- --------------------------
        -- VI.1.1.1. Le principe
        -- VI.1.1.2. Création
        -- VI.1.1.3. Les colonnes de la vue
        -- VI.1.1.4. Requête SELECT stockée dans la vue
        

        -- VI.1.1.1. Le principe
        -- ---------------------
            SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
            Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
            Espece.nom_courant AS espece_nom, Race.nom AS race_nom
            FROM Animal
            INNER JOIN Espece ON Animal.espece_id = Espece.id
            LEFT JOIN Race ON Animal.race_id = Race.id;
         

        -- VI.1.1.2. Création
        -- ------------------

            -- syntaxe
            CREATE [OR REPLACE] VIEW nom_vue
            AS requete_select;

            CREATE VIEW V_Animal_details
            AS SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
            Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
            Espece.nom_courant AS espece_nom, Race.nom AS race_nom
            FROM Animal
            INNER JOIN Espece ON Animal.espece_id = Espece.id
            LEFT JOIN Race ON Animal.race_id = Race.id;

            SELECT * FROM V_Animal_details;


########################################################################################################
#                                           CONVENTION                                                 #
#                                                                                                      #
#      J’ai préfixé le nom de la vue par ”V_”. Il s’agit d’une convention que je vous conseille        #
#      fortement de respecter. Cela permet de savoir au premier coup d’œil si l’on travaille avec      #
#      une vraie table, ou avec une vue.                                                               #
#                                                                                                      #
########################################################################################################

show tables;


        -- VI.1.1.3. Les colonnes de la vue
        -- --------------------------------
            -- VI.1.1.3.1. Lister les colonnes dans CREATE VIEW
            -- VI.1.1.3.2. Doublons interdits

            describe V_animal_details;


            -- VI.1.1.3.1. Lister les colonnes dans CREATE VIEW
            -- ------------------------------------------------
                drop VIEW v_animal_details;

                CREATE VIEW V_Animal_details (id, sexe, date_naissance, nom, commentaires, espece_id, race_id,mere_id, pere_id, disponible, espece_nom, race_nom)
                AS SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
                Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
                Espece.nom_courant, Race.nom
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                LEFT JOIN Race ON Animal.race_id = Race.id;


            -- VI.1.1.3.2. Doublons interdits
            -- ------------------------------
            CREATE VIEW V_test
            AS SELECT Animal.id, Espece.id
            FROM Animal
            INNER JOIN Espece ON Animal.espece_id = Espece.id;





        -- VI.1.1.4. Requête SELECT stockée dans la vue
        -- --------------------------------------------
            -- VI.1.1.4.1. La requête SELECT est ”figée”
            -- VI.1.1.4.2. Tri des données directement dans la vue
            -- VI.1.1.4.3. Comportement d’autres clauses de SELECT

            # Exemple 1 : une vue pour les chiens
            CREATE VIEW V_Chien
            AS SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
            FROM Animal
            WHERE espece_id = 1;


            # Exemple 2 : combien de chats possédons-nous ?
            CREATE OR REPLACE VIEW V_Nombre_espece
            AS SELECT Espece.id, COUNT(Animal.id) AS nb
            FROM Espece
            LEFT JOIN Animal ON Animal.espece_id = Espece.id
            GROUP BY Espece.id;


            # Exemple 3 : vue sur une vue
            CREATE OR REPLACE VIEW V_Chien_race
            AS SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
            FROM V_Chien
            WHERE race_id IS NOT NULL;


            # Exemple 4 : expression dans une vue.
            CREATE VIEW V_Espece_dollars
            AS SELECT id, nom_courant, nom_latin, description, ROUND(prix*1.31564, 2) AS prix_dollars
            FROM Espece;



            -- VI.1.1.4.1. La requête SELECT est ”figée”
            -- ----------------------------------------

                # Par exemple, si l’on crée une vue V_Client toute simple.


                CREATE VIEW V_Client
                AS SELECT *
                FROM Client;

                #Exemple : ajout d’une colonne date_naissance à la table Client.

                ALTER TABLE Client ADD COLUMN date_naissance DATE;

                DESCRIBE V_Client;


            -- VI.1.1.4.2. Tri des données directement dans la vue
            -- ---------------------------------------------------
            
            -- Exemple
            CREATE OR REPLACE VIEW V_Race
            AS SELECT Race.id, nom, Espece.nom_courant AS espece
            FROM Race
            INNER JOIN Espece ON Espece.id = Race.espece_id
            ORDER BY nom;

            SELECT *
            FROM V_Race; -- Sélection sans ORDER BY, on prend l'ORDER BY de la définition

            SELECT *
            FROM V_Race
            ORDER BY espece; -- Sélection avec ORDER BY, c'est celui-là qui sera pris en compte
            

    -- VI.1.2. Sélection des données d’une vue
    -- ---------------------------------------

        # Exemple 1 : on sélectionne les rats bruns à partir de la vue V_Animal_details.

        SELECT id, nom, espece_nom, date_naissance, commentaires, disponible
        FROM V_Animal_details
        WHERE espece_nom = 'Rat brun';

        # Exemple 2 : on sélectionne le nombre d’animaux par espèce avec la vue V_Nombre_espece, en ajoutant une jointure sur la table Espece pour avoir le nom des espèces en plus de leur id.

        SELECT V_Nombre_espece.id, Espece.nom_courant, V_Nombre_espece.nb
        FROM V_Nombre_espece
        INNER JOIN Espece ON Espece.id = V_Nombre_espece.id;

        show tables;
        desc v_nombre_espece;

        # Exemple 3 : on sélectionne le nombre de chiens qu’on possède pour chaque race, en utilisant un regroupement sur la vue V_Chien_race, avec jointure sur Race pour avoir le nom de la race.
        SELECT Race.nom, COUNT(V_Chien_race.id)
        FROM Race
        INNER JOIN V_Chien_race ON Race.id = V_Chien_race.race_id
        GROUP BY Race.nom;


    -- VI.1.3. Modification et suppression d’une vue
    -- ---------------------------------------------
        -- VI.1.3.1. Modification
        -- VI.1.3.2. Suppression


        -- VI.1.3.1. Modification
        -- ----------------------
            -- VI.1.3.1.1. CREATE OR REPLACE
            -- VI.1.3.1.2. ALTER

            
            -- VI.1.3.1.1. CREATE OR REPLACE
            -- -----------------------------

                CREATE OR REPLACE VIEW V_Espece_dollars
                AS SELECT id, nom_courant, nom_latin, description, ROUND(prix*1.30813, 2) AS prix_dollars
                FROM Espece;



            -- VI.1.3.1.2. ALTER
            -- -----------------
                -- syntaxe
                ALTER VIEW nom_vue [(liste_colonnes)]
                AS requete_select

                -- Exemples : les deux requêtes suivantes ont exactement le même effet : on modifie la vue V_espece_dollars pour mettre à jour le taux de change du dollar.

                CREATE OR REPLACE VIEW V_Espece_dollars
                AS SELECT id, nom_courant, nom_latin, description, ROUND(prix*1.30813, 2) AS prix_dollars
                FROM Espece;
                
                ALTER VIEW V_Espece_dollars
                AS SELECT id, nom_courant, nom_latin, description, ROUND(prix*1.30813, 2) AS prix_dollars
                FROM Espece;


                SELECT nom, date_naissance
                FROM table_temporaire
                WHERE pere_id IS NOT NULL;






        -- VI.1.3.2. Suppression
        -- ---------------------
            # Exemple : suppression de V_Race.
            DROP VIEW V_Race;


    -- VI.1.4. Utilité des vues
    -- ------------------------
        -- VI.1.4.1. Clarification et facilitation des requêtes
        -- VI.1.4.2. Création d’une interface entre l’application et la base de données
        -- VI.1.4.3. Restriction des données visibles par les utilisateurs


        -- VI.1.4.1. Clarification et facilitation des requêtes
        -- ----------------------------------------------------

        # Exemple : on veut savoir quelles espèces rapportent le plus, année après année. Comme c’est
        # une question importante pour le développement de l’élevage, et qu’elle reviendra souvent, on
        # crée une vue, que l’on pourra interroger facilement.ADD

            CREATE OR REPLACE VIEW V_Revenus_annee_espece
            AS SELECT YEAR(date_reservation) AS annee, Espece.id AS espece_id, SUM(Adoption.prix) AS somme, COUNT(Adoption.animal_id) AS nb
            FROM Adoption
            INNER JOIN Animal ON Animal.id = Adoption.animal_id
            INNER JOIN Espece ON Animal.espece_id = Espece.id
            GROUP BY annee, Espece.id;

            select * from V_Revenus_annee_espece;

            # 1. Les revenus obtenus par année
            SELECT annee, SUM(somme) AS total
            FROM V_Revenus_annee_espece
            GROUP BY annee;

            # 2. Les revenus obtenus pour chaque espece, toutes annees confondues
            SELECT Espece.nom_courant AS espece, SUM(somme) AS total
            FROM V_Revenus_annee_espece
            INNER JOIN Espece ON V_Revenus_annee_espece.espece_id = Espece.id
            GROUP BY espece;

            # 3. Les revenus moyens generes par la vente d'un individu de l'espece
            SELECT Espece.nom_courant AS espece, SUM(somme)/SUM(nb) AS moyenne
            FROM V_Revenus_annee_espece
            INNER JOIN Espece ON V_Revenus_annee_espece.espece_id = Espece.id
            GROUP BY espece;


        -- VI.1.4.2. Création d’une interface entre l’application et la base de données
        -- ----------------------------------------------------------------------------

        CREATE OR REPLACE VIEW V_Client -- le OR REPLACE indispensable (ou on utilise ALTER VIEW)
        AS SELECT Client.id, nom, prenom, rue_numero AS adresse, code_postal, ville, pays, email, date_naissance
        FROM Client
        LEFT JOIN Adresse ON Client.adresse_id = Adresse.id; -- LEFT JOIN au cas où certains clients n'auraient pas d'adresse définie
        show tables; -- Tsy mexiste io table adresse io.


        -- VI.1.4.3. Restriction des données visibles par les utilisateurs
        -- ---------------------------------------------------------------

            # Exemple
            # Le stagiaire travaillant dans notre élevage s’occupe exclusivement des chats, et ne doit pas avoir
            # accès aux commentaires. On ne lui donne donc pas accès à la table Animal, mais à une vue
            # V_Animal_stagiaire créée de la manière suivante 

            CREATE VIEW V_Animal_stagiaire
            AS SELECT id, nom, sexe, date_naissance, espece_id, race_id, mere_id, pere_id, disponible
            FROM Animal
            WHERE espece_id = 2;

            select * from v_animal_stagiaire;

        
        -- VI.1.5. Algorithmes
        -- -------------------
            -- VI.1.5.1. MERGE
            -- VI.1.5.2. TEMPTABLE


            -- VI.1.5.1. MERGE
            -- ---------------

                # Exemple 1
                SELECT *
                FROM V_Animal_details
                WHERE MONTH(date_naissance) = 6;

                SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
                Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
                Espece.nom_courant AS espece_nom, Race.nom AS race_nom
                FROM Animal
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                LEFT JOIN Race ON Animal.race_id = Race.id
                WHERE MONTH(date_naissance) = 6;


                # Exemple 2
                # Si l’on exécute la requête suivante sur la vue V_Chien, et que l’algorithme MERGE est utilisé :

                SELECT nom, date_naissance
                FROM V_Chien
                WHERE pere_id IS NOT NULL;

                SELECT nom, date_naissance
                FROM Animal
                WHERE espece_id = 1
                AND pere_id IS NOT NULL;


            -- VI.1.5.2. TEMPTABLE
            -- -------------------
                SELECT nom, date_naissance
                FROM V_Chien
                WHERE pere_id IS NOT NULL;


                SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
                FROM Animal
                WHERE espece_id = 1;


    -- VI.1.6. Modification des données d’une vue
    -- ------------------------------------------
        -- VI.1.6.1. Conditions pour qu’une vue permette de modifier des données (requêtes UPDATE)
        -- VI.1.6.2. Conditions pour qu’une vue permette d’insérer des données (requêtes INSERT)
        -- VI.1.6.3. Conditions pour qu’une vue permette de supprimer des données (requêtes DELETE)
        -- VI.1.6.4. Option de la vue pour la modification des données
        -- VI.1.6.5. En résumé


        -- VI.1.6.1. Conditions pour qu’une vue permette de modifier des données (requêtes UPDATE)
        -- ---------------------------------------------------------------------------------------
            -- VI.1.6.1.1. Jointures
            -- VI.1.6.1.2. Algorithme
            -- VI.1.6.1.3. Autres conditions
            
            
            -- VI.1.6.1.1. Jointures
            -- ---------------------

            desc V_Animal_details; 

            select * from V_animal_details where id = 21;
            -- Modifie Animal
            UPDATE V_Animal_details
            SET commentaires = 'Rhume chronique'
            WHERE id = 21;

            -- Modifie Race
            UPDATE V_Animal_details
            SET race_nom = 'Maine Coon'
            WHERE race_nom = 'Maine coon';          
            -- Erreur
            UPDATE V_Animal_details
            SET commentaires = 'Vilain oiseau', espece_nom = 'Perroquet pas beau' -- commentaires vient de Animal, et  espece_nom vient de Espece
            WHERE espece_id = 4;

        

            -- VI.1.6.1.2. Algorithme
            -- ----------------------
            UPDATE V_Nombre_espece
            SET nb = 6
            WHERE id = 4;






        -- VI.1.6.2. Conditions pour qu’une vue permette d’insérer des données (requêtes INSERT)
        -- ------------------------------------------------------------------------------------
            -- VI.1.6.2.1. Valeurs par défaut
            -- VI.1.6.2.2. Jointures
            -- VI.1.6.2.3. Expressions
            -- VI.1.6.2.4. Colonnes dupliquées


            -- VI.1.6.2.1. Valeurs par défaut
            -- ------------------------------
                INSERT INTO V_Animal_stagiaire (nom, sexe, date_naissance, espece_id, race_id)
                VALUES ('Rocco', 'M', '2012-03-12', 1, 9);

                CREATE VIEW V_Animal_mini
                AS SELECT id, nom, sexe, espece_id
                FROM Animal;

                INSERT INTO V_Animal_mini(nom, sexe, espece_id)
                VALUES ('Toxi', 'F', 1);

            
            -- VI.1.6.2.2. Jointures
                INSERT INTO V_Animal_details (espece_nom, espece_nom_latin) VALUES ('Perruche terrestre', 'Pezoporus wallicus');


                CREATE OR REPLACE VIEW V_Animal_espece
                AS SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
                Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
                Espece.nom_courant AS espece_nom, Espece.nom_latin AS espece_nom_latin
                FROM Animal
                INNER JOIN Espece ON Espece.id = Animal.espece_id;

                INSERT INTO V_Animal_espece (espece_nom, espece_nom_latin)
                VALUES ('Perruche terrestre', 'Pezoporus wallicus');


            -- VI.1.6.2.3. Expressions
            -- -----------------------
                INSERT INTO V_Espece_dollars (nom_courant, nom_latin, prix_dollars) 
                VALUES ('Perruche terrestre', 'Pezoporus wallicus', 30);


            -- VI.1.6.2.4. Colonnes dupliquées
            -- -------------------------------
                # Exemple
                # Si l’on crée une vue avec deux fois la même colonne référencée, il est possible de modifier des
                # données à partir de celle-ci, mais pas d’en insérer  
                
                CREATE VIEW V_Espece_2noms
                AS SELECT id, nom_courant, nom_latin, description, prix, nom_courant AS nom2 
                -- nom_courant est référencé deux fois
                FROM Espece;

                -- Modification, pas de problème
                UPDATE V_Espece_2noms
                SET description= 'Joli oiseau aux plumes majoritairement vert brillant', prix = 20.00
                WHERE nom_courant = 'Perruche terrestre';

                -- Insertion, impossible
                INSERT INTO V_Espece_2noms (nom_courant, nom_latin, prix)
                VALUES ('Perruche turquoisine', 'Neophema pulchella', 40);



        -- VI.1.6.3. Conditions pour qu’une vue permette de supprimer des données (requêtes DELETE)  
        -- ----------------------------------------------------------------------------------------
            # lesona


        -- VI.1.6.4. Option de la vue pour la modification des données
        -- -----------------------------------------------------------

            -- VI.1.6.4.1. LOCAL ou CASCADED


                -- Syntaxe
                    CREATE [OR REPLACE]
                    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
                    VIEW nom_vue [(liste_colonnes)]
                    AS requete_select
                    [WITH [CASCADED | LOCAL] CHECK OPTION]
                -- Fin syntaxe

                # Exemples
                # Si la vue V_Animal_stagiaire (qui, pour rappel, sélectionne les chats uniquement) est définie
                # avec WITH CHECK OPTION, on ne peut pas modifier l’espece_id à partir de cette vue.

                CREATE OR REPLACE VIEW V_Animal_stagiaire
                AS SELECT id, nom, sexe, date_naissance, espece_id, race_id, mere_id, pere_id, disponible
                FROM Animal
                WHERE espece_id = 2
                WITH CHECK OPTION;

                # En effet, cette vue est définie avec la condition WHERE espece_id = 2. Les modifications faites
                # sur les données de cette vue doivent respecter cette condition.

                UPDATE V_Animal_stagiaire
                SET espece_id = 1
                WHERE nom = 'Cracotte';

                # De même, l’insertion d’un animal dont l’espece_id n’est pas 2 sera refusée aussi.

                INSERT INTO V_Animal_stagiaire (sexe, date_naissance, espece_id, nom)
                VALUES ('F', '2011-09-21 15:14:00', 2, 'Bambi'); -- c'est un chat, pas de problème

                INSERT INTO V_Animal_stagiaire (sexe, date_naissance, espece_id, nom)
                VALUES ('M', '2011-03-11 05:54:00', 6, 'Tiroli'); -- c'est une perruche, impossible

            
            -- VI.1.6.4.1. LOCAL ou CASCADED
            -- -----------------------------

                # — LOCAL : seules les conditions de la vue même sont vérifiées.
                # — CASCADED : les conditions des vues sous-jacentes éventuelles sont également vérifiées.
                # C’est l’option par défaut.


                -- Exemple 1 : LOCAL
                CREATE OR REPLACE VIEW V_Chien_race
                AS SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
                FROM V_Chien
                WHERE race_id IS NOT NULL
                WITH LOCAL CHECK OPTION;

                -- Modification --
                -- ------------ --
                UPDATE V_Chien_race
                SET race_id = NULL -- Ne respecte pas la condition de V_Chien_race
                WHERE nom = 'Zambo'; -- => Impossible

                UPDATE V_Chien_race
                SET espece_id = 2, race_id = 4 -- Ne respecte pas la condition de V_Chien
                WHERE nom = 'Java'; -- => possible puisque LOCAL CHECKOPTION

                -- Insertion --
                -- --------- --
                INSERT INTO V_Chien_race (sexe, date_naissance, nom, commentaires, espece_id, race_id)
                -- Respecte toutes les  conditions
                VALUES ('M', '2012-02-28 03:05:00', 'Pumba','Prématuré, à surveiller', 1, 9); -- => Pas deproblèm

                INSERT INTO V_Chien_race (sexe, date_naissance, nom, commentaires,espece_id, race_id) 
                -- La race n'est pas NULL, mais c'est un chat
                VALUES ('M', '2011-05-24 23:51:00', 'Lion', NULL, 2, 5); -- => pas de problème puisque LOCAL

                INSERT INTO V_Chien_race (sexe, date_naissance, nom, commentaires, espece_id, race_id) 
                -- La colonne race_id est NULL
                VALUES ('F', '2010-04-28 13:01:00', 'Mouchou', NULL, 1, NULL);
                -- => impossible

               # Exemple 2 : CASCADED
                CREATE OR REPLACE VIEW V_Chien_race
                AS SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
                FROM V_Chien
                WHERE race_id IS NOT NULL
                WITH CASCADED CHECK OPTION;

                UPDATE V_Chien_race
                SET race_id = NULL -- Ne respecte pas la condition de V_Chien_race
                WHERE nom = 'Zambo'; -- => impossible

                UPDATE V_Chien_race
                SET espece_id = 2, race_id = 4 -- Ne respecte pas la condition deV_Chien
                WHERE nom = 'Fila'; -- => impossible aussi puisque CASCADED

 
-- VI.2. Table temporaires
-- -----------------------
    -- VI.2.1. Principe, regles et comportement
    -- VI.2.2. Methodes alternatives de creation des tables
    -- VI.2.3. Utilite des tables temporaires

    

    -- VI.2.1. Principe, regles et comportement
    -- ----------------------------------------
        -- VI.2.1.1. Création, modification, suppression d’une table temporaire
        -- VI.2.1.2. Utilisation des tables temporaires
        -- VI.2.1.3. Cache-cache table
        -- VI.2.1.4. Restrictions des tables temporaires
        -- VI.2.1.5. Interaction avec les transactions


        -- VI.2.1.1. Création, modification, suppression d’une table temporaire
        -- --------------------------------------------------------------------
            -- VI.2.1.1.1. Création
            -- VI.2.1.1.2. Modification
            -- VI.2.1.1.3. Suppression


            -- VI.2.1.1.1. Création
            -- ---------------------

                # Exemple : création d’une table temporaire TMP_Animal.

                CREATE TEMPORARY TABLE TMP_Animal (
                id INT UNSIGNED PRIMARY KEY,
                nom VARCHAR(30),
                espece_id INT UNSIGNED,
                sexe CHAR(1)
                );

                DESCRIBE TMP_Animal;


            -- VI.2.1.1.2. Modification
            -- ------------------------
                # Exemple : ajout d’une colonne à TMP_Animal.
                ALTER TABLE TMP_Animal
                ADD COLUMN date_naissance DATETIME;


            -- VI.2.1.1.3. Suppression:
            -- -----------------------
                #Exemple : suppression de TMP_Animal, qui n’aura pas fait long feu.
                DROP TEMPORARY TABLE TMP_Animal;


        -- VI.2.1.2. Utilisation des tables temporaires
        -- --------------------------------------------
            # Lesona

        
        -- VI.2.1.3. Cache-cache table
        -- ---------------------------

            # Exemple : création d’une table temporaire nommée Animal.
            # On commence par sélectionner les perroquets de la table Animal (la table normale, puisqu’on
            # n’a pas encore créé la table temporaire). On obtient quatre résultats.        


            SELECT id, sexe, nom, commentaires, espece_id
            FROM Animal
            WHERE espece_id = 4;

            # On crée ensuite la table temporaire, et on y insère un animal avec espece_id = 4. On refait la
            # même requête de sélection, et on obtient uniquement l’animal que l’on vient d’insérer, avec la
            # structure de la table temporaire.


            CREATE TEMPORARY TABLE Animal (
            id INT UNSIGNED PRIMARY KEY,
            nom VARCHAR(30),
            espece_id INT UNSIGNED,
            sexe CHAR(1)
            );

            INSERT INTO Animal
            VALUES (1, 'Tempo', 4, 'M');

            SELECT *
            FROM Animal
            WHERE espece_id = 4;

            DROP TEMPORARY TABLE Animal;

            select id, sexe, nom, commentaires, espece_id from animal where espece_id = 4;


        -- VI.2.1.4. Restrictions des tables temporaires

            #Exemples : on recrée une table TMP_Animal, un peu plus complexe cette fois, qu’on remplit
            #avec les chats de la table Animal.

            DROP TABLE Animal_copy;

            CREATE TEMPORARY TABLE TMP_Animal (
            id INT UNSIGNED PRIMARY KEY,
            nom VARCHAR(30),
            espece_id INT UNSIGNED,
            sexe CHAR(1),
            mere_id INT UNSIGNED,
            pere_id INT UNSIGNED
            );
            
            INSERT INTO TMP_Animal
            SELECT id, nom, espece_id, sexe, mere_id, pere_id
            FROM Animal
            WHERE espece_id = 2;

            # 1. Référence n’est pas occurrence
                SELECT TMP_Animal.nom, TMP_Animal.sexe
                FROM TMP_Animal
                WHERE nom LIKE 'B%';

                select * from Tmp_animal;

            # 2. Auto-jointure

                SELECT TMP_Animal.nom, TMP_Pere.nom AS pere
                FROM TMP_Animal
                INNER JOIN TMP_Animal AS TMP_Pere
                ON TMP_Animal.pere_id = TMP_Pere.id;

                # Cette fois, cela ne fonctionne pas : on extrait en effet des données de TMP_Animal, et de
                # TMP_Animal AS TMP_Pere

            # 3. Sous-requête
                SELECT nom
                FROM TMP_Animal
                WHERE id IN (SELECT pere_id FROM TMP_Animal);

                # À nouveau, on extrait des données de TMP_Animal à deux endroits différents : dans la requête
                # et dans la sous-requête. Cela ne peut pas fonctionner.


        -- VI.2.1.5. Interaction avec les transactions
        -- -------------------------------------------

           -- Exemple
            START TRANSACTION;

            INSERT INTO Espece (nom_courant, nom_latin)
            VALUES ('Gerbille de Mongolie', 'Meriones unguiculatus');

            CREATE TEMPORARY TABLE TMP_Test (id INT);

            ROLLBACK;

            SELECT id, nom_courant, nom_latin, prix FROM Espece;
            SELECT * FROM TMP_Test;


    -- VI.2.2. Methodes alternatives de creation des tables
    -- ----------------------------------------------------
        -- VI.2.2.1. Créer une table à partir de la structure d’une autre
        -- VI.2.2.2. Créer une table à partir de données sélectionnées


        -- VI.2.2.1. Créer une table à partir de la structure d’une autre
        -- --------------------------------------------------------------
                -- VI.2.2.1.1. Tables temporaires


                # Il est possible de creer la copie d'une table, en utilisant la commande suivante:
                CREATE [TEMPORARY] TABLE nouvelle_table LIKE ancienne_table;


                # Exemple: reproduction de la table Espece

                CREATE TABLE Espece_copy
                LIKE Espece;

                DESCRIBE Espece;

                DESCRIBE Espece_copy;

                # Ensuite, pour remplir la nouvelle table avec tout ou partie des données de la table d’origine, il
                # suffit d’utiliser la commande INSERT INTO ... SELECT.
                # Exemple

                INSERT INTO Espece_copy
                SELECT * FROM Espece
                WHERE prix < 100;

                SELECT id, nom_courant, prix
                FROM Espece_copy;


            -- VI.2.2.1.1. Tables temporaires
            -- ------------------------------
                # Exemple : copie de la table Animal
                CREATE TEMPORARY TABLE Animal_copy
                LIKE Animal;

                INSERT INTO Animal (nom, sexe, date_naissance, espece_id)
                VALUES ('Mutant', 'M', NOW(), 12);

                INSERT INTO Animal_copy (nom, sexe, date_naissance, espece_id)
                VALUES ('Mutant', 'M', NOW(), 12);

                # Aucune espèce n’a 12 pour id, l’insertion dans Animal échoue donc à cause de la clé étrangère.
                # Par contre, dans la table temporaire Animal_copy, l’insertion réussit.

        
        
        -- VI.2.2.2. Créer une table à partir de données sélectionnées 
        -- -----------------------------------------------------------
            -- VI.2.2.2.1. Forcer le type des colonnes
            -- VI.2.2.2.2. Nom des colonnes
            -- VI.2.2.2.3. Réunir les données de plusieurs tables


                # Exemple : suppression puis recréation d’une table temporaire Animal_copy contenant tous les
                # rats de la table Animal.

                DROP TABLE Animal_copy;

                CREATE TEMPORARY TABLE Animal_copy
                SELECT *
                FROM Animal
                WHERE espece_id = 5;

                DESCRIBE Animal;

                DESCRIBE Animal_copy;


            -- VI.2.2.2.1. Forcer le type des colonnes
            -- ---------------------------------------

                # Exemple : recréation d’Animal_copy, en modifiant quelques types et attributs

                DROP TABLE Animal_copy;

                CREATE TEMPORARY TABLE Animal_copy (
                id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                sexe CHAR(1),
                date_naissance DATETIME,
                nom VARCHAR(100),
                commentaires TEXT,
                espece_id INT NOT NULL,
                race_id INT,
                mere_id INT,
                pere_id INT,
                disponible BOOLEAN DEFAULT TRUE,
                INDEX (nom(10))
                ) ENGINE=InnoDB;

                SELECT *
                FROM Animal
                WHERE espece_id = 5;

                DESCRIBE Animal_copy;

        
        -- VI.2.2.2.2. Nom des colonnes
        -- ----------------------------

            # Exemple : on recrée Animal_copy, mais les noms des colonnes sont dans le désordre, et certains
            # ne correspondent pas à la requête SELECT.

            DROP TABLE Animal_copy;

            CREATE TEMPORARY TABLE Animal_copy (
                id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                nom VARCHAR(100), -- Ordre différent de la requête SELECT
                sexe CHAR(1),
                espece_id INT NOT NULL, -- Ordre différent de la requête SELECT
                date_naissance DATETIME,
                commentaires TEXT,
                race_id INT,
                maman_id INT, -- Nom de colonne différent de la requête SELECT
                papa_id INT, -- Nom de colonne différent de la requête SELECT
                disponible BOOLEAN DEFAULT TRUE,
                INDEX (nom(10))
                ) ENGINE=InnoDB
                SELECT id, sexe, date_naissance, nom, commentaires, espece_id, race_id, mere_id, pere_id, disponible
                FROM Animal
                WHERE espece_id = 5;

                DESCRIBE Animal_copy;


                SELECT maman_id, papa_id, id, sexe, nom, espece_id, mere_id, pere_id FROM Animal_copy;

                # Exemple : Recréation d’Animal_copy. Cette fois on ne précise le type et les attributs que de
                # la colonne id et on ajoute un index sur nom.

                DROP TABLE Animal_copy;

                CREATE TEMPORARY TABLE Animal_copy (
                id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                INDEX (nom(10))
                ) ENGINE=InnoDB
                SELECT *
                FROM Animal
                WHERE espece_id = 5;

                 DESCRIBE Animal_copy;


            -- VI.2.2.2.3. Réunir les données de plusieurs tables

                # Exemple 1 : création de Client_mini, qui correspond à une partie de la table Client.
                CREATE TABLE Client_mini
                SELECT nom, prenom, date_naissance
                FROM Client;

                # Exemple 2 : création de Race_espece, à partir des tables Espece et Race.
                CREATE TABLE Race_espece
                SELECT Race.id, Race.nom, Espece.nom_courant AS espece, Espece.id AS espece_id
                FROM Race
                INNER JOIN Espece ON Espece.id = Race.espece_id;



        -- VI.2.3. Utilité des tables temporaires
        -- --------------------------------------
            -- VI.2.3.1. Gain de performance
            -- VI.2.3.2. Tests
            -- VI.2.3.3. Sets de résultats et procédures stockées


            -- VI.2.3.1. Gain de performance
            -- -----------------------------
                CREATE TEMPORARY TABLE TMP_Adoption_chien
                    SELECT Animal.id AS animal_id, Animal.nom AS animal_nom, Animal.date_naissance AS animal_naissance, Animal.sexe AS animal_sexe, Animal.commentaires AS animal_commentaires,
                    Race.id AS race_id, Race.nom AS race_nom,
                    Client.id AS client_id, Client.nom AS client_nom, Client.prenom AS client_prenom, Client.adresse AS client_adresse,
                    Client.code_postal AS client_code_postal, Client.ville AS client_ville, Client.pays AS client_pays, Client.date_naissance AS client_naissance,
                    Adoption.date_reservation AS adoption_reservation, Adoption.date_adoption AS adoption_adoption, Adoption.prix
                    FROM Animal
                        LEFT JOIN Race ON Animal.race_id = Race.id
                        INNER JOIN Adoption ON Animal.id = Adoption.animal_id
                        INNER JOIN Client ON Client.id = Adoption.client_id
                    WHERE Animal.espece_id = 1;




            -- VI.2.3.3. Sets de résultats et procédures stockées
            --- -------------------------------------------------

                # Exemple : création par une procédure d’une table temporaire stockant les adoptions qui ne
                # sont pas en ordre de paiement.

                DELIMITER |
                CREATE PROCEDURE table_adoption_non_payee()
                BEGIN
                    DROP TEMPORARY TABLE IF EXISTS Adoption_non_payee;

                    CREATE TEMPORARY TABLE Adoption_non_payee
                    SELECT Client.id AS client_id, Client.nom AS client_nom, Client.prenom AS client_prenom, Client.email AS client_email,
                    Animal.nom AS animal_nom, Espece.nom_courant AS espece, Race.nom AS race,
                    Adoption.date_reservation, Adoption.date_adoption, Adoption.prix
                    FROM Adoption
                        INNER JOIN Client ON Client.id = Adoption.client_id
                        INNER JOIN Animal ON Animal.id = Adoption.animal_id
                        INNER JOIN Espece ON Espece.id = Animal.espece_id
                        LEFT JOIN Race ON Race.id = Animal.race_id
                    WHERE Adoption.paye = FALSE;
                END ;
                DELIMITER ;

                CALL table_adoption_non_payee();

                SELECT client_id, client_nom, client_prenom, animal_nom, prix
                FROM Adoption_non_payee;

            




        SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.commentaires,
        Animal.espece_id, Animal.race_id, Animal.mere_id, Animal.pere_id, Animal.disponible,
        Espece.nom_courant AS espece_nom, Race.nom AS race_nom
        FROM Animal
        INNER JOIN Espece ON Animal.espece_id = Espece.id
        LEFT JOIN Race ON Animal.race_id = Race.id;


-- VI.3. Vues materialisee
-- --------------------------
    -- VI.3.1. Principe
    -- VI.3.2. Mise a jours de vues materialisees
    -- VI.3.3. Gain de performance


    -- VI.3.1. Principe:
    -- ----------------
        -- VI.3.1.1. Vues - rappels et performance
        -- VI.3.1.2. Vues matérialisées
        

        -- VI.3.1.1. Vues - rappels et performance
        -- ---------------------------------------
            # Lesona be


        -- VI.3.1.2. Vues matérialisées
        -- ----------------------------
            -- VI.3.1.2.1. ”Vraies” vues matérialisées
            -- VI.3.1.2.2. ”Fausses” vues matérialisées pour MySQL

            -- VI.3.1.2.1. ”Vraies” vues matérialisées
            -- ---------------------------------------
                # lesona be


            -- VI.3.1.2.2. ”Fausses” vues matérialisées pour MySQL
            -- ---------------------------------------------------
                # Exemple : on veut matérialiser V_Revenus_annee_espece.
                CREATE TABLE VM_Revenus_annee_espece
                ENGINE = InnoDB
                SELECT YEAR(date_reservation) AS annee, Espece.id AS espece_id, SUM(Adoption.prix) AS somme, COUNT(Adoption.animal_id) AS nb
                FROM Adoption
                INNER JOIN Animal ON Animal.id = Adoption.animal_id
                INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY annee, Espece.id;
    


    -- VI.3.2. Mise à jour des vues matérialisées
    -- ------------------------------------------
        -- VI.3.2.1. Mise à jour sur demande
        -- VI.3.2.2. Mise à jour automatique


        -- VI.3.2.1. Mise à jour sur demande
        -- ---------------------------------
            # Exemple : procédure stockée permettant de mettre à jour la vue VM_Revenus_annee_especes.
            DELIMITER |
            CREATE PROCEDURE maj_vm_revenus()
            BEGIN
                TRUNCATE VM_Revenus_annee_espece;

                INSERT INTO VM_Revenus_annee_espece
                SELECT YEAR(date_reservation) AS annee, Espece.id AS espece_id, SUM(Adoption.prix) AS somme, COUNT(Adoption.animal_id) AS nb
                FROM Adoption
                    INNER JOIN Animal ON Animal.id = Adoption.animal_id
                    INNER JOIN Espece ON Animal.espece_id = Espece.id
                GROUP BY annee, Espece.id;
            END ;
            DELIMITER ;


            CALL maj_vm_revenus();



        -- VI.3.2.2. Mise à jour automatique
        -- ---------------------------------
            ALTER TABLE VM_Revenus_annee_espece
            ADD CONSTRAINT fk_vm_revenu_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id) ON DELETE CASCADE,
            ADD PRIMARY KEY (annee, espece_id);

        
            DELIMITER |

            DROP TRIGGER after_insert_adoption |

            CREATE TRIGGER after_insert_adoption AFTER INSERT
            ON Adoption FOR EACH ROW
            BEGIN
                UPDATE Animal
                SET disponible = FALSE
                WHERE id = NEW.animal_id;

                INSERT INTO VM_Revenus_annee_espece (espece_id, annee, somme, nb)
                SELECT espece_id, YEAR(NEW.date_reservation), NEW.prix, 1
                FROM Animal
                WHERE id = NEW.animal_id
                ON DUPLICATE KEY UPDATE somme = somme + NEW.prix, nb = nb + 1;
            END ;

            DROP TRIGGER after_update_adoption |

            CREATE TRIGGER after_update_adoption AFTER UPDATE
            ON Adoption FOR EACH ROW
            BEGIN
            IF OLD.animal_id <> NEW.animal_id THEN
                UPDATE Animal
                SET disponible = TRUE
                WHERE id = OLD.animal_id;

                UPDATE Animal
                SET disponible = FALSE
                WHERE id = NEW.animal_id;
            END IF;

            INSERT INTO VM_Revenus_annee_espece (espece_id, annee, somme, nb)
            SELECT espece_id, YEAR(NEW.date_reservation), NEW.prix, 1
            FROM Animal
            WHERE id = NEW.animal_id
            ON DUPLICATE KEY UPDATE somme = somme + NEW.prix, nb = nb + 1;

            UPDATE VM_Revenus_annee_espece
            SET somme = somme - OLD.prix, nb = nb - 1
            WHERE annee = YEAR(OLD.date_reservation)
            AND espece_id = (SELECT espece_id FROM Animal WHERE id = OLD.animal_id);

            DELETE FROM VM_Revenus_annee_espece
            WHERE nb = 0;
            END |


            DROP TRIGGER after_delete_adoption |


            CREATE TRIGGER after_delete_adoption AFTER DELETE
            ON Adoption FOR EACH ROW
            BEGIN
            UPDATE Animal
            SET disponible = TRUE
            WHERE id = OLD.animal_id;



            UPDATE VM_Revenus_annee_espece
            SET somme = somme - OLD.prix, nb = nb - 1
            WHERE annee = YEAR(OLD.date_reservation)
            AND espece_id = (SELECT espece_id FROM Animal WHERE id = OLD.animal_id);

            DELETE FROM VM_Revenus_annee_espece
            WHERE nb = 0;
            END |

            DELIMITER ;

    
    -- VI.3.3. Gain de performance
    -- ---------------------------
        -- VI.3.3.1. Tables vs vue vs vue matérialisée
        -- VI.3.3.2. Les trois procédures
        -- VI.3.3.3. Le test
        -- VI.3.3.4. Conclusion
        -- VI.3.3.5. En résumé


        -- VI.3.3.1. Tables vs vue vs vue matérialisée
        -- -------------------------------------------
            -- VI.3.3.1.1. Empêcher MySQL d’utiliser le cache

            # Lesona be

        
        -- VI.3.3.2. Les trois procédures
        -- ------------------------------
            -- VI.3.3.2.1. Sur les tables
            -- VI.3.3.2.2. Sur la vue
            -- VI.3.3.2.3. Sur la vue matérialisée


            -- VI.3.3.2.1. Sur les tables
            -- --------------------------
                DELIMITER |
                CREATE PROCEDURE test_perf_table()
                BEGIN
                    DECLARE v_max INT DEFAULT 1000;
                    DECLARE v_i INT DEFAULT 0;
                    DECLARE v_nb INT;
                    DECLARE v_somme DECIMAL(15,2);
                    DECLARE v_annee CHAR(4);
                        boucle: LOOP
                            IF v_i = v_max THEN LEAVE boucle; END IF;
                            -- Condition d'arrêt de la boucle

                            SELECT SQL_NO_CACHE YEAR(date_reservation) AS annee,
                            SUM(Adoption.prix) AS somme,
                            COUNT(Adoption.animal_id) AS nb
                            INTO v_annee, v_somme, v_nb
                            FROM Adoption
                            INNER JOIN Animal ON Animal.id = Adoption.animal_id
                            INNER JOIN Espece ON Animal.espece_id = Espece.id
                            WHERE Espece.id = 2
                            GROUP BY annee
                            ORDER BY somme DESC
                            LIMIT 1;

                            SET v_i = v_i + 1;
                        END LOOP;               
                END ;
                DELIMITER ;

   
            -- VI.3.3.2.2. Sur la vue
            -- ----------------------
                DELIMITER |
                CREATE PROCEDURE test_perf_vue()
                BEGIN
                    DECLARE v_max INT DEFAULT 1000;
                    DECLARE v_i INT DEFAULT 0;
                    DECLARE v_nb INT;
                    DECLARE v_somme DECIMAL(15,2);
                    DECLARE v_annee CHAR(4);

                    boucle: LOOP
                        IF v_i = v_max THEN LEAVE boucle; END IF;

                        SELECT SQL_NO_CACHE annee, somme, nb
                        INTO v_annee, v_somme, v_nb
                        FROM V_Revenus_annee_espece
                        WHERE espece_id = 2
                        ORDER BY somme DESC
                        LIMIT 1;

                        SET v_i = v_i + 1;
                    END LOOP;
                END ;
                DELIMITER ;

    
            
            -- VI.3.3.2.3. Sur la vue matérialisée
            -- -----------------------------------

                DELIMITER |
                CREATE PROCEDURE test_perf_vm()
                BEGIN
                    DECLARE v_max INT DEFAULT 1000;
                    DECLARE v_i INT DEFAULT 0;
                    DECLARE v_nb INT;
                    DECLARE v_somme DECIMAL(15,2);
                    DECLARE v_annee CHAR(4);

                    boucle: LOOP
                        IF v_i = v_max THEN LEAVE boucle; END IF;

                        SELECT SQL_NO_CACHE annee, somme, nb
                        INTO v_annee, v_somme, v_nb
                        FROM VM_Revenus_annee_espece
                        WHERE espece_id = 2
                        ORDER BY somme DESC
                        LIMIT 1;

                        SET v_i = v_i + 1;
                    END LOOP;

                END ;
                DELIMITER ;


        -- VI.3.3.3. Le test
        -- -----------------
            CALL test_perf_table();
            CALL test_perf_vue();
            CALL test_perf_vm();

            ALTER TABLE VM_Revenus_annee_espece ADD INDEX (somme);

        
        -- VI.3.3.4. Conclusion
        -- --------------------

            # lesona be



        -- VI.3.3.5. En résumé
        -- -------------------

            # lesona be


#############################################################
#                                                           #
#                  Septième partie                          #
#    Gestion des utilisateurs et configuration du serveur   #           
#                                                           #
#############################################################


-- VII. Gestion des utilisateurs et configuration du serveur
-- ---------------------------------------------------------

    -- VII.1. Gestion des utilisateurs
    -- VII.2. Information sur la base de donnee et les requetes
    -- VII.3. Configuration et OPTIONS
    -- VII.4. Aller plus loin


    -- VII.1.0.1. Etat actuel de la base de données
SET NAMES utf8;

DROP VIEW IF EXISTS V_Animal_details;
DROP VIEW IF EXISTS V_Animal_espece;
DROP VIEW IF EXISTS V_Animal_stagiaire;
DROP VIEW IF EXISTS V_Chien;
DROP VIEW IF EXISTS V_Chien_race;
DROP VIEW IF EXISTS V_Client;
DROP VIEW IF EXISTS V_Espece_dollars;
DROP VIEW IF EXISTS V_Nombre_espece;
DROP VIEW IF EXISTS V_Revenus_annee_espece;

DROP TABLE IF EXISTS Erreur;
DROP TABLE IF EXISTS Animal_histo;
DROP TABLE IF EXISTS VM_Revenus_annee_espece;

DROP TABLE IF EXISTS Adoption;
DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS Espece;
DROP TABLE IF EXISTS Client;

CREATE TABLE Client (
id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
nom varchar(100) NOT NULL,
prenom varchar(60) NOT NULL,
adresse varchar(200) DEFAULT NULL,
code_postal varchar(6) DEFAULT NULL,
ville varchar(60) DEFAULT NULL,
pays varchar(60) DEFAULT NULL,
email varbinary(100) DEFAULT NULL,
date_naissance date DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE KEY ind_uni_email (email)
) ENGINE=InnoDB AUTO_INCREMENT=17;

LOCK TABLES Client WRITE;
INSERT INTO Client VALUES
(1,'Dupont','Jean','Rue du Centre, 5','45810','Houtsiplou','France','jean.dupont@email.com',NULL),(2,'Boudur','Marie','Place de la Gare, 2','35840','Troudumonde','France','marie.boudur@email.com',NULL),(3,'Trachon','Fleur','Rue haute, 54b','3250','Belville','Belgique','fleurtrachon@email.com',NULL),
(4,'Van Piperseel','Julien',NULL,NULL,NULL,NULL,'jeanvp@email.com',NULL),
(5,'Nouvel','Johan',NULL,NULL,NULL,'Suisse','johanetpirlouit@email.com',NULL),(6,'Germain','Frank',NULL,NULL,NULL,NULL,'francoisgermain@email.com',NULL),
(7,'Antoine','Maximilien','Rue Moineau, 123','4580','Trocoul','Belgique','max.antoine@email.com',NULL),(8,'Di Paolo','Hector',NULL,NULL,NULL,'Suisse','hectordipao@email.com',NULL),
(9,'Corduro','Anaelle',NULL,NULL,NULL,NULL,'ana.corduro@email.com',NULL),
(10,'Faluche','Eline','Avenue circulaire, 7','45870','Garduche','France','elinefaluche@email.com',NULL),(11,'Penni','Carine','Boulevard Haussman, 85','1514','Plasse','Suisse','cpenni@email.com',NULL),(12,'Broussaille','Virginie','Rue du Fleuve, 18','45810','Houtsiplou','France','vibrousaille@email.com',NULL),
(13,'Durant','Hannah','Rue des Pendus, 66','1514','Plasse','Suisse','hhdurant@email.com',NULL),
(14,'Delfour','Elodie','Rue de Flore, 1','3250','Belville','Belgique','e.delfour@email.com',NULL),(15,'Kestau','Joel',NULL,NULL,NULL,NULL,'joel.kestau@email.com',NULL);
UNLOCK TABLES;


CREATE TABLE Espece (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
nom_courant varchar(40) NOT NULL,
nom_latin varchar(40) NOT NULL,
description text,
prix decimal(7,2) unsigned DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE KEY nom_latin (nom_latin)
) ENGINE=InnoDB AUTO_INCREMENT=8;

LOCK TABLES Espece WRITE;
INSERT INTO Espece VALUES (1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue',200.00),(2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres',150.00),
(3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure',140.00),
(4,'Perroquet amazone','Alipiopsitta xanthops','Joli oiseau parleur vert et jaune',700.00),(5,'Rat brun','Rattus norvegicus','Petite bestiole avec de longues moustaches et une longue queue sans poils',10.00),(6,'Perruche terrestre','Pezoporus wallicus','Joli oiseau aux plumes majoritairement vert brillant',20.00);
UNLOCK TABLES;


CREATE TABLE Race (
id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
nom varchar(40) NOT NULL,
espece_id smallint(6) unsigned NOT NULL,
description text,
prix decimal(7,2) unsigned DEFAULT NULL,
date_insertion datetime DEFAULT NULL,
utilisateur_insertion varchar(20) DEFAULT NULL,
date_modification datetime DEFAULT NULL,
utilisateur_modification varchar(20) DEFAULT NULL,
PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=11;

LOCK TABLES Race WRITE;
INSERT INTO Race VALUES (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
(4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.',835.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),(5,'Maine Coon',2,'Chat de grande taille, à poils mi-longs.',735.00,'2012-05-21 00:53:36','Test','2012-05-27 18:10:46','sdz@localhost'),(7,'Sphynx',2,'Chat sans poils.',1235.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
(8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...',985.00,'2012-05-21 00:53:36','Test','2012-05-21 00:53:36','Test'),
(9,'Rottweiller',1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.',630.00,'2012-05-21 00:53:36','Test','2012-05-22 00:54:13','sdz@localhost'),(10,'Yorkshire terrier',1,'Chien de petite taille au pelage long et soyeux de couleur bleu et feu.',700.00,'2012-05-22 00:58:25','sdz@localhost','2012-05-22 00:58:25','sdz@localhost');
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
disponible tinyint(1) DEFAULT '1',
PRIMARY KEY (id),
UNIQUE KEY ind_uni_nom_espece_id (nom,espece_id)
) ENGINE=InnoDB AUTO_INCREMENT=81;

LOCK TABLES Animal WRITE;
INSERT INTO Animal VALUES (1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22,1),(2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30,1),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31,0),
(4,'F','2009-08-03 05:12:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(5,NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche',2,NULL,NULL,NULL,0),(6,'F','2009-06-13 08:17:00','Bobosse','Carapace bizarre',3,NULL,NULL,NULL,1),
(7,'F','2008-12-06 05:18:00','Caroline',NULL,1,2,NULL,NULL,1),(8,'M','2008-09-11 15:38:00','Bagherra',NULL,2,5,NULL,NULL,0),(9,NULL,'2010-08-23 05:18:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
(10,'M','2010-07-21 15:41:00','Bobo','Petit pour son âge',1,NULL,7,21,1),(11,'F','2008-02-20 15:45:00','Canaille',NULL,1,NULL,NULL,NULL,1),(12,'F','2009-05-26 08:54:00','Cali',NULL,1,2,NULL,NULL,1),
(13,'F','2007-04-24 12:54:00','Rouquine',NULL,1,1,NULL,NULL,1),(14,'F','2009-05-26 08:56:00','Fila',NULL,1,2,NULL,NULL,1),(15,'F','2008-02-20 15:47:00','Anya',NULL,1,NULL,NULL,NULL,0),
(16,'F','2009-05-26 08:50:00','Louya',NULL,1,NULL,NULL,NULL,0),(17,'F','2008-03-10 13:45:00','Welva',NULL,1,NULL,NULL,NULL,1),(18,'F','2007-04-24 12:59:00','Zira',NULL,1,1,NULL,NULL,0),
(19,'F','2009-05-26 09:02:00','Java',NULL,2,4,NULL,NULL,1),(20,NULL,'2007-04-24 12:45:00','Balou',NULL,1,1,NULL,NULL,1),(21,'F','2008-03-10 13:43:00','Pataude','Rhume chronique',1,NULL,NULL,NULL,0),
(22,'M','2007-04-24 12:42:00','Bouli',NULL,1,1,NULL,NULL,1),(24,'M','2007-04-12 05:23:00','Cartouche',NULL,1,NULL,NULL,NULL,1),(25,'M','2006-05-14 15:50:00','Zambo',NULL,1,1,NULL,NULL,1),
(26,'M','2006-05-14 15:48:00','Samba',NULL,1,1,NULL,NULL,0),(27,'M','2008-03-10 13:40:00','Moka',NULL,1,NULL,NULL,NULL,0),(28,'M','2006-05-14 15:40:00','Pilou',NULL,1,1,NULL,NULL,1),
(29,'M','2009-05-14 06:30:00','Fiero',NULL,2,3,NULL,NULL,1),(30,'M','2007-03-12 12:05:00','Zonko',NULL,2,5,NULL,NULL,0),(31,'M','2008-02-20 15:45:00','Filou',NULL,2,4,NULL,NULL,1),
(32,'M','2009-07-26 11:52:00','Spoutnik',NULL,3,NULL,52,NULL,0),(33,'M','2006-05-19 16:17:00','Caribou',NULL,2,4,NULL,NULL,1),(34,'M','2008-04-20 03:22:00','Capou',NULL,2,5,NULL,NULL,1),
(35,'M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance',2,4,NULL,NULL,1),(36,'M','2009-05-14 06:42:00','Boucan',NULL,2,3,NULL,NULL,1),(37,'F','2006-05-19 16:06:00','Callune',NULL,2,8,NULL,NULL,1),
(38,'F','2009-05-14 06:45:00','Boule',NULL,2,3,NULL,NULL,0),(39,'F','2008-04-20 03:26:00','Zara',NULL,2,5,NULL,NULL,0),(40,'F','2007-03-12 12:00:00','Milla',NULL,2,5,NULL,NULL,0),
(41,'F','2006-05-19 15:59:00','Feta',NULL,2,4,NULL,NULL,0),(42,'F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%',2,5,NULL,NULL,0),(43,'F','2007-03-12 11:54:00','Cracotte',NULL,2,5,NULL,NULL,1),
(44,'F','2006-05-19 16:16:00','Cawette',NULL,2,8,NULL,NULL,1),(45,'F','2007-04-01 18:17:00','Nikki','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(46,'F','2009-03-24 08:23:00','Tortilla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
(48,'F','2006-03-15 14:56:00','Lulla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(49,'F','2008-03-15 12:02:00','Dana','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,0),(50,'F','2009-05-25 19:57:00','Cheli','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
(51,'F','2007-04-01 03:54:00','Chicaca','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),(52,'F','2006-03-15 14:26:00','Redbul','Insomniaque',3,NULL,NULL,NULL,1),
(54,'M','2008-03-16 08:20:00','Bubulle','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
(55,'M','2008-03-15 18:45:00','Relou','Surpoids',3,NULL,NULL,NULL,0),(56,'M','2009-05-25 18:54:00','Bulbizard','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1),
(57,'M','2007-03-04 19:36:00','Safran','Coco veut un gâteau !',4,NULL,NULL,NULL,0),
(58,'M','2008-02-20 02:50:00','Gingko','Coco veut un gâteau !',4,NULL,NULL,NULL,0),(59,'M','2009-03-26 08:28:00','Bavard','Coco veut un gâteau !',4,NULL,NULL,NULL,0),
(60,'F','2009-03-26 07:55:00','Parlotte','Coco veut un gâteau !',4,NULL,NULL,NULL,1),(61,'M','2010-11-09 00:00:00','Yoda',NULL,2,5,NULL,NULL,1),(62,'M','2010-11-05 00:00:00','Pipo',NULL,1,9,NULL,NULL,0),
(69,'F','2012-02-13 15:45:00','Baba',NULL,5,NULL,NULL,NULL,0),(70,'M','2012-02-13 15:48:00','Bibo','Agressif',5,NULL,72,73,1),(72,'F','2008-02-01 02:25:00','Momy',NULL,5,NULL,NULL,NULL,1),
(73,'M','2007-03-11 12:45:00','Popi',NULL,5,NULL,NULL,NULL,1),(75,'F','2007-03-12 22:03:00','Mimi',NULL,5,NULL,NULL,NULL,0),(76,'M','2012-03-12 00:00:00','Rocco',NULL,1,9,NULL,NULL,1),
(77,'F','2011-09-21 15:14:00','Bambi',NULL,2,NULL,NULL,NULL,1),(78,'M','2012-02-28 03:05:00','Pumba','Prématuré, à surveiller',1,9,NULL,NULL,1),(79,'M','2011-05-24 23:51:00','Lion',NULL,2,5,NULL,NULL,1);
UNLOCK TABLES;


CREATE TABLE Adoption (
client_id smallint(5) unsigned NOT NULL,
animal_id smallint(5) unsigned NOT NULL,
date_reservation date NOT NULL,
date_adoption date DEFAULT NULL,
prix decimal(7,2) unsigned NOT NULL,
paye tinyint(1) NOT NULL DEFAULT '0',
PRIMARY KEY (client_id,animal_id),
UNIQUE KEY ind_uni_animal_id (animal_id)
) ENGINE=InnoDB;

LOCK TABLES Adoption WRITE;


INSERT INTO Adoption VALUES (1,8,'2012-05-21',NULL,735.00,1),(1,39,'2008-08-17','2008-08-17',735.00,1),(1,40,'2008-08-17','2008-08-17',735.00,1),
(2,3,'2011-03-12','2011-03-12',835.00,1),(2,18,'2008-06-04','2008-06-04',485.00,1),(3,27,'2009-11-17','2009-11-17',200.00,1),
(4,26,'2007-02-21','2007-02-21',485.00,1),(4,41,'2007-02-21','2007-02-21',835.00,1),(5,21,'2009-03-08','2009-03-08',200.00,1),
(6,16,'2010-01-27','2010-01-27',200.00,1),(7,5,'2011-04-05','2011-04-05',150.00,1),(8,42,'2008-08-16','2008-08-16',735.00,1),
(9,38,'2007-02-11','2007-02-11',985.00,1),(9,55,'2011-02-13','2011-02-13',140.00,1),(9,59,'2012-05-22',NULL,700.00,0),
(10,49,'2010-08-17','2010-08-17',140.00,0),(11,32,'2008-08-17','2010-03-09',140.00,1),(11,62,'2011-03-01','2011-03-01',630.00,0),
(12,15,'2012-05-22',NULL,200.00,1),(12,69,'2007-09-20','2007-09-20',10.00,1),(12,75,'2012-05-21',NULL,10.00,0),
(13,57,'2012-01-10','2012-01-10',700.00,1),(14,58,'2012-02-25','2012-02-25',700.00,1),(15,30,'2008-08-17','2008-08-17',735.00,1);
UNLOCK TABLES;


CREATE TABLE VM_Revenus_annee_espece (
annee int(4) NOT NULL DEFAULT '0',
espece_id smallint(6) unsigned NOT NULL DEFAULT '0',
somme decimal(29,2) DEFAULT NULL,
nb bigint(21) NOT NULL DEFAULT '0',
PRIMARY KEY (annee,espece_id),
KEY somme (somme)
) ENGINE=InnoDB;

LOCK TABLES VM_Revenus_annee_espece WRITE;
INSERT INTO VM_Revenus_annee_espece VALUES (2007,1,485.00,1),(2007,2,1820.00,2),(2007,5,10.00,1),(2008,1,485.00,1),(2008,2,2940.00,4),
(2008,3,140.00,1),(2009,1,400.00,2),(2010,1,200.00,1),(2010,3,140.00,1),(2011,1,630.00,1),
(2011,2,985.00,2),(2011,3,140.00,1),(2012,1,200.00,1),(2012,2,735.00,1),(2012,4,2100.00,3),(2012,5,10.00,1);
UNLOCK TABLES;


CREATE TABLE Animal_histo (
id smallint(6) unsigned NOT NULL,
sexe char(1) DEFAULT NULL,
date_naissance datetime NOT NULL,
nom varchar(30) DEFAULT NULL,
commentaires text,
espece_id smallint(6) unsigned NOT NULL,
race_id smallint(6) unsigned DEFAULT NULL,
mere_id smallint(6) unsigned DEFAULT NULL,
pere_id smallint(6) unsigned DEFAULT NULL,
disponible tinyint(1) DEFAULT '1',
date_histo datetime NOT NULL,
utilisateur_histo varchar(20) NOT NULL,
evenement_histo char(6) NOT NULL,
PRIMARY KEY (id,date_histo)
) ENGINE=InnoDB;

LOCK TABLES Animal_histo WRITE;

INSERT INTO Animal_histo VALUES 
(10,'M','2010-07-21 15:41:00','Bobo',NULL,1,NULL,7,21,1,'2012-05-22 01:00:34','sdz@localhost','UPDATE'),
(19,'F','2009-05-26 09:02:00','Java',NULL,1,2,NULL,NULL,1,'2012-05-27 18:14:29','sdz@localhost','UPDATE'),
(21,'F','2008-03-10 13:43:00','Pataude',NULL,1,NULL,NULL,NULL,0,'2012-05-27 18:10:40','sdz@localhost','UPDATE'),
(47,'F','2009-03-26 01:24:00','Scroupy','Bestiole avec une carapace très dure',3,NULL,NULL,NULL,1,'2012-05-22 01:00:34','sdz@localhost','DELETE'),
(77,'F','2007-04-10 12:50:20','Toxi',NULL,1,NULL,NULL,NULL,1,'2012-05-27 18:12:38','sdz@localhost','DELETE');
UNLOCK TABLES;


CREATE TABLE Erreur (
id tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
erreur varchar(255) DEFAULT NULL,
PRIMARY KEY (id),
UNIQUE KEY erreur (erreur)
) ENGINE=InnoDB AUTO_INCREMENT=8;

LOCK TABLES Erreur WRITE;
INSERT INTO Erreur VALUES (5,'Erreur : date_adoption doit être >= à date_reservation.'),
(3,'Erreur : paye doit valoir TRUE (1) ou FALSE (0).'),
(1,'Erreur : sexe doit valoir \"M\", \"F\" ou NULL.');
UNLOCK TABLES;


ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES Animal (id);
ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES Animal (id);
ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race (id);
ALTER TABLE Adoption ADD CONSTRAINT fk_adoption_animal_id FOREIGN KEY (animal_id) REFERENCES Animal (id);
ALTER TABLE Adoption ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES Client (id);
ALTER TABLE VM_Revenus_annee_espece ADD CONSTRAINT fk_vm_revenu_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id) ON DELETE CASCADE;


DELIMITER |

CREATE TRIGGER before_insert_adoption BEFORE INSERT
ON Adoption FOR EACH ROW
BEGIN
IF NEW.paye != TRUE
AND NEW.paye != FALSE
THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');

ELSEIF NEW.date_adoption < NEW.date_reservation THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : date_adoption doit être >= à date_reservation.');
END IF;
END |

CREATE TRIGGER after_insert_adoption AFTER INSERT
ON Adoption FOR EACH ROW
BEGIN
UPDATE Animal
SET disponible = FALSE
WHERE id = NEW.animal_id;

INSERT INTO VM_Revenus_annee_espece (espece_id, annee, somme, nb)
SELECT espece_id, YEAR(NEW.date_reservation), NEW.prix, 1
FROM Animal
WHERE id = NEW.animal_id
ON DUPLICATE KEY UPDATE somme = somme + NEW.prix, nb = nb + 1;
END |

CREATE TRIGGER before_update_adoption BEFORE UPDATE
ON Adoption FOR EACH ROW
BEGIN
IF NEW.paye != TRUE
AND NEW.paye != FALSE
THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : paye doit valoir TRUE (1) ou FALSE (0).');

ELSEIF NEW.date_adoption < NEW.date_reservation THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : date_adoption doit être >= à date_reservation.');
END IF;
END |

CREATE TRIGGER after_update_adoption AFTER UPDATE
ON Adoption FOR EACH ROW
BEGIN
IF OLD.animal_id <> NEW.animal_id THEN
UPDATE Animal
SET disponible = TRUE
WHERE id = OLD.animal_id;

UPDATE Animal
SET disponible = FALSE
WHERE id = NEW.animal_id;
END IF;

INSERT INTO VM_Revenus_annee_espece (espece_id, annee, somme, nb)
SELECT espece_id, YEAR(NEW.date_reservation), NEW.prix, 1
FROM Animal
WHERE id = NEW.animal_id
ON DUPLICATE KEY UPDATE somme = somme + NEW.prix, nb = nb + 1;

UPDATE VM_Revenus_annee_espece
SET somme = somme - OLD.prix, nb = nb - 1
WHERE annee = YEAR(OLD.date_reservation)
AND espece_id = (SELECT espece_id FROM Animal WHERE id = OLD.animal_id);

DELETE FROM VM_Revenus_annee_espece
WHERE nb = 0;
END |

CREATE TRIGGER after_delete_adoption AFTER DELETE
ON Adoption FOR EACH ROW
BEGIN
UPDATE Animal
SET disponible = TRUE
WHERE id = OLD.animal_id;

UPDATE VM_Revenus_annee_espece
SET somme = somme - OLD.prix, nb = nb - 1
WHERE annee = YEAR(OLD.date_reservation)
AND espece_id = (SELECT espece_id FROM Animal WHERE id = OLD.animal_id);

DELETE FROM VM_Revenus_annee_espece
WHERE nb = 0;
END |

CREATE TRIGGER before_insert_animal BEFORE INSERT
ON Animal FOR EACH ROW
BEGIN
IF NEW.sexe IS NOT NULL
AND NEW.sexe != 'M'
AND NEW.sexe != 'F'
THEN
INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F" ou NULL.');
END IF;
END |

CREATE TRIGGER before_update_animal BEFORE UPDATE
ON Animal FOR EACH ROW
BEGIN
IF NEW.sexe IS NOT NULL
AND NEW.sexe != 'M'
AND NEW.sexe != 'F'
THEN
SET NEW.sexe = NULL;
END IF;
END |

CREATE TRIGGER after_update_animal AFTER UPDATE
ON Animal FOR EACH ROW
BEGIN
INSERT INTO Animal_histo (
id, sexe, date_naissance, nom, commentaires, espece_id, race_id,
mere_id, pere_id, disponible, date_histo, utilisateur_histo, evenement_histo)
VALUES (
OLD.id, OLD.sexe, OLD.date_naissance, OLD.nom, OLD.commentaires, OLD.espece_id, OLD.race_id,
OLD.mere_id, OLD.pere_id, OLD.disponible, NOW(), CURRENT_USER(), 'UPDATE');
END |

CREATE TRIGGER after_delete_animal AFTER DELETE
ON Animal FOR EACH ROW
BEGIN
INSERT INTO Animal_histo (
id, sexe, date_naissance, nom, commentaires, espece_id, race_id,
mere_id, pere_id, disponible, date_histo, utilisateur_histo, evenement_histo)
VALUES (
OLD.id, OLD.sexe, OLD.date_naissance, OLD.nom, OLD.commentaires, OLD.espece_id, OLD.race_id,
OLD.mere_id, OLD.pere_id, OLD.disponible, NOW(), CURRENT_USER(), 'DELETE');
END |

CREATE TRIGGER before_delete_espece BEFORE DELETE
ON Espece FOR EACH ROW
BEGIN
DELETE FROM Race
WHERE espece_id = OLD.id;
END |

CREATE TRIGGER before_insert_race BEFORE INSERT
ON Race FOR EACH ROW
BEGIN
SET NEW.date_insertion = NOW();
SET NEW.utilisateur_insertion = CURRENT_USER();
SET NEW.date_modification = NOW();
SET NEW.utilisateur_modification = CURRENT_USER();
END |

CREATE TRIGGER before_update_race BEFORE UPDATE
ON Race FOR EACH ROW
BEGIN
SET NEW.date_modification = NOW();
SET NEW.utilisateur_modification = CURRENT_USER();
END |

CREATE TRIGGER before_delete_race BEFORE DELETE
ON Race FOR EACH ROW
BEGIN
UPDATE Animal
SET race_id = NULL
WHERE race_id = OLD.id;
END |

DELIMITER ;

CREATE VIEW V_Animal_details AS
select Animal.id,Animal.sexe,Animal.date_naissance,Animal.nom,Animal.commentaires,Animal.espece_id,Animal.race_id,
Animal.mere_id,Animal.pere_id,Animal.disponible,Espece.nom_courant AS espece_nom,Race.nom AS race_nom
from Animal
join Espece on Animal.espece_id = Espece.id
left join Race on Animal.race_id = Race.id;

CREATE VIEW V_Animal_espece AS
select Animal.id,Animal.sexe,Animal.date_naissance,Animal.nom,Animal.commentaires,Animal.espece_id,Animal.race_id,
Animal.mere_id,Animal.pere_id,Animal.disponible,Espece.nom_courant AS espece_nom,Espece.nom_latin AS espece_nom_latin
from Animal
join Espece on Espece.id = Animal.espece_id;

CREATE VIEW V_Animal_stagiaire AS
select Animal.id,Animal.nom,Animal.sexe,Animal.date_naissance,Animal.espece_id,Animal.race_id,Animal.mere_id,Animal.pere_id,Animal.disponible
from Animal
where Animal.espece_id = 2
WITH CASCADED CHECK OPTION;

CREATE VIEW V_Chien AS
select Animal.id,Animal.sexe,Animal.date_naissance,Animal.nom,Animal.commentaires,Animal.espece_id,Animal.race_id,Animal.mere_id,Animal.pere_id,Animal.disponible
from Animal
where Animal.espece_id = 1;

CREATE VIEW V_Chien_race AS
select V_Chien.id,V_Chien.sexe,V_Chien.date_naissance,V_Chien.nom,V_Chien.commentaires,V_Chien.espece_id,V_Chien.race_id,V_Chien.mere_id,V_Chien.pere_id,V_Chien.disponible
from V_Chien
where V_Chien.race_id is not null
WITH CASCADED CHECK OPTION;

CREATE VIEW V_Client AS
select Client.id,Client.nom,Client.prenom,Client.adresse,Client.code_postal,Client.ville,Client.pays,Client.email
from Client;

CREATE VIEW V_Espece_dollars AS
select Espece.id,Espece.nom_courant,Espece.nom_latin,Espece.description,round((Espece.prix * 1.30813),2) AS prix_dollars
from Espece;
CREATE VIEW V_Nombre_espece AS
select Espece.id,count(Animal.id) AS nb
from Espece
left join Animal on Animal.espece_id = Espece.id
group by Espece.id;

CREATE VIEW V_Revenus_annee_espece AS
select year(Adoption.date_reservation) AS annee,Espece.id AS espece_id,sum(Adoption.prix) AS somme,count(Adoption.animal_id) AS nb
from Adoption
join Animal on Animal.id = Adoption.animal_id
join Espece on Animal.espece_id = Espece.id
group by year(Adoption.date_reservation),Espece.id;


    -- VII.1. Gestion des utilisateurs
    -- -------------------------------
        -- VII.1.1. Introduction
        -- VII.1.2. creation, modification et suppression des utilisateurs
        -- VII.1.3. Les privileges - introductions
        -- VII.1.4. Ajout et revocation de privilege
        -- VII.1.5. Privileges particuliers
        -- VII.1.6. Options supplementaires


        -- VII.1.1. Introduction
        -- ---------------------
            -- VII.1.1.1. Les Utilisateurs et leurs privileges

        
            -- VII.1.1.1. Les Utilisateurs et leurs privileges
            -- -----------------------------------------------
                -- VII.1.1.1.1. Privilèges des utilisateurs
                -- VII.1.1.1.2. Stockage des utilisateurs et privilèges
                -- VII.1.1.1.3. Modifications


                -- VII.1.1.1.1. Privilèges des utilisateurs
                    -- lesona be

                  
                -- VII.1.1.1.2. Stockage des utilisateurs et privilèges
                    -- lesona be



        -- VII.1.2. creation, modification et suppression des utilisateurs
        -- ---------------------------------------------------------------
            -- VII.1.2.1. Creation, modification et supression
            -- VII.1.2.2. Syntaxe
            -- VII.1.2.3. Utilisateur
            -- VII.1.2.4. Mot de passe


            -- VII.1.2.1. Creation, modification et supression
            -- -----------------------------------------------
                -- lesona be


            -- VII.1.2.2. Syntaxe
            -- ------------------

                -- Création
                CREATE USER 'login'@'hote' [IDENTIFIED BY 'mot_de_passe'];

                -- Suppression
                DROP USER 'login'@'hote'; 

            
            -- VII.1.2.3. Utilisateur
            -- ----------------------
                -- VII.1.2.3.1. Login (lesona be)
                -- VII.1.2.3.2. Hôte
                -- VII.1.2.3.3. Renommer l’utilisateur


                -- VII.1.2.3.2. Hôte
                -- -----------------
                    -- Exemples 1:
                    CREATE USER 'max'@'localhost' IDENTIFIED BY 'maxisthebest';
                    CREATE USER 'elodie'@'194.28.12.4' IDENTIFIED BY 'ginko1';
                    CREATE USER 'gabriel'@'arb.brab.net' IDENTIFIED BY 'chinypower';


                    # Exemples
                    -- thibault peut se connecter à partir de n'importe quel hôte dont l'adresse IP commence par 194.28.12.
                    CREATE USER 'thibault'@'194.28.12.%' IDENTIFIED BY 'basketball8';

                    -- joelle peut se connecter à partir de n'importe quel hôte du domaine brab.net
                    CREATE USER 'joelle'@'%.brab.net' IDENTIFIED BY 'singingisfun';

                    -- hannah peut se connecter à partir de n'importe quel hôte
                    CREATE USER 'hannah'@'%' IDENTIFIED BY 'looking4sun';
                    create user 'john'@'localhost' IDENTIFIED BY 'exemple2012';


                -- VII.1.2.3.3. Renommer l’utilisateur
                -- -----------------------------------

                    # Exemple : on renomme max en maxime, en gardant le même hôte.
                    RENAME USER 'max'@'localhost' TO 'maxime'@'localhost';


            -- VII.1.2.4. Mot de passe
            -- -----------------------
                -- VII.1.2.4.1. Modifier le mot de passe
                
                -- Exemple
                SET PASSWORD FOR 'thibault'@'194.28.12.%' = PASSWORD('basket8');



        -- VII.1.3. Les privileges - introductions
        -- ---------------------------------------
            -- VII.1.3.1. Les differents privileges
            -- VII.1.3.2. Les differents niveaux d'application des privileges

            # Lesona be


        -- VII.1.4. Ajout et revocation de privilege
        -- -----------------------------------------
            -- VII.1.4.1. Ajout de privileges
            -- VII.1.4.2. Revocation de privileges 


            -- VII.1.4.1. Ajout de privileges
            -- ------------------------------
                -- VII.1.4.1.1. Syntaxe
                GRANT privilege [(liste_colonnes)] [, privilege [(liste_colonnes)],...]
                ON [type_objet] niveau_privilege
                TO utilisateur [IDENTIFIED BY mot_de_passe];

                # Exemples
                # 1. On crée un utilisateur 'john'@'localhost', en lui donnant les privilèges SELECT, INSERT
                # et DELETE sur la table elevage.Animal, et UPDATE sur les colonnes nom, sexe et commentaires
                # de la table elevage.Animal.  

                GRANT SELECT,
                UPDATE (nom, sexe, commentaires),
                DELETE,
                INSERT
                ON mysqladminpdf.Animal
                TO 'john'@'localhost';

                
                # 2. On accorde le privilège SELECT à l’utilisateur 'john'@'localhost' sur la table elevage.
                # Espece, et on modifie son mot de passe.


                GRANT SELECT
                ON TABLE mysqladminpdf.Espece -- On précise que c'est une table (facultatif)
                TO 'john'@'localhost';

                # On accorde à 'john'@'localhost' le privilège de créer et exécuter des procédures stockées
                # dans la base de données elevage. 

                GRANT CREATE ROUTINE, EXECUTE
                ON elevage.*
                TO 'john'@'localhost';



            -- VII.1.4.2. Revocation de privileges 
            -- -----------------------------------
                REVOKE privilege [, privilege, ...]
                ON niveau_privilege
                FROM utilisateur;

                # Exemple
                REVOKE DELETE ON mysqladminpdf.Animal FROM 'john'@'localhost';


        -- VII.1.5. Privileges particuliers
        -- --------------------------------
            -- VII.1.5.1. Les privileges All, Usage, Grant OPTION
            -- VII.1.5.2. Particularite des triggers, vues et procedures stockees
        

            -- VII.1.5.1. Les privileges All, Usage, Grant OPTION
            -- --------------------------------------------------
                -- VII.1.5.1.1. ALL
                -- VII.1.5.1.2. USAGE
                -- VII.1.5.1.3. GRANT OPTION


                -- VII.1.5.1.1. ALL
                -- ----------------
                    # Exemple : on accorde tous les droits sur la table Client à 'john'@'localhost'.
                    GRANT ALL
                    ON mysqladminpdf.Client
                    TO 'john'@'localhost';  


                -- VII.1.5.1.2. USAGE
                -- ------------------
                    # Exemple : modification du mot de passe de 'john'@'localhost'. Ses privilèges ne changent pas.
                    GRANT USAGE
                    ON *.*
                    TO 'john'@'localhost';


                -- VII.1.5.1.3. GRANT OPTION
                -- -------------------------

                    # Exemple : on accorde les privilèges SELECT, UPDATE, INSERT, DELETE et GRANT OPTION sur la base de données elevage à 'joseph'@'localhost'.
                    GRANT SELECT, UPDATE, INSERT, DELETE, GRANT OPTION on mysqladminpdf.* TO 'john'@'localhost';

                    -- OU

                    GRANT SELECT, UPDATE, INSERT, DELETE ON mysqladminpdf.* TO 'john'@'localhost' WITH GRANT OPTION;



            -- VII.1.5.2. Particularite des triggers, vues et procedures stockees
            -- ------------------------------------------------------------------
                -- VII.1.5.2.1. Préciser et modifier le définisseur
                -- VII.1.5.2.2. Modification du contexte

                    # Exemple : avec l’utilisateur sdz, on définit une procédure faisant une requête SELECT sur la
                    # table Adoption. On exécute ensuite cette procédure avec l’utilisateur john, qui n’a aucun droit
                    # sur la table Adoption.

                    USE elevage;

                    DELIMITER |

                    DROP PROCEDURE test_definer|

                    CREATE PROCEDURE test_definer()
                    BEGIN
                    SELECT * FROM Adoption;
                    END |

                    DELIMITER ;

                    SELECT * FROM Adoption;
                    CALL test_definer();



                -- VII.1.5.2.1. Préciser et modifier le définisseur
                -- ------------------------------------------------
                    # Exemple : définition de deux procédures stockées avec l’utilisateur root (le seul ayant le
                    # privilège SUPER sur notre serveur), l’une avec root pour DEFINER (CURRENT_USER()), l’autre
                    # avec john.

                    DELIMITER |
                    CREATE DEFINER = CURRENT_USER() PROCEDURE test_definer2()
                    BEGIN
                        SELECT * FROM Race ; 
                    END | # utilisateur root ihany io no mandeha

                    
                    CREATE DEFINER = 'john'@'localhost' PROCEDURE test_definer3()
                    BEGIN
                    SELECT * FROM Race;
                    END |
                    DELIMITER ;

                    CALL test_definer2();
                    CALL test_definer3();


                -- VII.1.5.2.2. Modification du contexte
                -- -------------------------------------
                
                -- Vues
                CREATE [OR REPLACE]
                [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
                [DEFINER = { utilisateur | CURRENT_USER }]
                [SQL SECURITY { DEFINER | INVOKER }]
                VIEW nom_vue [(liste_colonnes)]
                AS requete_select
                [WITH [CASCADED | LOCAL] CHECK OPTION]

                -- Procédures
                CREATE
                [DEFINER = { utilisateur | CURRENT_USER }]
                PROCEDURE nom_procedure ([parametres_procedure])
                SQL SECURITY { DEFINER | INVOKER }
                corps_procedure;

                # Exemple : création, par l’utilisateur root, de deux vues avec des contextes de vérification des
                # privilèges différents.

                CREATE DEFINER = CURRENT_USER
                SQL SECURITY DEFINER
                VIEW test_contexte1
                AS SELECT * FROM Race;

                CREATE DEFINER = CURRENT_USER
                SQL SECURITY INVOKER
                VIEW test_contexte2
                AS SELECT * FROM Race;


                GRANT SELECT ON mysqladminpdf.test_contexte1 TO 'john'@'localhost';
                GRANT SELECT ON mysqladminpdf.test_contexte2 TO 'john'@'localhost';


                SELECT * FROM test_contexte1;
                SELECT * FROM test_contexte2;



        -- VII.1.6. Options supplementaires
        -- --------------------------------
            -- VII.1.6.1. Limitation des ressources
            -- VII.1.6.2. Connexion SSL
            -- VII.1.6.3. En resume


            -- VII.1.6.1. Limitation des ressources
            -- ------------------------------------
                # Exemple : création d’un compte 'aline'@'localhost' ayant tous les droits sur la base de
                # données elevage, mais avec des ressources limitées.

                # Tsy mandeha ny code rehetra momba ity section ity.


                GRANT ALL ON mysqladminpdf.*
                TO 'aline'@'localhost' 
                WITH MAX_QUERIES_PER_HOUR 50
                MAX_CONNECTIONS_PER_HOUR 5;

                
                # Exemple
                GRANT USAGE ON *.*
                TO 'john'@'localhost'
                WITH MAX_UPDATES_PER_HOUR 15;


                # Exemple
                GRANT USAGE ON *.*
                TO 'john'@'localhost'
                WITH MAX_UPDATES_PER_HOUR 0;



    -- VII.2. Information sur la base de donnee et les requetes
    -- --------------------------------------------------------
        -- VII.2.1. commande de description
        -- VII.2.2. la base de donnee information_schema
        -- VII.2.3. Deroulement d'une requete de selection


        -- VII.2.1. commande de description (show et describe)
        -- --------------------------------
            -- VII.2.1.1. Description d'objets
            -- VII.2.1.2. Requete de creation d'un objet
        

            -- VII.2.1.1. Description d'objets
            -- -------------------------------
                -- syntaxe
                show objets;


                # Exemple:
                show tables;


                # Exemple 1 : sélection des colonnes d’Adoption dont le nom commence par ”date”.
                
                SHOW COLUMNS
                FROM Adoption
                LIKE 'date%';

#
                #Exemple 2 : sélection des encodages contenant ”arab” dans leur description.
                SHOW CHARACTER SET
                WHERE Description LIKE '%arab%';



            -- VII.2.1.2. Requete de creation d'un objet
            -- -----------------------------------------

                # Exemple 1 : requête de création de la table Espece.
                SHOW CREATE TABLE Espece \G

                # Le \G est un délimiteur, comme ; . Il change simplement la manière d’afficher le résultat,
                # qui ne sera plus sous forme de tableau, mais formaté verticalement. Pour les requêtes de
                # description comme SHOW CREATE, qui renvoient peu de lignes (ici : une) mais contenant
                # beaucoup d’informations, c’est beaucoup plus lisible.


                # Exemple 2 : requête de création du trigger before_insert_adoption.
                SHOW CREATE TRIGGER before_insert_adoption \G


        -- VII.2.2. la base de donnee information_schema
        -- ---------------------------------------------
            show tables from information_schema;


            show columns from views from information_schema;

            USE information_schema; -- On sélectionne la base de données

            SELECT TABLE_SCHEMA, TABLE_NAME, VIEW_DEFINITION, IS_UPDATABLE, DEFINER, SECURITY_TYPE
            FROM VIEWS
            WHERE TABLE_NAME = 'V_Animal_details' \G


            # Exemple 1 : données sur les contraintes de la table Animal.
            SELECT CONSTRAINT_SCHEMA, CONSTRAINT_NAME, TABLE_NAME, CONSTRAINT_TYPE
            FROM TABLE_CONSTRAINTS
            WHERE CONSTRAINT_SCHEMA = 'mysqladminpdf' AND TABLE_NAME = 'Animal';


            # Exemple 2 : données sur la procédure maj_vm_revenus().
            SELECT ROUTINE_NAME, ROUTINE_SCHEMA, ROUTINE_TYPE, ROUTINE_DEFINITION, DEFINER, SECURITY_TYPE
            FROM ROUTINES
            WHERE ROUTINE_NAME = 'maj_vm_revenus' \G


        -- VII.2.3. Deroulement d'une requete de selection
        -- -----------------------------------------------
            -- VII.2.3.0.1. Savoir sur quelle colonne ajouter un index
            -- VII.2.3.0.2. Comparer le plan d’exécution de plusieurs requêtes
            -- VII.2.3.1. En resume (lesona be)

            # Exemple
            use mysqladminpdf;

            EXPLAIN SELECT Animal.nom, Espece.nom_courant AS espece, Race.nom AS race
            FROM Animal
            INNER JOIN Espece ON Animal.espece_id = Espece.id
            LEFT JOIN Race ON Animal.race_id = Race.id
            WHERE Animal.id = 37;



            -- VII.2.3.0.1. Savoir sur quelle colonne ajouter un index
            -- ------------------------------------------------------
                EXPLAIN SELECT Animal.nom, Adoption.prix, Adoption.date_reservation
                FROM Animal
                INNER JOIN Adoption ON Adoption.animal_id = Animal.id
                WHERE date_reservation >= '2012-05-01' \G


                ALTER TABLE Adoption ADD INDEX ind_date_reservation (date_reservation);    
                ALTER TABLE Adoption ADD INDEX ind_date_reservation (date_reservation);    



            -- VII.2.3.0.2. Comparer le plan d’exécution de plusieurs requêtes
            -- ---------------------------------------------------------------
                # Exemple
                EXPLAIN SELECT *
                FROM VM_Revenus_annee_espece
                WHERE somme/2 > 1000 \G

                EXPLAIN SELECT *
                FROM VM_Revenus_annee_espece
                WHERE somme > 1000*2 \G



    -- VII.3. Configuration et OPTIONS
    -- -------------------------------
        -- VII.3.1. Variable systeme
        -- VII.3.2. Modification des variables systeme avec SET
        -- VII.3.3. Options au demarage du client MYSQL
        -- VII.3.4. Options au demmarage du serveur mysqld
        -- VII.3.5. Fichier de configuration


        -- VII.3.1. Variable systeme
        -- -------------------------
            -- VII.3.1.1. Niveau des variables systeme
            show variables;


            #Exemple 1 : variables en rapport avec l’auto-incrémentation.
            SHOW VARIABLES LIKE '%auto_increment%';
    

            #Exemple 2 : affichage de la valeur de unique_checks.
            
            SHOW VARIABLES LIKE 'unique_checks';


            # Exemple
            SELECT @@autocommit;



            -- VII.3.1.1. Niveau des variables systeme
            -- ---------------------------------------
                -- VII.3.1.1.1. Variables système n’existant qu’à un niveau

                    SHOW GLOBAL VARIABLES;
                    SHOW SESSION VARIABLES;

                    SELECT @@GLOBAL.nom_variable;
                    SELECT @@SESSION.nom_variable;


                -- VII.3.1.1.1. Variables système n’existant qu’à un niveau
                -- --------------------------------------------------------

                #Exemples : last_insert_id n’existe qu’au niveau de la session, max_connections n’existe qu’au niveau global.
                
                    SHOW VARIABLES LIKE 'last_insert_id';
                    SHOW SESSION VARIABLES LIKE 'last_insert_id';
                    SHOW GLOBAL VARIABLES LIKE 'last_insert_id';


                    SHOW VARIABLES LIKE 'max_connections';
                    SHOW SESSION VARIABLES LIKE 'max_connections';
                    SHOW GLOBAL VARIABLES LIKE 'max_connections';


                    SELECT @@max_connections AS max_connections, @@last_insert_id AS last_insert_id;
                    SELECT @@GLOBAL.max_connections AS max_connections,
                    @@SESSION.last_insert_id AS last_insert_id;


                    SELECT @@SESSION.max_connections;
                    SELECT @@GLOBAL.last_insert_id;




        -- VII.3.2. Modification des variables systeme avec SET
        -- ----------------------------------------------------
            -- VII.3.2.1. Effet de la modification selon le niveau
            -- VII.3.2.2. Les commandes SET speciales


                # Deux syntaxes sont possibles avec SET :
                SET niveau nom_variable = valeur;

                -- OU

                SET @@niveau.nom_variable = valeur;


                # Exemples
                SET SESSION max_tmp_tables = 5; -- Nombre maximal de tables temporaires
                SET @@GLOBAL.storage_engine = InnoDB; -- Moteur de stockage par défaut

                -- Exemples
                SET max_tmp_tables = 12;
                SET @@max_tmp_tables = 8;

                SET @@max_connections = 200;


            -- VII.3.2.1. Effet de la modification selon le niveau
            -- ---------------------------------------------------
                SELECT @@GLOBAL.storage_engine, @@SESSION.storage_engine;


            -- VII.3.2.2. Les commandes SET speciales
            -- --------------------------------------
                -- syntaxe
                SET NAMES encodage;

                SET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL { REPEATABLE
                    READ | READ COMMITTED | READ UNCOMMITTED | SERIALIZABLE }




        -- VII.3.3. Options au demarage du client MYSQL
        -- --------------------------------------------
            -- Exemple
            SELECT id, nom, espece_id, prix
            FROM Race;

            



        -- VII.3.4. Options au demmarage du serveur mysqld
        -- -----------------------------------------------





        -- VII.3.5. Fichier de configuration
        -- ---------------------------------
            -- VII.3.5.1. Emplacement du fichier
            -- VII.3.5.2. Structure du fichier
            -- VII.3.5.3. En resume