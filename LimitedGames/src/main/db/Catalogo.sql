USE LimitedGames;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Gioco;
SET FOREIGN_KEY_CHECKS = 1;
DELETE FROM Piattaforma;
DELETE FROM Stock;
INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('69.99', '12.62', '2022-02-25', 'Elden Ring è un videogioco action RPG open world facente parte della saga dei suols like.', 'ELDEN RING', 'Elden-Ring.jpg', 'Standard', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('89.99', '16.23', '2022-02-25', 'Elden Ring è un videogioco action RPG open world facente parte della saga dei suols like.', 'ELDEN RING', 'Elden-Ring.jpg', 'Delux Edition', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('109.99', '19.83', '2022-02-25', 'Elden Ring è un videogioco action RPG open world facente parte della saga dei suols like.', 'ELDEN RING', 'Elden-Ring.jpg', 'GOTY Edition', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('59.99', '10.82', '2022-11-09', 'Un epico action adventure che unisce mitologia e dramma familiare.', 'God of War Ragnarök', 'God-of-War.jpg', 'Standard', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('79.99', '14.42', '2022-11-09', 'Un epico action adventure che unisce mitologia e dramma familiare.', 'God of War Ragnarök', 'God-of-War.jpg', 'Delux', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('69.99', '12.62', '2022-02-18', 'Avventura post-apocalittica in un vasto open world ricco di misteri.', 'Horizon Forbidden West', 'Horizon-Forbidden-West.jpg', 'Standard', '15.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('99.99', '18.03', '2022-02-18', 'Avventura post-apocalittica in un vasto open world ricco di misteri.', 'Horizon Forbidden West', 'Horizon-Forbidden-West.jpg', 'Complete edition', '25.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('49.99', '9.01', '2020-11-12', 'Un dinamico action-adventure con movimenti acrobatici e combattimenti fluidi.', 'Spider-Man: Miles Morales', 'SpiderMan.JPG', 'Standard', '20.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('59.99', '10.82', '2020-11-12', 'Un dinamico action-adventure con movimenti acrobatici e combattimenti fluidi.', 'Spider-Man: Miles Morales', 'SpiderMan.JPG', 'Ultimate edition', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('69.99', '12.62', '2020-11-12', 'Remake mozzafiato di un classico, con grafica e gameplay rinnovati.', 'Demon''s Souls', 'Demons-Souls.jpg', 'Standard', '15.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('89.99', '16.23', '2020-11-12', 'Remake mozzafiato di un classico, con grafica e gameplay rinnovati.', 'Demon''s Souls', 'Demons-Souls.jpg', 'Deluxe edition', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('59.99', '10.82', '2021-06-11', 'Un platform d’azione che sfrutta al massimo le potenzialità del PS5.', 'Ratchet & Clank: Rift Apart', 'Ratchet-&-Clank.jpg', 'Standard', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('69.99', '12.62', '2021-06-11', 'Un platform d’azione che sfrutta al massimo le potenzialità del PS5.', 'Ratchet & Clank: Rift Apart', 'Ratchet-&-Clank.jpg', 'Delux edition', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('39.99', '7.21', '2020-06-19', 'Un intenso survival drama con narrazione emozionante e ambientazioni realistiche.', 'The Last of Us Part II', 'The-Last-Of-Us-2.jpg', 'Standard', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('49.99', '9.01', '2020-06-19', 'Un intenso survival drama con narrazione emozionante e ambientazioni realistiche.', 'The Last of Us Part II', 'The-Last-Of-Us-2.jpg', 'Remastered', '0.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('29.99', '5.41', '2016-05-10', 'Un’avventura d’azione ricca di suspense e colpi di scena, con ambientazioni esotiche.', 'Uncharted 4: A Thief''s End', 'Uncharted-4.jpg', 'Standard', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('79.99', '14.42', '2016-05-10', 'Un’avventura d’azione ricca di suspense e colpi di scena, con ambientazioni esotiche.', 'Uncharted 4: A Thief''s End', 'Uncharted-4.jpg', 'Special edition', '20.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('49.99', '9.01', '2020-07-17', 'Un open world che miscela stealth e combattimenti epici in un Giappone feudale.', 'Ghost of Tsushima', 'Ghost-Of-Tsushima.jpg', 'Standard', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('69.99', '12.62', '2020-07-17', 'Un open world che miscela stealth e combattimenti epici in un Giappone feudale.', 'Ghost of Tsushima', 'Ghost-Of-Tsushima.jpg', 'Definitive Edition', '10.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('79.99', '14.42', '2021-05-07', 'Un survival horror con atmosfere claustrofobiche e un ritmo di gioco incalzante.', 'Resident Evil Village', 'Resident-Evil-Village.jpg', 'Standard', '25.00');

INSERT INTO Gioco (Prezzo, IVA, Data_uscita, Descrizione, Titolo, immagine, Edizione, Sconto) 
VALUES('99.99', '18.03', '2021-05-07', 'Un survival horror con atmosfere claustrofobiche e un ritmo di gioco incalzante.', 'Resident Evil Village', 'Resident-Evil-Village.jpg', 'Gold Edition', '30.00');

INSERT INTO Piattaforma(piattaforma) VALUES('Playstation 3');
INSERT INTO Piattaforma(piattaforma) VALUES('Playstation 4');
INSERT INTO Piattaforma(piattaforma) VALUES('Playstation 5');
INSERT INTO Piattaforma(piattaforma) VALUES('Nintendo Switch');
INSERT INTO Piattaforma(piattaforma) VALUES('XBox Series S');
INSERT INTO Piattaforma(piattaforma) VALUES('Nintendo Switch 2');
INSERT INTO Piattaforma(piattaforma) VALUES('XBox One');

INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (1, 'Playstation 4', 150, 50);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (1, 'Playstation 5', 120, 30);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (1, 'XBox One', 80, 20);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (1, 'XBox Series S', 60, 15);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (2, 'Playstation 5', 100, 25);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (3, 'Playstation 5', 90, 10);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (4, 'Playstation 5', 200, 60);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (5, 'Playstation 5', 180, 40);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (6, 'Playstation 5', 170, 35);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (7, 'Playstation 5', 90, 20);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (8, 'Playstation 5', 140, 25);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (9, 'Playstation 5', 130, 30);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (10, 'Playstation 5', 100, 10);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (11, 'Playstation 5', 90, 5);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (12, 'Playstation 5', 150, 40);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (13, 'Playstation 5', 130, 30);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (14, 'Playstation 4', 220, 70);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (15, 'Playstation 5', 110, 20);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (16, 'Playstation 4', 180, 60);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (17, 'Playstation 4', 160, 50);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (18, 'Playstation 4', 200, 70);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (19, 'Playstation 5', 150, 35);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (20, 'Playstation 5', 180, 60);
INSERT INTO Stock (IDGioco, Piattaforma, Acquistati, Rimanenti) VALUES (21, 'Playstation 5', 140, 25);

INSERT INTO Utente (Username, pwd, nome, cognome, email, Via, CAP, Citta, Tipo) VALUES ('admin','9892772ec784c94bd5076945ba1badf67486b2a73e6ceacb4cad2b48a8f26e5bf0b004aa4ffb72d5ec540d66d09c4af8c9865cd62e0aa0a2fd3f9c85c69034a7','ogham','dellerba','mail@maila','a','b','agropoli','admin')
