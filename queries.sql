-- ==========================================
-- 1. HIERARCHICAL QUERIES
-- ==========================================

-- Query 1: Display the product category hierarchy,
-- including hierarchy levels and full category paths.

SELECT
    id_categorie,
    denumire,
    LEVEL AS nivel_ierarhic,
    SYS_CONNECT_BY_PATH(denumire, ' -> ') AS traseu_categorie
FROM categorii
START WITH id_categorie_parinte IS NULL
CONNECT BY PRIOR id_categorie = id_categorie_parinte
ORDER SIBLINGS BY denumire;


-- Query 2: Traverse the hierarchy upwards from
-- Mascara to the main Cosmetics category.

SELECT
    id_categorie,
    denumire,
    LEVEL AS nivel_ierarhic,
    SYS_CONNECT_BY_PATH(denumire, ' -> ') AS traseu_categorie
FROM categorii
START WITH denumire = 'Mascara'
CONNECT BY PRIOR id_categorie_parinte = id_categorie;


-- ==========================================
-- 2. JOINS, SUBQUERIES AND AGGREGATIONS
-- ==========================================

-- Query 3: Calculate the total number of products
-- purchased and total spending for each customer.

SELECT
    c.id_client,
    c.nume,
    c.prenume,
    SUM(d.cantitate) AS total_produse,
    SUM(d.cantitate * d.pret_unitar) AS total_cheltuit
FROM clienti_cosmetice c
INNER JOIN comenzi_cosmetice co
    ON c.id_client = co.id_client
INNER JOIN detalii_comanda_cosmetice d
    ON co.id_comanda = d.id_comanda
GROUP BY
    c.id_client,
    c.nume,
    c.prenume
ORDER BY total_cheltuit DESC;


-- Query 4: Find categories where the average
-- product price exceeds 60 RON.

SELECT
    c.id_categorie,
    c.denumire,
    COUNT(p.id_produs) AS nr_produse,
    ROUND(AVG(p.pret), 2) AS pret_mediu
FROM categorii c
LEFT JOIN produse_cosmetice p
    ON c.id_categorie = p.id_categorie
GROUP BY
    c.id_categorie,
    c.denumire
HAVING AVG(p.pret) > 60
ORDER BY pret_mediu DESC;


-- Query 5: Find products priced above
-- the overall average product price.

SELECT
    p.id_produs,
    p.denumire AS produs,
    p.brand,
    p.pret,
    c.denumire AS categorie
FROM produse_cosmetice p
JOIN categorii c
    ON p.id_categorie = c.id_categorie
WHERE p.pret >
(
    SELECT AVG(pret)
    FROM produse_cosmetice
)
ORDER BY p.pret DESC;


-- Query 6: Find customers who purchased at least
-- one product from a direct Skincare subcategory.

SELECT
    c.id_client,
    c.nume,
    c.prenume,
    COUNT(DISTINCT co.id_comanda) AS nr_comenzi,
    SUM(d.cantitate * d.pret_unitar) AS total_cheltuit
FROM clienti_cosmetice c
JOIN comenzi_cosmetice co
    ON c.id_client = co.id_client
JOIN detalii_comanda_cosmetice d
    ON co.id_comanda = d.id_comanda
GROUP BY
    c.id_client,
    c.nume,
    c.prenume
HAVING EXISTS
(
    SELECT 1
    FROM comenzi_cosmetice co2
    JOIN detalii_comanda_cosmetice d2
        ON co2.id_comanda = d2.id_comanda
    JOIN produse_cosmetice p2
        ON d2.id_produs = p2.id_produs
    JOIN categorii cat2
        ON p2.id_categorie = cat2.id_categorie
    WHERE co2.id_client = c.id_client
      AND cat2.id_categorie_parinte = 3
);


-- Query 7: Analyze categories with total sales
-- above the average order line value.

SELECT
    c.id_categorie,
    c.denumire,
    COUNT(DISTINCT p.id_produs) AS nr_produse_vandute,
    SUM(d.cantitate * d.pret_unitar) AS total_vanzari
FROM categorii c
JOIN produse_cosmetice p
    ON c.id_categorie = p.id_categorie
JOIN detalii_comanda_cosmetice d
    ON p.id_produs = d.id_produs
GROUP BY
    c.id_categorie,
    c.denumire
HAVING SUM(d.cantitate * d.pret_unitar) >
(
    SELECT AVG(cantitate * pret_unitar)
    FROM detalii_comanda_cosmetice
)
ORDER BY total_vanzari DESC;


-- Query 8: Identify customers with at least
-- two orders and spending above the average
-- order line value.

SELECT
    c.id_client,
    c.nume,
    c.prenume,
    COUNT(DISTINCT co.id_comanda) AS nr_comenzi,
    SUM(d.cantitate * d.pret_unitar) AS total_cheltuit
FROM clienti_cosmetice c
JOIN comenzi_cosmetice co
    ON c.id_client = co.id_client
JOIN detalii_comanda_cosmetice d
    ON co.id_comanda = d.id_comanda
GROUP BY
    c.id_client,
    c.nume,
    c.prenume
HAVING COUNT(DISTINCT co.id_comanda) >= 2
   AND SUM(d.cantitate * d.pret_unitar) >
   (
       SELECT AVG(cantitate * pret_unitar)
       FROM detalii_comanda_cosmetice
   )
ORDER BY total_cheltuit DESC;


-- ==========================================
-- 3. ANALYTICAL FUNCTIONS
-- ==========================================

-- Query 9: Compare each product price with
-- the average price within its category.

SELECT
    p.id_produs,
    p.denumire,
    p.id_categorie,
    p.pret,
    ROUND(
        AVG(p.pret) OVER (
            PARTITION BY p.id_categorie
        ),
        2
    ) AS pret_mediu_categorie
FROM produse_cosmetice p
ORDER BY p.id_categorie, p.pret DESC;


-- Query 10: Rank products by price
-- within each category.

SELECT
    p.id_produs,
    p.denumire,
    p.id_categorie,
    p.pret,
    RANK() OVER (
        PARTITION BY p.id_categorie
        ORDER BY p.pret DESC
    ) AS pozitie_in_categorie
FROM produse_cosmetice p
ORDER BY p.id_categorie, pozitie_in_categorie;


-- Query 11: Compare each product price
-- with the previous product's price.

SELECT
    p.id_produs,
    p.denumire,
    p.pret,
    LAG(p.pret) OVER (
        ORDER BY p.pret
    ) AS pret_anterior,
    p.pret - LAG(p.pret) OVER (
        ORDER BY p.pret
    ) AS diferenta_pret
FROM produse_cosmetice p
ORDER BY p.pret;


-- Query 12: Calculate the cumulative sum
-- of product prices.

SELECT
    p.id_produs,
    p.denumire,
    p.pret,
    SUM(p.pret) OVER (
        ORDER BY p.pret
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS suma_cumulata
FROM produse_cosmetice p
ORDER BY p.pret;


-- Query 13: Display each product alongside
-- the highest price in its category.

SELECT
    p.id_produs,
    p.denumire,
    p.id_categorie,
    p.pret,
    FIRST_VALUE(p.pret) OVER (
        PARTITION BY p.id_categorie
        ORDER BY p.pret DESC
    ) AS pret_maxim_categorie
FROM produse_cosmetice p
ORDER BY p.id_categorie, p.pret DESC;


-- Query 14: Count the number of products
-- belonging to each category.

SELECT
    p.id_produs,
    p.denumire,
    p.id_categorie,
    p.pret,
    COUNT(*) OVER (
        PARTITION BY p.id_categorie
    ) AS nr_produse_categorie
FROM produse_cosmetice p
ORDER BY p.id_categorie, p.denumire;
