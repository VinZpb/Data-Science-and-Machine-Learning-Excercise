## Exercise 1 SQL

-- USE world;
use world;
-- SHOW FULL TABLES;
show full tables;
-- SELECT * FROM country;
select * from country;

# 1.  Ada berapa negara di database world?
-- > 239
select count(name) from country;

# 2.  Tampilkan rata-rata harapan hidup di benua Asia!
-- > 67.44118
select avg(LifeExpectancy) from country where Continent="Asia";

# 3.  Tampilkan total populasi di Asia Tenggara!
-- > 518541000
select sum(Population) from country where Region="Southeast Asia";

# 4.  Tampilkan rata-rata GNP di benua Afrika region Eastern Africa. Gunakan alias 'Average_GNP' untuk rata-rata GNP!
-- > 3496.250000
select avg(gnp) as Average_GNP from country where Continent="Africa" and Region="Eastern Africa";

# 5.  Tampilkan rata-rata Populasi pada negara yang luas areanya lebih dari 5 juta km2! 
-- > 274713857.1429
select avg(Population) from country where SurfaceArea>5e6;

# 6.  Ada berapa bahasa (unique) di dunia?
-- > 458
select count(distinct Language) from countrylanguage;

# 7.  Tampilkan GNP dari 5 negara di Asia yang populasinya di atas 100 juta penduduk!
-- > Bangladesh	32852.00
-- > China	982268.00
-- > Indonesia	84982.00
-- > India	447114.00
-- > Japan	3787042.00
select name, gnp from country where continent="Asia" and Population>1e8 limit 5;

# 8.  Tampilkan negara di Afrika yang memiliki SurfaceArea di atas 1.200.000!
-- > 
select name, surfacearea from country where SurfaceArea>12e5 and continent="Africa";

# 9.  Tampilkan negara di Asia yang sistem pemerintahannya adalah republik. Ada berapa jumlah negaranya?
-- > 26
select name,GovernmentForm from country where continent="Asia" and GovernmentForm="Republic";
select count(name) from country where continent="Asia" and GovernmentForm="Republic";

# 10. Tampilkan jumlah negara di Eropa yang merdeka sebelum 1940!
-- > 27
select count(name) from country where continent="Europe" and IndepYear<1940;