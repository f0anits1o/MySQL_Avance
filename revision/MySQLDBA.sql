-- Active: 1713782639576@@127.0.0.1@3306@fiompina
USE Fiompina;

-- I. MySQL et les bases du langage SQL
-- ------------------------------------
    -- I.1. Introduction
    -- I.2. Installation de MySQL
    -- I.3. Les types de donnees
    -- I.4. Creation d'une base de donnees
    -- I.5. Creation de tables
    -- I.6. Modification d'une table
    -- I.7. Insertion de donnees
    -- I.8. Selection de donnees
    -- I.9. Elargir la possibilite de la clause WHERE
    -- I.10. Suppression et modification de donnees


    -- I.1. Introduction
    -- -----------------
        -- I.1.1. Concept de base
        -- I.1.2. Presentation succinte de MySQL
        -- I.1.3. Presentation de ses Concurrents
        -- I.1.4. Organisation d'une base de donnees


        -- I.1.1. Concept de base
        -- ----------------------
            -- I.1.1.1. Base de donnees
            -- I.1.1.2. SGBD
            -- I.1.1.3. SGBDR
            -- I.1.1.4. Le langage SQL



        -- I.1.2. Presentation succinte de MySQL
        -- -------------------------------------
            -- I.1.2.1. Un peu d'histoire
            -- I.1.2.2. Mise en garde



        -- I.1.3. Presentation de ses Concurrents
        -- --------------------------------------
            -- I.1.3.1. Oracle database
            -- I.1.3.2. PostgreSQL
            -- I.1.3.3 MS Access
            -- I.1.3.4 SQLite




        -- I.1.4. Organisation d'une base de donnees
        -- -----------------------------------------
            -- I.1.4.1. En resume



    -- I.2. Installation de MySQL
    -- --------------------------
        -- (Resa be dia tsy ilaiko)



    -- I.3. Les types de donnees
    -- -------------------------
        -- I.3.1. Avertissement
        -- I.3.2. Types numeriques
        -- I.3.3. Types alphanumeriques
        -- I.3.4. Types temporels

    
        -- I.3.1. Avertissement
        -- --------------------


        -- I.3.2. Types numeriques
        -- -----------------------
            -- I.3.2.1. Nombres entiers
            -- I.3.2.2. Nombres decimaux



        -- I.3.3. Types alphanumeriques
        -- ----------------------------
            -- I.3.3.1. Chaine de type texte
            -- I.3.3.2. Chaine de type Binaire
            -- I.3.3.3. SET et ENUM




        -- I.3.4. Types temporels
        -- ----------------------
            -- I.3.4.1. DATE, TIME et DATETIME
            -- I.3.4.2. YEAR
            -- I.3.4.3. TIMESTAMP
            -- I.3.4.4. La date par defaut
            -- I.3.4.5. En resume



    -- I.4. Creation d'une base de donnees
    -- -----------------------------------
        -- I.4.1. Avant-propos: conseils et conventions
        -- I.4.2. Creation et suppression d'une base de donnees


        -- I.4.1. Avant-propos: conseils et conventions
        -- --------------------------------------------
            -- I.4.1.1. Conseils
            -- I.4.1.2. Conventions
            -- I.4.1.3. Mise en situation


        -- I.4.2. Creation et suppression d'une base de donnees
        -- ----------------------------------------------------
            -- I.4.2.1. Creation
            -- I.4.2.2. Suppression
            -- I.4.2.3. Utilisation d'une base de donnees
            -- I.4.2.4. En resume


    -- I.5. Creation de tables
    -- -----------------------
        -- I.5.1. Definition des colonnes
        -- I.5.2. Introduction aux cles primaires
        -- I.5.3. Les moteurs de tables
        -- I.5.4. Syntaxe de CREATE TABLE
        -- I.5.5. Suppression d'une table


        -- I.5.1. Definition des colonnes
        -- ------------------------------
            -- I.5.1.1. Type de colonne
            -- I.5.1.2. NULL or NOT NULL?
            -- I.5.1.3. Recaputilatif




        -- I.5.2. Introduction aux cles primaires
        -- --------------------------------------
            -- I.5.2.1. Identite
            -- I.5.2.2. Cle primaire
            -- I.5.2.3. Auto-incrementations





        -- I.5.3. Les moteurs de tables
        -- ----------------------------
            -- I.5.3.1. Preciser un moteurs lors de la creation de la table





        -- I.5.4. Syntaxe de CREATE TABLE
        -- ------------------------------
            -- I.5.4.1. Syntaxe 
            -- I.5.4.2. Application: creation de Animal
            -- I.5.4.3. Verifications



        -- I.5.5. Suppression d'une table
        -- ------------------------------
            -- I.5.5.1. En resume


    -- I.6. Modification d'une table
    -- -----------------------------
        -- I.6.1. Syntaxe de la requete
        -- I.6.2. Ajout et suppression d'une colonne
        -- I.6.3. Modification de colonne


        -- I.6.1. Syntaxe de la requete
        -- ----------------------------



        -- I.6.2. Ajout et suppression d'une colonne
        -- -----------------------------------------
            -- I.6.2.1. Ajout
            -- I.6.2.2. Suppression



        -- I.6.3. Modification de colonne
        -- ------------------------------
            -- I.6.3.1. Changement du nom de les colonnes
            -- I.6.3.2. Changement du type de donnees
            -- I.6.3.3. En resume




    -- I.7. Insertion de donnees
    -- -------------------------
        -- I.7.1. Syntaxe de INSERT
        -- I.7.2. Syntaxe alternative de MySQL
        -- I.7.3. Utilisation de fichiers externes
        -- I.7.4. Remplissage de la base


        -- I.7.1. Syntaxe de INSERT
        -- ------------------------
            -- I.7.1.1. Insertion sans preciser les colonnes
            -- I.7.1.2. Insertion en precisant les colonnes
            -- I.7.1.3. Insertion multiple



        -- I.7.2. Syntaxe alternative de MySQL
        -- -----------------------------------
            



        -- I.7.3. Utilisation de fichiers externes
        -- ---------------------------------------
            -- I.7.3.1. Executer des commandes SQL a partir d'un fichier
            -- I.7.3.2. Inserer des donnees a partir d'un fichier formate
        



        -- I.7.4. Remplissage de la base
        -- -----------------------------
            -- I.7.4.1. Execution de commandes SQL
            -- I.7.4.2. LOAD DATA INFILE
            -- I.7.4.3. En resume

    





    -- I.8. Selection de donnees
    -- -------------------------
        -- I.8.1. Syntaxe de SELECT
        -- I.8.2. La clause WHERE
        -- I.8.3. Tri des donnees
        -- I.8.4. Eliminer les doublons
        -- I.8.5. Restreindre les resultats




    
    -- I.9. Elargir la possibilite de la clause WHERE
    -- ----------------------------------------------
        -- I.9.1. Recherche approximative
        -- I.9.2. Recherche dans un intervalle
        -- I.9.3. Set de criteres


        -- I.9.1. Recherche approximative
        -- ------------------------------
            -- I.9.1.1. Sensibilite a la casse
            -- I.9.1.2. Recherche dans le numeriques


        -- I.9.2. Recherche dans un intervalle
        -- -----------------------------------


        -- I.9.3. Set de criteres
        -- ----------------------
            -- I.9.3.1. En resume


    -- I.10. Suppression et modification de donnees
    -- --------------------------------------------
        -- I.10.1. Sauvegarde d'une base de donnees
        -- I.10.2. Suppression
        -- I.10.3. Modification










    