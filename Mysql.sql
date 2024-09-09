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


-- I.10.3. Modification page 101

UPDATE Animal
SET sexe='F', nom='Pataude'
WHERE id=21;

/*      Deuxième partie

Index, jointures et sous-requêtes

II.1.3.1.2. Liste d’index*/

CREATE TABLE Animal0 (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
espece VARCHAR(40) NOT NULL,
sexe CHAR(1),
date_naissance DATETIME NOT NULL,
nom VARCHAR(30),
commentaires TEXT,
PRIMARY KEY (id),
INDEX ind_date_naissance (date_naissance), -- index sur ladate de naissance  
INDEX ind_nom (nom(10)) --
/*index sur le nom(le chiffre entre parenthèses étant le nombre de caractères
pris en compte)*/
 )
ENGINE=INNODB;

/*
création de la table Animal comme précédemment, en ajoutant un index UNIQUE
sur (nom, espece).*/

CREATE TABLE Animal1 (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
espece VARCHAR(40) NOT NULL,
sexe CHAR(1),
date_naissance DATETIME NOT NULL,
nom VARCHAR(30),
commentaires TEXT,
PRIMARY KEY (id),
INDEX ind_date_naissance (date_naissance),
INDEX ind_nom (nom(10)),
UNIQUE INDEX ind_uni_nom_espece (nom, espece) -- Index sur lenom et l'espece
)
ENGINE=INNODB;

-- II.1.3.2.1. Ajout index avec ALTER TABLE

ALTER TABLE test_tuto
ADD INDEX ind_id (id);

alter table test_tuto add COLUMN nom varchar(24) not NULL;

/*
Exemple : l’équivalent de la commande ALTER TABLE que nous avons
utilisée pour ajouter un index sur la colonne nom est donc :
*/

CREATE INDEX ind_nom
ON Test_tuto (nom);

CREATE TABLE Livre (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
auteur VARCHAR(50),
titre VARCHAR(200)
) ENGINE = MyISAM;

 INSERT INTO Livre (auteur, titre) VALUES 
('Daniel Pennac', 'Au bonheur des ogres'),
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

CREATE FULLTEXT INDEX ind_full_titre -- ind_full: index fulltext
ON Livre (titre);

CREATE FULLTEXT INDEX ind_full_aut
ON Livre (auteur);

CREATE FULLTEXT INDEX ind_full_titre_aut
ON Livre (titre, auteur);

/*
II.1.4.2. Les types de recherche

Il existe trois types de recherche FULLTEXT : la recherche naturelle,
la recherche avec booléen, et enfin la recherche avec extension de requête.

*/

-- II.1.4.2.1. Recherche naturelle
SELECT * FROM Livre WHERE MATCH(auteur) AGAINST ('Terry');


SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('Petite');

SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('Petit');
#jereo tsara ny remarque ao amin'ny page 121

/*
La pertinence est une valeur supérieure ou égale à 0 qui qualifie le résultat d’une recherche
FULLTEXT sur une ligne. Si la ligne ne correspond pas du tout à la recherche, sa pertinence sera
de 0. Si par contre elle correspond à la recherche, sa pertinence sera supérieure à 0. Ensuite, plus
la ligne correspond bien à la recherche (nombre de mots trouvés par exemple), plus la pertinence
sera élevée. Vous pouvez voir la pertinence attribuée à une ligne en mettant l’expression MATCH...
AGAINST dans le SELECT.
*/

SELECT *, MATCH(titre, auteur) AGAINST ('Jules Verne Lune')
FROM Livre;

-- II.1.4.2.2. Recherche avec booléens
SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('+bonheur -ogres' IN BOOLEAN MODE);


/*
Pour spécifier un groupe de mots exigés, on utilise les doubles guillemets. 
Tous les mots entre doubles guillemets devront non seulement être présents mais également
apparaître dans l’ordre donné, et sans rien entre eux. Il faudra donc que l’on retrouve
exactement ces mots pour avoir un résultat:

Exemple : recherche sur titre, qui doit contenir tout le groupe de mot entre guillemets doubles.
*/

SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('"Terre à la Lune"' IN BOOLEAN MODE);

-- tsy mandeha io 2 ambany io :)
SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('"Lune à la Terre"' IN BOOLEAN MODE);

SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('"Terre la Lune"' IN BOOLEAN MODE);

/*
La première requête renverra bien un résultat, contrairement à la seconde 
(car les mots ne sont pas dans le bon ordre) et à la troisième (car il manque
le ”à” dans la recherche - ou il y a un ”à” en trop dans la ligne, ça dépend 
du point de vue). ”Voyage au centre de la Terre” n’est pas un résultat puisque
seul le mot ”Terre” est présent.

Pour utiliser l’astérisque, il suffit d’écrire le début du mot dont on est sûr,
et de compléter avec un astérisque.
Exemple : recherche sur titre, sur tous les mots commençant par ”petit”.

*/
SELECT * FROM Livre WHERE MATCH(titre) AGAINST ('petit*' IN BOOLEAN MODE);

SELECT * FROM Livre WHERE MATCH(titre, auteur) AGAINST ('d*' IN BOOLEAN MODE);