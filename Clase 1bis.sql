use pubs;

show tables;

select * from titles;

-- funciones de agrupacion
select max(price) 'libro mas caro' from titles;-- 22.95
select min(hire_date) '1er ingreso' from employee;-- '1988-10-09'
select avg(price) promedio from titles;-- 14.76
select sum(price) total from titles;-- 236.26
select round(sum(price), 2) total from titles;-- 236.26
select count(*)  from titles;-- 19 cuenta nulos y no nulos
select count(title_id)  from titles;-- 19 cuenta solo no nulos
select count(price)  from titles;-- 16 -> hay 3 nulos

-- Agrupaciones
select		type as categoria,
			count(title_id) cantidad
from 		titles
where		type <> ''
-- group by	type;
group by	categoria
-- having		count(title_id) > 2;
having		cantidad > 2
-- order by	count(title_id) desc;
-- order by	2 desc;
order by	cantidad desc
limit		2,1;

select 1 from titles;

describe titles;

-- Relaciones ente tablas
--  inner join
create database empresa;

use empresa;

create table sucursales(suc_id int, suc_nombre char(20));
create table empleados(emp_id int, emp_nombre char(20), suc_id int);

insert into sucursales values
(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');

insert into empleados values
(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;

-- Listar el nombre de las sucursales y de los empleados q en ellas trabajan
select 		suc_nombre,
			emp_nombre
from		sucursales
inner join	empleados
on			sucursales.suc_id = empleados.suc_id;

-- variante
select 		suc_nombre,
			emp_nombre
from		sucursales s
inner join	empleados e
on			s.suc_id = e.suc_id;

-- variante 2
select 		suc_nombre,
			emp_nombre
from		sucursales s
join		empleados e
on			s.suc_id = e.suc_id;

-- variante no ANSI
select 		suc_nombre,
			emp_nombre
from		sucursales s, empleados e
where		s.suc_id = e.suc_id;


-- producto cartesiano
select 		suc_nombre,
			emp_nombre
from		sucursales s, empleados e;

-- variante
select 		suc_nombre,
			emp_nombre
from		sucursales s
cross join	empleados e;









