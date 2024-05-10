-- Active: 1715343469239@@127.0.0.1@3306@fiompina
                    #########################################
                    #                                       #
                    #          Deuxieme partie              #
                    #   Index, jointures et sous-requetes   #
                    #                                       #
                    #########################################

-- II.1. Index
-- II.2. Cles primaires et etrangeres
-- II.3. Jointures
-- II.4. Sous-requetes
-- II.5. Jointures et sous-requetes: modifications de donnees
-- II.6. Union de plusieurs requetes
-- II.7. Option des cles etrangeres
-- II.8. Violation de contrainte d'unicite






-- II.1. Index
-- -----------
    -- II.1.0.1. Etat actuelle de la base de donnees

    -- II.1.1. Qu'est-ce qu'un index ?
        -- II.1.1.1. Interet des index
        -- II.1.1.2. Desavantages
        -- II.1.1.3. Index sur plusieurs colonnes
        -- II.1.1.4. Index sur des colonnes de types alphanumeriques

    -- II.1.2. Les differents types des index
        -- II.1.2.1. Index UNIQUE
        -- II.1.2.1. Index FULLTEXT
        
    -- II.1.3. Creation et suppression des index
        -- II.1.3.1. Ajout des index lors de la creation de la table
        -- II.1.3.2. Ajout des index apres la creation de la table
        -- II.1.3.3. Complement pour la creation d'un index UNIQUE
        -- II.1.3.4. Suppression d'un index

    -- II.1.4. Recherches avec FULLTEXT
        -- II.1.4.1. Comment fonctionne la recherche FULLTEXT
        -- II.1.4.2. Les types de recherche
        -- II.1.4.3. En resume



    -- II.1.0.1. Etat actuelle de la base de donnees
    -- --------------------------------------------

        SET NAMES utf8;


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



    -- II.1.1. Qu'est-ce qu'un index ?
    -- ------------------------------
        -- II.1.1.1. Interet des index
        -- II.1.1.2. Desavantages
        -- II.1.1.3. Index sur plusieurs colonnes
        -- II.1.1.4. Index sur des colonnes de types alphanumeriques


        # Revoyons la définition d’un index.
        

        # => Structure de données qui reprend la liste ordonnée des valeurs auxquelles il se rapporte.
        
        # Lorsque vous créez un index sur une table, MySQL stocke cet index sous forme d’une structure
        # particulière, contenant les valeurs des colonnes impliquées dans l’index. Cette structure stocke
        # les valeurs triées et permet d’accéder à chacune de manière efficace et rapide.

        # || Pour permettre une compréhension plus facile, je représente ici l’index sous forme de table.
        # || En réalité, par défaut, MySQL stocke les index dans une structure de type ”arbre” (l’index
        # || est alors de type BTREE). Le principe est cependant le même.

        
        -- II.1.1.1. Interet des index
        -- ---------------------------

        # Vous devriez avoir compris maintenant que tout l’intérêt des index est d’accélérer les requêtes
        # qui utilisent des colonnes indexées comme critères de recherche. Par conséquent, si vous savez
        # que dans votre application, vous ferez énormément de recherches sur la colonne X, ajoutez donc
        # un index sur cette colonne, vous ne vous en porterez que mieux.
        
        # Les index permettent aussi d’assurer l’intégrité des données de la base. Pour cela, il existe en fait
        # plusieurs types d’index différents, et deux types de ”clés”. Lorsque je parle de garantir l’intégrité
        # de vos données, cela signifie en gros garantir la qualité de vos données, vous assurer que vos
        # données ont du sens. Par exemple, soyez sûrs que vous ne faites pas référence à un client dans la
        # table Commande, alors qu’en réalité, ce client n’existe absolument pas dans la table Client.



        -- II.1.1.2. Desavantages
        -- ----------------------

            # Si tout ce que fait un index, c’est accélérer les requêtes utilisant des critères de recherche
            # correspondants, autant en mettre partout, et en profiter à chaque requête ! Sauf qu’évidemment,
            # ce n’est pas si simple, les index ont deux inconvénients.
            
            # — Ils prennent de la place en mémoire
            # — Ils ralentissent les requêtes d’insertion, modification et suppression, puisqu’à chaque fois,
            #   il faut remettre l’index à jour en plus de la table.
            
            # Par conséquent, n’ajoutez pas d’index lorsque ce n’est pas vraiment utile.



        -- II.1.1.3. Index sur plusieurs colonnes
        -- --------------------------------------

            # cas pratique io mazava


        -- II.1.1.4. Index sur des colonnes de types alphanumeriques
        -- ---------------------------------------------------------




    -- II.1.2. Les differents types des index
    -- --------------------------------------
        -- II.1.2.1. Index UNIQUE 
        -- II.1.2.2. Index FULLTEXT


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
        -- --------------

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
        
            DESC test_tuto;
        
            ALTER TABLE test_tuto ADD COLUMN fanampin_anarana VARCHAR(50) NOT NULL AFTER anarana;
            ALTER TABLE Test_tuto ADD INDEX ind_fanampin_anarana (fanampin_anarana);
            
            DESC TEST_TUTO;
        
        
        --  Ajout avec CREATE INDEX
        -- -------------------------
        
        ######################## SYNTAXE #################################################
        #  
        #    CREATE 
        #    INDEX nom_index
        #    ON 
        #    nom_table (colonne_index [, colonne2_index ...]); -- Crée unindex simple
        #    
        #    CREATE 
        #    UNIQUE INDEX nom_index
        #    ON 
        #    nom_table (colonne_index [, colonne2_index ...]); -- Crée un index UNIQUE
        #    
        #    CREATE
        #    FULLTEXT INDEX nom_index
        #    ON 
        #    nom_table (colonne_index [, colonne2_index ...]); -- Crée un index FULLTEXT
        #
        #
        #
        #
        #   -- syntaxe UNIQUE
        #   -- --------------
        #   
        #   CREATE TABLE nom_table (
        #           colonne1 INT NOT NULL,
        #           colonne2 VARCHAR(40),
        #           colonne3 TEXT,
        #       CONSTRAINT [symbole_contrainte]
        #       UNIQUE 
        #       [INDEX] ind_uni_col2 (colonne2)
        #   );
        #   
        #   
        #   ALTER TABLE nom_table
        #   ADD CONSTRAINT [symbole_contrainte] UNIQUE ind_uni_col2 (colonne2);
        #   
        #
        #   -- Suppression d’un index
        #   -- ----------------------
        #   ALTER TABLE nom_table
        #   DROP INDEX nom_index;
        #
        ######################################### Fin Syntaxe ###################################
        
        
        CREATE INDEX ind_anarana ON Test_tuto (anarana);
        
        DESC test_tuto;
        
        
        -- Insertion des donnees sur le table livre:
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
        
        

        # aza adino ny regle, ao amin ny recherche booleen no manazava tsara an ilay 50%

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
        
            #*************************SYNTAXE**************************# 
            # SELECT *                                                 #
            # FROM nom_table                                           #
            # WHERE MATCH(colonne1[, colonne2, ...])                   #
            # AGAINST ('chaîne recherchée' IN NATURAL LANGUAGE MODE);  #
            #                                                          #
            #***********************************************************
        
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


            SELECT *
            FROM Livre
            WHERE MATCH(titre, auteur)
            AGAINST ('d*' IN BOOLEAN MODE);
            -- recherche sur titre et auteur, de tous les mots commençant par ”d”
            
            SELECT *
            FROM Livre
            WHERE MATCH(titre)
            AGAINST ('+petit* -prose' IN BOOLEAN MODE);
            -- mix d'un astérisque avec les + et -
            


            -- la recherche avec extension de requête.
            -- ---------------------------------------
            
            SELECT *
            FROM Livre
            WHERE MATCH(titre, auteur)
            AGAINST ('Daniel');
            
            SELECT *
            FROM Livre
            WHERE MATCH(titre, auteur)
            AGAINST ('Daniel' WITH QUERY EXPANSION);


-- II.2. Cles primaires et etrangeres
-- ----------------------------------
    -- II.2.1. Cles primaires, le retour
    -- II.2.2. Cles etrangers,
    -- II.2.3. Modification de notre base


    -- II.2.1. Cles primaires, le retour
    -- ---------------------------------
        -- II.2.1.1. Choix de la cle primaire
        -- II.2.1.2. Creation d'une cle primaire
        -- II.2.1.3. Suppression de la cle primaire


    -- II.2.2. Cles etrangers
    -- ----------------------
        -- II.2.2.1. Creation
        -- II.2.2.2. Suppression d'une cle etrangere


    -- II.2.3. Modification de notre base
    -- ----------------------------------
        -- II.2.3.1. La table Espece
        -- II.2.3.2. la table Animal 
        -- II.2.3.3. En resume



        -- Table espece
        -- ------------
        
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
        
        ALTER TABLE Animal ADD COLUMN espece_id SMALLINT UNSIGNED;
        
        UPDATE animal SET espece_id = 1 WHERE espece = 'chien';
        UPDATE animal SET espece_id = 2 WHERE espece = 'chat';
        UPDATE animal SET espece_id = 3 WHERE espece = 'tortue';
        UPDATE animal SET espece_id = 4 WHERE espece = 'perroquet';

        SELECT * FROM animal;
        
        DESC animal;

        ALTER table animal DROP column espece;
        
        ALTER TABLE animal ADD CONSTRAINT fk_espece_id foreign key (espece_id) references espece(id);


        -- test Puissance foreign key ary ny moteur Innodb
        -- -----------------------------------------------
        
        INSERT INTO Animal 
        (nom, espece_id, date_naissance) 
        VALUES 
        ('Caouette', 5, '2009-02-15 12:45:00');
        
        DESC espece;

        SELECT * FROM espece; -- Tsy misy ao amin'ny espece io id ~ 5 io.
        
        ALTER TABLE Animal
        MODIFY 
        espece_id SMALLINT UNSIGNED NOT NULL;
        
        CREATE UNIQUE INDEX
        ind_uni_nom_espece_id ON Animal 
        (nom,espece_id);



        -- --------------------------
        -- CREATION DE LA TABLE Race3 
        -- --------------------------
        
        
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
        
        ALTER TABLE Animal 
        ADD COLUMN 
        race_id SMALLINT UNSIGNED;
        
        ALTER TABLE Animal
        ADD CONSTRAINT
        fk_race_id FOREIGN KEY (race_id) REFERENCES Race(id);
        
        -- -------------------------
        -- REMPLISSAGE DE LA COLONNE
        -- -------------------------
        UPDATE Animal SET race_id = 1 WHERE id IN (1, 13, 20, 18, 22, 25, 26, 28);
        UPDATE Animal SET race_id = 2 WHERE id IN (12, 14, 19, 7);
        UPDATE Animal SET race_id = 3 WHERE id IN (23, 17, 21, 27);
        UPDATE Animal SET race_id = 4 WHERE id IN (33, 35, 37, 41, 44, 31, 3);
        UPDATE Animal SET race_id = 5 WHERE id IN (43, 40, 30, 32, 42, 34, 39, 8);
        UPDATE Animal SET race_id = 6 WHERE id IN (29, 36, 38);
        
        
        SELECT * FROM Animal;
        
        -- -------------------------------------------------------
        -- AJOUT DES COLONNES mere_id ET pere_id A LA TABLE Animal
        -- -------------------------------------------------------
        
        ALTER TABLE Animal 
        ADD COLUMN mere_id SMALLINT UNSIGNED;
        
        ALTER TABLE Animal
        ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES
        Animal(id);
        
        ALTER TABLE Animal 
        ADD COLUMN pere_id SMALLINT UNSIGNED;
        
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
        
        SELECT * FROM Animal;


------------------------------------------------------------------------------
--****************************************************************************
------------------------------------------------------------------------------

-- II.3. Jointures
-- ---------------
    -- II.3.1. Principe des jointures et notion d'alias
    -- II.3.2. Jointure interne
    -- II.3.3. Jointure externe
    -- II.3.4. Syntaxe Alternatives
    -- II.3.5. Examples d'application et exercices


    -- II.3.1. Principe des jointures et notion d'alias
    -- ------------------------------------------------
        -- II.3.1.1. Principe des jointures
        -- II.3.1.2. Notion d'alias


    -- II.3.2. Jointure interne
    -- ------------------------
        -- II.3.2.1. Syntaxe
        -- II.3.2.2. Pourquoi "interne"


    -- II.3.3. Jointure externe
    -- ------------------------
        -- II.3.3.1. Jointure a gauche
        -- II.3.3.2. Jointure a droite


    -- II.3.4. Syntaxe Alternatives
    -- ----------------------------
        -- II.3.4.1. Jointure avec USING
        -- II.3.4.2. Jointure naturelles
        -- II.3.4.3. Jointure sans JOIN


    -- II.3.5. Examples d'application et exercices
    -- -------------------------------------------
        -- II.3.5.1. A/ Commencons par des choses faciles
        -- II.3.5.2. B/ Compliquons un peu plus les choses
        -- II.3.5.3. C/ Et maintenant, le test ultime
        -- II.3.5.4. En resume


        SELECT Espece.description
        FROM Espece
        INNER JOIN Animal
        ON Espece.id = Animal.espece_id
        WHERE Animal.nom = 'Cartouche';
        
        
        #####################################################################################################################
        #
        #  SELECT Espece.description : je sélectionne la colonne description de la table Espece.
        #  FROM Espece : je travaille sur la table Espece.
        #  INNER JOIN Animal : je la joins (avec une jointure interne) à la table Animal.
        #  ON Espece.id = Animal.espece_id : la jointure se fait sur les colonnes id de la table
        #  Espece et espece_id de la table Animal, qui doivent donc correspondre.
        #  WHERE Animal.nom = 'Cartouche' : dans la table résultant de la jointure, je sélectionne
        #  les lignes qui ont la valeur ”Cartouche” dans la colonne nom venant de la table Animal.
        # 
        # -> SYNTAXE JOINTURE INTERNE
        #
        #  SELECT * -- comme d'habitude, vous sélectionnez les colonnes que vous voulez
        # FROM nom_table1
        # [INNER] JOIN nom_table2 -- INNER explicite le fait qu'il s'agit d'une jointure interne, mais c'est facultatif
        # ON colonne_table1 = colonne_table2 -- sur quelles colonnes se fait la jointure
        # -- vous pouvez mettre colonne_table2 = colonne_table1, l'ordre n'a pasd'importance
        # [WHERE ...]
        # [ORDER BY ...] -- les clauses habituelles sont bien sûr utilisables !
        # [LIMIT ...]
        #
        # FIN SYNTAXE <-
        #
        ###################################################################################################################
        
        
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
        -- -----------------------
        
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


        ########################################################################################################################
        #    
        #    -- Syntaxes alternatives: jointur avec USING
        #    -- -----------------------------------------
        #    
        #    SELECT *
        #    FROM table1
        #    [INNER | LEFT | RIGHT] JOIN table2 USING (colonneJ); -- colonneJ est présente dans les deux tables
        #    
        #    # équivalent à
        #    
        #    SELECT *
        #    FROM table1
        #    [INNER | LEFT | RIGHT] JOIN table2 ON Table1.colonneJ = table2.colonneJ;
        #
        #
        #    
        #    -- Syntaxes alternatives: jointur NATURAL JOIN
        #    -- -------------------------------------------
        #    
        #    # jointure de table1 et table2 (une colonne ayant le même nom : B)
        #
        #    SELECT *
        #    FROM table1
        #    NATURAL JOIN table2;
        #    
        #    # EST ÉQUIVALENT À
        #
        #    SELECT *
        #    FROM table1
        #    INNER JOIN table2
        #    ON table1.B = table2.B;
        #    
        #    # jointure de table1 et table3 (deux colonnes ayant le même nom : A et C)
        #    SELECT *
        #    FROM table1
        #    NATURAL JOIN table3;
        #    
        #    # EST ÉQUIVALENT À
        #    
        #    SELECT *
        #    FROM table1
        #    INNER JOIN table3
        #    ON table1.A = table3.A AND table1.C = table3.C;
        #    
        #    # Pour utiliser ce type de jointure, il faut donc être certain que toutes les colonnes nécessaires
        #    # à la jointure ont le même nom dans les deux tables, mais aussi que les colonnes ayant le même
        #    # nom sont uniquement celles qui servent à la jointure.
        #  
        #    # Notez que vous pouvez également réaliser une jointure externe par la gauche avec les jointures
        #    # naturelles à l’aide de NATURAL LEFT JOIN.
        #    
        #    -- ------------------------------------------
        #    -- Syntaxes alternatives: Jointures sans JOIN
        #    -- ------------------------------------------
        #    
        #    SELECT *
        #    FROM table1, table2
        #    WHERE table1.colonne1 = table2.colonne2;
        #    
        #    -- équivalent à
        #    
        #    SELECT *
        #    FROM table1
        #    [INNER] JOIN table2
        #    ON table1.colonne1 = table2.colonne2;
        #
        ####################################################################################################################


        -- VAKIRAOKA
        -- ---------
        
        DESC ANIMAL;
        
        DESC ESPECE;
        
        SELECT NOM_COURANT FROM ESPECE;
        
        SELECT * FROM ANIMAL WHERE NOM='BERGER';
        
        
        -- ---------------------------
        -- MINI TP
        -- ---------------------------
        
        # 1
        # Vous devez obtenir la liste des races de chiens qui sont des chiens de berger.
        # On considère (même si ce n’est pas tout à fait vrai) que les chiens de berger ont ”berger”
        # dans leur nom de race.
        
        SELECT Race.nom AS Race
        FROM Race
        INNER JOIN Espece ON Espece.id = Race.espece_id
        WHERE Espece.nom_courant = 'chien' AND Race.nom LIKE '%berger%';
        
        
        # 2
        # Vous devez obtenir la liste des animaux (leur nom, date de naissance et race) pour
        # lesquels nous n’avons aucune information sur la couleur que devrait avoir leur
        # pelage. Dans la description des races, j’utilise parfois ”pelage”, parfois ”poils”, et parfois ”robe”.
        
        
        SELECT Animal.nom AS nom_animal, Animal.date_naissance, Race.nom AS race FROM Animal
            LEFT JOIN Race
                ON Animal.race_id = Race.id
        WHERE (Race.description NOT LIKE '%poil%'
            AND Race.description NOT LIKE '%robe%'
            AND Race.description NOT LIKE '%pelage%'
              )
            commentairesOR Race.id IS NULL;
        
        
        # 3
        # Vous devez obtenir la liste des chats et des perroquets amazones, avec leur sexe,
        # leur espèce (nom latin) et leur race s’ils en ont une. Regroupez les chats ensemble,
        # les perroquets ensemble et, au sein de l’espèce, regroupez les races.
        
        SELECT  Animal.nom as nom_animal,
                Animal.sexe,
                Espece.nom_latin as espece, 
                Race.nom as race
        FROM Animal
            INNER JOIN Espece
                ON Animal.espece_id = Espece.id
            LEFT JOIN Race
                ON Animal.race_id = Race.id
        WHERE Espece.nom_courant IN ('Perroquet amazone', 'Chat')
        ORDER BY Espece.nom_latin, Race.nom;
        
        
        # 3
        # Vous devez obtenir la liste des chiennes dont on connaît la race, et qui sont en
        # âge de procréer (c’est-à-dire nées avant juillet 2010). Affichez leur nom, date de
        # naissance et race.
        
        
        SELECT  Animal.nom AS nom_chienne, 
                Animal.date_naissance, 
                Race.nom AS race
        FROM Animal
            INNER JOIN Espece
                ON Animal.espece_id = Espece.id
            INNER JOIN Race
                ON Animal.race_id = Race.id
        WHERE Espece.nom_courant = 'chien'
            AND Animal.date_naissance < '2010-07-01'
            AND Animal.sexe = 'F';
        
        
        # 4
        # Vous devez obtenir la liste des chats dont on connaît les parents, ainsi que le nom de ces parents.
        
        SELECT  Animal.nom, 
                Pere.nom AS Papa, 
                Mere.nom AS Maman 
        FROM Animal
            INNER JOIN Animal AS Pere
                ON Animal.pere_id = Pere.id
            INNER JOIN Animal AS Mere
                ON Animal.mere_id = Mere.id
            INNER JOIN Espece
                ON Animal.espece_id = Espece.id
        WHERE Espece.nom_courant = 'chat';
        
        
        # 5
        # Vous devez obtenir la liste des animaux dont on connaît le père, la mère, la race,
        # la race du père, la race de la mère. Affichez le nom et la race de l’animal et de ses
        # parents, ainsi que l’espèce de l’animal (pas des parents).
        
        SELECT  Espece.nom_courant AS espece, 
                Animal.nom AS nom_animal,
                Race.nom AS race_animal,
                Pere.nom AS papa, 
                Race_pere.nom AS race_papa,
                Mere.nom AS maman, 
                Race_mere.nom AS race_maman
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




-- II.4. Sous-requetes
-- -------------------
    -- II.4.1. Sous-requetes dans le FROM
        -- II.4.1.1. Les regles a respecter

    -- II.4.2. Sous-requetes dans les conditions
        -- II.4.2.1. Comparaisons
        -- II.4.2.2. Conditions avec IN et NOT IN
        -- II.4.2.3. Conditions avec ANY, SOME et ALL

    -- II.4.3. Sous-requetes correlees
        -- II.4.3.1. En resume


#  Sous-requêtes dans le FROM

SELECT  Animal.id, 
        Animal.sexe, 
        Animal.date_naissance, 
        Animal.nom, 
        Animal.espece_id
FROM Animal
    INNER JOIN Espece
        ON Espece.id = Animal.espece_id
WHERE   sexe = 'F'
        AND Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone');


SELECT MIN(date_naissance) 
FROM    (SELECT Animal.id, Animal.sexe, Animal.date_naissance, Animal.nom, Animal.espece_id
        FROM Animal
            INNER JOIN Espece
                ON Espece.id = Animal.espece_id
        WHERE   sexe = 'F'
                AND Espece.nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
        ) AS tortues_perroquets_F;



# Sous-requêtes dans les conditions

SELECT  id, 
        sexe, 
        nom, 
        commentaires, 
        espece_id, 
        race_id
FROM Animal
WHERE race_id = (SELECT id FROM Race WHERE nom = 'Berger Allemand'); -- la sous-requête renvoie simplement 1


# afaka atao amin''ny inner join io requette io 

SELECT  Animal.id, 
        sexe, 
        Animal.nom, 
        commentaires, 
        Animal.espece_id, 
        race_id 
FROM Animal
    INNER JOIN Race 
        ON Race.id = Animal.race_id
        WHERE Race.nom = 'Berger Allemand';


SELECT  id, 
        nom, 
        espece_id
FROM Race
WHERE espece_id = (
                  SELECT MIN(id) 
                  -- Je rappelle que MIN() permet de récupérer id
                  -- la plus petite valeur de la colonne parmi les lignes
                  -- sélectionnées
                  FROM Espece
                  );

SELECT  id, 
        nom, 
        espece_id 
FROM Race
    WHERE espece_id  <  (
                        SELECT id
                        FROM Espece
                        WHERE nom_courant = 'Tortue d''Hermann'
                        );


###################################################################################################################
#
#                                     --------------------------------
#                                     Sous-requête renvoyant une ligne
#                                     --------------------------------
# 
#  Seuls les opérateurs = et != (ou <>) sont utilisables avec une sous-requête de ligne, toutes
#  les comparaisons de type ”plus grand” ou ”plus petit” ne sont pas supportées.
# 
# -> Syntax
# 
# SELECT * FROM nom_table1
#     WHERE [ROW](colonne1, colonne2) = ( -- le ROW n'est pas obligatoire
#         SELECT colonneX, colonneY FROM nom_table2
#             WHERE...); -- Condition qui ne retourne qu'UNE SEULE LIGNE
# -> fin Syntaxe
# 
##################################################################################################################


SELECT  id,
        sexe, 
        nom, 
        espece_id, 
        race_id 
FROM Animal
WHERE (id, race_id)  =  (
                        SELECT id, espece_id FROM Race 
                            WHERE id = 7
                        );


-- ----------------------------
-- Conditions avec IN et NOT IN
-- ----------------------------

# -> IN

SELECT  Animal.id, 
        Animal.nom, 
        Animal.espece_id 
FROM Animal
    INNER JOIN Espece
        ON Espece.id = Animal.espece_id
WHERE Espece.nom_courant IN ('Tortue d''Hermann','Perroquet amazone');

# Cet opérateur peut également s’utiliser avec une sous-requête dont le résultat est une colonne
# ou une valeur. On peut donc réécrire la requête ci-dessus en utilisant une sous-requête plutôt
# qu’une jointure :

SELECT  id, 
        nom, 
        espece_id 
FROM Animal
WHERE espece_id  IN (
                    SELECT id 
                    FROM Espece
                    WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
                    );

SELECT id -- On ne sélectionne bien qu'UNE SEULE COLONNE.
FROM Espece
WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone');

# NOT IN

SELECT  id, 
        nom, 
        espece_id 
FROM Animal
WHERE espece_id NOT IN  (
                        SELECT id FROM Espece
                        WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
                        );


-- --------------------------------
-- Conditions avec ANY, SOME et ALL
-- --------------------------------


-- ANY (ou SOME)
SELECT * 
FROM Animal
WHERE espece_id   < ANY (
                        SELECT id 
                        FROM Espece
                        WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
                        );

-- ALL

SELECT *
FROM Animal
WHERE  espece_id  < ALL (
                        SELECT id
                        FROM Espece
                        WHERE nom_courant IN ('Tortue d''Hermann', 'Perroquet amazone')
                        );

-- Sous-requêtes corrélées
-- -----------------------

-- Syntaxe

SELECT colonne1 
FROM tableA
WHERE  colonne2  IN (
                    SELECT colonne3 
                    FROM tableB
                    WHERE tableB.colonne4 = tableA.colonne5
                    );


--  Conditions avec EXISTS et NOT EXISTS
-- -------------------------------------

-- syntaxe

# SELECT * FROM nom_table WHERE [NOT] EXISTS (sous-requête)

SELECT  id, 
        nom, 
        espece_id 
FROM Race 
WHERE EXISTS (SELECT * FROM Animal WHERE nom = 'Balou');

--  on sélectionne les races s’il existe un animal qui s’appelle Balou

SELECT * 
FROM Animal 
WHERE nom = 'Balou';


--  je veux sélectionner toutes les races dont on ne possède aucun animal

SELECT *
FROM Race;

SELECT * 
FROM Animal, Race 
WHERE Animal.race_id = Race.id;

SELECT * 
FROM Race 
WHERE NOT EXISTS (SELECT * FROM Animal WHERE Animal.race_id = Race.id);






-- II.5. Jointures et sous-requetes: modifications de donnees
-- ----------------------------------------------------------
    -- II.5.1. Insertion
        -- II.5.1. Sous-requete pour l'insertion

    -- II.5.2. Modification
        -- II.5.2.1. Utilisation des sous-requetes
        -- II.5.2.2. Modification avec jointure

    -- II.5.3. Suppression
        -- II.5.2.1. Utilisation des sous-requetes
        -- II.5.2.2. Suppression avec jointure
        -- II.5.2.3. En resume



--  Insertion
-- -- Sous-requête pour l’insertion

INSERT INTO Animal (nom, sexe, date_naissance, race_id, espece_id) 
-- Je précise les colonnes puisque je ne donne pas une valeur pour toutes.
    SELECT  'Yoda',
            'M', 
            '2010-11-09', 
            id AS race_id, 
            espece_id -- Attention à l'ordre !
    FROM Race 
    WHERE nom = 'Maine coon';


-- -- -- verification insertion
SELECT  Animal.id,
        Animal.sexe,
        Animal.date_naissance, 
        Animal.nom, 
        Race.nom AS race,
        Espece.nom_courant as espece
FROM Animal
    INNER JOIN Race 
       ON Animal.race_id = Race.id
    INNER JOIN Espece 
       ON Race.espece_id = Espece.id
WHERE Race.nom = 'Maine coon';


-- -- Modification: utilisation sous requette
UPDATE Animal SET commentaires = 'Coco veut un gâteau' WHERE espece_id = 4;

UPDATE Animal SET commentaires = 'Coco veut un gâteau !' WHERE
espece_id = (SELECT id FROM Espece WHERE nom_courant LIKE 'Perroquet%');


SELECT *
FROM Animal
WHERE commentaires = 'Coco veut un gateau !';


-- --  Pour l’élément à modifier
INSERT 
    INTO 
        Race (nom, espece_id, description) 
    VALUES 
         ('Nebelung', 2,'Chat bleu russe, mais avec des poils longs...');


-- -- -- misy diso io code eo ambany io
UPDATE Animal
    SET race_id = (SELECT id FROM Race WHERE nom = 'Nebelung' AND espece_id = 2) 
    WHERE nom = 'Cawette';



SELECT * FROM Race; 

SHOW TABLES;



SELECT  id 
FROM Race 
WHERE nom = 'Nebelung' AND espece_id = 2;

SELECT *
FROM Espece;



SELECT *
FROM Animal
WHERE race_id in (8, 9);



-- -- Modification avec jointure
UPDATE Animal -- Classique !
    INNER JOIN Espece -- Jointure.
        ON Animal.espece_id = Espece.id -- Condition de la jointure.
        SET Animal.commentaires = Espece.description -- Ensuite, la modification voulue.
WHERE Animal.commentaires IS NULL -- Seulement s'il n'y a pas encore de commentaire.
      AND 
      Espece.nom_courant IN ('Perroquet amazone', 'Tortue d''Hermann'); 
-- Et seulement pour les perroquets et les tortues.


-- -- Suppression: Utilisation des sous-requêtes
DELETE 
    FROM Animal 
    WHERE nom = 'Carabistouille';

DELETE 
FROM Animal
WHERE  nom = 'Carabistouille' 
       AND 
       espece_id = (SELECT id FROM Espece WHERE nom_courant = 'Chat');


-- --  Suppression avec jointure
DELETE  Animal -- Je précise de quelles tables les données doivent être supprimées
FROM Animal -- Table principale
    INNER JOIN Espece 
    ON Animal.espece_id = Espece.id -- Jointure
WHERE  Animal.nom = 'Carabistouille' 
       AND 
       Espece.nom_courant = 'Chat';



-- II.6. Union de plusieurs requetes
-- ---------------------------------
    -- II.6.1. Syntaxe
    -- II.6.2. UNION ALL
    -- II.6.3. LIMIT et ORDER BY


    -- II.6.1. Syntaxe
    -- ---------------
        -- II.6.1.1. Sous-requete pour l'insertion


    -- II.6.2. UNION ALL
    -- -----------------


    -- II.6.3. LIMIT et ORDER BY
    -- -------------------------
        -- II.6.2.1. LIMIT
        -- II.6.2.2. ORDER BY       

########################################################################################################
#
#                            -- ---------------------------- --
#                            -- Union de plusieurs requette  --
#                            -- ---------------------------- --
# -> Syntaxe
#
# SELECT ...
#   UNION
# SELECT ...
# 
# 
# SELECT ...
#   UNION
# SELECT ...
#   UNION
# SELECT ...
#   ....
#   UNION
# SELECT ...
# 
# -> fin Syntaxe
# 
#######################################################################################################

        -- -- Les règles: Nombre de colonnes 
        -- Pas le même nombre de colonnes
        
        SELECT  Animal.id,
                Animal.nom, 
                Espece.nom_courant
                -- 3 colonnes sélectionnées
            FROM Animal
                INNER JOIN Espece 
                    ON Animal.espece_id = Espece.id
            WHERE Espece.nom_courant = 'Chat'
        UNION
        SELECT  Animal.id, 
                Animal.nom, 
                Espece.nom_courant, 
                Animal.espece_id
                -- 4 colonnes sélectionnées
            FROM Animal
                INNER JOIN Espece 
                ON Animal.espece_id = Espece.id
            WHERE Espece.nom_courant = 'Tortue d''Hermann';
        
        
        
        -- --  Les règles: Type et ordre des colonnes => jereo tsara io colonne 3 io
        SELECT  Animal.id,
                Animal.nom, 
                Espece.nom_courant -- 3e colonne : nom_courant VARCHAR
            FROM Animal
                INNER JOIN Espece 
                ON Animal.espece_id = Espece.id
            WHERE Espece.nom_courant = 'Chat' AND Animal.nom LIKE 'C%'
        UNION
        SELECT  Animal.id,
                Animal.nom, 
                Espece.id -- 3e colonne :id SMALLINT
            FROM Animal
                INNER JOIN Espece 
                ON Animal.espece_id = Espece.id
            WHERE Espece.nom_courant = 'Tortue d''Hermann' AND Animal.nom LIKE 'C%';
        
        
        -- jereo ny ordre colonne
        
        SELECT  Animal.id,
                Animal.nom,
                Espece.nom_courant 
            FROM Animal
                INNER JOIN Espece 
                ON Animal.espece_id = Espece.id
            WHERE Espece.nom_courant = 'Chat' AND Animal.nom LIKE 'C%'
        UNION
        SELECT  Animal.nom, 
                Animal.id, 
                Espece.nom_courant 
        FROM Animal 
        -- 1e et 2e colonnes inversées par rapport à la première requête
            INNER JOIN Espece 
            ON Animal.espece_id = Espece.id
        WHERE Espece.nom_courant = 'Tortue d''Hermann' AND Animal.nom LIKE 'C%';


        
        -- -- -- UNION et UNION ALL
        -- -- -- ------------------

        SELECT * FROM Espece
        UNION
        SELECT * FROM Espece
        
        # -> Chaque résultat n’apparaît qu’une seule fois. Pour la simple et bonne raison que lorsque vous
        # -> faites UNION, les doublons sont effacés. En fait, UNION est équivalent à UNION DISTINCT. Si
        # -> vous voulez conserver les doublons, vous devez utiliser UNION ALL.
        
        SELECT * FROM Espece
        UNION ALL
        SELECT * FROM Espece;
        
        
        -- limit and order BY
        -- ------------------
        SELECT  id, 
                nom, 
                'Race' AS table_origine 
            FROM Race
        UNION
        SELECT  id,
                nom_latin, 
                'Espèce' AS table_origine 
            FROM Espece;
        
        
        
        
        SELECT  id, 
                nom, 
                'Race' AS table_origine 
            FROM Race
        UNION
        SELECT  id,
                nom_latin, 
                'Espèce' AS table_origine 
            FROM Espece LIMIT 2;
        
        
        
        
        SELECT  id, 
                nom, 
                'Race' AS table_origine 
            FROM Race
        UNION
        (SELECT id, 
                nom_latin, 
                'Espèce' AS table_origine 
            FROM Espece LIMIT 2);
        
        -- -- -- -- ORDER BY
        
        SELECT  id,
                nom, 
                'Race' AS table_origine 
            FROM Race
        UNION
        SELECT  id, 
                nom_latin, 
                'Espèce' AS table_origine 
            FROM Espece
            ORDER BY nom DESC;
        
        -- -- -- -- --  Exception pour les tris sur les requêtes intermédiaires
        
        (SELECT id, nom, 'Race' AS table_origine FROM Race LIMIT 6)
        UNION
        (SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT 3);
        
        
        (SELECT id, nom, 'Race' AS table_origine FROM Race ORDER BY nom DESC LIMIT 6)
        UNION
        (SELECT id, nom_latin, 'Espèce' AS table_origine FROM Espece LIMIT 3);
        
        
        
        
        
-- II.7. Option des cles etrangeres
-- --------------------------------
    -- I.7.1. Option sur suppression des cles etrangeres
    -- I.7.2. Option sur modification des cles etrangeres
    -- I.7.3. Utilisation de ces options dans notre base

        
    -- I.7.1. Option sur suppression des cles etrangeres
    -- -------------------------------------------------
        -- II.7.1.1. Petit rappels
        -- II.7.1.2. Suppression d'une reference


    -- I.7.2. Option sur modification des cles etrangeres
    -- --------------------------------------------------


    -- I.7.3. Utilisation de ces options dans notre base
    -- -------------------------------------------------
        -- II.7.3.1. Modifications
        -- II.7.3.2. Suppressions
        -- II.7.3.3. Les requetes
        -- II.7.3.4. En resumee





-- -- --  Option sur suppression des clés étrangères

############################################################################################################
#
#  Lorsque je vous ai parlé des clés étrangères, et que je vous ai donné la syntaxe pour les créer,
#  j’ai omis de vous parler des deux options fort utiles :
#
# —> ON DELETE, qui permet de déterminer le comportement de MySQL en cas de suppression d’une référence ;
# —> ON UPDATE, qui permet de déterminer le comportement de MySQL en cas de modification d’une référence
#
# -- -- --  Syntaxe
# ALTER TABLE nom_table
# ADD [CONSTRAINT fk_col_ref]
# FOREIGN KEY (colonne)
# REFERENCES table_ref(col_ref)
# ON DELETE {RESTRICT | NO ACTION | SET NULL | CASCADE}; -- <-- Nouvelle option 
# 
# -- -- -- fin syntaxe
#
#############################################################################################################


ALTER 
    TABLE Animal 
    DROP FOREIGN KEY fk_race_id;

DESC ANIMAL;

ALTER 
    TABLE Animal
        ADD CONSTRAINT fk_race_id 
            FOREIGN KEY (race_id) 
            REFERENCES Race(id)
        ON DELETE SET NULL;



-- Affichons d'abord tous les animaux, avec leur race --
-- -----------------------------------------------------

SELECT  Animal.nom,
        Animal.race_id, 
        Race.nom as race 
FROM Animal
    LEFT JOIN Race 
    ON Animal.race_id = Race.id
ORDER BY race;



-- Supprimons ensuite la race 'Boxer' --
-- -------------------------------------
DELETE 
    FROM Race 
    WHERE nom = 'Boxer';



-- Réaffichons les animaux --
-- --------------------------

SELECT  Animal.nom, 
        Animal.race_id, 
        Race.nom as race 
FROM Animal
    LEFT JOIN Race 
    ON Animal.race_id = Race.id
ORDER BY race;



-- Option sur modification des clés étrangères --
-------------------------------------------------
UPDATE Race
    SET id = 3 
    WHERE nom = 'Singapura';

# -> Jereo tsara ny lesona


                ########################################################
                #                                                      #
                #       Petite explication à propos de CASCADE         #
                #                                                      #
                ########################################################

-- Suppression de la clé --
-- ------------------------

ALTER 
    TABLE Animal 
    DROP FOREIGN KEY fk_race_id;

-- Recréation de la clé avec les bonnes options --
-- -----------------------------------------------

ALTER 
    TABLE Animal
    ADD CONSTRAINT fk_race_id 
        FOREIGN KEY (race_id) 
        REFERENCES Race(id)
    ON DELETE SET NULL -- N'oublions pas de remettre le ON DELETE!
    ON UPDATE CASCADE;

-- Modification de l'id des Singapura --
-- -------------------------------------
UPDATE Race 
    SET id = 3 
    WHERE nom = 'Singapura';

# ALTER 
#     TABLE Animal 
#     DROP FOREIGN KEY fk_race_id;
# 
# ALTER 
#     TABLE Animal
#     ADD CONSTRAINT fk_race_id 
#     FOREIGN KEY (race_id) 
#     REFERENCES Race(id)
# ON DELETE SET NULL;

-- exercice
-- Animal.mere_id --
-- -----------------
ALTER 
    TABLE Animal 
    DROP FOREIGN KEY fk_mere_id;

ALTER 
    TABLE Animal
    ADD CONSTRAINT fk_mere_id 
        FOREIGN KEY (mere_id) 
        REFERENCES Animal(id) 
    ON DELETE SET NULL;




-- Animal.pere_id --
-- -----------------
ALTER 
    TABLE Animal 
    DROP FOREIGN KEY fk_pere_id;

ALTER 
    TABLE Animal
    ADD CONSTRAINT fk_pere_id 
    FOREIGN KEY (pere_id) 
    REFERENCES Animal(id) 
    ON DELETE SET NULL;



-- Race.espece_id --
-- -----------------
ALTER 
    TABLE Race 
    DROP FOREIGN KEY fk_race_espece_id;

ALTER 
    TABLE Race
    ADD CONSTRAINT fk_race_espece_id 
        FOREIGN KEY (espece_id) 
        REFERENCES Espece(id) 
    ON DELETE CASCADE;




-- II.8. Violation de contrainte d'unicite
-- ---------------------------------------
    -- II.8.1. Ignorer les erreurs
    -- II.8.2. Remplacer l'ancienne ligne
    -- II.8.3. Modifier l'ancienne ligne


    -- II.8.1. Ignorer les erreurs
    -- ---------------------------
        -- II.8.1.1. Insertion
        -- II.8.1.2. Modification
        -- II.8.1.3. LOAD DATA INFILE


    -- II.8.2. Remplacer l'ancienne ligne
    -- ----------------------------------
        -- II.8.2.1. Remplacement de plusieurs lignes
        -- II.8.2.2. LOAD DATA INFILE


    -- II.8.3. Modifier l'ancienne ligne
    -- ---------------------------------
        -- II.8.3.1. Syntaxe
        -- II.8.3.2. Attention: plusieurs contraintes d'unicites sur la meme table
        -- II.8.3.3. En resume





        --  INsertion => demonstration
        
        INSERT 
            INTO Espece (nom_courant, nom_latin, description)
            VALUES ('Chien en peluche', 'Canis canis', 'Tout doux, propre et silencieux');
        
        -- Par contre, si l’on utilise le mot-clé IGNORE
        INSERT 
            IGNORE INTO Espece (nom_courant, nom_latin, description)
            VALUES ('Chien en peluche', 'Canis canis', 'Tout doux, propre et silencieux');
        
        -- Modification => demonstration
        UPDATE 
            Espece 
                SET nom_latin = 'Canis canis' 
                WHERE nom_courant = 'Chat';
        
        UPDATE 
            IGNORE Espece
                SET nom_latin = 'Canis canis' 
                WHERE nom_courant = 'Chat';
        
        ###################################################################################
        #
        #              LOAD DATA IGNORE SYNTAXE
        #
        # LOAD DATA [LOCAL] INFILE 'nom_fichier' IGNORE -- IGNORE se place juste avant INTO, comme dans INSERT 
        #     INTO TABLE nom_table 
        #     [FIELDS 
        #         [TERMINATED BY '\t'] 
        #         [ENCLOSED BY ''] 
        #         [ESCAPED BY '\\' ]
        #     ] 
        #     [LINES
        #         [STARTING BY ''] 
        #         [TERMINATED BY '\n'] 
        #     ] 
        #     [IGNORE nombre LINES] 
        #     [(nom_colonne,...)];
        # 
        ##################################################################################
        
        
        
        -- -- --  Remplacer l’ancienne ligne -- -- --
        ---------------------------------------------
        
        SELECT  id,
                sexe, 
                date_naissance,
                nom, 
                espece_id 
        FROM Animal 
        WHERE nom = 'Spoutnik';
        
        INSERT 
            INTO Animal (sexe, nom, date_naissance, espece_id)
            VALUES ('F', 'Spoutnik', '2010-08-06 15:05:00', 3);
        
        REPLACE 
            INTO Animal (sexe, nom, date_naissance, espece_id)
            VALUES ('F', 'Spoutnik', '2010-08-06 15:05:00', 3);
        
        SELECT  id, 
                sexe, 
                date_naissance, 
                nom, 
                espece_id 
        FROM Animal 
        WHERE nom = 'Spoutnik';
        
        -- -- --  Remplacement de plusieurs lignes -- -- --
        ---------------------------------------------------
        REPLACE 
            INTO Animal (id, sexe, nom, date_naissance, espece_id) -- Je donne moi-même un id, qui existe déjà !
            VALUES (32, 'M', 'Spoutnik', '2009-07-26 11:52:00', 3); -- Et Spoutnik est mon souffre-douleur du jour.
        
        
        
        ###################################################################################
        #
        #              LOAD DATA IGNORE SYNTAXE
        #
        # LOAD DATA [LOCAL] INFILE 'nom_fichier' REPLACE --  se place au meme endroit que IGNORE
        #     INTO TABLE nom_table 
        #     [FIELDS 
        #         [TERMINATED BY '\t'] 
        #         [ENCLOSED BY ''] 
        #         [ESCAPED BY '\\' ]
        #     ] 
        #     [LINES
        #         [STARTING BY ''] 
        #         [TERMINATED BY '\n'] 
        #     ] 
        #     [IGNORE nombre LINES] 
        #     [(nom_colonne,...)];
        # 
        ##################################################################################
        
        
        
        
        -- -- --  Modifier l’ancienne ligne -- -- --
        --------------------------------------------
        
        
        -- syntaxe
        INSERT 
            INTO nom_table [(colonne1, colonne2, colonne3)]
            VALUES (valeur1, valeur2, valeur3)
                ON DUPLICATE KEY 
                UPDATE colonne2 = valeur2 [, colonne3 = valeur3];
        -- fin syntaxe
        
        SELECT  id, 
                sexe, 
                date_naissance, 
                nom, espece_id, 
                mere_id, 
                pere_id
        FROM Animal
        WHERE nom = 'Spoutnik';
        
        INSERT 
            INTO Animal (sexe, date_naissance, espece_id, nom, mere_id)
            VALUES ('M', '2010-05-27 11:38:00', 3, 'Spoutnik', 52) -- date_naissance et mere_id sont différents du Spoutnik existant
            ON DUPLICATE KEY 
            UPDATE mere_id = 52;
        
        SELECT  id, 
                sexe, 
                date_naissance, 
                nom, 
                espece_id, 
                mere_id, 
                pere_id
        FROM Animal
        WHERE nom = 'Spoutnik';
        
        
        UPDATE Animal
            SET mere_id = 52
            WHERE nom = 'Spoutnik'
            AND espece_id = 3;