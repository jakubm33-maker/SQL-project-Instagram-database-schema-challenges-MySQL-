# Instagram SQL Challenges (MySQL)

Mini-projekt SQL z bazą `ig_clone` (users, photos, comments, likes, follows, tags).  
Repo zawiera **schemat**, **mały seed** danych oraz **zestaw zapytań** (JOIN/GROUP BY/HAVING, podzapytania, funkcje daty).

## Szybki start
W MySQL 8.x:
```sql
SOURCE 01_schema.sql;
SOURCE data/seed/seed.sql;
-- teraz możesz odpalać wybrane fragmenty z:
SOURCE 03_challenges.sql;
