USE fiompina;

####################################################
#                                                  #
#              TROISIEME PARTIE                    #
#     FONCTION: NOMBRES, CHAINES ET AGREGATS       #
#                                                  #
####################################################


-- III. Fonctions: nombres, chaines et aggregats
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
                    INNER JOIN Espece 
                    ON Espece.id = Animal.espece_id
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
