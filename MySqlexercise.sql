USE prueba1;

CREATE TABLE Empleados(
legajo INT,
nombre VARCHAR(30),
edad INT, 
idfuncion INT,
iddepto INT,
salario INT)

CREATE TABLE Funcion(
idfuncion INT,
desc_funcion VARCHAR(20))

CREATE TABLE departamento(
iddepto INT,
desc_depto VARCHAR(20))

CREATE TABLE clientes(
id INT,
nombre VARCHAR(20),
edad INT)

INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (10, "Fernando Cappi", 52, 10, 100, 65000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (15, "Pablo Perez", 35, 20, 200, 45000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (45, "Juan Diaz", 28, 30, 200, 52000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (26, "Paula Juarez", 45, 40, 300, 51000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (18, "Julian Fernandez", 29, 20, 200, 44000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (55, "Diego Soler", 33, 20, 200, 42000);
INSERT INTO Empleados(Legajo, nombre, edad, idfuncion, iddepto, salario) VALUES (30, "Noelia Rao, 46, 40, 300, 52000");

INSERT INTO Funcion(idfuncion, desc_funcion) VALUES(10, "gerente");
INSERT INTO Funcion(idfuncion, desc_funcion) VALUES(20, "vendedor");
INSERT INTO Funcion(idfuncion, desc_funcion) VALUES(30, "Supervisor");
INSERT INTO Funcion(idfuncion, desc_funcion) VALUES(40, "Analista");

INSERT INTO Departamento(iddepto, desc_depto) VALUES(100, "Administracion");
INSERT INTO Departamento(iddepto, desc_depto) VALUES(200, "Ventas");
INSERT INTO Departamento(iddepto, desc_depto) VALUES(300, "Comercial");
INSERT INTO Departamento(iddepto, desc_depto) VALUES(400, "RRHH");

INSERT INTO Clientes(id, nombre, edad) VALUES(25, "Maira Souto", 35);
INSERT INTO Clientes(id, nombre, edad) VALUES(450, "Julian Fernandez", 29);
INSERT INTO Clientes(id, nombre, edad) VALUES(78, "Karina Velez", 89);
INSERT INTO Clientes(id, nombre, edad) VALUES(88, "Martin Serra", 18);
INSERT INTO Clientes(id, nombre, edad) VALUES(99, "Ricardo Villa", 50);
INSERT INTO Clientes(id, nombre, edad) VALUES(715, "Chiara Gomez", 21);
#3
CREATE TRIGGER DEL.Log AFTER DELETE ON Empleados FOR EACH ROW
INSERT INTO Log.EMPLEADOS (Fecha, Usuario, Acción, DNI)
VALUES (NOW(), USER(), "DELETE", old.DNI);

#4
SELECT nombre, edad FROM Empleados
UNION
SELECT nombre, edad FROM Clientes
ORDER BY edad, nombre;

SELECT nombre, edad FROM Empleados
MINUS
SELECT nombre, edad FROM Clientes
ORDER BY edad, nombre;

SELECT nombre, edad FROM Empleados
interseccion
SELECT nombre, edad FROM Clientes
ORDER BY edad, nombre;

#5
SELECT MAX(salario), iddepto
FROM Empleados
GROUP BY iddepto
ORDER BY iddepto DESC;

#6
CREATE PROCEDURE Datos.empleado (IN Desc_depto)
SELECT *
FROM  Departamentos
WHERE iddepto=E.iddepto

#8
GRANT ALL PRIVILEGES ON Alumnos TO Pablo_Pérez;
REVOKE SELECT ON Profesores FROM Chiara_Gómez;

#9
ALTER TABLE clientes ADD Cuidad VARCHAR(20) NOT NULL;
UPDATE clientes
SET Ciudad = "Buenos Aires" WHERE ID>99;
UPDATE clientes
SET Cuidad = "Rosario" WHERE ID IS NULL; 

#10
SELECT RIGHT(nombre, 3), edad
FROM empleados
WHERE nombre LIKE "P%" AND edad>40;

#11
CREATE PROCEDURE Datos.empleado (IN Desc_depto)
SELECT *
FROM  Departamentos
WHERE iddepto=E.iddepto

#12
ALTER TABLE Empleados ADD PRIMARY KEY (legajo);
ALTER TABLE Funcion ADD PRIMARY KEY (idfuncion);
ALTER TABLE Departamento ADD PRIMARY KEY (iddepto);
ALTER TABLE Clientes ADD PRIMARY KEY (ID);

ALTER TABLE Empleados ADD FOREIGN KEY (legajo) REFERENCES Funcion(idfuncion);
ALTER TABLE Empleados ADD FOREIGN KEY (Iiddepto) REFERENCES Departamentos(iddepto);



