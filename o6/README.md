# Opdracht 6

Allereerst heb ik het `CREATE`-script omgeschreven naar `MySQL`.

1a)

```sql
CREATE MATERIALIZED VIEW materialized_view_empt_dept
REFRESH FAST
ENABLE QUERY REWRITE
AS
SELECT dept.deptno,
       dept.dname,
       COUNT(*) number_of_employees,
       SUM(sal) total_salary_of_employees
FROM emp, dept
WHERE emp.deptno = dept.deptno
GROUP BY dept.deptno,
         dept.dname;

ALTER TABLE materialized_view_empt_dept ADD CHECK (total_salary_of_employees < 20000);
```

1b)

Ja, dit is sneller dan een query. Dit omdat er bepaalde optimalisaties plaatsvinden; zie 1c / 1d.

1c)

Ik ben er niet achter kunnen komen hoe de view aangepast kan worden zodat hij gebruikt wordt, zonder deze expliciet aan te kunnen roepen. Dit lijkt niet te kunnen in MySQL?

1d)

De view wordt up-to-date gehouden door `QUERY REWRITE` toe te staan.

1e)

Door het toevoegen van `REFRESH FAST`, wordt de view alleen ververst waar nodig.

2a)

> De som van de salarissen in een afdeling mag niet meer zijn dan 20.000

Constraint checks kunnen gedifineerd worden bij het aanmaken van een table, dus dit kan doorgevoerd worden.
Zie https://en.wikipedia.org/wiki/Check_constraint.

Bijvoorbeeld:

```sql
CREATE TABLE table_name (
    CONSTRAINT constraint_name CHECK ( **predicate** ),
)
```

2b)

Wanneer er enkel gebruikt wordt gemaakt van triggers, welke achteraf pas uitgevoerd kunnen worden, kun je de vraag niet oplossen. Je kunt vanzelfsprekend geen `undo` doen.

2c)

Je kunt gebruik maken van materialized views. Hierin worden resultaten opgeslagen, maar kun je ook gebruik maken van een check om de resultaten te filteren (zie 1a).