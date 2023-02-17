use TPSQL2;

CREATE table Alumnos_aprobados(
dni int not null,
nombre varchar(50) not null,
materia varchar(20) not null,
notas int not null);

#2
create table Alumnos_back(
dni int not null,
nombre varchar(50) not null,
materia varchar(20) not null,
notas int not null,
idColegio int not null,
nacionalidad varchar(30));

create trigger Alumosb
after insert on Alumnos for each row
insert Alumnos_back (dni,nombre,materia,notas,idColegio,nacionalidad) values (new.dni,new.nombre,new.materia,new.notas,new.idColegio,new.nacionalidad);

#3
create table Log_Alumnos(
fecha date not null,
usario varchar(40) not null,
accion varchar(20) not null,
dni int not null,
nombre varchar(50) not null);

#4
Alter table Colegio add ciudad varchar(50);

#5
update Colegio set ciudad="Buenos aires" where id=1 or id=3 or id=5; 
update Colegio set ciudad="Rosario" where id=2 or id=4;

#6
create trigger LogDelete
after delete on Alumnos for each row
insert into Log_Alumnos(fecha,usario,accion,dni,nombre)values(now(),user(),"delete",old.dni,old.nombre);

create trigger LogInsert
after insert on Alumnos for each row
insert into Log_Alumnos(fecha,usario,accion,dni,nombre)values(now(),user(),"insert",new.dni,new.nombre);

create trigger LogUpdate
after update on Alumnos for each row
insert into Log_Alumnos(fecha,usario,accion,dni,nombre)values(now(),user(),"update",old.dni,old.nombre);

#7
create procedure SP_Alum(materia varchar(20), notas int)
select * from Alumnos
where materia="Historia" and notas>=6;

#8
create procedure SP_Col(id int)
select descripcion, Alumnos.* from Colegio 
inner join Alumnos
on Colegio.id=Alumnos.idColegio;

#9
create table Log_Colegio(
fecha date not null,
usario varchar(40) not null,
accion varchar(20) not null,
id int not null,
descripcion varchar(20) not null);

create trigger ColDelete
after delete on Colegio for each row 
insert into Log_Colegio(fecha,usuario,accion,id,descripcion) values (now(),user(),"delete",old.id,old.descripcion);

#10
delete from Colegio where id=5;

#11
alter table Log_Alumnos add primary key (usario);
alter table Log_Colegio add primary key (usario);

alter table Log_Alumnos add foreign key (dni) references  Alumnos(dni);
alter table Log_Colegio add foreign key (id) references Colegio(id);

#12	
grant select on Log_usario to Perez;
grant select on Log_Colegio to Perez;

#13
select * from Alumnos
union 
select * from Alumnos_back;

#14
select * from Alumnos
union all
select * from Alumnos_back;

#15
#select dni, nombre from Alumnos
#minus
#select dni, nombre from Log_alumnos
#where accion="update";