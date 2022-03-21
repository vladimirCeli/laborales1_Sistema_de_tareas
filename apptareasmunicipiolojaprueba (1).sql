-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: apptareasmunicipiolojaprueba
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calificacion` int NOT NULL,
  `comentario` text NOT NULL,
  `docentes1` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes1` (`docentes1`),
  CONSTRAINT `docentes1` FOREIGN KEY (`docentes1`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,4,'Excelente, buen trabajo',1),(2,3,'Me gusto su planificacion de trabajo, pero le falta más especificacion en algunos puntos',2);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `url_avatar` varchar(200) NOT NULL,
  `n_strikes` int NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'vladiceli','jvceliqasdq@','url.image.com/imagen1',0,1),(2,'jose14','jvcelidsadaas','url.image.com/imagen2',1,1),(3,'cristobalce','vcasdjdas@ssa','url.image.com/imagen3',0,1),(4,'estjuan','gvwqqjdas@ssa','url.image.com/imagen4',0,1),(5,'estanp','vcassaas@ssa','url.image.com/imagen5',0,1);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area` varchar(50) DEFAULT NULL,
  `asignatura` varchar(50) DEFAULT NULL,
  `persona` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona` (`persona`),
  CONSTRAINT `persona` FOREIGN KEY (`persona`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
INSERT INTO `docentes` VALUES (1,'Area de matemáticas','Matemáticas',2),(2,'Area de base de datos','Base de datos',3);
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `habilidades` text NOT NULL,
  `docentes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `docentes` (`docentes`),
  CONSTRAINT `docentes` FOREIGN KEY (`docentes`) REFERENCES `docentes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Matemática y Física',' Licenciado/a en Pedagogía de las Matemáticas y la Física','Dominios en la generación aplicación del conocimiento y desarrollo del pensamiento crítico, contribuyendo a desarrollar la investigación científica elevando la calidad de la docencia en las ciencias Físico-Matemáticas.',2),(2,'Base de datos','Especialista en Base de Datos','Amplios conocimientos de plataformas como UNIX / Linux, experiencia en arquitectura, configuración y administración de redes, modelado de datos, administración de servidores en entornos de gran escala y geográficamente diversos, creación de herramientas de automatización para administrar bases de datos relacionales (auditoría, administración de cuentas,implementación de esquemas).',1);
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institucion` varchar(50) DEFAULT NULL,
  `nivelDeEstudios` varchar(50) DEFAULT NULL,
  `personas` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personas` (`personas`),
  CONSTRAINT `personas` FOREIGN KEY (`personas`) REFERENCES `persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'Colegio Fiscomisional la Inmaculada','Secundarios',4),(2,'Universidad Nacional de Loja','Superiores',5);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipopago` varchar(30) NOT NULL,
  `mediopago` varchar(30) NOT NULL,
  `fechapago` date NOT NULL,
  `tareas1` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tareas1` (`tareas1`),
  CONSTRAINT `tareas1` FOREIGN KEY (`tareas1`) REFERENCES `tareas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'tarjeta de crédito','tranferencia virtual','2021-08-05',1),(2,'tarjeta de crédito','tranferencia virtual','2021-02-06',2);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `rol` int NOT NULL,
  `cuenta` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `cuenta` (`cuenta`),
  KEY `rol` (`rol`),
  CONSTRAINT `cuenta` FOREIGN KEY (`cuenta`) REFERENCES `cuenta` (`id`),
  CONSTRAINT `rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Vladimir Abelardo','Celi Alvarez','5930981438453','vladimir.celi@unl.edu.ec','21',1,1),(2,'Jose Andres','Celi Alvarez','5930919173535','jose.celi@gmail.com','30',2,2),(3,'Cristobal Armando','Calva Andrade','5930925438453','cristocalv54@gmail.com','32',2,3),(4,'Juan Carlos','Perez Lopez','5930981400113','juanperez@gmail.com','18',3,4),(5,'Ana Maria','Casas Garza','5930911438400','anamcasas01@gmail.com','22',3,5);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` int NOT NULL,
  `comision` int NOT NULL,
  `detalle` text NOT NULL,
  `tareas` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tareas` (`tareas`),
  CONSTRAINT `tareas` FOREIGN KEY (`tareas`) REFERENCES `tareas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
INSERT INTO `presupuesto` VALUES (1,20,1,'detalle',1),(2,50,5,'detalle',2);
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propuesta`
--

DROP TABLE IF EXISTS `propuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `valor` varchar(5) NOT NULL,
  `docente` int DEFAULT NULL,
  `tareas3` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `docente` (`docente`),
  KEY `tareas3` (`tareas3`),
  CONSTRAINT `docente` FOREIGN KEY (`docente`) REFERENCES `docentes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tareas3` FOREIGN KEY (`tareas3`) REFERENCES `tareas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propuesta`
--

LOCK TABLES `propuesta` WRITE;
/*!40000 ALTER TABLE `propuesta` DISABLE KEYS */;
INSERT INTO `propuesta` VALUES (1,'Se realiza en formato ieee con todas sus cosas','7.00',NULL,1),(2,'La tarea se realizará en el lapso de un 1 día','25',1,1),(4,'La tarea se realizará en el lapso de un 1 día','25',1,1),(5,'La tarea se realizará en el lapso de un 2 semanas','60',2,2),(6,'La tarea se realizará en el lapso de un 2 semanas','60',2,3),(7,'La tarea se realizará en el lapso de un 2 semanas','60',1,3),(8,'La tarea se realizará en el lapso de un 3 semanas','50',1,3),(9,'La tarea se realizará en el lapso de un 3 semanas','50',1,4);
/*!40000 ALTER TABLE `propuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamo`
--

DROP TABLE IF EXISTS `reclamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `estudiante` int DEFAULT NULL,
  `tareas2` int NOT NULL,
  `archivoReclamo` varchar(200) DEFAULT NULL,
  `fechalimiteR` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudiante` (`estudiante`),
  KEY `tareas2` (`tareas2`),
  CONSTRAINT `estudiante` FOREIGN KEY (`estudiante`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tareas2` FOREIGN KEY (`tareas2`) REFERENCES `tareas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamo`
--

LOCK TABLES `reclamo` WRITE;
/*!40000 ALTER TABLE `reclamo` DISABLE KEYS */;
INSERT INTO `reclamo` VALUES (1,'Necesito más especificacion en la tabla de alumnos, segun los requerimientos mencionados',2,2,NULL,NULL);
/*!40000 ALTER TABLE `reclamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('Administrador','Docente','Estudiante') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(2,'Docente'),(3,'Estudiante');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `fechaEnvio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechalimite` varchar(10) NOT NULL,
  `observaciones` text,
  `archivo` varchar(200) NOT NULL,
  `archivoDocente` varchar(200) DEFAULT NULL,
  `estadoTarea` tinyint(1) NOT NULL DEFAULT '1',
  `valorMaximo` varchar(5) NOT NULL,
  `estudianteId` int DEFAULT NULL,
  `docenteId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estudianteId` (`estudianteId`),
  KEY `docenteId` (`docenteId`),
  CONSTRAINT `docenteId` FOREIGN KEY (`docenteId`) REFERENCES `docentes` (`id`),
  CONSTRAINT `estudianteId` FOREIGN KEY (`estudianteId`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,'Literatura','Ensayo','Literatura','2022-03-15 17:55:34','2022-03-12','ninguna','https://google.com',NULL,1,'5.00',NULL,NULL),(2,'Deber de derivadas','Se requiere realizar las funciones de las siguiente derivadas...','Matemáticas','2021-08-03 05:00:00','2021-8-8','Revisar de forma detallada el pdf','ulr.deber1.com/deber1',NULL,1,'30',1,1),(3,'Deber de base de datos','Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-02-02 05:00:00','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber2',NULL,1,'60',2,2),(4,'Deber de base de datos','Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-02-02 05:00:00','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',NULL,1,'60',2,NULL),(5,'Deber de base de datos','Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-02-02 05:00:00','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',NULL,1,'60',2,NULL),(6,'matemática','Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-02-02 05:00:00','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',NULL,1,'60',2,NULL),(7,'matemática','Se requiere una base de datos para un sistema escolar de calificaciones con validaciones...','Base de datos','2021-02-02 05:00:00','2021-2-15','Revisar de forma detallada el pdf','ulr.deber1.com/deber3',NULL,1,'60',2,NULL),(8,'Deber de derivadas','Se requiere realizar las funciones de las siguiente derivadas...','Matemáticas','2021-08-03 05:00:00','2021-8-8','Revisar de forma detallada el pdf','ulr.deber1.com/deber1',NULL,1,'30',1,1);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-21  0:05:18
