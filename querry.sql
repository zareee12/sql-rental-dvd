--Hitung jumlah transaksi rental berdasarkan category, tampilkan nama category dan jml transaksi rental.
select 
    name as nama_kategori
    , count(rental_id) as jumlah_transaksi_rental
from category cat
left join film_category fc on cat.category_id = fc.category_id
left join inventory i on fc.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
group by nama_kategori;

--Hitung jumlah transaksi rental berdasarkan judul film, tampilkan kolom title, release_year dan jml transaksi rental. filter 10 data jml transaksi terbesar
select 
    title
    , release_year
    , count(rental_id) as jumlah_transaksi_rental
from film f
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
group by 1, 2
order by jumlah_transaksi_rental desc
limit 10;

--Tampilkan total jumlah film (count as number_of_films)
select 
    count(film_id) as number_of_film
from film;

--Tampilkan semua nama actor dan judul filmnya (first_name, last_name, title)
select 
    first_name
    , last_name, title
from film f
left join film_actor fa on f.film_id = fa.film_id
left join actor a on fa.actor_id = a.actor_id;

--Tampilkan rata-rata tarif sewa rental film (rental_rate) gunakan fungsi AVG
select 
    AVG(rental_rate) as average_rental_rate
from film;

--Tampilkan semua film dengan kategori "Animation" (title)
select distinct 
    title as nama_film
    , name as kategori
from film f
left join film_category fc on f.film_id = f.film_id 
left join category cat on fc.category_id = cat.category_id
where name = 'Animation';

--Tampilkan judul film yang paling banyak disewa (title, count as rental_count)
select 
    title, 
    count(rental_id) as rental_count
from film f
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
group by title
order by rental_count desc;


---1.Tampilkan jumlah film per film_genre
select 
	name as genre
	, count(f.film_id) as jumlah_film
from film f
left join film_category fc on f.film_id = fc.film_id
left join category cat on fc.category_id = cat.category_id
group by genre;

---2. Tampilkan semua judul film yang huruf depannya "D"
select 
	title as judul_film
from film
where title like 'D%';

---3.Tampilkan judul film dan category film yang release nya antara tahun 2005 s/d 2010
select 
	title as judul_film
	, name as category_film
	, release_year 
from film f
left join film_category fc on f.film_id = fc.film_id
left join category cat on fc.category_id = cat.category_id
where release_year between 2005 and 2010;

---4. Tampilkan list data customer (customer_id, fullname, address, phone, city, country)
select 
	customer_id
	, concat(first_name, ' ' ,last_name) as full_name
	, address
	, phone
	, city
	, country
from customer c
left join address a on c.address_id = a.address_id
left join city ct on a.city_id = ct.city_id
left join country co on ct.country_id = co.country_id;

---5. Tampilkan jumlah transaksi rental dan amount payment-nya untuk semua customer
select 
	concat(first_name,' ', last_name) as customer_name
	, count(r.rental_id) as jumlah_transaksi_rental
	, sum(p.amount) as amount_payment
from payment p
left join rental r on p.customer_id = r.customer_id
left join customer c on r.customer_id = c.customer_id
group by customer_name;




