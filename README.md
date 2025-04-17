# DVD RENTAL SQL

## 📘  SQL - Dna Studio

1. **Tampilkan jumlah film per genre**
   ```sql
   SELECT genre, COUNT(*) AS jumlah_film
   FROM film
   GROUP BY genre;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%201.png" alt="Jumlah Film per Genre" width="250"/>

2. **Tampilkan semua judul film yang huruf depannya "D**
   ```sql
   SELECT title
   FROM film
   WHERE title LIKE 'D%';

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%202.png" alt="Jumlah Film per Genre" width="250"/>
   
3. **Tampilkan judul film dan kategori film yang rilis antara tahun 2005 s/d 2010**
   ```sql
   SELECT title
   , category
   FROM film
   WHERE release_year BETWEEN 2005 AND 2010;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%203.png" alt="Jumlah Film per Genre" width="450"/>

4. **Tampilkan list data customer**
   ```sql
   SELECT customer_id, CONCAT(first_name, ' ', last_name) AS fullname,
       address, phone, city, country
   FROM customer;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%204.png" alt="Jumlah Film per Genre" width="450"/>

5. **Tampilkan jumlah transaksi rental dan total pembayaran (amount) untuk semua customer**
   ```sql
   SELECT customer_id, COUNT(rental_id) AS jumlah_transaksi, SUM(amount) AS total_payment
   FROM payment
   GROUP BY customer_id;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%205.png" alt="Jumlah Film per Genre" width="450"/>
   
6. **Tampilkan status pengembalian film dan total jumlah film**
   ```sql
   SELECT 
    CASE 
        WHEN return_date < due_date THEN 'Lebih Awal'
        WHEN return_date = due_date THEN 'Tepat Waktu'
        WHEN return_date > due_date THEN 'Terlambat'
    END AS status_pengembalian,
    COUNT(*) AS total_film
   FROM rental
   GROUP BY status_pengembalian;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%206.png" alt="Jumlah Film per Genre" width="450"/>

7. **Tampilkan 10 pelanggan dengan total penjualan tertinggi, beserta informasi detail pelanggan**
   ```sql
   SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.email, a.address, a.phone, ci.city, co.country,
    SUM(p.amount) AS total_penjualan_tertinggi
   FROM customer c
   JOIN address a ON c.address_id = a.address_id
   JOIN city ci ON a.city_id = ci.city_id
   JOIN country co ON ci.country_id = co.country_id
   JOIN payment p ON c.customer_id = p.customer_id
   GROUP BY c.customer_id
   ORDER BY total_penjualan_tertinggi DESC
   LIMIT 10;

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%207.png" alt="Jumlah Film per Genre" width="550"/>


   

