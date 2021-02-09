-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 22-12-2020 a les 19:48:55
-- Versió del servidor: 10.4.14-MariaDB
-- Versió de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `alumnos`
--
CREATE DATABASE IF NOT EXISTS `alumnos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `alumnos`;

-- --------------------------------------------------------

--
-- Estructura de la taula `alumnes`
--

CREATE TABLE `alumnes` (
  `Nom` varchar(50) NOT NULL,
  `Llinatges` varchar(50) NOT NULL,
  `DNI` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `alumnes`
--

INSERT INTO `alumnes` (`Nom`, `Llinatges`, `DNI`) VALUES
('Miquel', 'Campins', '41236541A'),
('Alicia', 'Rossello', '12345678A'),
('', '', ''),
('Fran', 'Hidalgo', '45612345B'),
('.Magdalena.', '.Sastre.', '.43212566M'),
('Pere', 'Garau', '666555222A');
--
-- Base de dades: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de la taula `libro`
--

CREATE TABLE `libro` (
  `Portada` varchar(100) NOT NULL,
  `Título` varchar(50) NOT NULL,
  `Autor` varchar(50) NOT NULL,
  `Editorial` varchar(50) NOT NULL,
  `Género` varchar(50) NOT NULL,
  `Fecha_de_publicación` varchar(50) NOT NULL,
  `Id_Libro` int(11) NOT NULL,
  `Sinopsis` varchar(300) NOT NULL,
  `Disponibles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `libro`
--

INSERT INTO `libro` (`Portada`, `Título`, `Autor`, `Editorial`, `Género`, `Fecha_de_publicación`, `Id_Libro`, `Sinopsis`, `Disponibles`) VALUES
('HarryPotter.jpg', 'Harry Potter i la pedra filosofal', 'J.K.Rowlling', 'Empúries', 'Fantasia', '1990', 1, 'Un llibre de magos', 6),
('el señor de los anillos.jpg', 'El Señor de los Anillos', 'J.R.R. Tolkien', 'La factoria de ideas', 'Aventura', '1980', 2, 'Un llibre racial', 19),
('el señor de los anillos 2.jpg', 'El Señor de los Anillos 2', 'J.R.R. Tolkien', 'La factoria de ideas', 'Aventura', '1985', 4, 'Un llibre molt llarg', 26),
('el señor de los anillosB.jpg', 'El Señor de los Anillos', 'J.R.R. Tolkien', 'Nova', 'Aventura', '1980', 6, 'Un altre llibre molt llarg', 25),
('HarryPotter2.jpg', 'Harry Potter 2', 'J.K.Rowlling', 'Empúries', 'Fantasia', '1992', 7, 'UN llibre molt dolent', 24);

-- --------------------------------------------------------

--
-- Estructura de la taula `reserva`
--

CREATE TABLE `reserva` (
  `Id_Libro` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `reserva`
--

INSERT INTO `reserva` (`Id_Libro`, `Id_Usuario`, `Fecha`) VALUES
(2, 6, '2020-12-22'),
(7, 6, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de la taula `usuario`
--

CREATE TABLE `usuario` (
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Fecha_Nacimiento` varchar(50) NOT NULL,
  `eMail` varchar(50) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `Población` varchar(50) NOT NULL,
  `Codigo_Postal` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Contraseña` varchar(300) NOT NULL,
  `Bibliotecari` varchar(20) DEFAULT NULL,
  `Id_Usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `usuario`
--

INSERT INTO `usuario` (`Nombre`, `Apellidos`, `Fecha_Nacimiento`, `eMail`, `Dirección`, `Población`, `Codigo_Postal`, `Nombre_Usuario`, `Contraseña`, `Bibliotecari`, `Id_Usuario`) VALUES
('SupToni', 'Galmés', '13-01-1988', ' prova', ' Cala Ratjada', 'Poligono 3', 7590, 'Goku', '$2y$10$GENeEQ0fGX.T3ksBx2ZDaekP6Q1HJMrJ.Pi8Yywwrsf0Cj6rUXaLS', NULL, 6),
('Pep', 'Gonella', '13-01-1988', ' pepgonellabiblioteca@gmail.com', ' Capdepera', 'Sant Andeu 97', 7590, 'PepGonella', '$2y$10$BFwiHWwRb/szIot1uMfEv.HxmES5NGdjo/1sYXIdwcbp45hJt93Fm', 'Si', 7),
('Alejandro', 'Moreno Jiménez', '2001-08-04', ' amorenojimenez@iessonferrer.com', ' Calvia', 'c/ocell des paradis', 7181, 'morenoide', '$2y$10$GT./nhK26JYOokd2ePpUf.xhUScNTVnupa/LXF7kfJAQBqawIFIee', NULL, 10);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`Id_Libro`);

--
-- Índexs per a la taula `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`Id_Libro`,`Id_Usuario`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Índexs per a la taula `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `libro`
--
ALTER TABLE `libro`
  MODIFY `Id_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la taula `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Id_Libro`) REFERENCES `libro` (`Id_Libro`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`);
--
-- Base de dades: `gocars`
--
CREATE DATABASE IF NOT EXISTS `gocars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gocars`;

-- --------------------------------------------------------

--
-- Estructura de la taula `coches`
--

CREATE TABLE `coches` (
  `Matricula` varchar(20) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Color` varchar(50) NOT NULL,
  `Antigüedad` int(11) NOT NULL,
  `Kms` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `coches`
--

INSERT INTO `coches` (`Matricula`, `Marca`, `Modelo`, `Color`, `Antigüedad`, `Kms`) VALUES
('0694JNC', '111', '111', '111', 111, 111),
('1111GKU', 'Núvol', 'Kinton', 'Groc', 1111, 9999),
('2222ssss', 'Ferrari', 'Testarosa', 'Verd', 4444, 4444),
('66666ÑLKJH', '222', '222', ' 222', 222, 222),
('6666ZZZ', 'Barca', 'Parca', 'Negro', 2222, 3333),
('7777DSA', 'Camaleó', 'Desert', 'Arena', 444, 444),
('9999DDS', 'Moto', 'GP', 'Blanc', 5555, 5555),
('Darrer', 'Avion', '', '', 0, 0);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `coches`
--
ALTER TABLE `coches`
  ADD PRIMARY KEY (`Matricula`);
--
-- Base de dades: `gsdaw`
--
CREATE DATABASE IF NOT EXISTS `gsdaw` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gsdaw`;

-- --------------------------------------------------------

--
-- Estructura de la taula `noticias`
--

CREATE TABLE `noticias` (
  `IdAlumne` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Primer LLintage` varchar(50) NOT NULL,
  `Segon LLinatge` varchar(50) NOT NULL,
  `Nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `noticias`
--

INSERT INTO `noticias` (`IdAlumne`, `Nom`, `Primer LLintage`, `Segon LLinatge`, `Nota`) VALUES
(1, 'Toni', 'Galmés', 'Estarellas', 10),
(2, 'Miquel', '', '', 0);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`IdAlumne`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `noticias`
--
ALTER TABLE `noticias`
  MODIFY `IdAlumne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de dades: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Estructura de la taula `ingreso`
--

CREATE TABLE `ingreso` (
  `Código_Ingreso` int(11) NOT NULL,
  `NºHabitación` int(11) NOT NULL,
  `NºCama` int(11) NOT NULL,
  `Fecha_Ingreso` int(11) NOT NULL,
  `Código_Paciente` int(11) NOT NULL,
  `Código_Medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `medico`
--

CREATE TABLE `medico` (
  `Código_Medico` int(11) NOT NULL,
  `Nombre` int(11) NOT NULL,
  `Apellidos` int(11) NOT NULL,
  `Teléfono` int(11) NOT NULL,
  `Especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `paciente`
--

CREATE TABLE `paciente` (
  `Código_Paciente` int(11) NOT NULL,
  `Nombre` int(11) NOT NULL,
  `Apellidos` int(11) NOT NULL,
  `Dirección` int(11) NOT NULL,
  `Población` int(11) NOT NULL,
  `Província` int(11) NOT NULL,
  `Código_Postal` int(11) NOT NULL,
  `Teléfono` int(11) NOT NULL,
  `Fecha_Nacimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`Código_Ingreso`),
  ADD KEY `Código_Paciente` (`Código_Paciente`),
  ADD KEY `Código_Medico` (`Código_Medico`);

--
-- Índexs per a la taula `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`Código_Medico`);

--
-- Índexs per a la taula `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Código_Paciente`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`Código_Paciente`) REFERENCES `paciente` (`Código_Paciente`),
  ADD CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`Código_Medico`) REFERENCES `medico` (`Código_Medico`);
--
-- Base de dades: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

--
-- Bolcament de dades per a la taula `pma__bookmark`
--

INSERT INTO `pma__bookmark` (`id`, `dbase`, `user`, `label`, `query`) VALUES
(1, 'gsdaw', 'root', 'select * from noticias', 'SELECT * FROM `noticias`'),
(2, 'gsdaw', 'root', 'select * from gsdaw', 'SELECT * FROM `noticias`');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- Bolcament de dades per a la taula `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES
(1, 'gsdaw', 'noticias', 'IdAlumne', '', '', '', 'Illes Balears', '', 'Toni');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Bolcament de dades per a la taula `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'biblioteca', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"libro\",\"reserva\",\"usuario\"],\"table_structure[]\":[\"libro\",\"reserva\",\"usuario\"],\"table_data[]\":[\"libro\",\"reserva\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la taula @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la taula @TABLE@ (continua)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contingut de la taula @TABLE@\",\"latex_data_continued_caption\":\"Contingut de la taula @TABLE@ (continua)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'bibliotecaBD', '{\"quick_or_custom\":\"custom\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"libro\",\"reserva\",\"usuario\"],\"table_structure[]\":[\"libro\",\"reserva\",\"usuario\"],\"table_data[]\":[\"libro\",\"reserva\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la taula @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la taula @TABLE@ (continua)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contingut de la taula @TABLE@\",\"latex_data_continued_caption\":\"Contingut de la taula @TABLE@ (continua)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Bolcament de dades per a la taula `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"biblioteca\",\"table\":\"reserva\"},{\"db\":\"biblioteca\",\"table\":\"usuario\"},{\"db\":\"biblioteca\",\"table\":\"libro\"},{\"db\":\"alumnos\",\"table\":\"alumnes\"},{\"db\":\"alumnos\",\"table\":\"Alumnes\"},{\"db\":\"uber\",\"table\":\"administrador\"},{\"db\":\"uber\",\"table\":\"transporta\"},{\"db\":\"uber\",\"table\":\"destino\"},{\"db\":\"uber\",\"table\":\"conduce\"},{\"db\":\"uber\",\"table\":\"clientes\"}]');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Bolcament de dades per a la taula `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'biblioteca', 'libro', '{\"sorted_col\":\"`T\\u00edtulo` ASC\"}', '2020-12-15 18:56:45');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Bolcament de dades per a la taula `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-12-22 18:46:06', '{\"Console\\/Mode\":\"show\",\"lang\":\"ca\",\"Console\\/Height\":198.9708,\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de la taula `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índexs per a la taula `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índexs per a la taula `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índexs per a la taula `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índexs per a la taula `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índexs per a la taula `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índexs per a la taula `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índexs per a la taula `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índexs per a la taula `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índexs per a la taula `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índexs per a la taula `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índexs per a la taula `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índexs per a la taula `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la taula `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la taula `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de dades: `provapreexam`
--
CREATE DATABASE IF NOT EXISTS `provapreexam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `provapreexam`;

-- --------------------------------------------------------

--
-- Estructura de la taula `productos`
--

CREATE TABLE `productos` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `proveedor`
--

CREATE TABLE `proveedor` (
  `DNI` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `tienda`
--

CREATE TABLE `tienda` (
  `NIF` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Poblacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de la taula `vende`
--

CREATE TABLE `vende` (
  `ID` int(11) NOT NULL,
  `NIF` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);

--
-- Índexs per a la taula `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`DNI`),
  ADD KEY `ID` (`ID`);

--
-- Índexs per a la taula `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`NIF`);

--
-- Índexs per a la taula `vende`
--
ALTER TABLE `vende`
  ADD PRIMARY KEY (`ID`,`NIF`),
  ADD KEY `NIF` (`NIF`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `vende`
--
ALTER TABLE `vende`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `productos` (`ID`);

--
-- Restriccions per a la taula `vende`
--
ALTER TABLE `vende`
  ADD CONSTRAINT `vende_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `productos` (`ID`),
  ADD CONSTRAINT `vende_ibfk_2` FOREIGN KEY (`NIF`) REFERENCES `tienda` (`NIF`);
--
-- Base de dades: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de dades: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de la taula `cliente`
--

CREATE TABLE `cliente` (
  `DNI` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Dirección` varchar(50) NOT NULL,
  `Fecha_de_Nacimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `cliente`
--

INSERT INTO `cliente` (`DNI`, `Nombre`, `Apellidos`, `Dirección`, `Fecha_de_Nacimiento`) VALUES
('41522030S', 'Toni', 'Galmés', 'Cala Ratjada', '13-01-1988'),
('45612354P', 'Fran', 'Hidalgo', 'Palma', '15-02-1990');

-- --------------------------------------------------------

--
-- Estructura de la taula `compra`
--

CREATE TABLE `compra` (
  `DNI` varchar(50) NOT NULL,
  `Código_Producto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `compra`
--

INSERT INTO `compra` (`DNI`, `Código_Producto`) VALUES
('41522030S', 'Cotcho'),
('45612354P', 'Moto');

-- --------------------------------------------------------

--
-- Estructura de la taula `producto`
--

CREATE TABLE `producto` (
  `Código_Producto` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Precio` varchar(50) NOT NULL,
  `NIF` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `producto`
--

INSERT INTO `producto` (`Código_Producto`, `Nombre`, `Precio`, `NIF`) VALUES
('Cotcho', 'Ferrari', 'Gratis', '41533330P'),
('Moto', 'Vespino', 'Molt Car', '41555555G');

-- --------------------------------------------------------

--
-- Estructura de la taula `proveedor`
--

CREATE TABLE `proveedor` (
  `Nombre` varchar(50) NOT NULL,
  `NIF` varchar(50) NOT NULL,
  `Dirección` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `proveedor`
--

INSERT INTO `proveedor` (`Nombre`, `NIF`, `Dirección`) VALUES
('Pedro', '41533330P', 'Sant Llorenç'),
('Goyo', '41555555G', 'Palma');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`DNI`);

--
-- Índexs per a la taula `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`DNI`,`Código_Producto`),
  ADD KEY `Código_Producto` (`Código_Producto`);

--
-- Índexs per a la taula `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Código_Producto`),
  ADD KEY `NIF` (`NIF`);

--
-- Índexs per a la taula `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NIF`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `cliente` (`DNI`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Código_Producto`) REFERENCES `producto` (`Código_Producto`);

--
-- Restriccions per a la taula `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`NIF`) REFERENCES `proveedor` (`NIF`);
--
-- Base de dades: `uber`
--
CREATE DATABASE IF NOT EXISTS `uber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uber`;

-- --------------------------------------------------------

--
-- Estructura de la taula `administrador`
--

CREATE TABLE `administrador` (
  `Usuario` varchar(50) NOT NULL,
  `Contrasenya` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Poblacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `administrador`
--

INSERT INTO `administrador` (`Usuario`, `Contrasenya`, `Nombre`, `Apellidos`, `FechaNacimiento`, `Poblacion`) VALUES
('Goku', '$2y$10$6sEbV8SXJ1T9v2s3N.dwL.Q2WfL1BB0KEiqZCGtIlVR', 'Toni', ' Galmes', '1988-01-13', 'Cala Ratjada'),
('Vegeta', '$2y$10$cIg8k0vvUkbtR6vWnnz3xOo9i8y4D7/68hUdwtYZ/tw', 'Joan', ' Santandreu', '1988-01-13', 'Manacor');

-- --------------------------------------------------------

--
-- Estructura de la taula `automovil`
--

CREATE TABLE `automovil` (
  `Matricula` varchar(50) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `Modelo` varchar(50) NOT NULL,
  `Potencia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `automovil`
--

INSERT INTO `automovil` (`Matricula`, `Marca`, `Modelo`, `Potencia`) VALUES
('0123ABC', 'Ferrari', 'Testarrosa', '300CV'),
('0694JNC', 'Peugeot', 'Tepee', '95CV');

-- --------------------------------------------------------

--
-- Estructura de la taula `chofer`
--

CREATE TABLE `chofer` (
  `DNI` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Salario` varchar(50) NOT NULL,
  `Poblacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `chofer`
--

INSERT INTO `chofer` (`DNI`, `Nombre`, `Telefono`, `Direccion`, `Salario`, `Poblacion`) VALUES
('12345678A', 'Pere', 654321987, 'Figueral 26', '10000€', 'Arta'),
('41522030S', 'Toni', 622533937, 'Sant Andreu 97', '100€', 'Cala Ratjada');

-- --------------------------------------------------------

--
-- Estructura de la taula `clientes`
--

CREATE TABLE `clientes` (
  `NombreUsuario` varchar(50) NOT NULL,
  `DirOrigen` varchar(50) NOT NULL,
  `DirDestino` varchar(50) NOT NULL,
  `CP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `clientes`
--

INSERT INTO `clientes` (`NombreUsuario`, `DirOrigen`, `DirDestino`, `CP`) VALUES
('Barbara', 'Cala Ratjada', 'Arta', 7570),
('Catalina', 'Arta', 'Cala Ratjada', 7590);

-- --------------------------------------------------------

--
-- Estructura de la taula `conduce`
--

CREATE TABLE `conduce` (
  `Fecha` date NOT NULL,
  `DNI` varchar(50) NOT NULL,
  `Matricula` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `conduce`
--

INSERT INTO `conduce` (`Fecha`, `DNI`, `Matricula`) VALUES
('2020-11-24', '12345678A', '0123ABC'),
('2020-11-24', '41522030S', '0694JNC');

-- --------------------------------------------------------

--
-- Estructura de la taula `destino`
--

CREATE TABLE `destino` (
  `CP` int(11) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `destino`
--

INSERT INTO `destino` (`CP`, `Calle`, `Numero`) VALUES
(7570, 'Figueral', 26),
(7590, 'Sant Andreu', 97);

-- --------------------------------------------------------

--
-- Estructura de la taula `transporta`
--

CREATE TABLE `transporta` (
  `NombreUsuario` varchar(50) NOT NULL,
  `DNI` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Bolcament de dades per a la taula `transporta`
--

INSERT INTO `transporta` (`NombreUsuario`, `DNI`) VALUES
('Barbara', '41522030S'),
('Catalina', '12345678A');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Usuario`);

--
-- Índexs per a la taula `automovil`
--
ALTER TABLE `automovil`
  ADD PRIMARY KEY (`Matricula`);

--
-- Índexs per a la taula `chofer`
--
ALTER TABLE `chofer`
  ADD PRIMARY KEY (`DNI`);

--
-- Índexs per a la taula `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`NombreUsuario`),
  ADD KEY `CP` (`CP`);

--
-- Índexs per a la taula `conduce`
--
ALTER TABLE `conduce`
  ADD PRIMARY KEY (`DNI`,`Matricula`),
  ADD KEY `Matricula` (`Matricula`);

--
-- Índexs per a la taula `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`CP`);

--
-- Índexs per a la taula `transporta`
--
ALTER TABLE `transporta`
  ADD PRIMARY KEY (`NombreUsuario`,`DNI`),
  ADD KEY `DNI` (`DNI`);

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`CP`) REFERENCES `destino` (`CP`);

--
-- Restriccions per a la taula `conduce`
--
ALTER TABLE `conduce`
  ADD CONSTRAINT `conduce_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `chofer` (`DNI`),
  ADD CONSTRAINT `conduce_ibfk_2` FOREIGN KEY (`Matricula`) REFERENCES `automovil` (`Matricula`);

--
-- Restriccions per a la taula `transporta`
--
ALTER TABLE `transporta`
  ADD CONSTRAINT `transporta_ibfk_1` FOREIGN KEY (`NombreUsuario`) REFERENCES `clientes` (`NombreUsuario`),
  ADD CONSTRAINT `transporta_ibfk_2` FOREIGN KEY (`DNI`) REFERENCES `chofer` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
