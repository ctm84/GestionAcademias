drop table if exists alumnopertenecegrupos;
drop table if exists alumnoapuntaeventos;
drop table if exists alumnomatriculacursos;
drop table if exists mensualidades;
drop table if exists grupos;
drop table if exists eventos;
drop table if exists cursos;
drop table if exists alumnos;

create table alumnos (
	id int, /*AUTO_INCREMENT*/ 
	nombre varchar (50) not null,
	apellido1 varchar (50) not null,
	apellido2 varchar (50) not null,
	telefono varchar (15),
	correo varchar (50),
	fregistro date,
	cuota float,
	activo boolean,
	direccion varchar (250),
	observaciones varchar (500),
	primary key(id)
); 

create table cursos (
	id int, /*AUTO_INCREMENT*/ 
	nombre varchar (50) not null,
	observaciones varchar (500),
	primary key(id)
);

create table eventos (
	id int, /*AUTO_INCREMENT*/ 
	nombre varchar (50) not null,
	importe float,
	finicio date,
	ffin date,
	observaciones varchar (500),
	primary key(id)
);

create table grupos (
	id int, /*AUTO_INCREMENT*/ 
	dia varchar (50) not null,
	hora varchar (50) not null,
	nombre varchar (50) not null,
	observaciones varchar (500),
	primary key(id)
);
/*en open office DB y similares copiar primero hasta aquí y poner a mano los autoincrementales*/

create table mensualidades ( 
	id int, /*AUTO_INCREMENT*/ 
	mes varchar (50) not null,
	importe float not null,
	fpago date,
	idalumno int,
	idcurso int,
	observaciones varchar (500),
	primary key(id),
	foreign key(idalumno) references alumnos (id), /*on update cascade on delete set null*/
	foreign key (idcurso) references cursos (id) /*on update cascade on delete set null*/
); 

create table alumnomatriculacursos (
	idalumno int,
	idcurso int,
	primary key (idalumno,idcurso),
	foreign key(idalumno) references alumnos (id), /*on update cascade on delete set null*/
	foreign key (idcurso) references cursos (id) /*on update cascade on delete cascade*/
);

create table alumnoapuntaeventos (
	idalumno int,
	idevento int,
	pagado boolean,
	primary key (idalumno,idevento),
	foreign key(idalumno) references alumnos (id), /*on update cascade on delete set null*/
	foreign key (idevento) references eventos (id) /*on update cascade on delete cascade*/
);

create table alumnopertenecegrupos (
	idalumno int,
	idgrupo int,
	primary key (idalumno,idgrupo),
	foreign key(idalumno) references alumnos (id), /*on update cascade on delete set null*/
	foreign key (idgrupo) references grupos (id) /*on update cascade on delete cascade*/
);

create table controlpagos ( 
	id int, /*AUTO_INCREMENT*/ 
	septiembre boolean,
	octubre boolean,
	noviembre boolean,
	diciembre boolean,
	enero boolean,
	febrero boolean,
	marzo boolean,
	abril boolean,
	mayo boolean,
	junio boolean,
	julio boolean,
	agosto boolean,
	idalumno int,
	idcurso int,
	observaciones varchar (500),
	primary key(id),
	foreign key(idalumno) references alumnos (id), /*on update cascade on delete set null*/
	foreign key (idcurso) references cursos (id) /*on update cascade on delete set null*/
); 
