-- Active: 1715630549418@@127.0.0.1@3306@librairie
CREATE DATABASE librairie;

DROP DATABASE librairie;

CREATE DATABASE LOCATION_VOITURE;

USE LOCATION_VOITURE;

CREATE TABLE client(
    nomClient VARCHAR(50),
    prenomClient VARCHAR(100),
    sexe VARCHAR(7) not NULL,
    adresse VARCHAR(150) NOT NULL,
    dateDeNaissance date,
    cin INT(15)
);

Alter table client MODIFY cin bigint;

INSERT INTO client VALUES ("solonirina", "avotriniaina fidelis", "male", "CU Ankatso II R+3 P205", "1998-10-29", 203011033370);

select * from client;
INSERT 
    INTO client 
    VALUES ("NANDRASANELA", "Avotriniaina Michelline", "Femelle", "CU Andrainjato Batiment C112", "1998-07-21", 203011033370);