-- Active: 1714130184748@@127.0.0.1@3306@revision

CREATE TABLE EX6CSV(
    one DECIMAL(15,13),
    two DECIMAL(15,13),
    three DECIMAL(15,13),
    four DECIMAL(15,13),
    cle VARCHAR(1)
);
CREATE TABLE CSVEX6(
    one INT,
    two INT,
    three INT,
    four INT,
    cle VARCHAR(1)
);

alter table ex6csv add column four DECIMAL(15, 13) after three;

desc ex6csv;

show tables;

set global local_infile=1;

LOAD DATA LOCAL infile "C:/Users/PERSONNE/Desktop/informatique/Python Data Analysis/data/pydata-book-3rd-edition/examples/ex6.csv"   
INTO TABLE ex6csv FIELDS TERMINATED BY "," 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;

select * FROM ex6csv limit 1000;