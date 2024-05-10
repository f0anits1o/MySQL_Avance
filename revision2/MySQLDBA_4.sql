-- Active: 1715343469239@@127.0.0.1@3306@fiompina
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
