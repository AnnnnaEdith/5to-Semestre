# 

# Operaciones CRUD en MySQL

Las operaciones *CRUD* son un conjunto de 4 operaciones fundamentales en el manejo de Bases de Datos y aplicaciones web. CRUD es un acronomo que representan las siguientes operaciones 

- **C**reate

- **R**ead

- **U**pdate

- **D**elete

**Primero creamos una tabla:** 

```sql
CREATE TABLE Usuarios(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL CHECK(email "%_@_%._%"),
    password VARCHAR(15) NO NULL CHECK(LENGTH(password)>=8)
);
```

## Create

La operacion *Crear* es responsable de insertar nuevos datos en la Base de Datos en SQL esto se realiza con la sentencia `INSERT INTO` y en el caso de MySQL `INSERT`. El proposito de la operacion es añadir el nuevo registro a una tabla

```sql
-- Ejemplo de una insercción valida usando todos los campos 
INSERT INTO Usuarios VALUES (1, "ejemplo@mail.com", "12345678");


-- Ejemplo de una insercción valida usando el comando DEFAULT

INSERT INTO Usuarios VALUES (DEFAULT, "ejemplo@mail.com", "abcdegf");


-- Ejemplo de una insercción sin inlcuir el idUsuario
INSERT Usuario(email, password) VALUES ("email3@hotmail.com", "12345678");
```

### Ejercicios

- Identifica los tipos de errores que pueden salir en esta tabla (min 4) 

- Inserta 4 registros nuevos en un solo insert

## Read

La operacion *leer* es utulizada para consultar o recupear datos de la Base de Datos. Esto no modifica los datos simplemento los extrae. En MySQL esta operacion se realiza con la sentencia `SELEC` 

```sql
-- Ejemplo de una consulta para todos los datos de una tabla.
SELECT *FROM Usuarios;

--Ejemplo de consulta para un registro en especifico a traves del id.
SELECT *FROM Usuarios WHERE idUsuario = 1;

--Ejemplo de consulta para un registro con un email en especifico
SELECT *FROM Usuarios WHERE email="ejemplo@mail.com"

--Ejemplo de consulta con solo los campos email y password
SELECT *FROM Usuarios;
SELECT email, password FROM Usuarios;

-- Ejemplo de consulta con un condicional lógico
SELECT *FROM Usuarios WHERE LENGTH(password)>=9;
```

### EJERCICIO

- Realiza una consulta que muestre solo el email pero que coincida con una contraseña de mas de 8 caracteres que realice una consulta a los id pares.
  
  ```sql
  SELECT email From usuario WHERE LENGTH(password)>8;
  
  
  SELECT *FROM usuario WHERE (id_usuario%2) = 0;
                              MOD(id_usuario, 2) = 0;
  ```

## Update - Actualizar

La operacion *actualizar* se utiliza para modificar registros en la Base de Datos. Esto se hace con la sentencia `UPDATE`



```sql
-- Ejemplo para actualizar la constraseña por su id
UPDATE usuarios SET password="a1b2c3d4e5" WHERE id_usuario=1;

-- Ejemplo para actualizar el email y password de un usuario en especifico.
UPDATE usuarios SET password="a1b2c3d4e5", email"lucionhdz3012@gmail.com" WHERE id_usuario=1
```

### 

### Ejercicios

- Intenta actualizar registros con valores que violen las restricciones (Minimo 3).

```sql
UPDATE usuarios SET email="ejemplo@gmail.com" WHERE id_usuario=1)
                SET email = "123" WHERE (id_usuario=1)
                SET email = "1234" WHERE (id_usuario=1)
                SET email = "12345678910111213" WHERE (id_usuario=1)

```

# 

## Delete

La operación eliminar en cursiva se usa para borrar registros de la base de datos. Esto se realiza con la sentencia DELETE. *Debemos ser muy cuidadosos con esta operación, ya que una vez que los datos son eliminados no pueden ser recuperados*

```sql
-- Eliminar el usuario por el id --
DELATE FROM usuarios WHERE id_usuario=4;

-- Eliminar los usuarios por el email especifico --
DELATE FROM usuarios WHERE email="lucionhdz3012@gmail.com";
```




### Ejercicios

- Eliminar usuarios cuyo email contenga uno o mas "5"".

- Eliminar usuarios que tengan una contraseña que contenga letras mayusculas usando expresiones regulares(cadena de texto que funciona como filtro para otra cadena de texto `REGEXP`.

- Eliminar usuarios con contraseñas que contengan solo números (expresion regular).

- Eliminar usuarios con correos que no tengan el dominio gmail.



```sql
1-
DELETE FROM usuarios WHERE email REGEXp '5';
                            email LIKE "%5%";

2-
DELETE FROM usuarios WHERE password REGEX '^[A-Z]';
                                           '[A-Z]';

3- 
DELETE FROM usuarios WHERE password REGEX '[0-9] +$';


4-
DELETE FROM usuarios WHERE email NOT LIKE "%@gmail.com"
```
