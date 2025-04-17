# DVD RENTAL SQL

## 📘  SQL - Dna Studio

# 📀 DVD RENTAL SQL PROJECT

Selamat datang di proyek eksplorasi SQL menggunakan data DVD Rental!  
Proyek ini merupakan simulasi dari sistem penyewaan DVD seperti yang digunakan di toko-toko rental film, dan bertujuan sebagai portofolio SQL yang dapat digunakan untuk keperluan analisis data.

---

## 🧠 Background Story

data ini berisi perusahaan rental DVD film di seluruh dunia. Untuk meningkatkan kualitas layanan dan memahami perilaku pelanggan, mereka membangun sistem basis data untuk merekam seluruh proses bisnis: dari penyimpanan film, peminjaman, pembayaran, hingga laporan pelanggan terbaik.  

Sebagai seorang data analyst atau SQL developer, kamu dihadapkan dengan kebutuhan untuk mengekstrak informasi penting dari database ini guna membantu pengambilan keputusan.

---

## 🎯 Objective

Tujuan dari proyek ini:
- Memahami dan membaca struktur relasi antar tabel dalam database relasional.
- Membuat query SQL untuk menjawab kebutuhan bisnis nyata.
- Menyajikan data dengan rapi dan logis.

---

## 🗂️ ER Diagram (Entity Relationship Diagram)

![DVD Rental ER Diagram](https://github.com/zareee12/sql-rental-dvd/blob/main/image/diagram%20dvd-rental.jpeg)

Diagram di atas menjelaskan bagaimana tabel-tabel saling berelasi. Beberapa relasi penting antara lain:
- Setiap **film** bisa memiliki banyak **kategori** (via tabel `film_category`).
- Setiap **customer** dapat melakukan banyak **rental** dan pembayaran (`payment`).
- Film disimpan di berbagai **store**, dikelola oleh **staff**.
- Struktur alamat terdiri dari `address`, `city`, dan `country`.

---

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

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%202.png" alt="Jumlah Film per Genre" width="200"/>
   
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

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%204.png" alt="Jumlah Film per Genre" width="550"/>

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

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%206.png" alt="Jumlah Film per Genre" width="300"/>

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

<img src="https://github.com/zareee12/sql-rental-dvd/blob/main/image/hasil%207.png" alt="Jumlah Film per Genre" width="650"/>


   

