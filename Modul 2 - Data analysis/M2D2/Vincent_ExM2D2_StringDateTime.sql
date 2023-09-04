# Vincent_ExM2D2_StringDateTime

# World
USE world;

#1. Ada berapa region di database world? Ubah headernya menjadi 'Jumlah_Region'!
-- > 25
select count(distinct region) as Jumlah_Region from country;

#2. Ada berapa negara di Africa? Ubah headernya menjadi 'Jumlah_Negara'!
-- > 58
select count(name) as Jumlah_Negara from country where continent="africa";

#3. Tampilkan 5 negara dengan populasi terbesar! Ubah headernya menjadi 'Nama_Negara' dan 'Populasi'!
-- > China	1277558000
-- > India	1013662000
-- > United States	278357000
-- > Indonesia	212107000
-- > Brazil	170115000
select name as Nama_Negara, population as Populasi from country order by population desc limit 5;

#4. Tampilkan rata-rata harapan hidup tiap benua dan urutkan dari yang terendah! Ubah headernya menjadi 'Nama_Benua' dan 'Rata_Rata_Harapan_Hidup'!
-- Antarctica	
-- Africa	52.57193
-- Asia	67.44118
-- Oceania	69.71500
-- South America	70.94615
-- North America	72.99189
-- Europe	75.14773
select continent as Nama_Benua, avg(lifeexpectancy) as Rata_Rata_Harapan_Hidup from country group by continent order by avg(lifeexpectancy);

#5. Tampilkan Jumlah region tiap benua dengan jumlah region lebih dari 3! Ubah headernya menjadi 'Nama_Benua' dan 'Jumlah_Region'!
-- Asia	4
-- Europe	6
-- Africa	5
-- Oceania	5
select continent as Nama_Benua, count(distinct region) as Jumlah_Region from country group by continent having count(distinct region)>3;

#6. Tampilkan rata-rata GNP di Afrika berdasarkan regionnya dan urutkan dari rata-rata GNP terbesar! Ubah headernya menjadi 'Nama_Region' dan 'Rata_Rata_GNP'!
-- Northern Africa	34838.571429
-- Southern Africa	25386.200000
-- Western Africa	6277.117647
-- Central Africa	3659.777778
-- Eastern Africa	3496.250000
select region as Nama_Region, avg(gnp) as Rata_Rata_GNP from country where continent='africa' group by region order by avg(gnp) desc;

#7. Tampilkan negara di Eropa yang memiliki nama dimulai dari huruf I
-- Ireland
-- Iceland
-- Italy
select name from country where continent='europe' and name like 'I%';

#8. Tampilkan Jumlah bahasa tiap negara! Urutkan dari yg paling banyak! Ubah headernya menjadi 'Jumlah_Bahasa'
select countrycode,count(language) as Jumlah_Bahasa from countrylanguage group by countrycode order by count(language) desc;

#9. Tampilkan nama negara yang panjang hurufnya 6 huruf dan berakhiran 'O'
-- Monaco
-- Mexico
select name from country where name like '_____o';

#10. Tampilkan 7 bahasa terbesar di Indonesia (secara persentase, dengan persentase yg dibulatkan)! Ubah headernya menjadi 'Bahasa' dan 'Persentase'
-- Javanese	39
-- Sunda	16
-- Malay	12
-- Madura	4
-- Bali	2
-- Banja	2
-- Batakki	2
select language as Bahasa, round(percentage) as Persentase from countrylanguage where countrycode='IDN' order by round(percentage) desc limit 7;

#11. Tampilkan Continent yang memiliki GovernmentForm kurang dari 10
-- Antarctica	5
-- South America	4
select continent,count(distinct governmentform) from country group by continent having count(distinct governmentform)<10;

#12. Region mana saja yg Total GNP-nya mengalami kenaikan dari Total GNP sebelumnya (GNPOld)? Urutkan dari yg tertinggi!
select region,sum(gnp),sum(gnpold),sum(gnp)-sum(gnpold) from country group by region having sum(gnp)>sum(gnpold) order by sum(gnp) desc;

USE Sakila;
# 13. Tampilkan tanggal create date sebagai Tanggal_Pembuatan dan last_update sebagai Terakhir_Diperbarui pada table customer menjadi format tanggal-bulan-tahun, seperti 30-January-2005.
use sakila;
select date_format(create_date,'%d-%M-%Y') as Tanggal_Pembuatan ,date_format(last_update,'%d-%M-%Y') as Terakhir_Diperbarui from customer;

