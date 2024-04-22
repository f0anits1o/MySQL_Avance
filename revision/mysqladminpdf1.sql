-- Active: 1713698041328@@127.0.0.1@3306@elevage
CREATE DATABASE elevage CHARACTER SET 'utf8';

USE elevage;

CREATE TABLE animal (
  id smallint unsigned not null auto_increment,
  espece varchar(40) not null,
  sex char(1),
  date_naissance datetime not null,
  nom varchar(30),
  commentaires text,
  primary key(id)
)
engine = innodb;

SHOW TABLES;

DESC animal;

DESCRIBE animal;

# desc is a short for  DESCRIBE

-- -------------------------------------
-- Modification d'une table avec ALTER
-- -------------------------------------

create table test_tuto(
  id int not null,
  nom varchar(10) not null,
  primary key(id)
);


    -- Alter ajout des colonnes (after et first)
        alter table test_tuto add column date_insertion date not null after id;

        # Verrification
        desc test_tuto;

        alter table test_tuto add type boolean first;


    -- Alter modifier le propriete d'un attribut
        alter table test_tuto modify type boolean default 0;


    -- Alter: changer le nom d'un attribut
        alter table test_tuto change nom anarana varchar(40) not null; # aza adino ny type an'ilay attribut 

    -- Insertion de donnee de donnee (page 73)
    -- Insertion sans preciser les colonnes
    INSERT INTO Animal
    VALUES (2, 'chat', NULL, '2010-03-24 02:23:00', 'Roucky', NULL);

    INSERT INTO Animal 
    VALUES (1, 'chien', 'M', '2010-04-05 13:43:00', 'Rox',
    'Mordille beaucoup');

    INSERT INTO Animal
    VALUES (NULL , 'chat', 'F', '2010-09-13 15:02:00',
    'Schtroumpfette', NULL);

    select * from animal;

    -- ------------------------------------
    --  Insertion en précisant les colonnes
    -- ------------------------------------
    DESC ANIMAL;

    ALTER TABLE ANIMAL change sex sexe char(1);


    INSERT INTO Animal (espece, sexe, date_naissance)
    VALUES ('tortue', 'F', '2009-08-03 05:12:00');

    INSERT INTO Animal (nom, commentaires, date_naissance, espece)
    VALUES ('Choupi', 'Né sans oreille gauche',
    '2010-10-03 16:44:00', 'chat');


    INSERT INTO Animal (espece, date_naissance, commentaires, nom,
    sexe)
    VALUES ('tortue', '2009-06-13 08:17:00', 'Carapace bizarre',
    'Bobosse', 'F');


    -- ---------------------------------------
    --  Insertion multiple
    -- ---------------------------------------

    INSERT INTO Animal (espece, sexe, date_naissance, nom)
    VALUES ('chien', 'F', '2008-12-06 05:18:00', 'Caroline'),
    ('chat', 'M', '2008-09-11 15:38:00', 'Bagherra'),
    ('tortue', NULL, '2010-08-23 05:18:00', NULL);

    select * from animal;


  -- -------------------------------
  -- Operateur
  -- -------------------------------

    select * from animal where espece <> 'chat';
  -- <> ~ != ~ different

  -- operateur AND: and ~ &&
    select * from animal where espece = 'chat' && sexe = 'F';

  -- operateur or: or ~ ||
    select * from animal where espece = 'peroquet'
    or espece = 'tortue';

    select * from animal where espece = 'tortue' || espece = 'perroquet';

    # Je vous conseille d’utiliser plutôt OR que ||, car dans la majorité des SGBDR (et dans la
    # norme SQL), l’opérateur || sert à la concaténation. C’est-à-dire à rassembler plusieurs
    # chaînes de caractères en une seule. Il vaut donc mieux prendre l’habitude d’utiliser OR, au
    # cas où vous changeriez un jour de SGBDR (ou tout simplement parce que c’est une bonne
    # habitude).

  -- operateur NOT
    select * from animal where sexe = 'F' and not espece = 'chien';

  -- operateur XOR
    select * from animal where sexe = 'M' XOR espece = 'perroquet';
    # Sélection des animaux qui sont soit des mâles, soit des perroquets (mais pas les deux) 


  -- NULL
    SELECT *
    FROM Animal
    WHERE nom = NULL; -- sélection des animaux sans nom


    SELECT *
    FROM Animal
    WHERE nom <=> NULL;

    -- OU
    SELECT *
    FROM Animal
    WHERE nom IS NULL;


  -- NOT NULL
    SELECT *
    FROM Animal
    WHERE commentaires IS NOT NULL; -- sélection des animaux pour lesquels un commentaire existe

  -- Tri des donnees
    select * from animal where espece = 'chien' order by date_naissance;

    select * from animal where espece = 'chien' and nom is not NULL
    order by nom desc;

    select * from animal order by espece, date_naissance;


  -- ---------------------------------------
  -- Eliminer les doublons
  -- ---------------------------------------

  select espece from animal;

  select distinct espece from animal;

  -- ---------------------------------------
  -- RESTREINDRE LES RESULTATS
  -- ---------------------------------------

    select * from animal order by id limit 6;

    select * from animal order by id limit 6 offset 6;

    select * from animal order by id limit 6 offset 0;



-- -------------------------------
-- JOKER _ and % (\ ~ echapement)
-- -------------------------------

  -- Echapement
    insert into animal value
    (35, 'chat', 
    'F', 
    '2008-04-20 03:20:00','
    bibla', 
    'Sourde de l\'oreille droite 80%' );

  -- Joker
    select * from animal where commentaires like '%\%%';

    select * from animal where nom not like '%a%';

  --  Sensibilité à la casse
    select * from animal where nom like '%ou%'; -- insensative case

    select * from animal where nom like binary '%Ou%'; -- sensative case    
  
  -- RECHERCHE DANS LE NUMERIQUE
    select * from animal
    where id like "1%";

    select count(*) from animal where id like '1%';  

  -- Recherche dans un intervalle
    select * from animal
        where date_naissance <= '2009-03-23' AND
        date_naissance >= '2008-01-05';

    select * from animal where date_naissance between '2008-01-05' and '2009-03-23';
  

  # BETWEEN peut s’utiliser avec des dates, mais aussi avec des nombres (BETWEEN 0 AND 100) ou
  # avec des chaînes de caractères (BETWEEN 'a' AND 'd') auquel cas c’est l’ordre alphabétique
  # qui sera utilisé (toujours insensible à la casse sauf si l’on utilise des chaînes binaires : BETWEEN
  # BINARY 'a' AND BINARY 'd'). Bien évidemment, on peut aussi exclure un intervalle avec NOT
  # BETWEEN. 

select * from animal where nom in ('Moka', 'bibla', 'Tortila', 'Balou', 'Dana', 'Redbul', 'Gingko');

  -- Suppession (delete)
    delete from animal where nom = 'Zoulou';

  -- Modification (update)

    update animal set sexe='F', nom='Pataude' where id=21;

---------------------------------------------
--              Deuxieme partie            --
--      Index, jointure et sous-requetes   --
-- ------------------------------------------

#  les tables de partie 1 ne sont pas reprises

set names utf8;

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

select * from animal;

#################################################################################
#                                                                               #
# Type INDEX:                                                                   #
#             * Unique,                                                         #
#             * fulltext,                                                       #
#             * and spatial.                                                    #
#                                                                               #
# (mila manao recherche momba anio index spatial io)                            #
# index Fulltext => MyIsam ihany afaka mampiasa azy (varchar, char and text)    #
#                                                                               #
#################################################################################


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

  desc test_tuto;

  ALTER TABLE test_tuto ADD COLUMN fanampin_anarana VARCHAR(50) NOT NULL AFTER anarana;
  ALTER TABLE Test_tuto ADD INDEX ind_fanampin_anarana (fanampin_anarana);
  DESC TEST_TUTO;


--  Ajout avec CREATE INDEX
-- -------------------------

##################### SYNTAXE ######################
CREATE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée unindex simple

CREATE UNIQUE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée un index UNIQUE

CREATE FULLTEXT INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]); -- Crée un index FULLTEXT


-- syntaxe UNIQUE
-- --------------
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
-- ----------------------
ALTER TABLE nom_table
DROP INDEX nom_index;

################## Fin Syntaxe #####################


CREATE INDEX ind_anarana ON Test_tuto (anarana);

desc test_tuto;


-- Insertion des donnees sur le table libre:
-- -----------------------------------------

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


###########################################################
#                                                         #
#  Il existe trois types de recherche FULLTEXT :          #
#    - la recherche naturelle,                            #
#    - la recherche avec booléen,                         #
#    - et enfin la recherche avec extension de requête.   #
#                                                         #
###########################################################


--  Recherche naturelle
--  -------------------

  --  Syntaxe:
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

  # tsy mampiova na inona na inona ny ORDER BY

  SELECT *
  FROM Livre
  WHERE MATCH(titre, auteur)
  AGAINST ('Jules Verne'); 

  SELECT *, MATCH(titre, auteur) AGAINST ('Jules Verne Lune') as pertinance
  FROM Livre;


-- Recherche avec booléens
-- -----------------------
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


###################################################################################################
#                                                                                                 # 
# Pour spécifier un groupe de mots exigés, on utilise les doubles guillemets. Tous les mots entre #
# doubles guillemets devront non seulement être présents mais également apparaître dans l’ordre   #
# donné, et sans rien entre eux. Il faudra donc que l’on retrouve exactement ces mots pour avoir  #
# un résultat.                                                                                    #
#                                                                                                 #
###################################################################################################


  SELECT *
  FROM Livre
  WHERE MATCH(titre)
  AGAINST ('petit*' IN BOOLEAN MODE);


-- Recherche sur titre et auteur, de tous les mots commençant par ”d”
-- -----------------------------------------------------------------
  
  SELECT *
  FROM Livre
  WHERE MATCH(titre, auteur)
  AGAINST ('d*' IN BOOLEAN MODE);  

create table stateArea(
  state varchar(20) not null,
  area int not null
) engine = csv;

