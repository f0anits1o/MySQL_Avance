-- Active: 1706482698208@@127.0.0.1@3306@elevage
create database elevage character set 'utf8';

use elevage;

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

desc animal;

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
      



 
