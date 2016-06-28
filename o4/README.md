# Opdracht 4

1a:

| Meting | Tijd  |
|--------|-------|
| 1      | 1.5   |
| 2      | 0.5   |
| 3      | 0.5   |
| 4      | 0.3   |
| 5      | 0.4   |

1b:

| Meting | Tijd  |
|--------|-------|
| 1      | 0.5   |
| 2      | 0.4   |
| 3      | 0.4   |
| 4      | 0.3   |
| 5      | 0.5   |

1c:

Eerste meting duurt het langst, daarna is de query snel(ler). Dit vanwege het feit dat de indexering pas na de eerste query kan plaatsvinden.

2a:

Tabellen aangemaakt en gevuld.

2b:

| Query                                                                                                                                  | Tijd  |
|----------------------------------------------------------------------------------------------------------------------------------------|-------|
| SELECT COUNT(*) FROM products as p WHERE prod_list_price < 1.15 * (SELECT avg(unit_cost),FROM costs as c,WHERE c.prod_id = p.prod_id); | 0.06  |
| SELECT COUNT(*) FROM products as p WHERE prod_list_price < (SELECT 1.15 * avg(unit_cost),FROM costs,WHERE prod_id = p.prod_id);        | 0.007 |

2c:

Ook hier weer geldt dat de optimalisatie pas kan plaatsvinden na het uitvoeren van de query in het eerste geval. Ook het meenemen van de berekening in de `SELECT`, zorgt voor een directere berekening welke voor een snellere query zorgt.

3a / 3b:

| Query                                                                                                                | Tijd        |
|----------------------------------------------------------------------------------------------------------------------|-------------|
| SELECT count(*) FROM job_history as jh, employees as e WHERE substring(e.employee_id,1)=substring(jh.employee_id,1); | - (timeout) |
| SELECT count(*) FROM job_history as jh, employees as e WHERE e.employee_id=jh..employee_id;                          | - (timeout) |

3c:

Heel veel copying en berekening van waardes; dat kost immens veel kracht - en is niet nodig.

4a:

| Query                                                                                        | Tijd |
|----------------------------------------------------------------------------------------------|------|
| SELECT count(*) FROM (SELECT o.name FROM old as o union SELECT n.name FROM new as n) as abc; | 1.1  |
| SELECT count(*) FROM (SELECT name FROM old union all SELECT name FROM new);                  | 0.6  |

4b:

De geoptimaliseerde query maakt gebruik van een `sort`, de eerste van `distinct`.

5a:

| Query                                                           | Tijd |
|-----------------------------------------------------------------|------|
| SELECT COUNT(*) FROM myemp WHERE salary < 2000;                 | 2.3  |
| SELECT COUNT (*) FROM myemp WHERE salary BETWEEN 2000 AND 4000; | 0.4  |
| SELECT COUNT (*) FROM myemp WHERE salary>4000;                  | 0.3  |
| === TOTAAL ===                                                  | ~3.5 |

5b:

| Query                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Tijd |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------|
| CREATE PROCEDURE `myempsaltary`() BEGIN,DECLARE salt INT; DECLARE lowest INT(10) DEFAULT 0; DECLARE mid INT(10) DEFAULT 0; DECLARE highest INT(10) DEFAULT 0;,DECLARE fin INT default 0;,DECLARE curs CURSOR FOR SELECT saltary FROM myemp; DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin =1; OPEN curs; get_salt: LOOP FETCH curs INTO salt; if fin =1 THEN leave get_salt; END IF;,CASE,WHEN salt4000 THEN SET highest = highest +1; END CASE; END LOOP get_salt; CLOSE curs;,select lowest, mid, highest; END | 0.3  |

5c:

Alles wordt in een loop uitgevoerd, waarmee je herhaling en copying voorkomt.

6a, b, c:

| Query                                            | Tijd |
|--------------------------------------------------|------|
| SELECT * FROM orders WHERE order_id_char = 50;   | 0.4  |
| SELECT * FROM orders WHERE order_id_char = ‘50’; | 0.03 |

6d:

Aanpassing van een `VARCHAR` naar een `INT`.

6e:

Ja, de index zorgt voor een vaste volgorde. Dit maakt het mogelijk om resultaten over te slaan als je op id zoekt; het is een `Btree` (`binary search`)