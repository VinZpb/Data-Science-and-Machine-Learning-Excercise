# Vincent_ExM2D4_CteWindowFunctionQuestion

# SAKILA
use sakila;

# 1. Tampilkan lima total rental_duration di tiap kategori film.
# Hitung jumlah kumulatif atau cumulative sum dan rata-rata bergerak atau moving average dari total rental_duration.
# Untuk membatasi data, pilih hanya film yang rental_duration-nya ≤ rata-rata keseluruhan rental_duration.
with t1 as (select c.name Ctgry, sum(f.rental_duration) RD from film f 
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
where f.rental_duration<=(select avg(rental_duration) from film)
group by ctgry order by RD desc limit 5)
select ctgry, RD,
sum(RD) over(order by RD desc rows between unbounded preceding and current row) Cummulative_Sum, 
avg(RD) over(order by RD desc rows between unbounded preceding and current row) Moving_Average 
From t1;


# 2. Tampilkan rating film beserta rata-rata durasi rentalnya.
# Gunakan data durasi rental film yang berasal dari 3 kategori dengan jumlah film terbanyak

with t22 as (select rating, rental_duration, category_id, N_Title, dense_rank() over(order by N_Title desc) NCat_Rank
from (select f.rating, f.rental_duration, c.category_id, count(f.title) over(partition by c.category_id) N_Title from film f 
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id) as tabel21)
select rating, avg(rental_duration) from t22
where NCat_Rank<=3
group by rating;


# 3. Tampilkan judul film dan total konsumen yang menyewa di tiap judul film tersebut.
# Saat menampilkan data tersebut, penuhi beberapa syarat berikut ini.
# Pertama, huruf pertama judul film adalah huruf ‘C’ atau ‘G’.
# Kedua, total konsumen yang menyewa di tiap judul film harus lebih tinggi dari rata-rata keseluruhan.
# Ketiga, total konsumen yang menyewa di tiap judul film harus ≥ 15 dan ≤ 25
with t3 as (select f.title Judul, count(r.customer_id) N_Customer from rental r 
left join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
where f.title like 'C%' or f.title like 'G%'
group by f.title)
select Judul, N_Customer from t3
where N_Customer > (select avg(N_Customer) from t3) and N_Customer between 15 and 25;

