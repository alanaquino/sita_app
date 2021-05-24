-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 24, 2021 at 12:31 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotary40_uasd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Asesor`
--

CREATE TABLE `Asesor` (
  `id_asesor` int(11) NOT NULL,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `id_trabajo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Asesor`
--

INSERT INTO `Asesor` (`id_asesor`, `nombre`, `apellidos`, `id_trabajo`) VALUES
(1, 'Matilde', 'Espinosa Novas', 2),
(2, 'Cleotilde', ' Criselba Paniagua, M.A.', 4),
(3, 'Juan', 'Feliz Vidal', 4),
(4, 'Ruddy', 'Aquino Merán. M.A.', 5),
(5, 'Juan', 'Pérez', 6),
(6, 'Luisa', 'Paniagua', 7),
(7, 'Ruddy', 'Aquino Merán. M.A.', 7),
(8, 'Oscar', 'Valdez', 9),
(9, 'Margaret', 'Cabrera', 9),
(10, 'Oscar', 'Valdez', 10),
(11, 'Margaret', 'Cabrera', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Carrera`
--

CREATE TABLE `Carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre_carrera` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_escuela` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Carrera`
--

INSERT INTO `Carrera` (`id_carrera`, `nombre_carrera`, `id_escuela`) VALUES
(1, 'Ingeniería Electromecánica, Mención Electrónica', 1),
(2, 'Ingeniería Electromecánica, Mención Eléctrica', 1),
(3, 'Ingeniería Electromecánica, Mención Mecánica', 1),
(4, 'Ingeniería Civil', 2),
(5, 'Técnico Superior en Agrimensura', 3),
(6, 'Ingeniería Industrial', 4),
(7, 'Ingeniería Química', 5),
(8, 'Arquitectura', 6),
(9, 'Ingeniería Agronómica, Mención Desarrollo Agrícola', 7),
(10, 'Ingeniería Agronómica, Mención Producción de Cultivos', 7),
(11, 'Ingeniería Agronómica, Mención Suelo y Riego', 7),
(12, 'Licenciatura en Industrias Lácteas', 8),
(13, 'Licenciatura en Producción Animal', 8),
(14, 'Licenciatura en Medicina Veterinaria', 9),
(15, 'Licenciatura en Farmacia', 10),
(16, 'Licenciatura en Enfermería', 11),
(17, 'Doctor en Odontología', 12),
(18, 'Licenciatura en Bioanálisis', 13),
(19, 'Licenciatura en Imagenología', 13),
(20, 'Doctor en Medicina', 14),
(21, 'Licenciatura en Comunicación Social, Mención Comunicación Gráfica', 15),
(22, 'Licenciatura en Comunicación Social, Mención Periodismo', 15),
(23, 'Licenciatura en Comunicación Social, Mención Relaciones Públicas', 15),
(24, 'Licenciatura en Filosofía', 16),
(25, 'Licenciatura en Antropología', 17),
(26, 'Licenciatura en Historia', 17),
(27, 'Licenciatura en Lenguas Modernas, Mención Francés', 18),
(28, 'Licenciatura en Lenguas Modernas, Mención Inglés', 18),
(29, 'Licenciatura en Letras', 19),
(30, 'Licenciatura en Psicología, Mención del Desarrollo Humano', 20),
(31, 'Licenciatura en Psicología, Mención Psicología Clínica', 20),
(32, 'Licenciatura en Psicología, Mención Psicología Escolar', 20),
(33, 'Licenciatura en Psicología, Mención Psicología Industria', 20),
(34, 'Licenciatura en Psicología, Mención Psicología Social', 20),
(35, 'Licenciatura en Administración de Empresas Turísticas y Hoteleras', 21),
(36, 'Licenciatura en Administración Pública', 21),
(37, 'Licenciatura en Administración de Empresas', 21),
(38, 'Licenciatura en Contabilidad', 22),
(39, 'Licenciatura en Economía', 23),
(40, 'Licenciatura en Estadística, Mención Informática', 24),
(41, 'Licenciatura en Estadística, Mención Socioeconómica', 24),
(42, 'Licenciatura en Mercadotecnia', 25),
(43, 'Licenciatura en Sociología', 26),
(44, 'Licenciatura en Trabajo Social', 26),
(45, 'Licenciatura en Geografía, Mención Recursos Naturales y Ecoturismo', 27),
(46, 'Licenciatura en Geografía, Mención Representación Espacial', 27),
(47, 'Licenciatura en Biología', 28),
(48, 'Licenciatura en Física', 29),
(49, 'Licenciatura en Matemáticas', 30),
(50, 'Licenciatura en Microbiología', 31),
(51, 'Licenciatura en Química', 32),
(52, 'Tecnólogo Superior en Alimentos', 32),
(53, 'Licenciatura en Informática', 33),
(54, 'Técnico Superior en Reparación y Ensamblaje de Computadoras', 33),
(55, 'Licenciatura en Historia y Crítica del Arte', 34),
(56, 'Licenciatura en Publicidad, Mención Creatividad y Gerencia', 35),
(57, 'Licenciatura en Publicidad, Mención Diseño', 35),
(58, 'Licenciatura en Publicidad, Mención Ilustración', 35),
(59, 'Licenciatura en Teatro, Mención Actuación', 36),
(60, 'Licenciatura en Teatro, Mención Dirección', 36),
(61, 'Licenciatura en Teatro, Mención Dramaturgia', 36),
(62, 'Licenciatura en Música, Mención Teoría y Educación Musical', 37),
(63, 'Licenciatura en Cinematografía y Audiovisuales, Mención Cine', 38),
(64, 'Licenciatura en Cinematografía y Audiovisuales, Mención Televisión', 38),
(65, 'Técnico en Fotografía y Medios Audiovisuales', 38),
(66, 'Licenciatura en Artes Industriales, Mención Diseño Artesanal', 39),
(67, 'Licenciatura en Artes Industriales, Mención Diseño de Modas', 39),
(68, 'Licenciatura en Artes Industriales, Mención Diseño Industrial', 39),
(69, 'Licenciatura en Artes Plásticas, Mención Escultura', 40),
(70, 'Licenciatura en Artes Plásticas, Mención Pintura', 40),
(71, 'Licenciatura en Educación Básica', 41),
(72, 'Licenciatura en Educación Infantil', 41),
(73, 'Licenciatura en Educación Inicial', 41),
(74, 'Licenciatura en Educación, Mención Arte Escolar', 41),
(75, 'Certificado ESE Francés', 42),
(76, 'Certificado ESE Inglés', 42),
(77, 'Licenciatura en Educación Media, Mención Biología y Química', 42),
(78, 'Licenciatura en Educación Media, Mención Ciencias Sociales', 42),
(79, 'Licenciatura en Educación Media, Mención Francés', 42),
(80, 'Licenciatura en Educación Media, Mención Física y Matemáticas', 42),
(81, 'Licenciatura en Educación Media, Mención Inglés', 42),
(82, 'Licenciatura en Educación Media, Mención Letras', 42),
(83, 'Licenciatura en Educación, Mención Biología y Química', 42),
(84, 'Licenciatura en Educación, Mención Ciencias Sociales', 42),
(85, 'Licenciatura en Educación, Mención Filosofía y Letras', 42),
(86, 'Licenciatura en Educación, Mención Física', 42),
(87, 'Licenciatura en Educación, Mención Matemáticas', 42),
(88, 'Licenciatura en Educación, Mención Orientación para el Desarrollo de Recursos Humanos', 43),
(89, 'Licenciatura en Educación Especial', 43),
(90, 'Licenciatura en Educación, Mención Orientación Sociocomunitaria', 43),
(91, 'Licenciatura en Educación, Mención Orientación Académica', 43),
(92, 'Licenciatura en Educación, Mención Orientación Psicopedagógica', 43),
(93, 'Licenciatura en Educación Física', 44),
(94, 'Licenciatura en Educación Física y Deportes', 44),
(95, 'Licenciatura en Bibliotecología y Ciencias de la Información', 45),
(96, 'Licenciatura en Educación, Mención Bibliotecología', 45),
(97, 'Licenciatura en Educación, Mención Informática Educativa', 45),
(98, 'Licenciatura en Educación, Mención Gestión Educativa', 46),
(99, 'Licenciatura en Educación para Personas Jóvenes y Adultas', 46),
(100, 'Licenciatura en Derecho', 47),
(101, 'Licenciatura en Ciencias Políticas', 48),
(102, 'Especialidad en la Enseñanza del Idioma Inglés como Lengua Extranjera', 52),
(103, 'Especialidad en la Enseñanza del Idioma Francés como Lengua Extranjera', 52),
(104, 'Maestría  en Psicología Clínica', 52),
(105, 'Maestría  en Psicología Escolar', 52),
(106, 'Maestría  en Psicología Organización y Gestión Humana', 52),
(107, 'Maestría  en Psicooncología', 52),
(108, 'Maestría  en Literatura', 52),
(109, 'Maestría  en Lingüística Aplicada al Español', 52),
(110, 'Maestría  en Metodología de la Investigación Científica', 52),
(111, 'Maestría  en Ética Profesional', 52),
(112, 'Maestría  en Estudio de Género', 52),
(113, 'Maestría  en Relaciones Públicas', 52),
(114, 'Maestría  en Lingüística Aplicada a la Enseñanza del  Idioma Inglés como Lengua Extranjera', 52),
(115, 'Maestría  en Lingüística Aplicada a la Enseñanza del Idioma Francés como Lengua Extranjera', 52),
(116, 'Maestría  en Historia Dominicana', 52),
(117, 'Maestría  en Antropología Social y Cultural', 52),
(118, 'Maestría en Historia Dominicana', 52),
(119, 'Maestría en Filosofía para Niños', 52),
(120, 'Maestría en Filosofía y Valores del Cooperativismo', 52),
(121, 'Maestría en Filosofía y Valores Penitenciario', 52),
(122, 'Master en Filosofía en un Mundo Global', 52),
(123, 'Doctorado en Filosofía para un Mundo Global. Convenio UASD-Universidad del País Vasco', 52),
(124, 'Especialidad en Física para Docentes de Educación Media', 54),
(125, 'Maestría en Física', 54),
(126, 'Especialidad en Contabilidad Impositiva', 53),
(127, 'Maestría en Administración de Empresas', 53),
(128, 'Maestría en Contabilidad Tributaria', 53),
(129, 'Maestría en Gestión de Recursos Humanos', 53),
(130, 'Maestría en Negocios y Relaciones Económicas Internacionales', 53),
(131, 'Maestría en Marketing Estratégico', 53),
(132, 'Maestría en Diseño y Análisis Estadístico de Investigaciones', 53),
(133, 'Maestría en Administración de Empresas Cooperativas', 53),
(134, 'Especialidad en Derecho Aeronáutico y Aeroportuario', 57),
(135, 'Máster en Sociedad Democrática, Estado y Derecho', 57),
(136, 'Maestría en Derecho Procesal Penal', 57),
(137, 'Maestría en Derecho y Relaciones Internacionales', 57),
(138, 'Maestría en Derecho Civil y Procedimiento Civil', 57),
(139, 'Maestría en Derecho Bancario y Financiero', 57),
(140, 'Maestría en Derecho Constitucional y Procesal Constitucional', 57),
(141, 'Maestría en Derecho de Familia', 57),
(142, 'Maestría en Derecho Inmobiliario', 57),
(143, 'Maestría en Propiedad Intelectual, Telecomunicaciones y Comercio Electrónico', 57),
(144, 'Maestría en Ciencias Políticas', 57),
(145, 'Maestría en Derecho Laboral y Seguridad Social', 57),
(146, 'Maestría en Derecho Migratorio', 57),
(147, 'Maestría en Derecho Procesal Administrativo', 57),
(148, 'Maestría en Derecho Mercantil y Societario', 57),
(149, 'Maestría en Derecho Procesal Administrativo', 57),
(150, 'Maestría en Derecho Mercantil y Societario', 57),
(151, 'Doctorado en Sociedad Democrática, Estado y Derecho. Convenio UASD-Universidad del País Vasco', 57),
(152, 'Maestría en Mercados Eléctricos', 49),
(153, 'Maestría en Administración de la Construcción', 49),
(154, 'Maestría en Diseño de Producto para la Manufactura', 49),
(155, 'Maestría en Prevención de Riesgos Laborales', 49),
(156, 'Maestría en Ingeniería Protección Ambiental', 49),
(157, 'Maestría en Tecnología de los Alimentos', 49),
(158, 'Maestría en Ingeniería Sanitaria y Ambiental', 49),
(159, 'Maestría en Arquitectura y Procesos Contemporáneos', 49),
(160, 'Maestría en Diseño Arquitectónico y Procesos', 49),
(161, 'Maestría en Diseño Urbano, Ordenamiento y Desarrollo Territorial', 49),
(162, 'Maestría en Arquitectura de Interiores', 49),
(163, 'Especialidad en Pediatría', 51),
(164, 'Especialidad en Calidad de los Servicios de Salud', 51),
(165, 'Especialidad en Ciencias de Laboratorio Mención Bioquímica Clínica', 51),
(166, 'Especialidad en Odontopediatría', 51),
(167, 'Especialidad en Implantología Oral', 51),
(168, 'Especialidad en Periodoncia', 51),
(169, 'Especialidad en Endodoncia', 51),
(170, 'Maestría en Terapia Familiar', 51),
(171, 'Maestría en Sexualidad Humana y Terapia de Pareja', 51),
(172, 'Maestría en Educación Superior en Ciencias de la Salud', 51),
(173, 'Maestría en Salud Pública', 51),
(174, 'Maestría en Fisiología Normal y Patológica', 51),
(175, 'Maestría en Bioquímica', 51),
(176, 'Maestría en Alimentación y Nutrición', 51),
(177, 'Maestría en Gerencia de Servicios Hospitalarios', 51),
(178, 'Maestria en Calidad en el Laboratorio Clínico', 51),
(179, 'Especialidad en Protección de Cultivos', 50),
(180, 'Especialidad en Fisiopatología de la Reproducción', 50),
(181, 'Maestría en Tecnología Agrícola', 50),
(182, 'Maestría en Ciencias en Manejo y Conservación de Suelos Tropicales', 50),
(183, 'Maestría en Ciencias en Manejo Integrado de Plagas', 50),
(184, 'Maestría en Ciencias en Nutrición Animal', 50),
(185, 'Maestría en Gestión de las Industrias Culturales y Creativas', 55),
(186, 'Maestría en Artes Visuales', 55),
(187, 'Especialidad en Educación Física', 56),
(188, 'Especialidad en Educación Inicial', 56),
(189, 'Especialidad en Orientación Educativa e Intervención Psicopedagógica', 56),
(190, 'Maestría en Didáctica de la Matemática', 56),
(191, 'Maestría en Gestión de Centros Educativos', 56),
(192, 'Maestría en Pedagogía de la Educación Física', 56),
(193, 'Maestría en Orientación Educativa e Intervención Psicopedagógica', 56),
(194, 'Doctorado en Ciencias Pedagógicas. Convenio UASD-Universidad Hector Pineda Saldivar, Cuba', 56),
(195, 'Doctorado en Ciencias Pedagógicas con Enfasis en la Enseñanza de las Matemáticas. Convenio UASD-Universidad de Camaguey, Cuba', 56),
(196, 'Doctorado en Ciencia de la Educación salidas en Gestión Educativa, Sociología de la Educación y Tecnología Educativa. Convenio U', 56),
(197, 'Maestría en Derechos Fundamentales y Litigio Estratégico', 57);

-- --------------------------------------------------------

--
-- Table structure for table `Cuenta_Usuario`
--

CREATE TABLE `Cuenta_Usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_recinto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Cuenta_Usuario`
--

INSERT INTO `Cuenta_Usuario` (`id_usuario`, `nombre`, `apellidos`, `username`, `password`, `fecha_registro`, `id_recinto`) VALUES
(1, 'Alan', 'Aquino', 'alanaquino', '1234', '2021-04-23 01:41:50', 1),
(2, 'Robinzon', 'Montero', 'robinzon', '1234', '2021-04-23 23:28:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Escuela`
--

CREATE TABLE `Escuela` (
  `id_escuela` int(11) NOT NULL,
  `nombre_escuela` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `id_facultad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Escuela`
--

INSERT INTO `Escuela` (`id_escuela`, `nombre_escuela`, `id_facultad`) VALUES
(1, 'ESCUELA DE INGENIERÍA ELECTROMECÁNICA', 1),
(2, 'ESCUELA DE INGENIERÍA CIVIL', 1),
(3, 'ESCUELA DE AGRIMENSURA', 1),
(4, 'ESCUELA DE INGENIERÍA INDUSTRIAL', 1),
(5, 'ESCUELA DE INGENIERÍA QUÍMICA', 1),
(6, 'ESCUELA DE ARQUITECTURA', 1),
(7, 'ESCUELA DE AGRONOMÍA', 2),
(8, 'ESCUELA DE ZOOTECNIA', 2),
(9, 'ESCUELA DE VETERINARIA', 2),
(10, 'ESCUELA DE FARMACIA', 3),
(11, 'ESCUELA ENFERMERÍA', 3),
(12, 'ESCUELA DE ODONTOLOGÍA', 3),
(13, 'ESCUELA DE BIOANÁLISIS', 3),
(14, 'ESCUELA DE MEDICINA', 3),
(15, 'ESCUELA DE COMUNICACIÓN SOCIAL', 4),
(16, 'ESCUELA DE FILOSOFÍA', 4),
(17, 'ESCUELA DE HISTORIA Y ANTROPOLOGÍA', 4),
(18, 'ESCUELA DE IDIOMAS', 4),
(19, 'ESCUELA DE LETRAS', 4),
(20, 'ESCUELA DE PSICOLOGÍA', 4),
(21, 'ESCUELA DE ADMINISTRACIÓN', 5),
(22, 'ESCUELA DE CONTABILIDAD', 5),
(23, 'ESCUELA DE ECONOMÍA', 5),
(24, 'ESCUELA DE ESTADÍSTICA', 5),
(25, 'ESCUELA DE MERCADOTECNIA', 5),
(26, 'ESCUELA DE SOCIOLOGÍA', 5),
(27, 'ESCUELA DE CIENCIAS GEOGRÁFICAS', 6),
(28, 'ESCUELA DE BIOLOGÍA', 6),
(29, 'ESCUELA DE FÍSICA', 6),
(30, 'ESCUELA DE MATEMÁTICAS', 6),
(31, 'ESCUELA DE MICROBIOLOGÍA Y PARASITOLOGÍA', 6),
(32, 'ESCUELA DE QUÍMICA', 6),
(33, 'ESCUELA DE INFORMÁTICA', 6),
(34, 'ESCUELA DE CRÍTICA E HISTORIA DEL ARTE', 7),
(35, 'ESCUELA DE PUBLICIDAD', 7),
(36, 'ESCUELA DE TEATRO', 7),
(37, 'ESCUELA DE MÚSICA', 7),
(38, 'ESCUELA DE CINE, TELEVISIÓN Y FOTOGRAFÍA', 7),
(39, 'ESCUELA DE DISEÑO INDUSTRIAL Y MODA', 7),
(40, 'ESCUELA DE ARTES PLÁSTICAS', 7),
(41, 'ESCUELA DE FORMACIÓN DOCENTE PARA LA EDUCACIÓN INFANTIL Y BÁSICA', 8),
(42, 'ESCUELA DE FORMACIÓN DOCENTE PARA LA EDUCACIÓN MEDIA', 8),
(43, 'ESCUELA DE ORIENTACIÓN Y PSICOPEDAGOGÍA', 8),
(44, 'ESCUELA DE FORMACIÓN DOCENTE EN EDUCACIÓN FÍSICA Y CIENCIAS DEL DEPORTE', 8),
(45, 'ESCUELA DE BIBLIOTECOLOGÍA, TECNOLOGÍA E INOVACIONES', 8),
(46, 'ESCUELA DE TEORÍA Y GESTIÓN EDUCATIVA', 8),
(47, 'ESCUELA DE DERECHO', 9),
(48, 'ESCUELA DE CIENCIAS POLÍTICAS', 9),
(49, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 1),
(50, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 2),
(51, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 3),
(52, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 4),
(53, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 5),
(54, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 6),
(55, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 7),
(56, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 8),
(57, 'DIVISION DE POSTGRADO Y EDUCACIÓN PERMANENTE', 9);

-- --------------------------------------------------------

--
-- Table structure for table `Estudiante`
--

CREATE TABLE `Estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `matricula` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombres` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `id_trabajo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Estudiante`
--

INSERT INTO `Estudiante` (`id_estudiante`, `matricula`, `nombres`, `apellidos`, `id_trabajo`) VALUES
(1, 'BC9148', 'Manuela Veroliny', 'Durán de los Santos', 1),
(2, 'DF2566', 'Senny', 'Montero Montero', 1),
(3, '100151474', 'Fatima Elaine', 'Lorenzo de la Cruz', 2),
(4, '100110016', 'Stephany', 'Hernandez Suero', 2),
(5, 'DC2921', 'Melva Alexandra', 'Peña de los Santos', 2),
(6, NULL, 'Mariela', 'Familia Moreta', 3),
(7, NULL, 'Ramilys Altagracia', 'Valenzuela de la Cruz', 3),
(14, NULL, 'Orquidea Joselyn', 'Luna De Oleo', 4),
(15, NULL, 'Pedro', 'Mateo Montilla', 4),
(16, NULL, 'Eyisenia Margarita', 'Rosado Nova', 4),
(17, '10125040', 'Vivian', 'Purcell', 5),
(18, NULL, 'Orquidea Joselin', 'Luna De Oleo', 6),
(19, NULL, 'Pedro', 'Mateo Montilla', 6),
(20, NULL, 'Eyisenia Margarita', 'Rosado Nova', 6),
(21, NULL, 'Alan', 'Aquino', 6),
(22, NULL, 'Lusarina Isabel', 'Ramirez Montero', 7),
(23, NULL, 'Meranny', 'Valdez Jiménez', 7),
(24, NULL, 'Yedissa ', 'De Los Santos Santana', 7),
(25, NULL, 'Yeimi Lissette', 'Varona Diaz', 7),
(26, 'AF-6767', 'José Alejandro', 'Sánchez Beltré', 8),
(27, 'CB-4282', 'Vilma Cristina', 'Marrero de Oleo', 8),
(28, '100256487', 'Iván Bolivar', 'Chevalier Jourdain', 9),
(29, '100256487', 'Iván Bolivar', 'Chevalier Jourdain', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Facultad`
--

CREATE TABLE `Facultad` (
  `id_facultad` int(11) NOT NULL,
  `nombre_facultad` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Facultad`
--

INSERT INTO `Facultad` (`id_facultad`, `nombre_facultad`) VALUES
(1, 'Ingeniería y Arquitectura'),
(2, 'Ciencias Agronómicas y Veterinarias'),
(3, 'Ciencias de la Salud'),
(4, 'Humanidades'),
(5, 'Ciencias Económicas y Sociales'),
(6, 'Ciencias'),
(7, 'Artes'),
(8, 'Ciencias de la Educación'),
(9, 'Ciencias Jurídicas y Políticas');

-- --------------------------------------------------------

--
-- Table structure for table `Nivel_Trabajo`
--

CREATE TABLE `Nivel_Trabajo` (
  `id_nivel_trabajo` int(11) NOT NULL,
  `descripcion_nivel` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Nivel_Trabajo`
--

INSERT INTO `Nivel_Trabajo` (`id_nivel_trabajo`, `descripcion_nivel`) VALUES
(1, 'Grado'),
(2, 'Postgrado'),
(3, 'Técnico');

-- --------------------------------------------------------

--
-- Table structure for table `Recinto`
--

CREATE TABLE `Recinto` (
  `id_recinto` int(11) NOT NULL,
  `nombre_recinto` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ubicacion_recinto` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Recinto`
--

INSERT INTO `Recinto` (`id_recinto`, `nombre_recinto`, `ubicacion_recinto`) VALUES
(1, 'UASD Santo Domingo Sede', 'Distrito Nacional'),
(2, 'UASD Recinto San Francisco de Macorís', 'San Francisco de Macorís'),
(3, 'UASD Recinto Santiago', 'Santiago De Los Caballeros'),
(4, 'UASD Centro Barahona', 'Barahona'),
(5, 'UASD Centro Higüey', 'Higüey'),
(6, 'UASD Centro Mao', 'Santa Cruz de Mao'),
(7, 'UASD Centro Bonao', 'Bonao'),
(8, 'UASD Centro Nagua', 'Nagua'),
(9, 'UASD Centro San Juan de la Maguana', 'San Juan de la Maguana'),
(10, 'UASD Centro Puerto Plata', 'Puerto Plata'),
(11, 'UASD Centro Hato Mayor', 'Hato Mayor del Rey'),
(12, 'UASD Centro San Cristóbal', 'San Cristóbal'),
(13, 'UASD Centro San Pedro de Macorís', 'San Pedro de Macorís'),
(14, 'UASD Centro La Vega', 'La Vega'),
(15, 'UASD Centro Baní', 'Baní'),
(16, 'UASD Centro La Romana', 'La Romana'),
(17, 'UASD Subcentro Santiago Rodríguez', 'Santiago Rodríguez'),
(18, 'UASD Subcentro Samaná', 'Samaná'),
(19, 'UASD Subcentro Neyba', 'Neyba'),
(20, 'UASD Santo Domingo Este', 'Santo Domingo Este');

-- --------------------------------------------------------

--
-- Table structure for table `Tipo_Trabajo`
--

CREATE TABLE `Tipo_Trabajo` (
  `id_tipo_trabajo` int(11) NOT NULL,
  `descripcion_tipo` varchar(128) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tipo_Trabajo`
--

INSERT INTO `Tipo_Trabajo` (`id_tipo_trabajo`, `descripcion_tipo`) VALUES
(1, 'Tesis'),
(2, 'Monográfico');

-- --------------------------------------------------------

--
-- Table structure for table `Trabajo_Academico`
--

CREATE TABLE `Trabajo_Academico` (
  `id_trabajo` int(11) NOT NULL,
  `titulo_trabajo` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `extracto` text COLLATE utf8_unicode_ci,
  `fecha_publicacion` date NOT NULL,
  `id_nivel_trabajo` int(11) DEFAULT NULL,
  `id_tipo_trabajo` int(11) DEFAULT NULL,
  `id_recinto` int(11) DEFAULT NULL,
  `id_facultad` int(11) DEFAULT NULL,
  `id_escuela` int(11) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL,
  `archivo_adjunto` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registrado_por` int(11) DEFAULT NULL,
  `fecha_registro_sistema` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Trabajo_Academico`
--

INSERT INTO `Trabajo_Academico` (`id_trabajo`, `titulo_trabajo`, `extracto`, `fecha_publicacion`, `id_nivel_trabajo`, `id_tipo_trabajo`, `id_recinto`, `id_facultad`, `id_escuela`, `id_carrera`, `archivo_adjunto`, `registrado_por`, `fecha_registro_sistema`) VALUES
(1, 'Cuidado de enfermería que reciben los pacientes con enfermedad cerebro vascular, unidad de cuidados intensivos, hospital regional docente doctor alejandro cabral, san juan de la maguana, julio-septiembre 2019', '', '2019-12-01', 1, 1, 9, 3, 11, 16, '', 2, '2021-04-23 23:59:51'),
(2, 'Factores de riesgos que inciden en la mortalidad neonatal, unidad de neonatología, hospital regional doctor alejandro cabral, periodo agosto-octubre 2019', 'In this thesis a novel method for quality control of the cooling half-rings in the pixel endcaps is described. The half rings are used to provide the cooling for pixel modules in the new Inner Tracker of the ATLAS experiment that will operate during the runs of the High Luminosity LHC. In the quality control, they are analysed using infrared measurements during cooling processes. Defective half rings can be found and rejected during the serial production. The sensitivity of this method is shown for small ring pieces with known implanted defects, as well as for a half ring prototype. The measurement of the ttH production cross section with H!2', '2020-12-01', 1, 1, 9, 3, 11, 16, '', 1, '2021-04-23 23:59:51'),
(3, 'Plan estratégico de marketing de la carrera de mercadotecnia en la UASD Centro San Juan de la Maguana, año 2019', NULL, '2019-09-06', 1, 1, 9, 5, 25, 42, NULL, 1, '2021-05-06 20:08:17'),
(4, 'Derecho fundamental a la igualdad y sus garantías en República Dominicana', NULL, '2020-01-06', 1, 1, 9, 9, 47, 100, NULL, 1, '2021-05-06 20:26:40'),
(5, 'Evaluación de los aprendizajes en la educación preuniversitaria (revisión de diez monografías) en el recinto UASD San Juan Durante los años 2018-2019', NULL, '2020-10-01', 1, 2, 9, 8, 41, 71, NULL, 1, '2021-05-11 15:24:10'),
(6, 'Derecho fundamental a la igualdad y sus garantías en Republica Dominicana', NULL, '2020-01-10', 1, 1, 9, 2, 7, 100, NULL, 2, '2021-05-11 23:15:44'),
(7, 'La salud como derecho fundamental', NULL, '2021-02-12', 1, 1, 9, 9, 47, 100, NULL, 2, '2021-05-11 23:23:50'),
(8, 'Beneficios de las Tecnologías de la Información (TIC) como herramientas de desarrollo competitivo de las MiPymes caso Supermercado Yenni S.RL. San Juan De La Maguana 2017-2018', '', '2019-09-12', 1, 1, 9, 5, 21, 37, '', 1, '2021-05-11 23:35:22'),
(9, 'Legitimación activa del defensor del pueblo para accionar en inconstitucionalidad Por la Vía Directa', NULL, '2021-02-11', 2, 1, 1, 9, 57, 140, 'Legitimacion_activa.pdf', 1, '2021-05-12 00:55:30'),
(10, 'Legitimación activa del defensor del pueblo para accionar en inconstitucionalidad Por la Vía Directa', NULL, '2018-02-11', 1, 1, 1, 9, 47, 100, NULL, 1, '2021-04-22 01:05:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Asesor`
--
ALTER TABLE `Asesor`
  ADD PRIMARY KEY (`id_asesor`),
  ADD KEY `Asesor_ibfk_1` (`id_trabajo`);

--
-- Indexes for table `Carrera`
--
ALTER TABLE `Carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD KEY `id_escuela` (`id_escuela`);

--
-- Indexes for table `Cuenta_Usuario`
--
ALTER TABLE `Cuenta_Usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_recinto` (`id_recinto`);

--
-- Indexes for table `Escuela`
--
ALTER TABLE `Escuela`
  ADD PRIMARY KEY (`id_escuela`),
  ADD KEY `id_facultad` (`id_facultad`);

--
-- Indexes for table `Estudiante`
--
ALTER TABLE `Estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `Estudiante_ibfk_1` (`id_trabajo`);

--
-- Indexes for table `Facultad`
--
ALTER TABLE `Facultad`
  ADD PRIMARY KEY (`id_facultad`);

--
-- Indexes for table `Nivel_Trabajo`
--
ALTER TABLE `Nivel_Trabajo`
  ADD PRIMARY KEY (`id_nivel_trabajo`);

--
-- Indexes for table `Recinto`
--
ALTER TABLE `Recinto`
  ADD PRIMARY KEY (`id_recinto`);

--
-- Indexes for table `Tipo_Trabajo`
--
ALTER TABLE `Tipo_Trabajo`
  ADD PRIMARY KEY (`id_tipo_trabajo`);

--
-- Indexes for table `Trabajo_Academico`
--
ALTER TABLE `Trabajo_Academico`
  ADD PRIMARY KEY (`id_trabajo`),
  ADD KEY `Trabajo_Academico_ibfk_2` (`id_nivel_trabajo`),
  ADD KEY `Trabajo_Academico_ibfk_3` (`id_recinto`),
  ADD KEY `Trabajo_Academico_ibfk_4` (`id_facultad`),
  ADD KEY `Trabajo_Academico_ibfk_5` (`id_escuela`),
  ADD KEY `Trabajo_Academico_ibfk_6` (`id_carrera`),
  ADD KEY `Trabajo_Academico_ibfk_7` (`registrado_por`),
  ADD KEY `Trabajo_Academico_ibfk_1` (`id_tipo_trabajo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Asesor`
--
ALTER TABLE `Asesor`
  MODIFY `id_asesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `Carrera`
--
ALTER TABLE `Carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `Cuenta_Usuario`
--
ALTER TABLE `Cuenta_Usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Escuela`
--
ALTER TABLE `Escuela`
  MODIFY `id_escuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `Estudiante`
--
ALTER TABLE `Estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Facultad`
--
ALTER TABLE `Facultad`
  MODIFY `id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Nivel_Trabajo`
--
ALTER TABLE `Nivel_Trabajo`
  MODIFY `id_nivel_trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Recinto`
--
ALTER TABLE `Recinto`
  MODIFY `id_recinto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Tipo_Trabajo`
--
ALTER TABLE `Tipo_Trabajo`
  MODIFY `id_tipo_trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Trabajo_Academico`
--
ALTER TABLE `Trabajo_Academico`
  MODIFY `id_trabajo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Asesor`
--
ALTER TABLE `Asesor`
  ADD CONSTRAINT `Asesor_ibfk_1` FOREIGN KEY (`id_trabajo`) REFERENCES `Trabajo_Academico` (`id_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Carrera`
--
ALTER TABLE `Carrera`
  ADD CONSTRAINT `Carrera_ibfk_1` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`);

--
-- Constraints for table `Cuenta_Usuario`
--
ALTER TABLE `Cuenta_Usuario`
  ADD CONSTRAINT `Cuenta_Usuario_ibfk_1` FOREIGN KEY (`id_recinto`) REFERENCES `Recinto` (`id_recinto`);

--
-- Constraints for table `Escuela`
--
ALTER TABLE `Escuela`
  ADD CONSTRAINT `Escuela_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `Facultad` (`id_facultad`);

--
-- Constraints for table `Estudiante`
--
ALTER TABLE `Estudiante`
  ADD CONSTRAINT `Estudiante_ibfk_1` FOREIGN KEY (`id_trabajo`) REFERENCES `Trabajo_Academico` (`id_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Trabajo_Academico`
--
ALTER TABLE `Trabajo_Academico`
  ADD CONSTRAINT `Trabajo_Academico_ibfk_1` FOREIGN KEY (`id_tipo_trabajo`) REFERENCES `Tipo_Trabajo` (`id_tipo_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_2` FOREIGN KEY (`id_nivel_trabajo`) REFERENCES `Nivel_Trabajo` (`id_nivel_trabajo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_3` FOREIGN KEY (`id_recinto`) REFERENCES `Recinto` (`id_recinto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_4` FOREIGN KEY (`id_facultad`) REFERENCES `Facultad` (`id_facultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_5` FOREIGN KEY (`id_escuela`) REFERENCES `Escuela` (`id_escuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_6` FOREIGN KEY (`id_carrera`) REFERENCES `Carrera` (`id_carrera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Trabajo_Academico_ibfk_7` FOREIGN KEY (`registrado_por`) REFERENCES `Cuenta_Usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
