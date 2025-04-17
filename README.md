# DVD RENTAL SQL

## 📘  SQL - Dna Studio

1. **Tampilkan jumlah film per genre**
   ```sql
   SELECT genre, COUNT(*) AS jumlah_film
   FROM film
   GROUP BY genre;
