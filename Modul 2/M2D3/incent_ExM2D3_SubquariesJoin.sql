-- Vincent_ExM2D3_SubquariesJoin

use world;

-- Join

-- Soal 1
-- Tampilkan 10 kota dengan populasi terbesar beserta nama negaranya, urutkan berdasarkan populasinya dari yang terbesar!
select ci.name as Nama_Kota, co.name as Negara, ci.Population
from country co join city ci
on co.code=ci.CountryCode
order by Population desc limit 10;

-- Soal 2
-- Tampikan GNP negara Belanda (Netherlands), ibukota, beserta populasi dari ibukotanya!
select co.name Negara, co.GNP, ci.name Capital, ci.population Population
from country co join city ci
on co.code=ci.CountryCode
where co.capital=ci.id and co.name='Netherlands';

select co.name Negara, co.GNP, ci.name Capital, ci.population Population
from country co join city ci
on co.capital=ci.id
where co.name='Netherlands';

-- Soal 3
-- Tampilkan 10 negara yang memiliki persentase pemakai bahasa spanyol paling tinggi!
select co.name as Negara, cl.percentage as Persentase
from country co join countrylanguage cl
on co.code=cl.CountryCode
where cl.Language='Spanish'
order by cl.Percentage desc Limit 10;

-- Soal 4
-- Tampikan GNP negara Indonesia, ibukota, populasi dari ibukotanya dan bahasa resmi yang dipakai!
select co.name Negara, co.GNP, ci.name Ibu_Kota, ci.population Populasi, cl.language Bahasa
from country co join city ci on co.code=ci.CountryCode
join countrylanguage cl on co.code=cl.CountryCode
where co.capital=ci.id and co.name='Indonesia' and cl.isofficial='T';

select co.name Negara, co.GNP, ci.name Ibu_Kota, ci.population Populasi, cl.language Bahasa
from country co join city ci on co.capital=ci.id
join countrylanguage cl on co.code=cl.CountryCode
where co.name='Indonesia' and cl.isofficial='T';


-- Sub Query

-- Soal 1
-- Tampilkan benua dengan jumlah negara lebih dari jumlah negara di benua North America!

select continent, count(name) Jumlah_Negara from country group by continent
having count(name)>(select count(name) from country group by continent having continent='North America');

select continent, count(name) Jumlah_Negara from country group by continent
having count(name)>(select count(name) from country where continent='North America');

-- Soal 2
-- Tampilkan negara di Asia dengan GNP di atas rata-rata GNP negara-negara di benua Eropa, diurutkan dari yang terbesar!
select name, GNP from country where continent ='Asia' and GNP>(select avg(gnp) from country group by continent having continent='Europe') order by GNP desc;

select name, GNP from country where continent ='Asia' and GNP>(select avg(gnp) from country where continent='Europe') order by GNP desc;

-- Soal 3
-- Tampilkan benua berakhiran huruf 'a' dengan jumlah region lebih dari jumlah region benua Asia!
select count(distinct region) Jumlah_Region,continent from country group by continent having continent like '%a'
 and count(distinct region)>(select count(distinct region) from country where continent='Asia');