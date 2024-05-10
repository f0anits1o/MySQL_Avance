-- Active: 1715343469239@@127.0.0.1@3306@fiompina
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
