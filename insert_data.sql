-- Categories
INSERT INTO categorii VALUES (1, 'Cosmetice', NULL);
INSERT INTO categorii VALUES (2, 'Makeup', 1);
INSERT INTO categorii VALUES (3, 'Skincare', 1);
INSERT INTO categorii VALUES (4, 'Fata', 2);
INSERT INTO categorii VALUES (5, 'Ochi', 2);
INSERT INTO categorii VALUES (6, 'Buze', 2);
INSERT INTO categorii VALUES (7, 'Curatare', 3);
INSERT INTO categorii VALUES (8, 'Hidratare', 3);
INSERT INTO categorii VALUES (9, 'Protectie solara', 3);
INSERT INTO categorii VALUES (10, 'Fond de ten', 4);
INSERT INTO categorii VALUES (11, 'Pudra', 4);
INSERT INTO categorii VALUES (12, 'Mascara', 5);
INSERT INTO categorii VALUES (13, 'Farduri', 5);
INSERT INTO categorii VALUES (14, 'Ruj', 6);
INSERT INTO categorii VALUES (15, 'Gloss', 6);

COMMIT;

-- Products
INSERT INTO produse_cosmetice VALUES (1, 'Fond de ten True Match', 'L''Oreal', 69.99, 30, 10);
INSERT INTO produse_cosmetice VALUES (2, 'Pudra Fit Me', 'Maybelline', 49.99, 25, 11);
INSERT INTO produse_cosmetice VALUES (3, 'Mascara Lash Sensational', 'Maybelline', 59.99, 40, 12);
INSERT INTO produse_cosmetice VALUES (4, 'Paleta farduri Reloaded', 'Revolution', 54.99, 20, 13);
INSERT INTO produse_cosmetice VALUES (5, 'Ruj SuperStay Matte Ink', 'Maybelline', 64.99, 35, 14);
INSERT INTO produse_cosmetice VALUES (6, 'Gloss Lip Maximizer', 'Dior', 199.99, 15, 15);
INSERT INTO produse_cosmetice VALUES (7, 'Gel de curatare Effaclar', 'La Roche-Posay', 75.50, 28, 7);
INSERT INTO produse_cosmetice VALUES (8, 'Crema hidratanta Hydro Boost', 'Neutrogena', 68.90, 22, 8);
INSERT INTO produse_cosmetice VALUES (9, 'SPF Anthelios 50+', 'La Roche-Posay', 89.99, 18, 9);
INSERT INTO produse_cosmetice VALUES (10, 'Serum Hyaluronic Acid', 'The Ordinary', 58.00, 26, 8);

COMMIT;

-- Customers (demo data)
INSERT INTO clienti_cosmetice VALUES (1, 'Popescu', 'Ana', 'ana.popescu@gmail.com', 'Bucuresti');
INSERT INTO clienti_cosmetice VALUES (2, 'Ionescu', 'Maria', 'maria.ionescu@gmail.com', 'Brasov');
INSERT INTO clienti_cosmetice VALUES (3, 'Georgescu', 'Elena', 'elena.georgescu@gmail.com', 'Cluj-Napoca');
INSERT INTO clienti_cosmetice VALUES (4, 'Dumitrescu', 'Ioana', 'ioana.dumitrescu@gmail.com', 'Bucuresti');
INSERT INTO clienti_cosmetice VALUES (5, 'Stan', 'Andreea', 'andreea.stan@gmail.com', 'Constanta');
INSERT INTO clienti_cosmetice VALUES (6, 'Marin', 'Bianca', 'bianca.marin@gmail.com', 'Ploiesti');
INSERT INTO clienti_cosmetice VALUES (7, 'Radu', 'Cristina', 'cristina.radu@gmail.com', 'Bucuresti');
INSERT INTO clienti_cosmetice VALUES (8, 'Tudor', 'Alexandra', 'alexandra.tudor@gmail.com', 'Pitesti');

COMMIT;

-- Orders
INSERT INTO comenzi_cosmetice VALUES (1, 1, TO_DATE('01-10-2026', 'DD-MM-YYYY'), 'Finalizata');
INSERT INTO comenzi_cosmetice VALUES (2, 2, TO_DATE('02-10-2026', 'DD-MM-YYYY'), 'In procesare');
INSERT INTO comenzi_cosmetice VALUES (3, 1, TO_DATE('03-10-2026', 'DD-MM-YYYY'), 'Finalizata');
INSERT INTO comenzi_cosmetice VALUES (4, 3, TO_DATE('03-10-2026', 'DD-MM-YYYY'), 'Expediata');
INSERT INTO comenzi_cosmetice VALUES (5, 4, TO_DATE('04-10-2026', 'DD-MM-YYYY'), 'Finalizata');
INSERT INTO comenzi_cosmetice VALUES (6, 5, TO_DATE('05-10-2026', 'DD-MM-YYYY'), 'In procesare');
INSERT INTO comenzi_cosmetice VALUES (7, 6, TO_DATE('05-10-2026', 'DD-MM-YYYY'), 'Finalizata');
INSERT INTO comenzi_cosmetice VALUES (8, 7, TO_DATE('06-10-2026', 'DD-MM-YYYY'), 'Expediata');
INSERT INTO comenzi_cosmetice VALUES (9, 8, TO_DATE('06-10-2026', 'DD-MM-YYYY'), 'Finalizata');
INSERT INTO comenzi_cosmetice VALUES (10, 2, TO_DATE('07-10-2026', 'DD-MM-YYYY'), 'Finalizata');

COMMIT;

-- Order details
INSERT INTO detalii_comanda_cosmetice VALUES (1, 1, 1, 69.99);
INSERT INTO detalii_comanda_cosmetice VALUES (1, 3, 1, 59.99);
INSERT INTO detalii_comanda_cosmetice VALUES (2, 7, 1, 75.50);
INSERT INTO detalii_comanda_cosmetice VALUES (2, 8, 1, 68.90);
INSERT INTO detalii_comanda_cosmetice VALUES (3, 5, 2, 64.99);
INSERT INTO detalii_comanda_cosmetice VALUES (4, 9, 1, 89.99);
INSERT INTO detalii_comanda_cosmetice VALUES (4, 10, 1, 58.00);
INSERT INTO detalii_comanda_cosmetice VALUES (5, 6, 1, 199.99);
INSERT INTO detalii_comanda_cosmetice VALUES (6, 2, 1, 49.99);
INSERT INTO detalii_comanda_cosmetice VALUES (6, 4, 1, 54.99);
INSERT INTO detalii_comanda_cosmetice VALUES (7, 7, 2, 75.50);
INSERT INTO detalii_comanda_cosmetice VALUES (8, 3, 1, 59.99);
INSERT INTO detalii_comanda_cosmetice VALUES (8, 5, 1, 64.99);
INSERT INTO detalii_comanda_cosmetice VALUES (9, 8, 1, 68.90);
INSERT INTO detalii_comanda_cosmetice VALUES (9, 10, 2, 58.00);
INSERT INTO detalii_comanda_cosmetice VALUES (10, 1, 1, 69.99);
INSERT INTO detalii_comanda_cosmetice VALUES (10, 9, 1, 89.99);

COMMIT;
