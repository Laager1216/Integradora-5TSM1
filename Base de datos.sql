
-----ATENCION!!!!!! PARA QUE ESTA BASE FUNCIONE MEJOR Y NO TENGAN QUE CORRER CADA PROCEDIMIENTO ALMACENADO POR SE PARADO, CUANDO VEAN LO SIQUIENTE:

---_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ 
m
--SIGNIFICA QUE DESDE AHI PUEDES JALAR HASTA LLEGAR DE NUEVO A ESA SEÑAL QUE MARCARÁ EL FIN DE HASTA DONDE PUEDEN JALAR PARA QUE CORRA TODAS ESAS SENTENCIAS DE GOLPE
--POR LO QUE SERÁ MÁS FÁCIL

--HASTA ABAJO DESPUÉS DE ESA SEÑAL ESTARAN TODOS LOS COMANDOS PARA EJECUTAR CADA UNO DE LOS PROCEDIMIENTOS SI LO REQUIEREN, VALE.


--CUALQUIER PREGUNTA FAVOR DE INFORMARMELO POR FAVOR





---_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------AQUI EMPIEZAN A CREARSE TODAS LAS TABLAS--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO LA TABLA ADMINISTRADORES
------------------------------------------
CREATE TABLE administradores(id_administrador serial not null,nombre_a varchar(30),apellido_pa varchar(30),apellido_ma varchar(30),rfc_a varchar(13),curp_a varchar(20),
edad_a varchar(3),calle_a varchar(50),num_int_a varchar(5),num_ext_a varchar(5),localidad_a varchar(30), municipio_a varchar(30),codigo_postal_a varchar(5),telefono_a varchar(10),
tipo_a int, estatus_a int,PRIMARY KEY (id_administrador));
------------------------------------------------------------------
--CREANDO LA TABLA CLINICAS
------------------------------------------
CREATE TABLE clinicas(id_clinica serial not null,nombre_clinica varchar(50),rfc_c varchar(12), calle_c varchar(50), num_int_c varchar(10), num_ext_c varchar(10),
                                                  localidad_c varchar(30),municipio_c varchar(30),codigo_postal_c varchar(10),telefono_c varchar(12),estatus_c int,
                                                  tipo_c int,id_administrador int,primary key(id_clinica));

-----------------------------------------------------------------------------------------
--CREANDO LA TABLA RECEPCIONISTAS
-----------------------------------------------------------
CREATE TABLE recepcionistas (id_recepcionista serial not null, nombre_r varchar(30), apellido_pr varchar(30), apellido_mr varchar(30),
 rfc_r varchar(13), curp_r varchar(18), edad_r varchar(3), calle_r varchar(50), num_int_r varchar(5),
 num_ext_r varchar(5), localidad_r varchar(30), municipio_r varchar(30),codigo_postal_r varchar(5),
 telefono_r varchar(10), estatus_r int, id_clinica int,PRIMARY KEY (id_recepcionista));

-----------------------------------------------------------------------------------------------
--CREANDO LA TABLA CONSULTORIOS
--------------------------------------------------------------------
CREATE  TABLE consultorios (id_consultorio serial not null,id_servicio int ,id_clinica int ,PRIMARY KEY (id_consultorio));

----------------------------------------------------------------------------------------------------
--CREANDO LA TABLA USUARIOS
--------------------------------------------------------------------------------------

CREATE TABLE usuarios (id_usuario serial not null,
 nombre_u varchar (30), 
apellido_pu varchar (30),
 apellido_mu varchar (30), 
rfc_u varchar (13),
curp_u varchar (18),  
edad_u varchar (3),
calle_u varchar(50),
num_int_u varchar(5),
num_ext_u varchar(5),
localidad_u varchar(30),
municipio_u varchar(30),
codigo_postal_u varchar(5),
correo_electronico varchar (50),
 contraseña varchar (32), 
 estatus_u int,
 id_clinica int,
 PRIMARY KEY (id_usuario));
 -------------------------------------------------------------------------------
 --CREANDO LA TABLA SERVICIOS
-----------------------------------------------------------------------------------------
CREATE TABLE servicios(id_servicio serial not null,servicio varchar(30),descripcion_servicio varchar(500),costo float(10), PRIMARY KEY (id_servicio));














------------------------------------------
--CREANDO LA TABLA PROMOCIONES
------------------------------------------
CREATE TABLE promociones(id_promocion serial not null,nombre_promocion varchar(50),descripcion varchar(500),descuento float(15),id_servicio int, PRIMARY KEY (id_promocion));




------------------------------------------
--CREANDO LA TABLA PERSONAL
------------------------------------------


CREATE TABLE personal(id_personal serial not null,nombre_p varchar(30),apellido_pp varchar(30),
apellido_mp varchar(30),curp_p varchar(18),rfc_p varchar(13), edad_p varchar(3),calle_p varchar(50),
num_int_p varchar(5), num_ext_p varchar(5),localidad_p varchar(30),municipio_p varchar(30),
codigo_postal_p varchar(5),telefono_p varchar(10),tipo_p int,
estatus_p int,id_personal2 int,id_administrador int, PRIMARY KEY (id_personal));

------------------------------------------
--CREANDO LA TABLA ESPECIALIDADES
------------------------------------------
CREATE TABLE especialidades(id_especialidad serial not null,id_personal int,id_servicio int,PRIMARY KEY (id_especialidad));



------------------------------------------
--CREANDO LA TABLA FAMILIARES
------------------------------------------


 CREATE TABLE Familiares(id_familiar serial not null, nombre_f varchar (30), 
apellido_pf varchar (30), apellido_mf varchar (30), 
edad_f varchar (3), curp_f varchar (20),
 parentesco varchar (30),estatus_f int, id_usuario int, PRIMARY KEY (id_familiar)); 


------------------------------------------
--CREANDO LA TABLA CITAS
------------------------------------------

CREATE TABLE Citas(id_cita serial not null,hora time,fecha date,monto float(15), estatus_c int,id_usuario int,id_personal int,id_consultorio int, PRIMARY KEY (id_cita));



------------------------------------------
--CREANDO LA TABLA TARJETAS
------------------------------------------


CREATE TABLE tarjetas(id_tarjeta serial not null,serie_tarjeta varchar(16),credito float(15),id_usuario int,estatus_t int, 
PRIMARY KEY (id_tarjeta));







---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------AQUI EMPIEZAN A CREARSE TODAS LAS RELACIONES DE LAS TABLAS--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO LLAVE FORANEA ENTRE CLINICA Y CONSULTORIO--
ALTER TABLE Consultorios
add constraint CLINICA_CONSULTORIO
FOREIGN KEY(id_clinica)
REFERENCES Clinicas (id_clinica);


--CREANDO LA RELACIÓN ENTRE SERVICIO Y CONSULTORIO--
ALTER TABLE Consultorios
add constraint SERVICIO_CONSULTORIO
FOREIGN KEY(id_servicio)
REFERENCES Servicios (id_servicio);





---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO RELACIÓN ENTRE USUARIO Y FAMILIAS--
ALTER TABLE Familiares
add constraint USUARIOS_FAMILIAS
FOREIGN KEY(id_usuario)
REFERENCES Usuarios (id_usuario);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO RELACIÓN ENTRE DENTISTAS Y AYUDANTES--
ALTER TABLE personal
add constraint DENTISTAS_AYUDANTES
FOREIGN KEY(id_personal2)
REFERENCES personal(id_personal);
--CREANDO RELACIÓN ENTRE DENTISTAS Y AYUDANTES Y ADMINISTRADORES--

ALTER TABLE personal
add constraint ADMINISTRADOR_DENTISTAS
FOREIGN KEY(id_administrador)
REFERENCES administradores(id_administrador);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO RELACIÓN ENTRE CITAS Y CONSULTORIO--
ALTER TABLE Citas
add constraint CITAS_CONSULTORIOS
FOREIGN KEY(id_consultorio)
REFERENCES Consultorios (id_consultorio);


--CREANDO RELACIÓN ENTRE CITAS Y USUARIOS--
ALTER TABLE Citas
add constraint CITAS_USUARIOS
FOREIGN KEY(id_usuario)
REFERENCES usuarios (id_usuario);


--CREANDO RELACIÓN ENTRE CITAS Y DENTISTAS--
ALTER TABLE Citas
add constraint CITAS_DENTISTAS
FOREIGN KEY(id_personal)
REFERENCES personal (id_personal);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREANDO RELACIÓN ENTRE SERVICIO Y PROMOCIONES--
ALTER TABLE promociones
add constraint SERVICIO_PROMOCIONES
FOREIGN KEY(id_servicio)
REFERENCES servicios (id_servicio);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--CREANDO RELACIÓN ENTRE CLINICA Y ADMINISTRADORES--
ALTER TABLE clinicas
add constraint CLINICA_ADMINISTRADORES
FOREIGN KEY(id_administrador)
REFERENCES administradores (id_administrador);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CREANDO RELACIÓN ENTRE CLINICA Y RECEPCIONISTA
ALTER TABLE recepcionistas
add constraint CLINICA_RECEPCIONISTA
FOREIGN KEY(id_clinica)
REFERENCES clinicas (id_clinica);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CREANDO RELACIÓN ENTRE USUARIOS Y TAREJETAS
ALTER TABLE tarjetas
add constraint USUARIO_TARJETA
FOREIGN KEY(id_usuario)
REFERENCES usuarios (id_usuario);


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CREANDO RELACIÓN ENTRE USUARIOS Y CLINICAS
ALTER TABLE usuarios
add constraint USUARIO_CLINICA
FOREIGN KEY(id_clinica)
REFERENCES clinicas (id_clinica);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CREANDO RELACIÓN ENTRE PERSONAL Y ESPECIALIDAD
ALTER TABLE especialidades
add constraint PERSONAL_ESPECIALIDAD
FOREIGN KEY(id_personal)
REFERENCES personal (id_personal);


--CREANDO RELACIÓN ENTRE SERVICIOS Y ESPECIALIDAD
ALTER TABLE especialidades
add constraint SERVICIO_ESPECIALIDAD
FOREIGN KEY(id_servicio)
REFERENCES servicios (id_servicio);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------CREACIÓN DE LOS UNIQUE PARA VOLVER UNICOS CIERTOS REGISTROS COMO RFC Y CURP AL IGUAL QUE CORREO ELECTRONICO---------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--RFC CLINICAS
alter table clinicas
 add constraint RFC_CLINICAS
 unique (rfc_c);

--RFC, CURP, CORREO ELECTRONICO DE USUARIOS
 alter table usuarios
 add constraint RFC_USUARIOS
 unique (rfc_u);

 alter table usuarios
 add constraint CURP_USUARIOS
 unique (curp_u);

  alter table usuarios
 add constraint CORREO_ELECTRONICO_USUARIOS
 unique (correo_electronico);

 --RFC, CURP DE ADMINISTRADORES
 alter table administradores
 add constraint RFC_ADMINISTRADORES
 unique (rfc_a);

 alter table administradores
 add constraint CURP_ADMINISTRADORES
 unique (curp_a);




  --RFC, CURP DE RECEPCIONISTAS
  alter table recepcionistas
 add constraint RFC_RECEPCIONISTAS
 unique (rfc_r);

 alter table recepcionistas
 add constraint CURP_RECEPCIONISTAS
 unique (curp_r);


  --RFC, CURP DE PERSONAL
alter table personal
add constraint RFC_PERSONAL
 unique (rfc_p);

 alter table personal
add constraint CURP_PERSONAL
 unique (curp_p);


 --RFC, CURP DE FAMILIAR


 alter table familiares
add constraint CURP_FAMILIAR
 unique (curp_f);



 --SERIE DE TARJETAS
 
 alter table tarjetas
add constraint SERIE_TARJETA
 unique (serie_tarjeta);

 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------AQUI EMPIEZAN A CREARSE TODOS LOS PRODECIMIENTOS ALMACENADOS DE CADA TABLA-----------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS PARA LA TABLA CLINICAS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nueva_clinica(IN nombre_clinica varchar,IN rfc_c varchar,IN calle_c varchar,IN num_int_c varchar,IN num_ext_c varchar,
                                                  IN localidad_c varchar,IN municipio_c varchar,IN codigo_postal_c varchar,IN telefono_c varchar,IN estatus_c int,
						  IN tipo_c int  ,IN id_administrador int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO Clinicas ("nombre_clinica","rfc_c","calle_c","num_int_c","num_ext_c","localidad_c","municipio_c","codigo_postal_c","telefono_c","estatus_c","tipo_c","id_administrador") VALUES 
(nombre_clinica,rfc_c,calle_c,num_int_c,num_ext_c,localidad_C,municipio_c,codigo_postal_c,telefono_c,estatus_c,tipo_c,id_administrador);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION cambiar_clinica(IN id_clinica2 int,IN nombre_clinica2 varchar,IN rfc_c2 varchar,IN calle_c2 varchar,IN num_int_c2 varchar,IN num_ext_c2 varchar,
                                                  IN localidad_c2 varchar,IN municipio_c2 varchar,IN codigo_postal_c2 varchar,IN telefono_c2 varchar,IN estatus_c2 int,
                                                  IN tipo_c2 int  , IN id_administrador2 int) RETURNS void 
AS $$
BEGIN
	UPDATE clinicas SET "nombre_clinica"=nombre_clinica2,"rfc_c"=rfc_c2,"calle_c"=calle_c2,"num_int_c"=num_int_c2,"num_ext_c"=num_ext_c2,"localidad_c"=localidad_c2,
			    "municipio_c"=municipio_c2,"codigo_postal_c"=codigo_postal_c2,"telefono_c"=telefono_c2,"estatus_c"=estatus_c2,"tipo_c"=tipo_c2,
			    "id_administrador"=id_administrador2 WHERE "id_clinica"=id_clinica2;
END;
$$ LANGUAGE 'plpgsql';
---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_clinicas AS(id_clinica int,nombre_clinica varchar,rfc_c varchar, calle_c varchar, num_int_c varchar, num_ext_c varchar,
                                                  localidad_c varchar,municipio_c varchar,codigo_postal_c varchar,telefono_c varchar,estatus_c int,
                                                  tipo_c int  ,  id_administrador int);
  
CREATE OR REPLACE FUNCTION consulta_clinicas()
RETURNS SETOF datos_clinicas AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_clinica","nombre_clinica","rfc_c","calle_c","num_int_c","num_ext_c","localidad_c","municipio_c","codigo_postal_c","telefono_c","estatus_c",
			    "tipo_c","id_administrador"
	FROM clinicas  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';



-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS PARA LA TABLA ADMINISTRADORES
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nuevo_administrador(IN nombre_a varchar,IN apellido_pa varchar,IN apellido_ma varchar ,IN rfc_a varchar,IN curp_a varchar, 
						  IN edad_a varchar,IN calle_a varchar,IN num_int_a varchar,IN num_ext_a varchar,
						  IN localidad_a varchar, IN municipio_a varchar,
						  IN codigo_postal_a varchar,
						  IN telefono_a varchar,IN tipo_a int,IN estatus_a int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO administradores("nombre_a","apellido_pa","apellido_ma","rfc_a","curp_a","edad_a","calle_a","num_int_a","num_ext_a","localidad_a","municipio_a","codigo_postal_a","telefono_a","tipo_a","estatus_a")
  VALUES (nombre_a,apellido_pa,apellido_ma,rfc_a,curp_a,edad_a,calle_a,num_int_a,num_ext_a,localidad_a,municipio_a, codigo_postal_a,telefono_a,tipo_a,estatus_a);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_administrador(IN id_administrador2 int,IN nombre2 varchar,IN apellido_pa2 varchar,IN apellido_ma2 varchar ,IN rfc_a2 varchar,IN curp_a2 varchar,
						  IN edad_a2 varchar  ,IN calle_a2 varchar,IN num_int_a2 varchar,IN num_ext_a2 varchar,
                                                  IN localidad_a2 varchar, IN municipio_a2 varchar,
						  IN codigo_postal_a2 varchar,
						  IN telefono_a2 varchar, IN tipo_a2 int,IN estatus_a2 int) RETURNS void 
AS $$
BEGIN
	UPDATE Administradores SET "nombre_a"=nombre2,"apellido_pa"=apellido_pa2,"apellido_ma"=apellido_ma2,"rfc_a"=rfc_a2,"curp_a"=curp_a2,"edad_a"=edad_a2,"calle_a"=calle_a2,
				   "num_int_a"=num_int_a2,"num_ext_a"=num_ext_a2,
"localidad_a"=localidad_a2, "municipio_a"=municipio_a2,
				   "codigo_postal_a"=codigo_postal_a2,"telefono_a"=telefono_a2,"tipo_a"=tipo_a2,"estatus_a"=estatus_a2  WHERE
				    "id_administrador"=id_administrador2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_administradores  AS( id_administrador int,  nombre_a varchar, apellido_pa varchar, apellido_ma varchar , rfc_a varchar, curp_a varchar, 
						   edad_a varchar, calle_a varchar, num_int_a varchar, num_ext_a varchar,
						   localidad_a varchar,  municipio_a varchar,
						   codigo_postal_a varchar,
						   telefono_a varchar, tipo_a int, estatus_a int);
 
CREATE OR REPLACE FUNCTION consulta_administradores()
RETURNS SETOF datos_administradores AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_administrador","nombre_a","apellido_pa","apellido_ma","rfc_a","curp_a","edad_a","calle_a","num_int_a","num_ext_a","localidad_a","municipio_a","codigo_postal_a","telefono_a"
	,"tipo_a","estatus_a"
	FROM Administradores  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS PARA LA TABLA PERSONAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------

 CREATE OR REPLACE FUNCTION insertar_nuevo_personal(IN nombre_p varchar,IN apellido_pp varchar,IN apellido_mp varchar ,IN curp_p varchar,
						  IN rfc_p varchar ,IN edad_p varchar ,IN calle_p varchar,IN num_int_p varchar,IN num_ext_p varchar,IN localidad_p varchar,
						 IN municipio_p varchar ,IN codigo_postal_p varchar,IN telefono_p varchar,IN tipo_p int, 
						 IN estatus_p int, IN id_personal2 int,IN id_administrador int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO personal ("nombre_p","apellido_pp","apellido_mp","curp_p","rfc_p","edad_p","calle_p","num_int_p","num_ext_p","localidad_p","municipio_p",
"codigo_postal_p","telefono_p","tipo_p","estatus_p","id_personal2","id_administrador") VALUES (nombre_p,apellido_pp,apellido_mp,curp_p,rfc_p,edad_p,
calle_p,num_int_p,num_ext_p,localidad_p,municipio_p,codigo_postal_p,telefono_p,tipo_p,estatus_p,id_personal2,id_administrador);
END;
$$ LANGUAGE 'plpgsql';
---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_personal(IN id_persona int,IN nombre_p2 varchar,IN apellido_pp2 varchar,IN apellido_mp2 varchar ,IN curp_p2 varchar,
						  IN rfc_p2 varchar ,IN edad_p2 varchar ,IN calle_p2 varchar,IN num_int_p2 varchar,IN num_ext_p2 varchar,IN localidad_p2 varchar,
						 IN municipio_p2 varchar ,IN codigo_postal_p2 varchar,IN telefono_p2 varchar,IN tipo_p2 int, 
						 IN estatus_p2 int, IN id_per int,IN id_administrador2 int) RETURNS void 
AS $$
BEGIN
	UPDATE personal SET "nombre_p"=nombre_p2,"apellido_pp"=apellido_pp2,"apellido_mp"=apellido_mp2,"curp_p"=curp_p2,"rfc_p"=rfc_p2,"edad_p"=edad_p2,"calle_p"=calle_p2,
	"num_int_p"=num_int_p2,"num_ext_p"=num_ext_p2,"localidad_p"=localidad_p2,"municipio_p"=municipio_p2,"codigo_postal_p"=codigo_postal_p2,"telefono_p"=telefono_p2,
	"tipo_p"=tipo_p2,"estatus_p"=estatus_p2,"id_personal2"=id_per,"id_administrador"=id_administrador2  WHERE "id_personal"=id_persona;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_personal AS(id_personal int,nombre_p varchar,apellido_pp varchar,apellido_mp varchar ,curp_p varchar,
						 rfc_p varchar ,edad_p varchar ,calle_p varchar,num_int_p varchar,num_ext_p varchar,localidad_p varchar,
						 municipio_p varchar ,codigo_postal_p varchar,telefono_p varchar,tipo_p int, 
						 estatus_p int,id_personal2 int,id_administrador int);
 
CREATE OR REPLACE FUNCTION consulta_personal()
RETURNS SETOF datos_personal AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_personal","nombre_p","apellido_pp","apellido_mp","curp_p","rfc_p","edad_p","calle_p","num_int_p","num_ext_p","localidad_p","municipio_p",
                             "codigo_postal_p","telefono_p","tipo_p","estatus_p","id_personal2","id_administrador"
	FROM personal  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS PARA LA TABLA SERVICIOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
 CREATE OR REPLACE FUNCTION insertar_nuevo_servicio(IN Servicio varchar, IN Descripcion_servicio varchar, 
 IN costo float)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO servicios ("servicio","descripcion_servicio","costo") VALUES (servicio,descripcion_servicio,costo);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_servicio(IN id_servicio2 INT, IN servicio2 varchar, IN descripcion_servicio2 varchar, IN costo2 float) RETURNS void 
AS $$
BEGIN
	UPDATE servicios SET "servicio"= servicio2, "descripcion_servicio"= descripcion_servicio2, "costo"=costo2 WHERE "id_servicio"= id_servicio2 ;
END;
$$ LANGUAGE 'plpgsql';


---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_servicios AS(servicio varchar,descripcion_servicio varchar,costo float(15));
 
CREATE OR REPLACE FUNCTION consulta_servicios()
RETURNS SETOF datos_servicios AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "servicio","descripcion_servicio","costo"
	FROM servicios  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS PARA LA TABLA FAMILIARES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
 CREATE OR REPLACE FUNCTION insertar_nuevo_familiar(IN Nombre_f varchar,
                                         IN Apellido_pf varchar,IN Apellido_mf varchar,
                                         IN edad_f varchar,IN curp_f varchar,IN parentesco varchar,IN estatus_f int,IN id_usuario int)


	
                                                            RETURNS VOID AS
                                                                   $$

                                                                 BEGIN
	
                             INSERT INTO Familiares("nombre_f","apellido_pf","apellido_mf","edad_f","curp_f","parentesco","estatus_f","id_usuario") VALUES 
                                               (Nombre_f,Apellido_pf,Apellido_mf,edad_f,curp_f,Parentesco,estatus_f,id_usuario);
                                                                  END;

                                                            $$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_familar(IN id_familiar2 int,IN nombre_f2 varchar,
                                         IN apellido_pf2 varchar,IN apellido_mf2 varchar,
                                         IN edad_f2 varchar,IN curp_f2 varchar,IN parentesco2 varchar,IN estatus_f2 int,IN id_usuario2 int) RETURNS void 
AS $$
BEGIN
	UPDATE Familiares SET "nombre_f"=nombre_f2,"apellido_pf"=apellido_pf2,"apellido_mf"=apellido_mf2,"edad_f"=edad_f2,"curp_f"=curp_f2,"parentesco"=parentesco2,"estatus_f"=estatus_f2,"id_usuario"=id_usuario2  WHERE "id_familiar"=id_familiar2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_familiares AS( id_familiar int, Nombre_f varchar,
                                          Apellido_pf varchar, Apellido_mf varchar,
                                          edad_f varchar, curp_f varchar, Parentesco varchar,estatus_f2 int, id_usuario int);
CREATE OR REPLACE FUNCTION consulta_familiares()
RETURNS SETOF datos_familiares AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_familiar","nombre_f","apellido_pf","apellido_mf","edad_f","curp_f","parentesco","estatus_f","id_usuario"
	FROM Familiares LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS PARA LA TABLA PROMOCIONES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nueva_promocion(IN nombre_promocion varchar,IN descripcion varchar, IN descuento float,IN id_servicio int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO promociones ("nombre_promocion","descripcion","descuento","id_servicio") VALUES 
(nombre_promocion,descripcion,descuento,id_servicio);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_promocion(IN id_promocion2 int, IN nombre_promocion2 varchar,IN descripcion2 varchar,IN descuento2 float,IN id_servicio2 int) RETURNS void 
AS $$
BEGIN
	UPDATE promociones SET "nombre_promocion"=nombre_promocion2,"descripcion"=descripcion2,"descuento"=descuento2,"id_servicio"=id_servicio2  WHERE "id_promocion"=id_promocion2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_promociones AS( id_promocion int,  nombre_promocion varchar, descripcion varchar,descuento float(15),id_servicio int);
CREATE OR REPLACE FUNCTION consulta_promociones()
RETURNS SETOF datos_promociones AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_promocion","nombre_promocion","descripcion","descuento","id_servicio"
	FROM promociones  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';





  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS DE LA TABLA USUARIOS
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
  CREATE OR REPLACE FUNCTION Insertar_nuevo_usuario(IN nombre_u varchar,IN apellido_pu varchar,IN apellido_mu varchar ,IN rfc_u varchar,IN curp_u varchar,
						    IN edad_u varchar,IN calle_u varchar,IN num_int_u varchar,IN num_ext_u varchar,IN localidad_u varchar,IN municipio_u varchar,
						    IN codigo_postal_u varchar,IN correo_electronico varchar, IN contraseña varchar,IN estatus_u int,IN id_clinica int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO Usuarios ("nombre_u","apellido_pu","apellido_mu","rfc_u","curp_u","edad_u","calle_u","num_int_u","num_ext_u","localidad_u","municipio_u",
		      "codigo_postal_u","correo_electronico","contraseña","estatus_u","id_clinica") VALUES 
		      
(nombre_u,apellido_pu,apellido_mu,rfc_u,curp_u,edad_u,calle_u,num_int_u,num_ext_u,localidad_u,municipio_u,codigo_postal_u,correo_electronico,md5(contraseña),estatus_u,id_clinica);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION cambiar_usuario(IN id_usuario2 int,IN nombre_u2 varchar,IN apellido_pu2 varchar,IN apellido_mu2 varchar ,IN rfc_u2 varchar,IN curp_u2 varchar,
						    IN edad_u2 varchar,IN calle_u2 varchar,IN num_int_u2 varchar,IN num_ext_u2 varchar,IN localidad_u2 varchar,IN municipio_u2 varchar,
						    IN codigo_postal_u2 varchar,IN correo_electronico2 varchar, IN contraseña2 varchar,IN estatus_u2 int,IN id_clinica2 int) RETURNS void 
AS $$
BEGIN
	UPDATE Usuarios SET "nombre_u"=nombre_u2,"apellido_pu"=apellido_pu2,"apellido_mu"=apellido_mu2,"rfc_u"=rfc_u2,"curp_u"=curp_u2,"edad_u"=edad_u2,"calle_u"=calle_u2,
			    "num_int_u"=num_int_u2,"num_ext_u"=num_ext_u2,"localidad_u"=localidad_u2,"municipio_u"=municipio_u2,"codigo_postal_u"=codigo_postal_u2,
			    "correo_electronico"=correo_electronico2,"contraseña"=md5(contraseña2),"estatus_u"=estatus_u2,"id_clinica"=id_clinica2 WHERE "id_usuario"=id_usuario2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_usuarios AS(id_usuario int,nombre_u varchar,apellido_pu varchar,apellido_mu varchar ,rfc_u varchar,curp_u varchar,
						    edad_u varchar,calle_u varchar,num_int_u varchar,num_ext_u varchar,localidad_u varchar,municipio_u varchar,
						    codigo_postal_u varchar,Correo_electronico varchar,contraseña varchar,estatus_u int,id_clinica int);
  
CREATE OR REPLACE FUNCTION consulta_usuarios()
RETURNS SETOF datos_usuarios AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_usuario","nombre_u","apellido_pu","apellido_mu","rfc_u","curp_u","edad_u","calle_u","num_int_u","num_ext_u","localidad_u","municipio_u",
		      "codigo_postal_u","correo_electronico","contraseña","estatus_u","id_clinica"
	FROM Usuarios  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';





-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS PARA LA TABLA CITAS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nueva_cita(IN hora time,IN fecha date,IN monto float,IN estatus_c int,IN id_usuario int,
						  IN id_personal int ,IN id_consultorio int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO Citas ("hora","fecha","monto","estatus_c","id_usuario","id_personal","id_consultorio") VALUES 
(hora,fecha,monto,estatus_c,id_usuario,id_personal,id_consultorio);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_cita(IN id_cita2 int,IN hora2 time,IN fecha2 date,IN monto2 float(15),IN estatus_c2 int,IN id_usuario2 int,
						  IN id_personal2 int ,IN id_consultorio2 int) RETURNS void 
AS $$
BEGIN
	UPDATE Citas SET "hora"=hora2,"fecha"=fecha2,"monto"=monto2,"estatus_c"=estatus_c2,"id_usuario"=id_usuario2,"id_personal"=id_personal2,"id_consultorio"=id_consultorio2 WHERE "id_cita"=id_cita2;
END;
$$ LANGUAGE 'plpgsql';


---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_citas AS( id_cita int,hora time, fecha date,monto float(15),estatus_c int , id_usuario int,
						   id_personal int , id_consultorio int);--drop type datos_citas cascade
CREATE OR REPLACE FUNCTION consulta_citas()
RETURNS SETOF datos_citas AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_cita","hora","fecha","monto","estatus_c","id_usuario","id_personal","id_consultorio"
	FROM Citas  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS DE LA TABLA CONSULTORIOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nuevo_consultorio(IN id_servicio int, IN id_clinica int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO Consultorios ("id_servicio","id_clinica") VALUES 
(id_servicio,id_clinica);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_consultorio(IN id_consultorio2 int,IN id_servicio2 int, IN id_clinica2 int) RETURNS void 
AS $$
BEGIN
	UPDATE Consultorios SET "id_servicio"=id_servicio2,"id_clinica"=id_clinica2 WHERE "id_consultorio"=id_consultorio2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------

CREATE TYPE datos_consultorio AS(id_consultorio int,id_servicio int, id_clinica int);
CREATE OR REPLACE FUNCTION consulta_consultorio()
RETURNS SETOF datos_consultorio AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_consultorio","id_servicio","id_clinica"
	FROM Consultorios  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS DE LA TABLA RECEPCIONISTAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
 CREATE OR REPLACE FUNCTION insertar_nueva_recepcionista(IN nombre_r varchar,IN apellido_pr varchar,IN apellido_mr varchar ,IN rfc_r varchar,
						  IN curp_r varchar ,IN edad_r varchar ,IN calle_r varchar,IN num_int_r varchar,IN num_ext_r varchar,IN localidad_r varchar,
						 IN municipio_r varchar ,IN codigo_postal_r varchar,IN telefono_r varchar,IN estatus_r int, IN id_clinica int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO recepcionistas ("nombre_r","apellido_pr","apellido_mr","rfc_r","curp_r","edad_r","calle_r","num_int_r","num_ext_r","localidad_r","municipio_r",
"codigo_postal_r","telefono_r","estatus_r","id_clinica") VALUES (nombre_r,apellido_pr,apellido_mr,rfc_r,curp_r ,edad_r,calle_r,num_int_r,num_ext_r,localidad_r,municipio_r,
codigo_postal_r,telefono_r,estatus_r,id_clinica);
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_recepcionista(IN id_recepcionista2 int,IN nombre_r2 varchar,IN apellido_pr2 varchar,IN apellido_mr2 varchar ,IN rfc_r2 varchar,
						  IN curp_r2 varchar ,IN edad_r2 varchar ,IN calle_r2 varchar,IN num_int_r2 varchar,IN num_ext_r2 varchar,IN localidad_r2 varchar,
						  IN municipio_r2 varchar,IN codigo_postal_r2 varchar,IN telefono_r2 varchar,IN estatus_r2 int,IN id_clinica2 int) 
RETURNS void 
AS $$
BEGIN
	UPDATE recepcionistas SET "nombre_r"=nombre_r2,"apellido_pr"=apellido_pr2,"apellido_mr"=apellido_mr2,"rfc_r"=rfc_r2,"curp_r"=curp_r2,"edad_r"=edad_r2,"calle_r"=calle_r2,
	"num_int_r"=num_int_r2,"num_ext_r"=num_ext_r2,"localidad_r"=localidad_r2,"municipio_r"=municipio_r2,"codigo_postal_r"=codigo_postal_r2,"telefono_r"=telefono_r2,
	"estatus_r"=estatus_r2,"id_clinica"=id_clinica2 WHERE "id_recepcionista"=id_recepcionista2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_recepcionistas AS(id_recepcionista int, nombre_r varchar, apellido_pr varchar, apellido_mr varchar,
 rfc_r varchar, curp_r varchar, edad_r varchar, calle_r varchar, num_int_r varchar,num_ext_r varchar, localidad_r varchar, municipio_r varchar,codigo_postal_r varchar,
 telefono_r varchar, estatus_r int , id_clinica int);
 
CREATE OR REPLACE FUNCTION consulta_recepcionista()
RETURNS SETOF datos_recepcionistas AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_recepcionista","nombre_r","apellido_pr","apellido_mr","rfc_r","curp_r","edad_r","calle_r","num_int_r","num_ext_r","localidad_r","municipio_r",
	"codigo_postal_r","telefono_r","estatus_r","id_clinica"
	FROM recepcionistas  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS DE LA TABLA ESPECIALIDADES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------

  CREATE OR REPLACE FUNCTION insertar_nueva_especialidad(IN id_personal int ,IN id_servicio int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO especialidades ("id_personal","id_servicio") VALUES 
(id_personal,id_servicio );
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION cambiar_especialidad(IN id_especialidad2 int,IN id_personal2 int ,IN id_servicio2 int) RETURNS void 
AS $$
BEGIN
	UPDATE especialidades SET "id_personal"=id_personal2,"id_servicio"=id_servicio2 WHERE "id_especialidad"=id_especialidad2;
END;
$$ LANGUAGE 'plpgsql';
---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_especialidades AS(id_especialidad int,id_personal int ,id_servicio int);
  
CREATE OR REPLACE FUNCTION consulta_especialidades()
RETURNS SETOF datos_especialidades AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_especialidad","id_personal","id_servicio"
	FROM especialidades  LOOP
RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';




------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTOS ALMACENADOS DE LA TABLA TARJETAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--INSERT
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertar_nueva_tarjeta(IN serie_tarjeta varchar,IN credito float,IN id_usuario int ,IN estatus_t int)	
RETURNS VOID AS
$$

BEGIN
	
INSERT INTO tarjetas ("serie_tarjeta","credito","id_usuario","estatus_t") VALUES 
(serie_tarjeta,credito,id_usuario,estatus_t );
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--UPDATE
---------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cambiar_tarjeta(IN id_tarjeta2 int,IN serie_tarjeta2 varchar,IN credito2 float,IN id_usuario2 int ,IN estatus_t2 int) RETURNS void 
AS $$
BEGIN
	UPDATE tarjetas SET "serie_tarjeta"=serie_tarjeta2,"credito"=credito2,"id_usuario"=id_usuario2,"estatus_t"=estatus_t2 WHERE "id_tarjeta"=id_tarjeta2;
END;
$$ LANGUAGE 'plpgsql';

---------------------------------------------------------------------------------------------
--SELECT
---------------------------------------------------------------------------------------------
CREATE TYPE datos_tarjetas AS(id_tarjeta int,serie_tarjeta varchar,credito float(15),id_usuario int ,estatus_t int);
  
CREATE OR REPLACE FUNCTION consulta_tarjetas()
RETURNS SETOF datos_tarjetas AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_tarjeta","serie_tarjeta","credito","id_usuario","estatus_t"
	FROM tarjetas  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';




---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------AQUI EMPIEZAN A CREARSE TODOS LOS PRODECIMIENTOS ALMACENADOS AVANZADOS---------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------CONSULTA PARA VER TODAS LAS CLINICAS QUE TENGAN EL ESTATUS  1------------------------

CREATE OR REPLACE FUNCTION consulta_clinicas_estatus_1()

RETURNS SETOF datos_clinicas AS
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT "id_clinica","nombre_clinica","rfc_c","calle_c","num_int_c","num_ext_c","localidad_c","municipio_c","codigo_postal_c","telefono_c","estatus_c","tipo_c",
	"id_administrador" 
	FROM Clinicas where "estatus_c"='1' LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';


--SERVICIOS DE UNA CLINICA
CREATE TYPE datos_clinica_servicios AS(id_clinica int,nombre_clinica varchar,id_servicio int,servicio varchar,descripcion_servicio varchar,costo float(15));
CREATE OR REPLACE FUNCTION consulta_clinica_servicios(IN id_clinica2 int)
RETURNS SETOF datos_clinica_servicios AS 
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN select clinicas."id_clinica","nombre_clinica",servicios."id_servicio","servicio","descripcion_servicio","costo" from 
	servicios 
						join consultorios using("id_servicio")
						join clinicas using("id_clinica") where clinicas."id_clinica"=id_clinica2  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';




--PROCEDIMIENTO PARA VER LOS CONSULTORIOS DE UNA CLINICA

CREATE TYPE datos_clinica_consultorios AS(id_clinica int,nombre_clinica varchar,id_consultorio int,id_servicio int);


CREATE OR REPLACE FUNCTION consulta_clinica_consultorios(IN id_clinica2 int)
RETURNS SETOF datos_clinica_consultorios AS 
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN select clinicas."id_clinica","nombre_clinica","id_consultorio","id_servicio" from consultorios
						join clinicas using("id_clinica") where clinicas."id_clinica"=id_clinica2  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';





--PRODCEDIMIENTO PARA VER LOS DENTISTAS CON SUS AYUDANTES DE UNA CLINICA



CREATE TYPE datos_clinica_dentistas_ayudantes AS(id_clinica int,
	nombre_clinica varchar,
	id_dentista int,
	nombre_dentista varchar,
	apellido_p_dentista varchar ,
	apellido_m_dentista varchar,
	rfc_dentista varchar,
	id_ayudante int,
	nombre_ayudante varchar, 
	apellido_p_ayudante varchar ,
	apellido_m_ayudante varchar,
	rfc_ayudante varchar );


CREATE OR REPLACE FUNCTION consulta_clinica_dentistas_asistentes(IN id_clinica2 int)
RETURNS SETOF datos_clinica_dentistas_ayudantes AS 
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT
	"id_clinica",
	"nombre_clinica",
    entidad2."id_personal",
    entidad2."nombre_p" ,
    entidad2."apellido_pp" ,
    entidad2."apellido_mp" ,
    entidad2."rfc_p",
    entidad1."id_personal",
    entidad1."nombre_p",
    entidad1."apellido_pp" ,
    entidad1."apellido_mp" , 
    entidad1."rfc_p" 
FROM personal AS entidad1
    INNER JOIN personal AS entidad2
        ON(entidad1."id_personal" = entidad2."id_personal2") inner join administradores on
         administradores."id_administrador"=entidad1."id_administrador" inner join clinicas ON administradores."id_administrador"= clinicas."id_administrador"  where "id_clinica"=id_clinica2 

  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';



--SABER LAS PROMOCIONES DE UNA CLINICA

CREATE TYPE datos_clinica_promociones AS
(id_clinica int,nombre_clinica varchar,id_promocion int,nombre_promocion varchar,descripcion varchar,descuento float(15),id_servicio int);



CREATE OR REPLACE FUNCTION consulta_clinica_promociones
(IN id_clinica2 int)

RETURNS SETOF datos_clinica_promociones  AS 

$$

DECLARE datos RECORD;

BEGIN
	FOR datos IN select clinicas."id_clinica","nombre_clinica",promociones."id_promocion","nombre_promocion","descripcion","descuento",servicios."id_servicio" from clinicas 
			join consultorios using("id_clinica")
  join servicios using("id_servicio")
  join promociones using("id_servicio")

where clinicas."id_clinica"=id_clinica2 
 LOOP

RETURN NEXT datos;

	
END 
LOOP;

END;

$$ LANGUAGE 'plpgsql';





--PRODCEDIMIENTO PARA SABER TODO SOBRE LAS CITAS DE UN USUARIO



CREATE TYPE datos_cita_usuario AS(estatus_cita int,id_cita int,hora time,fecha date,nombre_u varchar);


CREATE OR REPLACE FUNCTION consulta_cita_usuario(IN nombre_u2 varchar)
RETURNS SETOF datos_cita_usuario AS 
$$
DECLARE datos RECORD;
BEGIN
	FOR datos IN SELECT
	"estatus_c","id_cita","hora","fecha","nombre_u" 
FROM citas 
    INNER JOIN usuarios 
        ON usuarios."id_usuario"=citas."id_usuario" WHERE "nombre_u"=nombre_u2 

  LOOP
	RETURN NEXT datos;
	END LOOP;
END;
$$ LANGUAGE 'plpgsql';








CREATE TYPE datos_citas_dentista AS(id_cita int,hora time,fecha date,monto real,estatus_c int,id_usuario int,id_personal int, id_consultorio int,nombre_u varchar,apellido_pu varchar,
                                    apellido_mu varchar, rfc_u varchar,curp_u varchar,edad_u varchar,correo_electronico varchar);
                               
CREATE OR REPLACE FUNCTION consulta_citas_dentista(IN id int)
Returns SETOF datos_citas_dentista
 AS $$
DECLARE
reg RECORD;
BEGIN
 For reg IN Select citas.*,"nombre_u","apellido_pu","apellido_mu","rfc_u","curp_u","edad_u","correo_electronico" From citas JOIN usuarios using("id_usuario") 
                                               JOIN consultorios using ("id_consultorio")
                                               JOIN personal using ("id_personal")
                                               WHERE "id_personal"=id LOOP
  RETURN NEXT reg;
 END LOOP;
END;
$$ LANGUAGE 'plpgsql';


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------AQUI EMPIEZAN LOS REGISTROS PARA CADA TABLA DE LA BASE DE DATOS-------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------
--ADMINISTRADORES
---------------------------------------------------------------------------------------------

SELECT * FROM insertar_nuevo_administrador('Mario Josue','Arteaga','Martinez','AEMM000517WEE','AEMM000517HDFRRRA9','19','3ra cerrada de bosques mexico','105','63-3','Heroes','Tecamac','55764','5549650017',1,1);
SELECT * FROM insertar_nuevo_administrador('Luis Angel','Aguirre','Godinez','AUGL001216JGH','AUGL001216HDFGDSA8','19','calle 12 de octubre','15','15','Tonanitla','Tonanitla','55785','5612714813',1,1);
SELECT * FROM insertar_nuevo_administrador('Claudia','Mendoza','Monter','MEMC000503DLF','MEMC000503MMCNNLA0','19','Salto de agua','5','30','Santo Domingo','Tecamac','55754','5583621828',1,1);
SELECT * FROM insertar_nuevo_administrador('Josè Francisco','Nava','Rodrìguez','NARF000405SLD','NARF000405HDFVDRA1','19','Bayona','23','23','Villa del Real','Tecàmac','55749','5586939159',1,1);
SELECT * FROM insertar_nuevo_administrador('luis angel','Canales','Calva','CACL006262SLF','CACL006262HDFNLSA4','19','GLADIOLAS','30','2','Lomas de Tecamac','Tecamac','55675','5583438203',1,1);
SELECT * FROM insertar_nuevo_administrador('alexis','parra','rojas','ARA960906SLR','PARA960906HMCRJL06','23','Privada Vista Hermosa','47','15','Sierra Hermosa','Tecàmac','55749','5587065642',1,1);
SELECT * FROM insertar_nuevo_administrador('Lizeth','Meza','Picazo','MEPL000912LPO','MEPL000912MMCZCZA0','19','Cerro Jesus','703','29','Cerros',' Ecatepec','55070','5559643513',1,1);
SELECT * FROM insertar_nuevo_administrador('Ivan','Navarro','Hernandez','NAHI000406PWR','NAHI000406HMCVRVVA6','19','Bugambilia','8','12','Tizayuca','Tizayuca','43800','7714105025',1,1);
SELECT * FROM insertar_nuevo_administrador('Hugo Alejandro','Belmont','Romo','BERH00529LVT','BERH00529HHGLMGA3','19','Calle florida','s/n','3','Santa Ana Tlachiahualpa','Temascalapa','55994','5510054921',1,1);
SELECT * FROM insertar_nuevo_administrador('David Alejandro','Alvarado','Diaz','AADD001204LLI','AADD001204HDFLZVA5','19','Privada Hacienda Torrecillas','104','104','Haciendas de Tizayuca','Tizayuca','43815','5565761602',1,1);
SELECT * FROM insertar_nuevo_administrador('Brayan Adrian','Sanchez','Rubio','SARB991113NDJ','SARB991113HMCNBR07','20','Lago Managua','59','s/n','San Pedro','Tecamac','55767','5523690691',1,1);
SELECT * FROM insertar_nuevo_administrador('Itzel','Gallegos','Marìn','GAMI000831PWE','GAMI000831MMCLRTA4','19','CALLE Isla Mujeres','s/n','48','Jardines de Morelos','Ecatepec','55070','5518631586',1,1);
SELECT * FROM insertar_nuevo_administrador('Paola Alejandra','Obregòn','Guzman','OEGP000229PBT','OEGP000229MMCBZLA9','20','peña y peña','5','25','San Francisco Cuautliquixca','Tecamac','55760','5560478986',1,1);
SELECT * FROM insertar_nuevo_administrador('Eunice guadalupe','gutierrez','garcia','GUGE001027NET','GUGE001027MMCTRNA1','19','valle san gabriel','s/n','26','urbi villas del campo','Tecamac','55767','5581183956',1,1);
SELECT * FROM insertar_nuevo_administrador('Víctor Emmanuel','Baeza','Hernández','BAHV971228LQR','BAHV971228HMCZRC07','22','Camino a españa','350','14','La trinidad','Zumpango','55614','5578515986',1,1);
SELECT * FROM insertar_nuevo_administrador('Braulio Adrian','Arias','Macias','AIMB00221ACX','AIMB00221HMCRCRA2','20','Cuarzo','17','17','Geovillas','Tizayuca','43806','5611118850',1,1);
SELECT * FROM insertar_nuevo_administrador('Cesar Omar','Salinas','Piña','SAPC001020LST','SAPC001020HMCLXSA0','19','Amargura','s/n','203','San Juan','Nextlalpan','55790','5564066206',1,1);
SELECT * FROM insertar_nuevo_administrador('Hugo Alberto','Gonzalez','Copado','GOCH980203MNC','GOCH980203HMCNPG02','22','Olivos','15','9','Olivos','Tecamac','55748','5548712254',1,1);
SELECT * FROM insertar_nuevo_administrador('Josué Fernando','Rivero','Martínez','RIMJ000405MNB','RIMJ000405HMCVRSA3','19','Juan Escutia','s/n','18','Ozumbilla','Tecámac','55766','5611877478',1,1);
SELECT * FROM insertar_nuevo_administrador('Aaron Isai','Alvarado','Vega','AAVA991126QWE','AAVA991126HMCLGR03','20','Calle 9','30','94','Ecatepec','Ecatepec','55339','5529084455',1,1);
SELECT * FROM insertar_nuevo_administrador('Ivan','Hernández','Hernández','HEHI000214JHG','HEHI000214HMCRRVA6','20','Neblina','3','28','Ecatepec','Ecatepec','55066','5614305936',1,1);
SELECT * FROM insertar_nuevo_administrador('Jesus Obed','Gutierrez','Garcia','GUGJ981024PWE','GUGJ981024HMCTRS05','21','valle san gabriel','s/n','26','urbi villas del campo','Tecamac','55767','5564549933',1,1);
SELECT * FROM insertar_nuevo_administrador('Martin Ulises','Romo','Torres','ROTM991029EDC','ROTM991029HMCMRR07','20','Grano de oro','12','25','Tecamac','Tecamac','55765','5556786642',1,1);
SELECT * FROM insertar_nuevo_administrador('Jesus Josue','Garnica','Meneses','GAMJ000107','GAMJ000107HMCRNSV8','20','Geoda','14','14','Geovillas','Tizayuca','43806','5679585432',1,1);
SELECT * FROM insertar_nuevo_administrador('Juan Angel','Escamilla','Lopez','EALJ000716','EALJ000716HMCSPNH8','19','Granillo','03','03','Pedregal','Tizayuca','43806','5696636251',1,1);




---------------------------------------------------------------------------------------------
--CLINICAS
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nueva_clinica('Escámez dental ','HMCK56OTYA','Anillo Periférico','2','5','Naucalpan de Juárez','Naucalpan','53598','886687105',1,1,1);
SELECT * FROM insertar_nueva_clinica('Avodent','HMCK51OTYB','Avenida 16 de Septiembre','4','6','Otumba','Otumba','53598','8654660880',1,1,2);
SELECT * FROM insertar_nueva_clinica('Ortonova','HMCK52OTYC','Avenida Álvaro Obregón','6','16','Ixtapaluca','Ixtapaluca','56576','7618790054',1,1,3);
SELECT * FROM insertar_nueva_clinica('Clínica Lisbon Smile Clinic','HMCK53OTYD','Avenida Ámsterdam','8','53','Cd. Nezahualcóyotl','Nezahualcoyotl','57210','8499009641',1,1,4);
SELECT * FROM insertar_nueva_clinica('Clínica dental La Vaguada','HMCK54OTYF','Avenida Bucareli','3','2','Toluca de Lerdo','Toluca','50009','8865470654',1,1,5);
SELECT * FROM insertar_nueva_clinica('Avodent ','HMCK55OTYG','Avenida Chapultepec','6','54','Naucalpan de Juárez','Naucalpan','53598','7911031498',1,2,6);
SELECT * FROM insertar_nueva_clinica('Ortonova','HMCK56OTYH','Calzada de Guadalupe','9','4','Otumba','Otumba','53598','8519118820',1,2,7);
SELECT * FROM insertar_nueva_clinica('Clínica Navarro, Bergés Nieto','HMCK57OTYJ','Calzada de la Viga','12','8','Ixtapaluca','Ixtapaluca','56576','6990216454',1,2,8);
SELECT * FROM insertar_nueva_clinica('Clínica dental Siero','HMCK58OTYK','Calzada de los Misterios','14','6','Cd. Nezahualcóyotl','Nezahualcoyotl','57210','6990216454',1,2,9);
SELECT * FROM insertar_nueva_clinica('Clínica dental La Vaguada','HMCK59OTYL','Calzada de Tlalpan','16','9','Toluca de Lerdo','Toluca','50009','7634412338',1,2,10);
SELECT * FROM insertar_nueva_clinica('Escámez dental ','AMCK56OTYN','Calzada Ignacio Zaragoza','18','11','Naucalpan de Juárez','Naucalpan','53598','7634412338',1,1,11);
SELECT * FROM insertar_nueva_clinica('Clínica Lisbon Smile Clinic','BMCK56OTYM','Calzada México-Tacuba','4','14','Otumba','Otumba','53598','6325052174',1,1,12);
SELECT * FROM insertar_nueva_clinica('Clínica dental Siero','CMCK56OTYO','Circuito Interior','8','24','Ixtapaluca','	Ixtapaluca','56576','7379328079',1,1,13);
SELECT * FROM insertar_nueva_clinica('Clínica Navarro, Bergés Nieto','DMCK56OTYP','República de Argentina','9','64','Cd. Nezahualcóyotl','Nezahualcoyotl','57210','7235106316',1,1,14);
SELECT * FROM insertar_nueva_clinica('Clínica CED','EMCK56OTYQ','Callejón de Manzanares','10','23','Toluca de Lerdo','Toluca','50009','6541984535',1,1,15);
SELECT * FROM insertar_nueva_clinica('Clínica CED','FMCK56OTYR','Eje 1 Norte','5','6','Naucalpan de Juárez','Naucalpan','53598','6254030092',1,2,16);
SELECT * FROM insertar_nueva_clinica('Sonrie Siempre','GMCK56OTYS','Eje 1 Poniente','10','26','Otumba','Otumba','53598','7314004547',1,2,17);
SELECT * FROM insertar_nueva_clinica('Clínica dental La Vaguada','MCK56OTYRT','Eje Central Lázaro Cárdenas','15','26','Ixtapaluca','Ixtapaluca','56576','7977560514',1,2,18);
SELECT * FROM insertar_nueva_clinica('Sonrie Siempre','AMCK56OTYU','Paseo de la Reforma','20','54','Cd. Nezahualcóyotl','Nezahualcoyotl','57210','6644264616',1,2,19);
SELECT * FROM insertar_nueva_clinica('Clínica CED','BMCK56OTYV','Río Consulado','25','34','Toluca de Lerdo','Toluca','50009','6473728802',1,2,20);
SELECT * FROM insertar_nueva_clinica('Avodent','CMCK56OTYX','Río de la Piedad','9','28','Naucalpan de Juárez','Naucalpan','53598','8707374520',1,1,21);
SELECT * FROM insertar_nueva_clinica('Clínica Lisbon Smile Clinic','DMCK56OTYY','Río Magdalena ','18','27','Otumba','Otumba','53598','6308037878',1,2,22);
SELECT * FROM insertar_nueva_clinica('Clínica CED','EMCK56OTYZ','Supervía Poniente','27','1','Ixtapaluca','Ixtapaluca','56576','6550613673',1,1,23);
SELECT * FROM insertar_nueva_clinica('Ortonova','XMCK56OTYA','Viaducto Miguel Alemán','26','8','Cd. Nezahualcóyotl','Nezahualcoyotl','57210','6633389208',1,2,24);
SELECT * FROM insertar_nueva_clinica('Clínica Navarro, Bergés Nieto','ZMCK56OTYB','Glorieta de los Insurgentes','2','2','Toluca de Lerdo','Toluca','50009','6812542971',1,1,25);



---------------------------------------------------------------------------------------------
--SERVICIOS
---------------------------------------------------------------------------------------------
SELECT*FROM insertar_nuevo_servicio('dientes limpios','vas a tener dientes super limpios',200);
SELECT*FROM insertar_nuevo_servicio('Cirugía Oral','Extracciones dentarias y cirugía de la boca.',550);
SELECT*FROM insertar_nuevo_servicio('Odontología Preventiva','Tartrectomías.',250.00);
SELECT*FROM insertar_nuevo_servicio('Periodoncia','Tratamiento de la patología de las encías y tejidos de soporte dentario.',1500.50);
SELECT*FROM insertar_nuevo_servicio('Terapéutica dental','Tratamiento de las lesiones dentales, como la caries.',850);
SELECT*FROM insertar_nuevo_servicio('Endodoncia','Tratamiento de las raíces dentarias.',700);
SELECT*FROM insertar_nuevo_servicio('Prótesis dental','Sustitución de piezas dentarias mediante prótesis removible y fija sobre otros dientes o sobre implantes.',2100.50);
SELECT*FROM insertar_nuevo_servicio('Odontología Infantil','Tratamiento odontológico general en niños',1000);
SELECT*FROM insertar_nuevo_servicio('Dolor orofacial','Tratamiento del dolor orofacial y trastornos funcionales masticatorios',680.20);
SELECT*FROM insertar_nuevo_servicio('Medicina Bucal','Tratamiento de las lesiones de la mucosa oral.',1800);
SELECT*FROM insertar_nuevo_servicio('Radiología Dental.','muestra en rayos x  los dietes para poder solucionar',2600);
SELECT*FROM insertar_nuevo_servicio('Ortodoncia','Diagnóstico, prevención y el tratamiento de las irregularidades dentales y faciales.',1400);
SELECT*FROM insertar_nuevo_servicio('limpieza de  muelas','tratamiento de muelas picadas o infectadas',850);
SELECT*FROM insertar_nuevo_servicio('limpieza de dientes y caries','tratamiento de dientes picados',850);
SELECT*FROM insertar_nuevo_servicio('brackets','corregir los defectos en la forma, posición',1500);
SELECT*FROM insertar_nuevo_servicio('sacar dientes','los dientes podridos o malos se  sacan',500);
SELECT*FROM insertar_nuevo_servicio('lipieza infantil','tratamientos  mas cuidadosos',1000);
SELECT*FROM insertar_nuevo_servicio('limpieza para adultos mayores','limpieza profunda en los dientes',1800);
SELECT*FROM insertar_nuevo_servicio('coronas','Creacion de coronillas para dientes rotos',1600);
SELECT*FROM insertar_nuevo_servicio('examen dental','checar los dientes',150);
SELECT*FROM insertar_nuevo_servicio('inspeccion de dientes','bitacora dental de como van los dientes',600);
SELECT*FROM insertar_nuevo_servicio('dentaduras','para señores o viejitos',7862.00);
SELECT*FROM insertar_nuevo_servicio('enjuages','para que tengas mas blancos los dientes',350);
SELECT*FROM insertar_nuevo_servicio('solucion de dolores','tratamiento de dolor dental',850);
SELECT*FROM insertar_nuevo_servicio('medicamentos','venta de medicamentos especiales',120.50);

---------------------------------------------------------------------------------------------
--PROMOCIONES
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nueva_promocion('dientes felices','dientes mas sanos que nunca',30,1);
SELECT * FROM insertar_nueva_promocion('dientes mas blancos','claramiento de dientes',20,2);
SELECT * FROM insertar_nueva_promocion('brackets colorines','colocacion de brackets de colores',15,3);
SELECT * FROM insertar_nueva_promocion('dientes perfectos','tratamientos de dientes a lineados',10,4);
SELECT * FROM insertar_nueva_promocion('sin caries','limpieza de dientes',25,5);
SELECT * FROM insertar_nueva_promocion('servico express','servicio super rapido',10,6);
SELECT * FROM insertar_nueva_promocion('medicinas mitad de precio','los medicinas mas baratas del oeste',50,7);
SELECT * FROM insertar_nueva_promocion('medicinas molares','medicinas para controlar dolor molar',5,8);
SELECT * FROM insertar_nueva_promocion('brackets 2x1','colocacion de brackets',27,9);
SELECT * FROM insertar_nueva_promocion('diente postizo','dientes de porcelana',5,10);
SELECT * FROM insertar_nueva_promocion('dentaduras finas','para comer mejor',15,11);
SELECT * FROM insertar_nueva_promocion('remplazo de muelas','muelas de porcelana',12,12);
SELECT * FROM insertar_nueva_promocion('muelas perfectas','limpieza en las muelas y blanquiamiento',2,13);
SELECT * FROM insertar_nueva_promocion('estrellas mas blancas','se tapan las caries con extrellas',30,14);
SELECT * FROM insertar_nueva_promocion('citas rapidas','citas rapido y al momento',5,15);
SELECT * FROM insertar_nueva_promocion('dientes fuertes','vitaminas para los dientes',10,16);
SELECT * FROM insertar_nueva_promocion('adultos felices','tratamientos para dientes en los mayores',18,17);
SELECT * FROM insertar_nueva_promocion('impieza molar','limpieza y tratamiento',15,18);
SELECT * FROM insertar_nueva_promocion('limpiezas grandes','limpieza de dientes para adultos',20,19);
SELECT * FROM insertar_nueva_promocion('1 mes gratis de brackets','prueba de brackets',12,20);
SELECT * FROM insertar_nueva_promocion('2x1 en dentaduras','para señores mayores',50,21);
SELECT * FROM insertar_nueva_promocion('adolecentes con dientes perfectos','para chavos',30,22);
SELECT * FROM insertar_nueva_promocion('niños 2x2','pagan con diversion',22,23);
SELECT * FROM insertar_nueva_promocion('niños pagan poco','para niños precio reducidos',14,24);
SELECT * FROM insertar_nueva_promocion('familia 2x1','familiares pagan la mitad',20,25);
---------------------------------------------------------------------------------------------
--CONSULTORIOS
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nuevo_consultorio(1,1);
SELECT * FROM insertar_nuevo_consultorio(2,2);
SELECT * FROM insertar_nuevo_consultorio(3,3);
SELECT * FROM insertar_nuevo_consultorio(4,4);
SELECT * FROM insertar_nuevo_consultorio(5,5);
SELECT * FROM insertar_nuevo_consultorio(6,6);
SELECT * FROM insertar_nuevo_consultorio(7,7);
SELECT * FROM insertar_nuevo_consultorio(8,8);
SELECT * FROM insertar_nuevo_consultorio(9,9);
SELECT * FROM insertar_nuevo_consultorio(10,10);
SELECT * FROM insertar_nuevo_consultorio(11,11);
SELECT * FROM insertar_nuevo_consultorio(12,12);
SELECT * FROM insertar_nuevo_consultorio(13,13);
SELECT * FROM insertar_nuevo_consultorio(14,14);
SELECT * FROM insertar_nuevo_consultorio(15,15);
SELECT * FROM insertar_nuevo_consultorio(16,16);
SELECT * FROM insertar_nuevo_consultorio(17,17);
SELECT * FROM insertar_nuevo_consultorio(18,18);
SELECT * FROM insertar_nuevo_consultorio(19,19);
SELECT * FROM insertar_nuevo_consultorio(20,20);
SELECT * FROM insertar_nuevo_consultorio(21,21);
SELECT * FROM insertar_nuevo_consultorio(22,22);
SELECT * FROM insertar_nuevo_consultorio(23,23);
SELECT * FROM insertar_nuevo_consultorio(24,24);
SELECT * FROM insertar_nuevo_consultorio(25,25);
--AYUDANTES
--1
SELECT * FROM insertar_nuevo_personal('Josefina','Lopez','Salasar','LOSA770826MSLPLN94','LOSA770826','43','piedra','20','20','geovillas','Tizayuca','43806','5611118850',2,1,null,1);
--2
SELECT * FROM insertar_nuevo_personal('Andrea','Macias','Solis','MASA970373MMCCLN18','MASA970303','22','geoda','18','18','geovillas','Tizayuca','43806','5687642118',2,1,null,2);
--3
SELECT * FROM insertar_nuevo_personal('Karla','Macias','Ortiz','MAOK970373MMCCRR83','MAOK970304','22','puerto vallarta','19','19','casas Geo','Tizayuca','43806','5621346578',2,1,null,3);
--4
SELECT * FROM insertar_nuevo_personal('Jessica','Romero','Ramirez','RORJ970520MMCMMS23','RORJ970520','22','acapulco','20','20','geovillas','Tizayuca','43806','5679643125',2,1,null,4);
--5
SELECT * FROM insertar_nuevo_personal('Misrain','Macias','Gonzalez','MAGM830622MMCCNS15','MAGM830622','37','grafito','21','21','geovillas','Tizayuca','43806','5619273458',2,1,null,5);
--6
SELECT * FROM insertar_nuevo_personal('Tania','Mayorga','Hernandez','MAHT830622MMCCNS15','MAHTM830622','37','diamante','22','22','los angeles','Tizayuca','43806','5619273458',2,1,null,6);
--7
SELECT * FROM insertar_nuevo_personal('Laura','Padilla','Hernandez','PAHL000824MMCDRRW7','PAHL000824','20','malaquita','23','23','villa magna','Tizayuca','43806','5631452189',2,1,null,7);
--8
SELECT * FROM insertar_nuevo_personal('Victoria','Licona','Islas','LIIV971025MMCCSC52','LIIV971025','22','esmeralda','24','24','geovillas','Tizayuca','43806','5632353849',2,1,null,8);
--9
SELECT * FROM insertar_nuevo_personal('Vanesa','Torres','Castillo','TOCV971127MMCRSN62','TOCV971127','22','jamaica','25','25','el pedregal','Tizayuca','43806','5689671834',2,1,null,9);
--10
SELECT * FROM insertar_nuevo_personal('Fernanda','Hernandez','Guevara','HEGF971228MMCRVR72','HEGF971228','22','cancun','26','26','centro tizayuca','Tizayuca','43806','5621323564',2,1,null,10);
--11
SELECT * FROM insertar_nuevo_personal('Paola','Perez','Mendez','PEMP970201MMCRNL23','PEMP970201','23','grafito','29','29','sadasi','Tizayuca','43806','5621323567',2,1,null,11);
--12
SELECT * FROM insertar_nuevo_personal('Yetzelin','Sevilla','Cruz','SECY970302MMCVRT21','SECY970302','22','rosa','30','30','Los conos','Tizayuca','43806','5619273458',2,1,null,12);
--13
SELECT * FROM insertar_nuevo_personal('Adriana','Osorio','Garcia','OOGA970403MMCSRD49','OOGA970403','22','morelos','20','20','Casas Geo','Tizayuca','43806','5621346532',2,1,null,13);
--14
SELECT * FROM insertar_nuevo_personal('Karla','Armas','Estrada','AAEK970510MMCRSR66','AAEK970510','22','plasma','21','21','Unidad Habitacional','Tizayuca','43806','5621343124',2,1,null,14);
--15
SELECT * FROM insertar_nuevo_personal('juana','martinez','miranda','JUMM732405HDFRRA2','JUMM732405','48','3ra cerrada de bosques de mexico','105','63-3','heroes','tecamac','55764','4977543',2,1,null,1);
--16
SELECT * FROM insertar_nuevo_personal('jessica paola','ramirez','rojo','RRJP000816HDFAFR2','RRJP000816','20','sur 16','s/n','6','san agustin', 'ecatepec','55687','5547875825',2,1,null,1);
--17
SELECT * FROM insertar_nuevo_personal('juana guadulupe','vazquez','martinez','VMJG0101HDFGHL3','VMJG0101','18','bosques de mexico','105','63-3','heroes','tecamac','55764','49775437',2,1,null,1);
--18
SELECT * FROM insertar_nuevo_personal('michel','niño','muñoz','NÑMN000601MMWRELA9','NÑMN000601', '19', 'Calle milagro', 's/n','10','ecatepec', 'ecaatepec', '55458','5578984875',2, 1,null,1);
--19
SELECT * FROM insertar_nuevo_personal('martha jennifer','lopez','martinez','MJLJ000520HDFRRRA9','MJLJ000520','19','calle sur 16','5','103','flores magon','miguel hidalgo','55312','5542157894',2,1,null,1);
--20
SELECT * FROM insertar_nuevo_personal('Claudia','Piña','Martinez','PIMC750707MDFXLR09','PIMC750707','44','Amargura','45','203','San Juan','Nextlalpan','55790','5534563213',2,1,null,1);
--21
SELECT * FROM insertar_nuevo_personal('Fernanda','Perez','Martinez','PEMF750813MDFRRR09','PEMF750813','43','Potreros','35','234','Prados','Nextlalpan','55790','5556432167',2,1,null,1);
--22
SELECT * FROM insertar_nuevo_personal('Paulina','Castillo','Hernandez','CAMP800617MMCSRU07','CAMP800617','39','Flores','35','432','San Pablo','Ojo de Agua','55790','5545678945',2,1,null,1);
--23
SELECT * FROM insertar_nuevo_personal('Lorena','Piña','Mendez','PIML850221MMCXNR02','PIML850221','35','Chapultepec','54','456','San Juan','Nextlalpan','55790','5545674322',2,1,null,1);
--24
SELECT * FROM insertar_nuevo_personal('Itzel','Piña','Martinez','PIMI960901MMCXRZ05','PIMI960901','23','Peras','11','20','CTC Pinturas','Zumpango','55754','5534567566',2,1,null,1);
--25
SELECT * FROM insertar_nuevo_personal('Jatsiri','Flores','Arias','FOAJ950826MMCLRT37','FOAJ950826','24','montura','116','116','Quma','Tizayuca','43806','5531467958',2,1,null,1);


--DENTISTAS
SELECT * FROM insertar_nuevo_personal('mario josue','arteaga','martinez','AEMM000517HDFRRRA9','AEMM000517','20','3ra cerrada de bosques de mexico','105','63-3','heroes','tecamac','55764','5549240017',1,1,1,1);
SELECT * FROM insertar_nuevo_personal('luis angel','aguirre','godìnez','AUGL001216HDFGDSA8','AUGL001216','19','calle 12 de octubre','15','15','heroes', 'tecamac','55764','5549650017',1,1,2,2);
SELECT * FROM insertar_nuevo_personal('Claudia','Mendoza','Monter','MEMC000503MMCNNLA0','MEMC000503','19','Salto del Agua','5','30','Tonanitla','Tonanitla','55785','5612714813',2,0,3,3);
SELECT * FROM insertar_nuevo_personal('Josè Francisco','Nava', 'Rodrìguez','NARF000405HDFVDRA1', 'NARF000405', '19', 'Bayona', '23','23', 'Santo Domingo', 'Tecamac', '55754','5583621828',  3, 0,4,4);
SELECT * FROM insertar_nuevo_personal('alexis','parra', 'rojas','PARA960906HMCRJL06','PARA960906','23','Privada Vista Hermosa','47','15', 'Lomas de Tecamac','Tecamac','55675','5583438203', 4, 0,5,5);
SELECT * FROM insertar_nuevo_personal('Lizeth','Meza','Picazo', 'MEPL000912MMCZCZA0','MEPL000912','19',' Cerro Jesus','703','29','Sierra Hermosa','Tecàmac','55749','5587065642',2,1,6,6);
SELECT * FROM insertar_nuevo_personal('Ivan','Navarro','Hernandez','NAHI000406HMCVRVA6','NAHI000406', '19','Bugambilia','8','12','Cerros','Ecatepec', '55070','5559643513',1,0,7,7);
SELECT * FROM insertar_nuevo_personal('Hugo Alejandro'	,'Belmont'	,'Romo'	,'BERH00529HHGLMGA3'	,'BERH00529'	,'19',	'Calle florida',	's/n'	,'3',	'Tizayuca',	'Tizayuca',	'43800',	'7714105025',		4,	1	,8,	8);
SELECT * FROM insertar_nuevo_personal('David Alejandro'	,'Alvarado'	,'Diaz',	'AADD001204HDFLZVA5'	,'AADD001204'	,'19',	'Privada Hacienda Torrecillas',	'104',	'104'	,'Santa Ana Tlachiahualpa',	'Temascalapa',	'55994',	'5510054921'		,3	,0	,9	,9);
SELECT * FROM insertar_nuevo_personal('Brayan Adrian'	,'Sanchez',	'Rubio'	,'SARB991113HMCNBR07'	,'SARB991113',	'20',	'Lago Managua',	'59',	's/n',	'Haciendas de Tizayuca',	'Tizayuca',	'43815'	,'5565761602',		2	,1	,10,	10);
SELECT * FROM insertar_nuevo_personal('Itzel',	'Gallegos'	,'Marìn'	,'GAMI000831MMCLRTA4',	'GAMI000831'	,'19'	,'CALLE Isla Mujeres'	,'s/n'	,'48'	,'San Pedro'	,'Tecamac'	,'55767'	,'5523690691',		1	,1,	11,	11);
SELECT * FROM insertar_nuevo_personal('Paola Alejandra',	'Obregòn',	'Guzman'	,'OEGP000229MMCBZLA9'	,'OEGP000229',	'20',	'peña y peña',	'5',	'25',	'Jardines de Morelos'	,'Ecatepec',	'55070'	,'5518631586'	,4	,1,	12	,12);
SELECT * FROM insertar_nuevo_personal('Eunice guadalupe',	'gutierrez',	'garcia',	'GUGE001027MMCTRNA1'	,'GUGE001027'	,'19',	'valle san gabriel',	's/n'	,'26',	'San Francisco Cuautliquixca'	,'Tecamac',	'55760'	,'5560478986'	,	1,	1,	13,	13);
SELECT * FROM insertar_nuevo_personal('Víctor Emmanuel',	'Baeza',	'Hernández',	'BAHV971228HMCZRC07',	'BAHV971228'	,'22',	'Camino a españa',	'350',	'14',	'urbi villas del campo'	,'Tecamac',	'55767',	'5581183956',		4,	1,	14,	14);
SELECT * FROM insertar_nuevo_personal('Cesar Omar'	,'Salinas',	'Piña',	'SAPC001020HMCLXSA0',	'SAPC001020',	'19',	'Amargura',	's/n',	'203',	'Geovillas',	'Tizayuca',	'43806'	,'5611118850',		1,	0,	15,	15);
SELECT * FROM insertar_nuevo_personal('Hugo Alberto',	'Gonzalez',	'Copado',	'GOCH980203HMCNPG02',	'GOCH980203'	,'22',	'Olivos',	'15',	'9',	'San Juan',	'Nextlalpan',	'55790',	'5564066206',	1,	0,	16,	16);
SELECT * FROM insertar_nuevo_personal('Josué Fernando',	'Rivero', 	'Martínez',	'RIMJ000405HMCVRSA3',	'RIMJ000405',	'19',	'Juan Escutia',	's/n'	,'18',	'Olivos',	'Tecamac',	'55748'	,'5548712254'	,1	,0,	17,	17);
SELECT * FROM insertar_nuevo_personal('Aaron Isai',	'Alvarado',	'Vega',	'AAVA991126HMCLGR03',	'AAVA991126',	'20',	'Calle 9',	'30',	'94',	'Ozumbilla',	'Tecámac',	'55766',	'5611877478',		2,	0,	18,	18);
SELECT * FROM insertar_nuevo_personal('Ivan'	,'Hernández',	'Hernández',	'HEHI000214HMCRRVA6',	'HEHI000214',	'20',	'Neblina',	'3',	'28',	'Ecatepec',	'Ecatepec',	'55339'	,'5529084455',		'4'	,1,	19	,19);
SELECT * FROM insertar_nuevo_personal('Jesus Obed',	'Gutierrez',	'Garcia',	'GUGJ981024HMCTRS05',	'GUGJ981024'	,'21',	'valle san gabriel',	's/n'	,'26',	'Ecatepec',	'Ecatepec',	'55066'	,'5614305936',		3,	1,	20,	20);
SELECT * FROM insertar_nuevo_personal('Martin Ulises',	'Romo'	,'Torres	', 'ROTM991029HMCMRR07'	,'ROTM991029'	,'20',	'Grano de oro',	'12',	'25',	'urbi villas del campo',	'Tecamac',	'55767'	,'5564549933',		3,	1,	21,	21);
SELECT * FROM insertar_nuevo_personal('juana','martinez','miranda','JMAM991029HDFRRRA9','JMAM991029','20','calle 13','s/n','s/n','tecamac','tecamac','55767','5578945868',2,1,22,22);
SELECT * FROM insertar_nuevo_personal('melissa','arteaga','ramirez','mear0010515HDFRRR9','mear0010515','17','villas de aragon','s/n','5','ecatepec de morelos','ecatepec','55987','5587789845',1,0,23,23);
SELECT * FROM insertar_nuevo_personal('jessica paola','ramirez','rojo','RRJP000812HDFRRRA9','RRJP000812','20','sur 18','15','4','san agustin','ecatepec','55784','5578789874',1,1,24,24);
SELECT * FROM insertar_nuevo_personal('Andrea Yameli','Macias','Solis','MASA970413MMCCLN64','MASA970413','22','perla','22','22','Haciendas','Tizayuca','43806','5534185746',1,1,25,25);


---------------------------------------------------------------------------------------------
--ESPECIALIDADES
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nueva_especialidad(1,1);
SELECT * FROM insertar_nueva_especialidad(2,2);
SELECT * FROM insertar_nueva_especialidad(3,3);
SELECT * FROM insertar_nueva_especialidad(4,4);
SELECT * FROM insertar_nueva_especialidad(5,5);
SELECT * FROM insertar_nueva_especialidad(6,6);
SELECT * FROM insertar_nueva_especialidad(7,7);
SELECT * FROM insertar_nueva_especialidad(8,8);
SELECT * FROM insertar_nueva_especialidad(9,9);
SELECT * FROM insertar_nueva_especialidad(10,10);
SELECT * FROM insertar_nueva_especialidad(11,11);
SELECT * FROM insertar_nueva_especialidad(12,12);
SELECT * FROM insertar_nueva_especialidad(13,13);
SELECT * FROM insertar_nueva_especialidad(14,14);
SELECT * FROM insertar_nueva_especialidad(15,15);
SELECT * FROM insertar_nueva_especialidad(16,16);
SELECT * FROM insertar_nueva_especialidad(17,17);
SELECT * FROM insertar_nueva_especialidad(18,18);
SELECT * FROM insertar_nueva_especialidad(19,19);
SELECT * FROM insertar_nueva_especialidad(20,20);
SELECT * FROM insertar_nueva_especialidad(21,21);
SELECT * FROM insertar_nueva_especialidad(22,22);
SELECT * FROM insertar_nueva_especialidad(23,23);
SELECT * FROM insertar_nueva_especialidad(24,24);
SELECT * FROM insertar_nueva_especialidad(25,25);
SELECT * FROM insertar_nueva_especialidad(26,1);
SELECT * FROM insertar_nueva_especialidad(27,2);
SELECT * FROM insertar_nueva_especialidad(28,3);
SELECT * FROM insertar_nueva_especialidad(29,4);
SELECT * FROM insertar_nueva_especialidad(30,5);
SELECT * FROM insertar_nueva_especialidad(31,6);
SELECT * FROM insertar_nueva_especialidad(32,7);
SELECT * FROM insertar_nueva_especialidad(33,8);
SELECT * FROM insertar_nueva_especialidad(34,9);
SELECT * FROM insertar_nueva_especialidad(35,10);
SELECT * FROM insertar_nueva_especialidad(36,11);
SELECT * FROM insertar_nueva_especialidad(37,12);
SELECT * FROM insertar_nueva_especialidad(38,13);
SELECT * FROM insertar_nueva_especialidad(39,14);
SELECT * FROM insertar_nueva_especialidad(40,15);
SELECT * FROM insertar_nueva_especialidad(41,16);
SELECT * FROM insertar_nueva_especialidad(42,17);
SELECT * FROM insertar_nueva_especialidad(43,18);
SELECT * FROM insertar_nueva_especialidad(44,19);
SELECT * FROM insertar_nueva_especialidad(45,20);
SELECT * FROM insertar_nueva_especialidad(46,21);
SELECT * FROM insertar_nueva_especialidad(47,22);
SELECT * FROM insertar_nueva_especialidad(48,23);
SELECT * FROM insertar_nueva_especialidad(49,24);
SELECT * FROM insertar_nueva_especialidad(50,25);

---------------------------------------------------------------------------------------------
--RECEPCIONISTAS
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nueva_recepcionista('FRANCISCO JAVIER','BERNABE',' DIAZ', 'BEDF4403D4944','BEDF4403HSERZR00' ,'19','Av.amargura','203','34','San Juan','Nextlalpan','55790','5589674835',1,1);
SELECT * FROM insertar_nueva_recepcionista(' NORANEY',' BELTRAN',' HERNANDEZ ','BEHN750719000','BEHN750719MGRLRR0','20','Av.Ojo de Agua','3','4','San Juan','Xalapan','55780','5515684054',1,2);
SELECT * FROM insertar_nueva_recepcionista(' BISMARCK CAYETANO',' BEDOLLA ','PLATERO','BEPB860909000','BEPB860909HGRDLS0', '32','Av.soleado','13','40','Cuvictoria','Ixtapalapa','55050','5515478956',1,3);
SELECT * FROM insertar_nueva_recepcionista('MARIA DEL CARMEN ','BENITEZ ','SALGADO ','BEHN750719001','BEHN750719MGRLRR1','40','Cda.Michoac','30','7','Ecatepec','Morelos','55066','5554589741',1,4);
SELECT * FROM insertar_nueva_recepcionista(' SERAFIN',' BERNAL',' SALGADO ','BESS650131UK5','BESS650131HSERLR00','60','Altevideo','10','74','Ecatepec','Cristo','55076','5578547892',1,5);

SELECT * FROM insertar_nueva_recepcionista('ANDRES',' BENITEZ',' TABOADA ','BETA7528000','BETA7528HGRNBN01','50','Michoac','30','41','Morelia','Morelos','55067','5578475412',1,6);
SELECT * FROM insertar_nueva_recepcionista('PEDRO ','BUSTAMANTE ','SALGADO','BUSP8204276H2','BUSP820427HGRSLDOZ','42','Michoacaniu','31','1','Morten','Moctezuma','55097','5578475415',1,7);
SELECT * FROM insertar_nueva_recepcionista('ARACELI ','CASTREJON',' ELIZALDE ','CAEA7819SRA','CAEA7819MGRSLRO5','21','Mixcoac','30','41','Morelia','Morelos','55067','5578475412',1,8);
SELECT * FROM insertar_nueva_recepcionista(' KATIA',' CHAVEZ',' GUERRERO ','CAGK8108TZ4','CAGK8108MSEHRT00','20','choleto','30','4','Morelia','Morelos','55063','5578475412',1,9);
SELECT * FROM insertar_nueva_recepcionista('LUCIANA',' CATALAN',' GUSMAN','CAGL720718000','CAGL720718MGRTSC02','29','chokada','14','41','Morelia','Mosbre','55047','5578475412',1,10);

SELECT * FROM insertar_nueva_recepcionista(' ELIDETH',' CASTRO ','HERRERA ','CAHE850328000','CAHE850328MGRSRL04','30','carrido','310','441','Alexala','Aquiel','55014','5578475412',1,11);
SELECT * FROM insertar_nueva_recepcionista(' ANAHI ','CATARINO ','MARTINEZ ','CAMA8217UJ2','CAMA8217MGRTRNO0','20','oleasa','37','419','Sateri','olmos','55015','5578475412',1,12);
SELECT * FROM insertar_nueva_recepcionista('JOSEFINA',' CASARRUBIAS',' MARTINEZ','CAMJ650413000','CAMJ650413MDFSRS06','40','salido','39','41','Palma','aswqui','55016','5578475412',1,13);
SELECT * FROM insertar_nueva_recepcionista('HERIBERTO ','CASIMIRO',' POBLETE ','CAPH690316SZ3','CAPH690316HSESBR00','50','veterino','25','41','polos','Negateres','55017','5578475912',1,14);
SELECT * FROM insertar_nueva_recepcionista('MARIEL ANAHI',' CAMPUZANO ','QUINTO ','CAQM8731000','CAQM8731MGRMNR04','60','afterio','30','65','Mater','Mospotre','55018','5578475812',1,15);

SELECT * FROM insertar_nueva_recepcionista('CRISTIAN SAMUEL ','CABAÑAS',' RAMIREZ','CARC920814000','CARC920814HGRBMR07','90','adertio','30','87','Aledon','Morelos','55019','5578775412',1,16);
SELECT * FROM insertar_nueva_recepcionista(' MIGUEL',' CALITO',' RAMIREZ ','CARM590708000','CARM590608HGRLMG04','20','Michoacan','14','41','Materia','Armada','55020','5578475419',1,17);
SELECT * FROM insertar_nueva_recepcionista(' MIGUEL ','CHAVEZ ','RAMIREZ ','CARM780929000','CARM780929HGRHMG07','20','Milisio','89','41','Mortedio','Mexicana','55021','5578975412',1,18);
SELECT * FROM insertar_nueva_recepcionista(' MIGUEL ANGEL',' CARRERA ','ROMERO','CARM810205000','CARM810205HGRRMG02', '25','Mexico','74','41','Inglesa','Morelos','55022','5576475412',1,19);
SELECT * FROM insertar_nueva_recepcionista(' FANY ','CASTRO',' SEGURA ','CASF7109000','CASF7109MGRSGN08','28','Michoacan','30','41','Asia','Moreliada','55041','5574475412',1,20);

SELECT * FROM insertar_nueva_recepcionista(' HEIDI ','CASTILLO ','TORNES','CATH780914D73','CATH780914MGRSRDOO','26','Michoacan','7','41','Moreliana','Morelos','55054','5522475412',1,21);
SELECT * FROM insertar_nueva_recepcionista('ANA BERTHA ','CADENAS ','VALLE','CAVA700204000','CAVA700204MGRDLN02','38','Nayarit','3','41','Mortesioncle','Asia','55036','5578475425',1,22);
SELECT * FROM insertar_nueva_recepcionista('JUAN CARLOS',' CADENAS ','VALLE','CAVJ710503000','CAVJ710503HGRDLN00', '45','Asil','10','41','Aculeida','America','55026','5578498412',1,23);
SELECT * FROM insertar_nueva_recepcionista(' SARAI',' CLETO ','BANDERA ','CEBS810922000','CEBS810922MMCLNR09','68','Setino','3','11','Asturias','Oner','55027','5578477412',1,24);
SELECT * FROM insertar_nueva_recepcionista(' SARAI',' CLETRU ','BANDERO ','CEBS810921000','CEBS810921MMCLNR08','61','boterio','310','51','Misaya','Othernid','55068','5578875412',1,25);



---------------------------------------------------------------------------------------------
--USUARIOS
---------------------------------------------------------------------------------------------
SELECT * FROM Insertar_nuevo_usuario('Braulio Adrian','Arias','Macias','AIMB000221','AIMB000221HMCRCRA2','20','Cuarzo','17','17','Geovillas','Tizayuca','43806','bloodgem21@gmail.com','5611118850',0,1);
SELECT * FROM Insertar_nuevo_usuario('Mauro Yael','Arias','Macias','AIMM951215','AIMM951215HMCRCR43','25','Cuarzo','17','17','Geovillas','Tizayuca','43806','mauro1995@gmail.com','5631249758',0,2);
SELECT * FROM Insertar_nuevo_usuario('Diana Lizet','Arias','Macias','AIMD050708','AIMD050708MMCRCNO1','14','Cuarzo','17','17','Geovillas','Tizayuca','43806','dianax@gmail.com','5669635285',0,3);
SELECT * FROM Insertar_nuevo_usuario('Israel','Arias','Gomez','AIGI691020','AIGI691020HMCRMS64','51','Cuarzo','17','17','Geovillas','Tizayuca','43806','israelari44@gmail.com','5632216554',0,4);
SELECT * FROM Insertar_nuevo_usuario('Misrain','Macias','Gonzalez','MAGM790108','MAGM790108MMCCNS76','41','Cuarzo','17','17','Geovillas','Tizayuca','43806','misvalery79@gmail.com','5623546589',0,5);
SELECT * FROM Insertar_nuevo_usuario('mario','arteaga','Martinez','AEMM000517','AEMM000517HDFRRRA9','19','3ra cerrada de bosques de mexico','105','63-3','heroes','tecamac','55764','mariojosue@gmail.com','mariojosue',1,6);
SELECT * FROM Insertar_nuevo_usuario('Martin Ulises','Romo','Torres','ROTM991029','ROTM991029HMCMRR07','20','Grano de oro','12','25','tecamac','tecamac','55765','ulisesromo@gmail.com','ulises123',0,7);
SELECT * FROM Insertar_nuevo_usuario('jesus obed','gutierrez','garcia','GUGJ981024','GUGJ981024HMCTRS05','21','san gabriel','s/n','26','urbi','tecamac','55748','obedjesus@gmail.com','obed1234',1,8);
SELECT * FROM Insertar_nuevo_usuario('paola alejandra','obregon','guzman','OEGP000229','OEGP000229MMCBZLA9','20','peña y peña','5','25','jardines de morelos','ectepec','55784','paolaguzman@gmail.com','paola1515',1,9);
SELECT * FROM Insertar_nuevo_usuario('eunice','gutierrez','garcia','GUGE001027','GUGE001027MMCTRNA1','20','san gabriel','s/n','26','urbi','tecamac','55789','eunice@gmail.com','lupita1234',1,10);
SELECT * FROM Insertar_nuevo_usuario('Jorge','Zuñiga','Marquez','ZUMJ980221','ZUMJ980221HMCRCRA2','22','Durzano','15','07','Olivos','Tecamac','55748','jorgezum@gmail.com','Jorgezm98',1,11);
SELECT * FROM Insertar_nuevo_usuario('Osvaldo','Gonzalez','Perez','GOPO000521','GOPO000521HMCRCRA2','21','Jacaranda','07','17','San martin','Tecamac','55748','Osvaldito123@gmail.com','Valinqwe',0,12);
SELECT * FROM Insertar_nuevo_usuario('Ivan','Rodriguez','Sanchez','ROSI990314','ROSI990314HMCRCRA2','22','Esmeralda','08','14','Olivos','Tecamac','55748','elivanmalo@gmail.com','CASEPS123',1,13);
SELECT * FROM Insertar_nuevo_usuario('Zurisadai','Garcia','Nava','GANZ000602','GANZ000602HMCRCRA2','19','Sabino','15','10','Olivos','Tecamac','55748','Zurigarcia@gmail.com','Zuri1234g',0,14);
SELECT * FROM Insertar_nuevo_usuario('Mauro','Castellanos','Chumchum','CACM001002','CACM001002HMCRCRA2','19','Encino','20','05','Olivos','Tecamac','55748','Chumchum123@gmail.com','Elchumchum321',0,15);
SELECT * FROM Insertar_nuevo_usuario('Esperanza','Piña','Martinez','PIME010513','PIME010513MMCXRPA8','19','Peras','11','20','CTC Pinturas','Zumpango','55754','espe_32@gmail.com','5ythh6y',0,16);
SELECT * FROM Insertar_nuevo_usuario('Rosy Juli','Sanchez','Salinas','SASR960115','SASR960115MMCNLSA2','24','Amargura','34','203','San Juan','Nextlalpan','55790','ros_july@gmail.com','hbrtyy46h',0,17);
SELECT * FROM Insertar_nuevo_usuario('Areli','Salinas','Perez','SAPA001202','SAPA001202MMCLREA5','19','Juarez','456','34','San Juan','Nextlalpan','55790','are_salip@gmail.com','vfrgrg456',0,18);
SELECT * FROM Insertar_nuevo_usuario('Luisa','Gonzalez','Herrera','GOHL760403','GOHL760403MMCNRIA7','43','Chabacanos','45','434','San Juan','Totanitla','55790','Lui_32_Herre@gmail.com','tg5t45g4r',0,19);
SELECT * FROM Insertar_nuevo_usuario('Beatriz','Contreras','Salinas','COSB800930','COSB800930MMCNLAA3','39','Jesus Ortega','567','434','San Martin','Jaltenco','55778','Betty_34g@gmail.com','gveb4yggrtjh',0,20);
SELECT * FROM Insertar_nuevo_usuario('veronica','miranda','martinez','MMVE820314','MMVE820314HDFARES3','40','santa julia','s/n','32','cdmx','miguel hidalgo','54525','vero@gmail.com','vero1232',1,21);
SELECT * FROM Insertar_nuevo_usuario('silvia','vazquez','andrade','MMVE720401','VASI720401MMERSER4','45','ermita','102','102','iztapalapa','iztapalapa','55678','$ilvia@gmail.com','$ilvi@80',1,22);
SELECT * FROM Insertar_nuevo_usuario('Felipe','Vazquez','Arrieta','VAAF780509','VAAF780509HMCZRLR2','41','1 de mayo','34','321','san andres','jaltenco','55790','Fep_Vaz33@gmail.com','vgfg43f',1,25);
SELECT * FROM Insertar_nuevo_usuario('Juan Jose','Salinas','Piña','SAPJ980508','SAPJ060508HMCLXAA6','21','Amargura','45','203','san juan','nextlalpan','55790','Juan_sp34@gmail.com','fgtecv',1,23);
SELECT * FROM Insertar_nuevo_usuario('Fernanda','Ortiz','Perez','ORPF930324','ORPF930324MMCTRRR8','26','Allende','45','323','san francisco','molonco','55790','Fer_sd@gmail.com','tgr65yh',1,25);

---------------------------------------------------------------------------------------------
--FAMILIARES
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nuevo_familiar('FRANCISCO JAVIER','BERNABE',' DIAZ','10', 'BEDF4403HSERZR00','Hermano',1,1);
SELECT * FROM insertar_nuevo_familiar(' NORANEY',' BELTRAN',' HERNANDEZ ','20','BEHN750719MGRLRR09','Hermana',1,2);
SELECT * FROM insertar_nuevo_familiar(' BISMARCK CAYETANO',' BEDOLLA ','PLATERO', '32','BEPB860909HGRDLS01','Padre',1,3);
SELECT * FROM insertar_nuevo_familiar('MARIA DEL CARMEN ','BENITEZ ','SALGADO ','40','BEHN750719MGRLRR08','Madre',1,4);
SELECT * FROM insertar_nuevo_familiar(' SERAFIN',' BERNAL',' SALGADO ','60','BESS650131HSERLR00','Padre',1,5);

SELECT * FROM insertar_nuevo_familiar('ANDRES',' BENITEZ',' TABOADA ','50','BETA7528HGRNBN01','Hermano',1,6);
SELECT * FROM insertar_nuevo_familiar('PEDRO ','BUSTAMANTE ','SALGADO','42','BUSP820427HGRSLDOZ','Hermano',1,7);
SELECT * FROM insertar_nuevo_familiar('ARACELI ','CASTREJON',' ELIZALDE ','21','CAEA7819MGRSLRO5','Hermano',1,8);
SELECT * FROM insertar_nuevo_familiar(' KATIA',' CHAVEZ',' GUERRERO ','20','CAGK8108MSEHRT00','Hermana',1,9);
SELECT * FROM insertar_nuevo_familiar('LUCIANA',' CATALAN',' GUSMAN','29','CAGL720718MGRTSC02','Hermana',1,10);

SELECT * FROM insertar_nuevo_familiar(' ELIDETH',' CASTRO ','HERRERA ','30','CAHE850328MGRSRL04','Madre',1,11);
SELECT * FROM insertar_nuevo_familiar(' ANAHI ','CATARINO ','MARTINEZ ','20','CAMA8217MGRTRNO0','Madre',1,12);
SELECT * FROM insertar_nuevo_familiar('JOSEFINA',' CASARRUBIAS',' MARTINEZ','40','CAMJ650413MDFSRS06','Madre',1,13);
SELECT * FROM insertar_nuevo_familiar('HERIBERTO ','CASIMIRO',' POBLETE ','50','CAPH690316HSESBR00','Padre',1,14);
SELECT * FROM insertar_nuevo_familiar('MARIEL ANAHI',' CAMPUZANO ','QUINTO','60','CAQM8731MGRMNR04','Madre',1,15);

SELECT * FROM insertar_nuevo_familiar('CRISTIAN SAMUEL ','CABAÑAS',' RAMIREZ','90','CARC920814HGRBMR07','Hermano',1,16);
SELECT * FROM insertar_nuevo_familiar(' MIGUEL',' CALITO',' RAMIREZ ','20','CARM590608HGRLMG04','Hermano',1,17);
SELECT * FROM insertar_nuevo_familiar(' MIGUEL ','CHAVEZ ','RAMIREZ ','20','CARM780929HGRHMG07','Hermano',1,18);
SELECT * FROM insertar_nuevo_familiar(' MIGUEL ANGEL',' CARRERA ','ROMERO', '25','CARM810205HGRRMG02','Hermano',1,19);
SELECT * FROM insertar_nuevo_familiar(' FANY ','CASTRO',' SEGURA ','28','CASF7109MGRSGN08','Hermana',1,20);

SELECT * FROM insertar_nuevo_familiar(' HEIDI ','CASTILLO ','TORNES','26','CATH780914MGRSRDOO','Hermana',1,21);
SELECT * FROM insertar_nuevo_familiar('ANA BERTHA ','CADENAS ','VALLE','38','CAVA700204MGRDLN02','Hermana',1,22);
SELECT * FROM insertar_nuevo_familiar('JUAN CARLOS',' CADENAS ','VALLE', '45','CAVJ710503HGRDLN00','Hermano',1,23);
SELECT * FROM insertar_nuevo_familiar(' SARAI',' CLETO ','BANDERA ','68','CEBS810921MMCLNR09','Hermana',1,24);
SELECT * FROM insertar_nuevo_familiar(' SARAI',' CLETRU ','BANDERO ','61','CEBS810921MMCLNR08','Hermana',1,25);

---------------------------------------------------------------------------------------------
--TARJETAS
---------------------------------------------------------------------------------------------
SELECT * FROM insertar_nueva_tarjeta('456FG78TH56EHFG4',200,1,1);
SELECT * FROM insertar_nueva_tarjeta('457AB78TH57EHFG1',2100,2,1);
SELECT * FROM insertar_nueva_tarjeta('458CD78TH58EHFG2',400,3,1);
SELECT * FROM insertar_nueva_tarjeta('459DC78TH59EHFG3',800,4,1);
SELECT * FROM insertar_nueva_tarjeta('451FD78TH51EHFG4',1000,5,1);

SELECT * FROM insertar_nueva_tarjeta('452RT78TH51EHFG5',400,6,1);
SELECT * FROM insertar_nueva_tarjeta('453YU78TH52EHFG6',800,7,1);
SELECT * FROM insertar_nueva_tarjeta('454RE78TH53EHFG7',700,8,1);
SELECT * FROM insertar_nueva_tarjeta('455WE78TH54EHFG8',900,9,1);
SELECT * FROM insertar_nueva_tarjeta('456TY78TH56EHFG9',400,10,1);

SELECT * FROM insertar_nueva_tarjeta('457YT78TH56EHFG1',600,11,1);
SELECT * FROM insertar_nueva_tarjeta('458ER78TH57EHFG2',900,12,1);
SELECT * FROM insertar_nueva_tarjeta('459GH78TH58EHFG3',400,13,1);
SELECT * FROM insertar_nueva_tarjeta('451IJ78TH59EHFG4',800,14,1);
SELECT * FROM insertar_nueva_tarjeta('454KL78TH51EHFG5',1200,15,1);

SELECT * FROM insertar_nueva_tarjeta('459MN78TH46EHFG6',1400,16,1);
SELECT * FROM insertar_nueva_tarjeta('457NÑ78TH58EHFG7',1500,17,1);
SELECT * FROM insertar_nueva_tarjeta('451OP78TH51EHFG8',2160,18,1);
SELECT * FROM insertar_nueva_tarjeta('452QR78TH52EHFG9',800,19,1);
SELECT * FROM insertar_nueva_tarjeta('453ST78TH53EHFG1',800,20,1);

SELECT * FROM insertar_nueva_tarjeta('454UU78TH54EHFG2',900,21,1);
SELECT * FROM insertar_nueva_tarjeta('456UV78TH55EHFG3',600,22,1);
SELECT * FROM insertar_nueva_tarjeta('455WX78TH56EHFG4',300,23,1);
SELECT * FROM insertar_nueva_tarjeta('457YZ78TH57EHFG5',700,24,1);
SELECT * FROM insertar_nueva_tarjeta('458YZ78TH58EHFG6',700,24,1);

---------------------------------------------------------------------------------------------
--CITAS
---------------------------------------------------------------------------------------------


SELECT * FROM insertar_nueva_cita('4:30','2020-01-11',22.5,0,1,26,1);
SELECT * FROM insertar_nueva_cita('10:30','2020-02-29',150.15,1,2,27,2);
SELECT * FROM insertar_nueva_cita('3:00','2020-10-21',620.05,1,3,28,3);
SELECT * FROM insertar_nueva_cita('2:10','2020-07-30',263.5,1,4,29,4);
SELECT * FROM insertar_nueva_cita('1:15','2020-01-05',2202.50,0,5,30,5);
SELECT * FROM insertar_nueva_cita('12:10','2020-09-01',7451.5,0,6,31,6);
SELECT * FROM insertar_nueva_cita('4:30','2020-01-01',1500.5,1,7,32,7);
SELECT * FROM insertar_nueva_cita('5:00','2019-06-30',22.5,1,8,33,8);
SELECT * FROM insertar_nueva_cita('12:00','2020-08-24',632,1,9,34,9);
SELECT * FROM insertar_nueva_cita('11:00','2020-01-29',22.5,0,10,35,10);
SELECT * FROM insertar_nueva_cita('2:34','2020-12-01',22.5,0,11,36,11);
SELECT * FROM insertar_nueva_cita('5:40','2020-05-28',950,0,12,37,12);
SELECT * FROM insertar_nueva_cita('10:00','2020-07-02',22.5,0,13,38,13);
SELECT * FROM insertar_nueva_cita('7:20','2018-11-09',22.5,0,14,39,14);
SELECT * FROM insertar_nueva_cita('12:50','2020-04-28',22.5,1,15,40,15);
SELECT * FROM insertar_nueva_cita('9:00','2020-06-18',700,1,16,41,16);
SELECT * FROM insertar_nueva_cita('7:30','2020-11-26',22.5,0,17,42,17);
SELECT * FROM insertar_nueva_cita('9:28','2020-05-25',224,1,18,43,18);
SELECT * FROM insertar_nueva_cita('8:00','2009-03-12',265,0,19,44,19);
SELECT * FROM insertar_nueva_cita('4:20','2020-04-21',22.5,0,20,45,20);
SELECT * FROM insertar_nueva_cita('2:45','2010-03-13',295.5,1,21,46,21);
SELECT * FROM insertar_nueva_cita('7:00','2020-09-23',7800.5,0,22,47,22);
SELECT * FROM insertar_nueva_cita('4:30','2020-02-12',78.5,1,23,48,23);
SELECT * FROM insertar_nueva_cita('4:30','2019-01-20',278.5,1,24,49,24);
SELECT * FROM insertar_nueva_cita('6:00','2020-08-23',52.5,1,25,50,25);
---_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

















----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SECCIÓN PARA EJECUTAR LOS PROCEDIMIENTOS ALMACENADOS AVANZADOS------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--EJECUCION PARA VER LAS CLINICAS CON EL ESTATUS 1 --
SELECT * FROM consulta_clinicas_estatus_1();

--EJECUCION PARA SABER LAS PROMOCIONES DE UNA CLINICA--

SELECT * FROM consulta_clinica_promociones(1);

--EJECUCION PARA SABER LOS SERVICIOS DE UNA CLINICA --
SELECT * FROM consulta_clinica_servicios(20);

--EJECUCIÓN PARA SABER LOS CONSULTORIOS DE UNA CLINICA --
SELECT * FROM consulta_clinica_consultorios(20);

--EJECUCION PARA SABER LOS DENTISTAS CON SUS ASISTENTES DE UNA CLINICA--
SELECT * FROM consulta_clinica_dentistas_asistentes(8);

--EJECUCIÓN PARA SABER TODAS LAS CITAS DE UN USUARIO
SELECT * FROM consulta_cita_usuario('Braulio Adrian');

--EJECUCIÓN PARA SABER TODAS LAS CITAS DE UN DENTISTA

SELECT * FROM consulta_citas_dentista(26)




