create database comercio;

use comercio;

create table sucursales(suc_id int, suc_nombre varchar(20));
create table empleados(emp_id int, emp_nombre varchar(20),suc_id int);

insert into sucursales values
(1,'Centro'),(2,'Congreso'),(3,'Caballito'),(4,'Palermo');

insert into empleados values
(1,'Juan',1),(2,'Carlos',2),(3,'Jose',2),(4,'Maria',null);

select * from sucursales;
select * from empleados;	

-- INNER JOIN
-- listar el nombre de las sucursales y de
-- los empleados que en ellas trabajan
select		suc_nombre,
			emp_nombre
from		sucursales
inner join	empleados
on			sucursales.suc_id = empleados.suc_id;

-- variante
select		suc_nombre,
			emp_nombre
from		sucursales as s
inner join	empleados e
on			s.suc_id = e.suc_id;

-- variante 2
select		suc_nombre,
			emp_nombre
from		sucursales as s
join		empleados e
on			s.suc_id = e.suc_id;

-- variante no ANSI
select		suc_nombre,
			emp_nombre
from		sucursales as s, empleados e
where		s.suc_id = e.suc_id;

-- producto cartesiano
select		suc_nombre,
			emp_nombre
from		sucursales as s, empleados e;

select		suc_nombre,
			emp_nombre
from		sucursales 
cross join	empleados;

-- outer join
-- listar los empleados q no trabajan en ninguna sucursal
-- tabla ppal: empleados
select 	e.emp_nombre
		-- ,s.* -- todos los campos de la tabla secundaria
from	sucursales s
right   outer join empleados e
on		s.suc_id = e.suc_id
where	s.suc_id is null;















