CREATE TABLE categorii (
    id_categorie NUMBER(3) PRIMARY KEY,
    denumire VARCHAR2(50) NOT NULL,
    id_categorie_parinte NUMBER(3),

    CONSTRAINT fk_categorie_parinte
        FOREIGN KEY (id_categorie_parinte)
        REFERENCES categorii(id_categorie)
);

CREATE TABLE produse_cosmetice (
    id_produs NUMBER(4) PRIMARY KEY,
    denumire VARCHAR2(100) NOT NULL,
    brand VARCHAR2(50),
    pret NUMBER(8,2) NOT NULL,
    stoc NUMBER(4) NOT NULL,
    id_categorie NUMBER(3),

    CONSTRAINT fk_produs_categorie
        FOREIGN KEY (id_categorie)
        REFERENCES categorii(id_categorie)
);

CREATE TABLE clienti_cosmetice (
    id_client NUMBER(4) PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    prenume VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    oras VARCHAR2(50)
);

CREATE TABLE comenzi_cosmetice (
    id_comanda NUMBER(4) PRIMARY KEY,
    id_client NUMBER(4) NOT NULL,
    data_comanda DATE NOT NULL,
    status VARCHAR2(30),

    CONSTRAINT fk_comanda_client
        FOREIGN KEY (id_client)
        REFERENCES clienti_cosmetice(id_client)
);

CREATE TABLE detalii_comanda_cosmetice (
    id_comanda NUMBER(4),
    id_produs NUMBER(4),
    cantitate NUMBER(3) NOT NULL,
    pret_unitar NUMBER(8,2) NOT NULL,

    CONSTRAINT pk_detalii_comanda
        PRIMARY KEY (id_comanda, id_produs),

    CONSTRAINT fk_detalii_comanda
        FOREIGN KEY (id_comanda)
        REFERENCES comenzi_cosmetice(id_comanda),

    CONSTRAINT fk_detalii_produs
        FOREIGN KEY (id_produs)
        REFERENCES produse_cosmetice(id_produs)
);
