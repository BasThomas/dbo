# Opdracht 2

1. Allereerst heb ik het CREATE-script omgeschreven van `Oracle SQL` naar `MYSQL`.
2. `data_generator` voegt data toe aan de tabllen met `CALL data_generator`.
3. `data_generator_2` voegt data toe aan de gespecificeerde tabel, in de gespecificeerde database.

## Running

```sql
CALL data_generator;
```

```sql
CALL data_generator_2('dbo6', 'Auteur', 5, 0);
```