CREATE DATABASE  IF NOT EXISTS `cervejaboa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cervejaboa`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cervejaboa
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `idAvaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `DescricaoAvaliacao` varchar(120) DEFAULT NULL,
  `Nota` int(11) DEFAULT NULL,
  `Preco` double DEFAULT NULL,
  `DataAvaliacao` date DEFAULT NULL,
  `idCerveja` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idAvaliacao`,`idCerveja`,`idUsuario`),
  KEY `idCerveja` (`idCerveja`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`idCerveja`) REFERENCES `cerveja` (`idCerveja`),
  CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cerveja`
--

DROP TABLE IF EXISTS `cerveja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cerveja` (
  `idCerveja` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(60) DEFAULT NULL,
  `DescricaoCerveja` varchar(500) DEFAULT NULL,
  `TeorAlcoolico` double DEFAULT NULL,
  `TemperaturaIdeal` double DEFAULT NULL,
  `ProporcaoodemaltedeCevada` double DEFAULT NULL,
  `Preco` double DEFAULT NULL,
  `idCopo` int(11) NOT NULL,
  `idCor` int(11) NOT NULL,
  `idNacionalidade` int(11) NOT NULL,
  `idEstilo` int(11) NOT NULL,
  `Imagem` blob,
  PRIMARY KEY (`idCerveja`,`idCopo`,`idCor`,`idNacionalidade`,`idEstilo`),
  KEY `idCopo` (`idCopo`),
  KEY `idCor` (`idCor`),
  KEY `idNacionalidade` (`idNacionalidade`),
  KEY `idEstilo` (`idEstilo`),
  CONSTRAINT `cerveja_ibfk_1` FOREIGN KEY (`idCopo`) REFERENCES `copo` (`idCopo`),
  CONSTRAINT `cerveja_ibfk_2` FOREIGN KEY (`idCor`) REFERENCES `cor` (`idCor`),
  CONSTRAINT `cerveja_ibfk_3` FOREIGN KEY (`idNacionalidade`) REFERENCES `nacionalidade` (`idNacionalidade`),
  CONSTRAINT `cerveja_ibfk_4` FOREIGN KEY (`idEstilo`) REFERENCES `estilo` (`idEstilo`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cerveja`
--

LOCK TABLES `cerveja` WRITE;
/*!40000 ALTER TABLE `cerveja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cerveja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `copo`
--

DROP TABLE IF EXISTS `copo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `copo` (
  `idCopo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `TipoCopo` blob,
  PRIMARY KEY (`idCopo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `copo`
--

LOCK TABLES `copo` WRITE;
/*!40000 ALTER TABLE `copo` DISABLE KEYS */;
INSERT INTO `copo` VALUES (1,'Calice','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((�\�\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0>\0\0\0\0\0\0\0!1Q\"Aq2BRab��#�����\�CS�$34s��\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0!Aa1Q�\�\0\0\0?\0��\r��n\Z��q\�V�@UR�S0�\��6\�G\��\r��\��    �t�4vڪ�\�A\�nz�����^f\�j��\�MT\�\�	[>\�\Z@\�\�ެT\�\�\�5�M�7�\�\'��\�\���\�\�\�\�d��ҶZ�\�\�z�.�\�\��q���mxc!�~\�\�w�q�!s��\�\r��\"\��:�潸i�¿\�?k\�W�o�ӳwÙݭ\�X�+j\�UL�L���\�\� �\0�:\�l�\�\�\�]�c�@�YG\�WO/\�/�\�Me�M\�=\�\�\�ck��va\�\�.\�Or\�ΰ\�ցV\�l�����F��hW��\0\n\�\'�{\�1\�\�9���\Z�Zc\�&~�1\�t�Џ���J_\�\��B`\�AyF\�\�\r\�G<.\r��w\�\��\�I@@AS�\�\�n`��)\��\0+Q+\�\�\�\�j��f\�]Nz�\�\���Y\�\�\�WM�\0sP��8�\�Z,�*�:�u\�j	h(�\�\�,/��)\�^|DyB�\�p\�x�E�PeU\�T�t\�M!�\�U~\'ժ�  �w�\�r�UPI\�\�F\��Б���>\�W>jV\�V4\�A�S���5�y���\�Yi��\�)j#��\�pk[̞\\5\�\�UU\�s\�ͻ�����W�^�\�ߵ�\�bghmsA9�Q��ơ�\�=�\�5Ͼ~��^��k$v|\�\��[{Z6�r\�:jv\�Y-��\����u��3S�J[�.\�\�\�C\�RAWn)X1\�\�5c暪=\�+\�,G�\�r>J\�Q�����	\�k\\\�\r`\�\�|�3zSIQQ|�m%\�`�\0P�;1\�\�ӟ��������:xF#�ij\�\�#\�s7�\�UU~���use�\\�\�Wv\�({��Y=<UI[����\�h�`oa����[\0\�HZ\�I�.~�[�s#�,�*v�h\��\Zp��匨%�n~\�.>6��d-�;�\�5�����]O z\�=��\��ͺ\�In�S7\r\�\�zN=\\{\�mu��QsW���=\�6�6FuS�g�#\�V��\�%�\�\�)�<\�\�i:\�2j�<O>Һ��\�g�;�:�\�x��*\�+�\�?h��%K\�ݣ~\\�,��\" tX�#�\�ퟡ�[\�EH3\�Tҟ:G�d��Fֈ8����M��oY�0Î}\�\�O�\�X�\Z\\\0Y�ˉ?��\�8\�\�$\�H\�8�Cr|q��5�ph\�\�⠀����������TR\�\�j\�!��[Ȝ�\�\�#��Ub_kG\�h\�\�X��\�\Z\�|49ɍy=J �t�\���\�\�CF�jΞq\�ޔ�U@@@@@@@@A\�l�]�7V;�\�SA��\�\\\�g��>�k\�\���\�*\�8Ϣ\'�h/Rf\�8\�9\�q��G~�      \�*\�\�0��\�\�x\�UT\�G<\�C^\�\�q����9{@|/��R�cr\�{Y�\ZO�V0�Ir���|ۉ\"{\\X\"�G��\�\�Ѿ̺*\Z��wIqə\�{\�\rkZ\0\�5��\�2x\�\�Q�Hެ �H\�v�8pA��F\�:��A�ʛ�F\�<\�`䴞\��]n\�\�1ۊ�%��\Z8��pp����U_,ra\�V\�\�\��H\�=�{\��\�Km�+}42ˠ�\�mq\�9��Y\�z鬣l�\�2�])\�TJʎ�\�0s\\\�N}�0�.�}4�Զ�f���Y_%>\�^z\�Qjpn9�Ϫ\�\�=ڮ\�W1CXN�����c�\�\�}?c*��廪�Fi�ӣz1,\�<\�ͭ��{�z�     񪣤��\�W\'��d����N\�\��i�?\��\�!1<P\��\n\�\\\�ܻ�1��3�@C\��\�f�\�ſ\�7�t�w\��S[\r��d\�q\�Ks㥡Zx� �PA�\r�{Dx�\\J@@@@@@@@@@@@@@@@A�\�'),(2,'Caneca','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\n\n\n\n\n\r\n\n\r)((()++++++++++�\�\0C\n\n##&\"    \"&$%###%$((&&((+++++++++++++++��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0E\0	\0\0\0\0\0\0!1\"AQq�2Rabr��#$3BSd�����\�\�%4Cc����\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\Z\0\0\0\0\0\0\0\0\0\0!A1�\�\0\0\0?\0�T\0�@ \0�@ @ \0�PF�r�\�\�l\�GW4�S�Y.\��\Z\0�����\0T�1:�ȸ6�@�\�5�1\��$>�o܃M.`\�jj�$-����\��u���A@?\�=��)\�vsj7:�{�t\ZB��d�\�:�A��rH\�<\�l.\�n*�j\0���R�Q�[�\�#\��hp�\0\�8|��>�jF\�1���x!eSN�Ē\rN߻\�ݽj%�t\�Sn>q\�~\�*\�!U�Tu\�k}G���Ǥ�\�Ub-\�\��Cg�\�-���zZ\����Ab\������n����*\�\�@  ]\0�8\\ӕ�\�\�T\�Lb�kt�H\�q\�\�=�\�/�j(��\'H��H�\�\�n��Y�\�\\�%6-��\"kfdu0\�.a�Nm�� v7��驉\�\�>�ʲ�\0�ݩ☨	1݅�Ǘ\�ܵC�� A@\'��q��e��\�*[���^	]N\�\�o�\�{0�T!�\�`���b\�e�\\�bS\�\�eDۢ�{�\'\�\�\�;\�gr\�\�\0�@ j�\�T\'\�w⒟:�!\�ʰ��F9���i�\�Tr� 2\�)�<YN�\��\0Ҫx\�i%\�R�/\�F\��\�\nʷO�/�Or0\�3��\�\�\�`������wS\��!\�ʢ\�9��\�\�z�t^���\�i<6�]��w\�\��U�͢y�Or\�W�7\�.=lj\�n�\0�\\ÚU�VߜNz\�{ʴ9Yk/\r�\�I\�/+U<3\�L-��\�x�h��)Uk~΂��L2sJ��\Z9\�=q��n�+\0@ !\�\�)�)�j\�?\�j�\�#UeK)i��y�bay�	㤒�+\��/%,\�\�9�\�+^���0rjH �(\�\���UK5ͱ�k\�ӱsE�>o\�NCKGS@[���d6iH8\�Ǚ���^�#�k*c�\�^減�7�ut�!\�.n�ĀDr\�=\�\�v�\�\�\��rH\0�|\�b�>iȗ���\�\�Gͅ�o\�{\�\�;�\�1t�\�dC��7M/\�yn�\��\�⁒�}�ǖ�F�|��{^\�4�\�\n�O\�~!�e�9�wA#t�w�\�+Hk�� ݮ\�t\r\�+\\���\�d\�\�i��j�7~\�\�\�A�<׆\�\�\�\�.p\�m{Xy\�d|d�\�w\�<�\Zkq֚Id�x.k]bA6 _�os\�UQ��\\Oɭ��_�\�W���5�\�ˤ\08nT���\�-Xm;\�^\�ގ��c�֙\�`\�%J�\n����Iu<�+�G�x�\�\�E2c\ZƆ��pp\n	A\�xQ��\"��87�U\�$��>M�\�\�eaT�\�T2i���hC!�>#�I���\"\�8>9N\�T\�-x<A\�\�}�< ƪ�3\��_�OT\�*�Xᑭ**��Mk>�.\���i���iA\Zq\�\0\�=��0{\�SE�*�}o��\�H\�x\�3D\�\�\\SQ��w����WS�\�v\�\�\�[?\�F��G4�\�f`|�<:\���-\�Dz��\�`\�t4t�\�cG.6�zIXiy\0�A\�\�*����\�\�f\�\��E���\0r��\�\�2m�kUI\'N�9\�M�wY\�c�;$\�5�,nxǓ����a�-\�2�\�&c���\�\�N�N_\�\�f��{?ԝ8\�&_í�7L?ܓ�\0�\�\�)�\\>3�r��w4\�p��=�Vř�.h��/�w�\�r5z]R�\�mo<�BX\�/\�O}���vAS{끗=�߲��-AL�\\�L\n�ܹ�cѶ<N��\Z<G�\�S�b�\�\�|e\n��:���6]C\�\�PQ��m$�J,VF����\�P1� c�\�\�\�TOo���Ȧ\r\�ʙ���\�\�\�)�u/\�9�\�\�a�J|�P��u�\�\����cLB`�I\�3�M����67k#\0o\�*�cI\�s+�#d��UO[\�\�\�\�cN\�\�`������&\�6\�\rh\�6�J�-�TF\���A�PJPB\�A( ��J\0 ��\�'),(3,'Cilindrico','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\r		\n\n\n\r\r\Z ! \Z\'\'**\'\'555556666666666�\�\0C\r\r\Z\Z&&,$    $,(+&&&+(//,,//666666666666666��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0<\0	\0\0\0\0\0\0\0!12q\"4rs�#Q�����RSa\�\�3Bbcd�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�p\0\0\0\0\0\0\0\0\0\0\0\0\0U�\\\n�վV6H\�r�\�t��>Y�\�]7\�;\�o\�]7\�;\�o\�u\�\�����0L�5\\����U\�@6�\0\0\0\0\0C�W��\�e\0��H��E�n��\0\0\0\0\0;�y_\��@7� �\�Q����〰\0\0\0\0\0\�^@Vú�|�\n.\��.;\�d\0\0\0\0\0� +a�V>H�%xJ+\��\�\�8@\0\0\0\0\0��ܔ\n�_T���YP 	w��	{\�}\0�\0\0\0\0\0��\�@���\�\�지U@�2\0�żsw��t\0\0\0\0\0�;��\��]z��m�ڨA�\�єU�\��O߿\�@\0\0\0\0\0�@\�`/�`�\�+\�ty٩�_�%�\�\0\0\0\0\0\0�nP<\�O�\r��G\'�ʀt�@���-�\n�\"�e\��\�\���w@\0\0\0\0\0!w\��:���F�d�L��b��\���a\'\n��d[Vȍ\��\'\�ρ\��\�ʼ\�\�=0\0\0\0\0\0@�&\rS\�H��#*\�+\�M\�u�e\�m��\�\�i\�N�\�\�� ҩ�~V\��/_S�_��~z�\�uT�$�[\�&r5\�ڈ�\�uE�\�\�Y.4�bD\�\�N䉻����\��\0\0\0\0\0\0�lj�\�\�4N6\�\�\�أl5\r�\�d\�v˪&\���\�٢x��\\�\�U_\�G{\�f�7\�h�?I&x�\�_�.\�e\�\\n�\�\�n!4\�m�dkzH���zIe�(�@\�%��\�[=�\�I&T�]m�\0��\0\0\0\0\0Ȋ�r&�(\��x\�DO\�ɫTʻ\�K����O����\��S[��6����\\��o�h\�zƫU\�=ͺZ趲\�\�\0\0\0\0\0\0\0\�\�\�8ET�4�P�eڲ\�Dz�i6���Uif5\�ORI\"\�����ל�/��\�\�L/Z�:�7\�\���\�9+�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�'),(4,'Conhaque','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((�\�\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\06\0\n\0\0\0\0\0\0!1\"Aa2BQq����#$CRb�3S���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�r+k �����\�!��3\�\� ֞�:�k��i>\�\�\�\�\�\�\r|\��O�\��$�J�����\�|�F�\�vJȞK_!\�̴\�}�A:\n\�\�Ώ�W�1�pAn�-1� \� \�]�,\�\�zG3	�\�E:\���pz�\�3���\0h:``aPU��\'��?h\�\�\�s)㓽\�����\n_ǹ\�\�\�ǈ[�\0�\��(:H5p\�HAV�f>/����\�-aPj�I�D�OF\�\n��Ltm.�\�\�\�\�v\�\�AJ3˯-\�}\�\�5AF�\�R\�꽭�u)�\�#4x �6��\�!�\��\�(0��\�#\'#�ɟ��.�f�Psnl.-�*\�莊�\�(\"�pkZOMC\�	�PeF#GĪ\'Ph�9\�l��/�G�� \�Zo\�uS\����m�\�&ot��r:�\�\�w2��Pg!(A�\�k\Z\\\�:��l�6\�$\�v�Xyq\�\��=->\�:e]�3�\Z� ��[´�\�`��+\�\�[��\�N�\�\�\�.5\��\�na��7�\�9�n�\0VU�׷�q��\��¦��r�Ϲ\��\0�E����\�\"\Zv�f�]����$Z��\�$�S\�܁�\�AI\�SI\r�\�\�Q�5�\�\�\�\�1��x�ϖ�X,\�\�\��\�N�{��$�\�D���ǎ\']����2\�\�F\��F7wĪ>�OO\r4\��\�\�bhk:\0U\"\n%��\�\��Җ�%w\�*ʦ��_t\�:�6Α\�FO��R1m���\�h��i|��F3\�0 \�USS\�!��}V\�)\��\nU\�j���g\�}_��(o\\c\�\�R;��%\�\�h\�nč�\�\����<R�{\�zh)�l�(Y�XрU\"#Ǵ�qGKp�s��VSKw\�$=�\Z[#u{B���?Ķ�\�\r�T\���\�Z\�~6�C[�\�x\��	G\�,��k�AG�\�#��8�<\�\�\�\�E^@@@@@@@@@AN\�iDP����\�ѱ=�\�3\�L\�%�m�SX\�Pm�\�9 �?�GC�\�8���\�Ԡ\�\�W\�0\�Iw\�\�茱8�\�-\�vU:�\�i\�\Z\�\r���\0D\�/s�K$Og\'9^0$\��t\�E^�\��\�!r��\�\�En�\�Y(��\�;�\0;\�y+��f��J�\nmq�I)n\�̜��V%r�x��w_?\�>��\�A;\�?߲\�J���V�\�P։��P\�J\�&�un�\ZNz\�Q\����\�\�$�=���l�@~�$\�Ez訯b\�\"5\�\�\�\�4Hd.��g�q\�\�Ds�\�{u\�\�!lp�K�!\�q\'\ZJB�M��\�.��\�\�j��1��㮗\r��k\�j\n)�R��\Z\�so�m�C\\\�yGTni�i(G��ɝ��]��;7�\��i\�\�Z�<\r$��k\��8\�����B9�~N]P\�k\�\�\�&��>$�S�>d�\��L\�H?0��xn�6�O{��QÜ{.=wU7돓\�p�L�[%��vd\�\�\�n�\"fy6��X孬�\�\�C��W��9{6v\Z\�7f��x\r��7փ!\�5@@2c�\n\rPA@T�\�'),(5,'Flauta','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\r		\n\n\n\r\r\Z ! \Z\'\'**\'\'555556666666666�\�\0C\r\r\Z\Z&&,$    $,(+&&&+(//,,//666666666666666��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0B\0\r		\0\0\0\0\0\0\0!2\"Aa135QRq������\�#$4Br���\�DTbcst����\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�p\0\0\0\0\0\0\0\0\0\0\0\0\0P3eDv*�uջ��\�\�ڽ\�۰���\�`kv�@+cvq(Ѻ&ķN�\�,�\0\0\0\0\0\0P3d\�o\\	\�z�@�N%c\�O\�\�6�\0NOy�i\0\0\0\0\0\0\0�6�LV�zzψIĠL\\hk���¿�\��L\0\0\0\0\0\0(x�\�\�+\�I�\�c�H\�Ġr��\0\�\�s�\Z��\"�����j\0\0\0\0\0\0\0�#v\�M\�\�5��R���U\0\�nƺߩ@\�\�\��\�\��kc���}�X\0\0\0\0\0\0(���\\�V%\�M�R\��=��\Z�\�\�cl�կj9�%\�lǯW�\n2\�?\�?�K,�G=Q��\rp\0\0\0\0\0\0�WQ*!�\�\�Z\�9:��P<�Y�ra���~qB���:o\�|���~`\�y&2\�\�\��(���[\�P7�)[GGOJ\�#di\� �\0\0\0\0\0\0�\0�\�:�\�nh��{Qf�jK�rٓ1>��F-\�\�)`;�E5V)�F�����\�N�\rs�v\�}^�}:=\0{�$\0\0\0\0\0\0(\0<�y\�\"����\\襦��7�k&zD���|�_���#+�}����Gj�4DW�˪����	\0\0\0\0\0\0\n\0\�ė\�g\�X\��dc�\�	-OP�]Z�\0�\��\0\0\0\0\0\0\0���_e=\�p?�I�\�W\�\��\0\0\0\0\0\0\0���_e=\���^���\�x\Z@H\0\0\0\0\0\0P\0d\�w�0i��\�\�\��b\�-J\�i\��~�eJz_���\�@\0\0\0\0\0\0B�՟��E\�\�\�ۮ��<nf̔���jH�0�ܒ#��\�6\�	�5{\�{���,c|�\�\�+\�¤��d\�G\�\�[o9\�UtT��@�q\�\�#v�\��\0\0\0\0\0\0`M����s�.\�Ϻ�u#ؗ]Ul��\�~B\�}2\�\�*Y~Y\��9U\0�|��\��\�T>���\�rTY+\0��e}�]䲾�4s�\�cQ�F�,\�\�:\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�'),(6,'Lager','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0\n\n\n\n\n\r\n\n\r)((()++++++++++�\�\0C\n\n##&\"    \"&$%###%$((&&((+++++++++++++++��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0D\0\0\0\0\0\0\0!\"1Qaq�2A���#$3BDR����\�\�\�STbr��\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0��AF@<��\�x�L2\�W�l\�J�)F�d�޷ϛ\��˪�R��\�ߓ\\�7����֏��\�Տ\�j>\�\�AT�\Z\�\�U�\0\���\�=�t��[հ���R4�W�L\\�\',�\�A�!F���I�\ZS\��1()�h?\�\�\��,�\�\�Ysqj{�e\�i˺H�\\B��M\0���\0%\��Ͳ\��e\�b0+|\�V%�#,�\�>��$��@D*¡���{\�\��KӐ#\�\0r\�����] n\020,\�҂!���r�ˡ�4\�\�@6@00\�r�t\��\0�[ET����^\�_�s\�|�XR|�\�\0|�`\�yyO�/S�\"�\�	�\04��$]\�y�,���:��\0F��0a�\�^T��.�����\��Yč*DC RJK\'\�\�v�\�aԲ\�\��\0)��	��\��3�(E��\\��07D�0 �\"\0\0��տu���\Z�>W\�\�\0!]�{@τZ;[\Z4�\�\�/\�s���� #��4Q Zd\0\0\0Ed�/3�\0\��H\0\nk\�*�\�\��\�\0\0�Z@`\0\0\0S^Z\'��}�\0�\0ΝWS�5\�f�\���\0\0\0\0\0\0\0\0,bNӚ\�s�\0(��8�\��f��۹y#Ew6\\\0\0\0\0\0\0\0\0�\�;{\n�*p�i�}����Ǳ 9V#,N�/\Z5b��y���\0\0\0\0\0\0\0\0�ڼR�+V�h�\�B\�\�iy(9\�*K襓\�̸=B���\�yЀ�e\�8�Ƅnx�,+hn*\\\�wm{+EFO\�Vz�8�$\�G�2\0\0\0\0\0\0\09�I�[l�w�\���7<�t���,�\�|-\�\�I\����\�\�\\�X-S�7*/,�pe��ퟱ7*^^[�ΨҌa�%J�]\�푰�b�b7\�\�y�R�4�p��\�(\�\�6ZT��\�w�����*��i�\�|Ro�Q���ڪU�[b��NkE\�>ehp����\�`-HRU�4����{;Kj0�&�M\��\'\n��R�}Y�A�1�\�K\�T\�ǃ�\'�|T����?c�\�\�l\�\�~RE]��b�r�[U\��(�����;\�W�3\�N��9.�\�}W��ǽ����J�\�����z\"\�Q\�܀�ΩDp�0\r\�\0��`V�I���dQ\0\0�\�'),(7,'Mass','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0			\n\Z\Z\"\"$$\"\".....0000000000�\�\0C$$)#    #)&($$$(&++))++000000000000000��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0D\0\n\0\0\0\0\0!1A\"Qaq#2������3BRbr%45Cs���\�$c�\�ғ�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0\�(\n��(\n��(\n��(\n|cj0|\�5\�Zs��$�彯���\��f��\��^���>\�(Pv%�x���\��(\�/x�\0�n	*\�̊�\�U�Η�ڂ.n\�\�X{�jyr)s\�+A)��\�h\n��(\n_l��[Q-G�Gt��\�m�Ti�J0\�\�\�f\��%.���2h��\��\'�\r<R�UE\�f��V\�j�\�R���\�W�5)@PA�bY\�\�[����J\�Q\'���5,`r\n\�O���K���D,(\�F�\�<#��\�m���\�\nn¹�g#�ҡ\�΢�t@Px������x\�\�ތ\�qkZH\'*o{zTXv}+v.�\��\Zdk�kë�4F�\ri\�L�9yGG�\�\�\�\�)D>�k�+�\�\��D�>\�J-�����\�\�	iD.N�,�\����N\���C;\�\�\�\�R�\�(U�X��x:�F\�\�##��\�m��� ���\�@\��\0@\�\�?\n{e�(�\�e�*B��\�a�T9�����pPnʥ��\r\�[�\�s�4\�(�3�{��\�\�\���t)4�\�#y�TR\�ݸQ~��H�kuڃ�fv�v5m\�@}�+Kkm\�k��RB�_��S/\�\�\r��:\�\�+\��\�\'\\М��:�z\��T)�x��@�5�Z�[I9\�t\rN\��kۘ \�*J������5�\r��\�#W^6E�\��\�F���o�(�x���\�\Zh�7O��DY\�H�\r\�U;�A=T)Im�:�d +�\"\�\"ıEbsݖ\��jx\�\�J@�Q\\�pɳ$Ǎ�?ue\ZeU��\�\�\�Pi�\�v0\�c\�1\���t�вA\�7\�\�QKV\�Mhoa\�2�\�Hx\�l��uUG�$=�l��%9\'C9��nDs\��\�,�e\"l&%�\�Hm.՘^\�\Z.@�wG\�W�nF\�ޏ�U\Z|\�h\�G\"4zT史�p����s�\��h�RݍAϊ%�I�d\��6R\�{U\��\�S�͐�\r\n�/!��j?���\�ѥ\�ཡ\����:eԤ*\�\�-ͻ\�4�P�\r\�X\�[t-\��\�ȿy��Vƫ�-\����\����{**m�\0�s���*ƣv:=Z��\�\��\�\�:\��]��H�M�����V�S�\�Dy���>���@�4�X*E\�\�\�\Z\\(\nw,1�\�ڄ\����j��c\�\�)䙒��EX�5w\ZGf8\�\�t\�F�	�q\�\��v�2�utԲO�A0����h\�\�u\�(f���\�=IIM�\�\�BmL�yayI�m�$�zX����\�Z0\�m9�r9\�HE�ꬮ.4QA\�;!_f@�\0\�\�Oʪ96*�\0�$/\�̐G�[\�QS\�0\�\�I�Pb�+�i�\��\�F�\\vSG���}Kv�t\04�R/խ�k�=|h��\n&\�\�?8!F.(Fx%\�7�w�̌ö\�T��+3s\�Ⱥ��}E���� OA*$�GGK\�Z�T9�쩭��T,���?\�Qp{\rELH�]\����)��b����\rTiQ�f[�\�\�\�����\�{h<\�~�}\'���[��3�\�N\�\"��X;�c��%6�!�/��T;՚��@w\�\'8<\��	� �F�r��ı\�c\0\����k�G\r\�HO����\�\rn��\�;Erg+v��w\�W�����\�e�,�\��ؑaQI�����_\nGg\�\�\��Q\ZE&�48n\���l�].D@q7�\\\nZ�H\�mA9��ŵi\��@�sT��4Ԫ!����/��J:\�tH�����b`򟿔K}rR�T�h�~\�\�Z0��Q]�\�\�\�\����e��϶��_\��\�\�⫉=O�B�ݝ�\�\�\�\�\�$k�]\�\�P\�\�\��%���b�+xeJ�a�9y���EN\�%ą�HW��	���1@�\�II(C\��3�sY�\�U\Z��3���6\�y׎g�_���(;T\�\�\']GG\�@�`�����Y]\�t$$��Pr=�t\�� d�\�ɗ��.\�\�F\r!`�ۮ�\�r�\0:+>�Z\�\�\�L\�\�ͽe\�W��@s\'����ħ&\"!����\�\�4\"_\�0�5$Dh%K�GOI\��%�\�5\�@P%\�f\�z��\�vr|Rk�Ƚ�I�M�:j=uQy�mD^$�$��Ǖm<\�\�#\�Dt\'i0�\�\�o��d|h�_\�#�[\�\�u���]\� �����i.����\\��gO@�qͷ\�\�/�\�P\�)^f\�M��\�Z��i$G��\�*4k\�Gz�-`�u#��G��\�:L��|<[sʅe�֢�t@P!\�����~�\�b\��7i\�:�\�.:�pd��\�\07�\�P\�8V\�\�YO\�\�E7\�\����;\�A\���\�֞�\�\��\�\�D\��\0�Y�\0�F/{-ЮW��[�B���P\�a�w�C\�4\r�g��C��	]�\r�2�H\�|f�-��Kﹼ-�\�\�,ƗӕEYh\n��(\n��(\n��(\n��(?�\�'),(8,'Pilsner','�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0d\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0A\0	\r\0\0\0\0\0\0\0!1AQR��2a��\�\"#STcr���$%5Cbdq�\�\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0Q!�\�\0\0\0?\0�:֑�\�N�B1\�+i�ɒ!�^}52\�,ICtv\�GF綑\�j�.\n�\�oK\�3��\�Oq���*Ӫ�Oĥ�E7� ��\�\�r{�o\�T�����\�Oqz\0��\�).����::m$��>~o9=�\�\�G��V�\Z\��,\����m\Z�A�\0D#I��\0�\�\��\�)\�U\'\�R䥰p�����/it\0\0u\�*\���\�,J\�g\Z˃���?\�d\0\0H\0Y��Ko\�\�\�\�V?��\�.\�tn\�T?\�`j�*�p\0�$\�2\���*f*��\�r�a=��\�fn-л��w�N\�\0\0\0\01#$��IV�$!$Eejl\�(d\�#ؾ\n��̯�&�N\�\��\�{K\0\�Mն�\�;+�����(`�\�fc|x�\�M\�&v\Z�\�n\0\0\0\0 \0�2\0\0\0q]\��|�\�û�\�j娦��oi�gi���l�\�\nw��\0\�*k\�n�n��]\"��_j�\�;>7SʽS�}�w��p\0\0\0\0\0\0\0\0\0\0WٸR�/��\�\�w��?�T��\�\�\�#��Y4\�\�ʵ�fQ\�\�L��\0=qMa]�e֧�Ӥi�\Z\����S\��v�=dv\�|�\�\�3�\�r�DCn���\�\�+\�\�0\�mT5\�\�Ms�Q{�X��\�@P\0\0\0\0\0\0\0\0��\��Z\��a�Kf\�\�\�>!�\���é4m\�?u[%#�����\�@(�|��G\'�7F�\nh�-F��\�\�}H[���,\�\�ai(\�S\�\�\"/���Q�-\�k��#��dw�O�\0\0\0\0\0\0�\�\r�8Rb7\�MAa��\'�,����SY��\�\�\\i\�7cm2x.P���\�54͡�TT�$Һg67�\�\�\�WpEN~)\�\�p\�\�%R\�l�W\�.UR,�Ѧz�ǣ%ky6\�V���ϫbM�\�L/\�T\�\�]�\�7�\Z�uZ�\�%\�X�����d���xeUg��U9\��e�UD�M]@�\�*���$�7aW����V\�={[\�uE��<�C�_fT\��\�IX�\�\�T\�O\"��1U:�\�_P�μ}�	ᩅ%���F\�g1r�\�ݤ<���\�\�{Km�Օa\�W��?m\�r󪯱��6�\�A��z\�7\�\�\�\� +���s� � \03\�\0\r&@\01P\0֦]\0\0\0�\�'),(9,'Pint','�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0d\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0@\0\0\0\0\0\0\0!1Raq��\"2AQ���\�\�BS��#3���%Cb�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\01!A2B�\�\0\0\0?\0��xH\�\�*w��\�ޠa\�W\�G0x㥕�QR��d:���o\'ẗE�\�F\�-���*�[\�\�oz�}\�3�-c��?��\�Pp\�~�g\�0e�\�\���\�\�\�|����c\�۞��X�M1�[�}R�A\�E���|���i����y\�I][J\�F\��1m�\�\�p�qu˙���\�\�gJi\�\�\�r��\\���v\"\"\" �\�\�j8��\0?\n���$\nN��˵*�l8L-=fW�(]J<T�\�T��,Y郎��iE�VU3��\�IΒj�]ԍ�\r�uv)r\r�\�a\�f{�֐OV�2}�kOY\�\�u��(��\�ֆ�\�Z\"������!��\0:f��\�\�\��:�z�\�*L�;�>\�s5+ۤTEKY\�\r&7{X�\�\�J�xPYpVdo�U�yP\���mj���>)?\�?�����Nӧ5p\�B�\�1�\�y4w�kFVu\�GM�PJ�\09�������SB\�zx�g�PWV-�D@DD\�ɦ�>\�\��\r[f\�\�\�C�\�\�-*T�\�\����ew�u\�Y�O�����zW��+/<\�2Z\�-ջLw���)\�\�6��S?�m�}K�D]�\�#Ob\���\�\�}Q�r\�[9h�h��\�\�\�\�ɫժf6\�\��Y\�\�;\"\",������\"��o��?3�\�潿2�U\�4�/��\�om\�#H��\0t7\�R�$\����;�]_qx�T�=bH\�(,�\n��\�uՍ���\�<.�\��l���39�����}os\�}\�A�\'sr�V�9\�\rd�=\�S�9EV\'�gidr\�J\�=L\�ø���Y\�ӫ\"\"Ű�����\�\�\�����f\�+�H�@�˘d�\�T\r\�\�-�ZͯS\n��\�\\.\r16\� �\�k� aν\�\�z�\�.�Ngi����QV%w���\�+a8+W0\�\�\�\\\�\�u;�#_5\�C�7Ȱ<\Zc�R\�\�Mɚ���FϪ�iN\r��\�k\�1\�R��1\�c\�e;\�\�-L������I\�\�#��\�\",\Z�����49\�-�Mƣ\�R�ܹ��ua�*�/\�S\�ۤ\�}����4?\�\Z\�C�\0i\\��}\�\�)	\�\"��t2�\�{UԹ�\�\�\�.U*Ȣ�e+UP\�.[:����K�t�.\�\�\�\�g\�e���b\�Y�\�swc�\�;\�\�3i6m�����Gp\�˗m�\�%47\�QW6\�=߰.ó8�;?�k^�7�����tDY4acфֺ��/7��\0	�/�2.=��\�]�Xen�\�vB\�?�5jf�\��A��о� A�\nQ���-k��\�\�Թڌ����\�Wt�F\�\�3��\\��]͓\�i\�Ӥ�Q�\�­;7P?�Y��OPm>\�\�]F\�p\�e����W��@\�P+e�d\����6��N�U�ǎc�\�)[��<��/\�\��l��-3+#\�\�\\N�\�s�lR\�O���\��Æ׎c5�ci\�C�}�`خi�\�W]�?��z\�`-nO\nӒ\"{KS:rͨԳ�\�\�\�a�TN��x\�4�l8/ǡ}�!4\�[��1\�\�\�\��:�\�_�⮮�z�\�\Zc�Z/{Y��+����\rh�\0\nrZ-=:�f�T��7b\" \"\"\" \"\"\" \"\"\" \"\"�\�'),(10,'Taca','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0			\n\Z\Z\"\"$$\"\".....0000000000�\�\0C$$)#    #)&($$$(&++))++000000000000000��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0=\0	\0\0\0\0\0\0\0!1AQRq�\"#3Ba���$%4Sbr���\�\�2CU���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0S\���I~��\�\�d\rjYk\'�l�s\�j+�\Z���\�\���\�\��Ũ\�7����YU[K�\�cU\�j�u\�g\�z	x\�G/\'�v>�d�\0\0\0\0\0\Z7uŶ�\�7s���2S� \�JoE����޶R�Dmow\���\0\0\0\0\0_x_�5�Y,m�\0�_�٤\0bP\0&�h;\"�\�\��+}\�8 \0\0\0\0\0\n˺��i�\�k�\r���1(\��\0`����oV��\0�5\�-@\0\0\0\0\0*.\�K�O�\"����w�\0�́�d_+\\Ή���\��p\0\0\0\0\0Mvw\�T)�&_\�u]\�,�_\�Ӳ*�\�\�Ȱ�U�\0\0\0\0\0�\��WS��hs\�sD�07��M�FuQ@����\r=�]��Ss-CcO���^�\0\0\0\0\0P\�|2:\���Z��\��V1�ʼ%̉\�\\�(\�c���F\�\�=\�^�]Q@\�\�\0\�\�7j�\�W�۬��\�/F5P=l�<�Y`�Tݚ�]S\"t,˾�\�j�t\0\0\0\0\0\�\�G\"�ɖ����8*)V\�s�\�P��\"�\�\�/#\�v�<��\�\�\��*X\�p=%K�*\�s�=\�Cxe�-icT�\��m\�\�v��\�\�x�D\�h��z\0\0\0\0\0\0�9��ٴ�\��!zC]\n\�\�J��\�\�~5\������2�\�V��RףU�i$��\�^f��j\�:�qo��WT\�\�\���C\�G<��MX�κ\��\�QCJ̲&E#\�8�>L�~ m \0\0\0\0\0\0n�a���MƝ[\rD�xD�bH��k���\�U������;}*\�ܙ�1e��I��G�;Վ|m�ꜞ�;\0H\0\0\0\0\0\0�i*_��\�\��$��8ܞ�\�J��S.@�\0�\0\0\0\0\0@\08��������\�t��xT\�{э\�Q[{\�\�\�oc�	\�\�\�\�)֕֗\�:\�\�$��F�$I��9cV�5\�\�9��\0�\0\0\0\0\0s\�͡��O\�W_|\"��{5\�L#��\���m��f�C]H�\�\�?>�@���\�n/̕w\nOy\�|\rn��\Z\�*��d���B�Ǫ��7������\�\�L\�y���yn\�\�\�bG=�\�Q\"r�:G&}x_\��\�w��=͖\�SBֵ�T#Z�U�Q7�\�\�\0\0\0\0\00\0\0\0\00�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�'),(11,'Tulipa','�\��\�\0JFIF\0\0H\0H\0\0�\�\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((�\�\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0E\0	\r\0\0\0\0\0\0!1Q\"A�aq��23BRb\�#EUr���\�$CScs����\�\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0!1\"Qa�\�\0\0\0?\0���          ����\�Zm5�}��U�H�oyw���@٦?��\�G�\nE��~U��\0v��g��_�_v�\�~r��\�\�C�u@p�T�\0��)X\�룻ֺz\�akY�ii\'9\0x�A\�T�}G��AmH3\�55��mA�\n��~\�?ㄢ\�\�`-��0�v8{��\0�F��������1�y\�\�I� �ln(�\'��\�\�\�Z-�(�ݝ��Y\��T^PB	@AN\�&�B��\"1�\��\n�f&荭\�0�\�}\�\�_MU�T�;�]\�*������:��Աx72��j\r�()\�c\�PJ\�R��\���Ex��>\��QaA(3K\�E�R&�IZ�\r5�@@@@A���g��gl���v\�$\��+¹z�Ʋʈ3\�i�\��\0\�\����i\�\�<�F��������Ҫ:[|�Zp<K�\0��q�+�=����\��Ʒ2~���|J_V.�>s\�&���<\�\�r(3�\0\�ST�+����w\�\��H:\�\���9�q�6\�k�ᩧ �!dJ{\�\�X,��V\�\��i�ߙǠcr|՘ڗ%[;nw\�b�]!4�l:\����\�4\�k\��\�I;z%��mލ\�wQN�\0��\���>\�e\���\�\�5ގC&\�^福9�H��ZpV��qU���z:\�Os�����\�\�Q`�%{�}\�Q�\�w��\�*\Zy.l�\��-��h�\��Hvͧ\��\�o��J\�\�TQ\Z\�O\����ʛ�ƽN\��ia�=�R�\�n��A����>��snb�\�\r<\�\�\�\"�[\�i�\�\�\�\�\�4����e�<r��U��l�<\�ڊ_O4U�i�R׳=湮y%5\�eD��=�5���\�Һ�\�u\�;�Q\���%\"4TQdj\�t��\��㎖�G\� �I���Q��\�PC�#\'N�\�{5�<t\�\�n1wY4�N\�_#\�+i`\�kd�\�JZ���1�\0kL�z�v\�9�\�ޠ}Kf�\�_�\�̌�\�M���Fcxp<�TW\�\Z\�\�kM��\n\�\�h\�\�T\�oL�?�\r`|o��-Mv:��3q|a��:Yp�Z*��\'\�?�)�X��\0���f� �`��=\�r�>�?\�Fݽ�7d�a�rǃ\�Sk��q5wiuP�&\�3���#���}��i����z:Fg�$w�ao\�Y\�ƽ�\�\�\\�tN�\�^k\�\\s�\ZXƎM`9\'\�I\�M:H\�mA�R�&��h=!�Sm|D�U��ꁽ@\� k( ��@\�@A\nJ%A�-b\�Wv9�}j\'S���\�\�5��;���N\��UD\�=T\rG�\�\� �\�A=T��[Ś�\�'),(12,'Tumbler','�\��\�\0JFIF\0\0�\0�\0\0�\�\0C\0			\n\Z\Z\"\"$$\"\".....0000000000�\�\0C$$)#    #)&($$$(&++))++000000000000000��\0\0�\0d\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0D\0\n	\0\0\0\0\0\0!1AQ\"��23Raq����\�BCbr��c�\�\�#$%DSd�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�\�\0�@ \0�@ G3\�q�\r�AI�ոf7)\�:�ԂA-W�\�����)��\�\��\�G��\�\�\�k깷�\�\�f�\'x\�����T�_;v�ߚL��2�|\�A=ul,\�\�v\�lv�@\�:�hP\"��@��m#<��\��te�=\�+ u�A5G\�A]\�R@\�Ky\�}��\0\��\0�AG���[����\�Q�E\�-?\�v�:\� ����	q>�m{\�>oQ�ԃP�@ �.؟�J�R%\�}h*\�\�\�\�\�@\��x�\��=\�\�To\�A\0ށ\�ϤQ\ZǞ\�F\�\Z\�\��BM5u.�N�\�5�]J�6���W\�����\��ϱ���\�\�W\����5\�A\�=�*\�lm/y�knO�m((Vb�t4�2�L�[0�\�p��,U�X�\�\�ޒ٘\�c	.ly{3t\0�\�$�\�̎7\���foՑ�p�2G0\�k�\�>�l��I&]i�=f\�\�\�-i\�\��:\�\��4os\�� 2ev\�q���k\0;�W�)c�\�_�3	�\ZC�ɉWL*)�˛��x6\�\�A��;l��\�Q$�q\��c7��\0�@ \�\�t\�\��S\\?4DrՍ*�\�d\r��:\��Aن\�:=݈+\�\��O�K@Z�\�\�~ڥ\���\r����\0\��O%\�\0�?��-H\� >\�ߊ�\�J^߂\�yA\��s��Ђ�Q�4���[Cz�\'�\�e�\��G\�\�\nx=��@\�\0�@ G�#�]ɭw�#J\n؛�h]���g\��\���&�Z�\�<z,\�ݓ�w(\�}�38���!�\0bG\�Pk�h�Ao%��\�`���u?2�\���(oE�\��\�\��hX~\�A\�/�\�\�\�9=\'�S�ֿ��%&\�b\�*X8\�L�\0�\�o\�\�	vh\�<5�4z\�� ��@ %\�\�\�J\�ְ�f W\\�\���C\��Y�f���\� �&\�ڂ_�(2\�y.�F�\�� \�\��A\�\��\0�\��cq�\0G�7g?�\�%\�cd?k$�\�\�\Z \nq\�2R\�\�L=��\�c5\r\n�f\�u,���P?Ѻ���S\�{\�k��~(\� �\��PbhO\�KGJ?\�N\�\��5|�\�y\�Ȥ�\�a��3\�\�l�\�\�ޱ\'⁚\0�@�I�\"\�5\�t21ǿ/\�]-enS��U\�tyE\�\\z\�3�v\�8 �\0Ŧè������|1r\�A\�bO\�Z�%Zwg�\�� ����\�\��J�\�\�\�wu�Dt�:����i����%��\�(e�	5Trk�\��Ƹ\��\�m]]tұ��^C���sGuPl�h�XMg{a�T ��@ )\�x��\r`�u��\�i\�\�݈3z;�s�<k��w\�\�\�k�KL\�\�\��G�$��}\��\�7`Ԭ-��ǈ�H=E�\�\�.�4�KZ\�qv\�0;],caqh�ùk���Al��<[d��\��ܐF\�%�w \n�\�h^o�h7�W��~ �\�c\�\�X�\�Do	$� \�Bm\�\�\�o\�����\'���G\�\�\�K\��\�r<.�7\�l@���w\�%�\0�@ \0�@ ?�\�'),(13,'Weiss','�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0d\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0E\0\0\0\0\0\0\0\01!AQa���\"2���#BRqr����\�\�$\'CSTbcd�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0��\0\0\0\0\�4\�*��\\�5��amt���;%k\Z#$\�{^�X�7�x�\\_�\�I΁r��\�r\�x�\��:>^X\�y\�$��\�z\�,�b��I��Xe�d\�5\�d\�k\�\�䜜N���\0\0\0\0\0\08r�Z�]\�\�rb\���\�97�N^\�����\�-�;˞5�r��Y�/\�,HE\�f#pݥ��(\���%�T\�\0��\�,Sg�?xʈ��D�	vM7K#�R�\�\�Bp\0\0\0\0\0\0\�UM4_�\�\�\��\0AaL1iw��\'��\�&%\�v��奚h͕ȝ\���v�*�t�F~G�D��D\�\�$خ��\�\�I\'[�֧s\\N�\0\0\0\0\0\0\0\\�\'�\�/t��²��\�#ҍ\�\�r�[\Z[$�5��\�/\�b��\�\�	Ƨr�\�Q:�������Q�X\�\�S\�n�\�\"x�\�(��\�R\�\��o}R�\�W\'r�4\0\0\0\0\0\0\0\0o\Zgت\�|HW�L\�_�\'�+�N�`�u�	��H\'�\0I�\�Qd\�P9ȍē�.�΋����Ƚ:W.�D�\�\�����\�\�\�9s뙍^\�b\�N�v�jf�0\�\�ө=FH\0\0\0\0\0\0\0\0\0T����\\L�\�3�Ѫ��\Z	�\"��o\�F\���)W\�,\�O�\�P�塒4�\\�S\�,6\�\�\�\�O\Zzq]\�\�i����K�W\�}E��m\r\��\�2�1]\�\\\�\�E���@[�\0\0\0\0\0\0\0\0\0j\�dEjÀ���|{���S^�\�a�\�D�6ƛ��\�\�L��\��\�\�;g���\�|\�dm\�\�\rԳ1��G#\Z�z��S�+,�\�Ώf�����FGXܹ╲~Еԋ���\�[���A��X\�\�2K|\�>\"�`E��vT\�\�4K�r5\�\�EL\��({\r�{y��5T\�j���N����c_��|\0\0\0\0\0\0\0\0\�\�d��m��\�weRB\�x|	X���F�k��9]�&J�\\���-W,!_K\��%O�;N�ϕ\�\���ov[e�h\��Ԯ\�DI#~\\�r����.\�EH�\�T^\r7F��zqr&�Nವ\�U�s[�[tk\�l<yv���\��6\�_C�O\\�\��A#�r.�աQ:|dSx�Z$���*\��y*��]�\�Eq�+�n�{aSa���MΩ\�V��\�\�Ӹ���\�X��f�p�F��_L\�J9����\�MY�\"g�F\�<��8\"lp��\�\�F��DDj&\�DCԨ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�'),(14,'Yard','�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(�\�\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�\0d\"\0�\�\0\0\0\0\0\0\0\0\0\0\0�\�\0A\0\n\n	\0\0\0\0\0\0\0!\"$14Qq�7ARat����\�#Bcs��\'23Sder���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0?\0�H\0\0\0eO.X�\�\�\�Z�R[अ{5\��\�d\�V%K��\�w���\�r4��25ߗ2�H\�\�\�1�ӊ�{ʕAr��ی2bgsSq�[YU6�D�>���\�-\����\�P�\0P\0\0\0\0\0\0\0\��\0��/-�\�Z\�dU�\\�\�\�W�li�}��T���W7\�\�%SP\�\�X�<���꺝��FO��\�T�\�DC�rU@\0\0\0\0\0\0\0\0\0JjW\�\�\�\"Sp��M%�\":Y0�\�E\�Բ_i�Utvh��\�&s�M�˽Gx\��h��\�|\�	<�\�cp��b%f�hW\n�\�g|¯UTU\�\�[\�+Oe�\�vb��+�\�\�E\�>L35$W*�\�\�;MR�{]ަI�>�\r|\��\�Elv:,<l|��\�j\"�ֻ�\�\�c\�\0\0\0\0\0\0\0\0\0V���|�%+2?J�4�*��\�\�\�\�yL�J�\�N���>�5\�oCok�\�2-\'�ɨ�\�Ċ\��\0\0\0\0\0\0\0\0\0	�\�9d~��\'��-���+�K\�L\�w��G��5�\"��n�Й�\����dԏć�\�V\�\0\0\0\0\0\0\0\0\0\0M\�ז��|�)	���\��>V�%w)}ϽL�HV�ǩk����ש]/ϼ\��kn�jj��)\�y��\0\0\0\0\0\0\0\0\0��*c��)o�ZT\�L<�\�{s59\�|H��j9zW�\0U\\\�u��;9��(\�zfz\�d\Z\"�\�\�Mw���\�\�2�%[|$�-��[Wi�\�r~е1\�\���B+h\0\0\0\0\0\0\0\0\0ͮO�O#cc^\�2��\�=�J\�3-&|E�_8���/��:�L�\�2CF\�p�t�\�-\�2�{UV\�؈`1\�T�׆�\�?.b_�\�,J\�g͔*q�\�8\�r�|nܢ�-�\�\�\�3�\�4�\��f�Q�_\n�~�dU�Υ�x����\�\n\��#�\�\\lVN��ξ5?>E\�MD\�y�\rU�9\Z���iyl7F��ۍԪ)�\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�');
/*!40000 ALTER TABLE `copo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cor` (
  `idCor` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'Amarelo'),(2,'Amarelo Palha'),(3,'Ambar'),(4,'Cobre'),(5,'Cobre Claro'),(6,'Dourado'),(7,'Marrom'),(8,'Marrom Claro'),(9,'Marrom Escuro'),(10,'Marrom Muito Escuro'),(11,'Preto'),(12,'Preto Opaco');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estilo`
--

DROP TABLE IF EXISTS `estilo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estilo` (
  `idEstilo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstilo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estilo`
--

LOCK TABLES `estilo` WRITE;
/*!40000 ALTER TABLE `estilo` DISABLE KEYS */;
INSERT INTO `estilo` VALUES (1,'Ipa'),(2,'Lagers'),(3,'Pilsners'),(4,'Porter'),(5,'Stout'),(6,'Trapistas'),(7,'Trigo/Weiss'),(8,'Tripel'),(9,'Dunkelweizen');
/*!40000 ALTER TABLE `estilo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidade`
--

DROP TABLE IF EXISTS `nacionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidade` (
  `idNacionalidade` int(11) NOT NULL AUTO_INCREMENT,
  `NomePais` varchar(65) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idNacionalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidade`
--

LOCK TABLES `nacionalidade` WRITE;
/*!40000 ALTER TABLE `nacionalidade` DISABLE KEYS */;
INSERT INTO `nacionalidade` VALUES (1,'AFEGANISTÃO','AFGHANISTAN'),(2,'ACROTÍRI E DECELIA','AKROTIRI E DEKÉLIA'),(3,'ÁFRICA DO SUL','SOUTH AFRICA'),(4,'ALBÂNIA','ALBANIA'),(5,'ALEMANHA','GERMANY'),(6,'AMERICAN SAMOA','AMERICAN SAMOA'),(7,'ANDORRA','ANDORRA'),(8,'ANGOLA','ANGOLA'),(9,'ANGUILLA','ANGUILLA'),(10,'ANTÍGUA E BARBUDA','ANTIGUA AND BARBUDA'),(11,'ANTILHAS NEERLANDESAS','NETHERLANDS ANTILLES'),(12,'ARÁBIA SAUDITA','SAUDI ARABIA'),(13,'ARGÉLIA','ALGERIA'),(14,'ARGENTINA','ARGENTINA'),(15,'ARMÉNIA','ARMENIA'),(16,'ARUBA','ARUBA'),(17,'AUSTRÁLIA','AUSTRALIA'),(18,'ÁUSTRIA','AUSTRIA'),(19,'AZERBAIJÃO','AZERBAIJAN'),(20,'BAHAMAS','BAHAMAS, THE'),(21,'BANGLADECHE','BANGLADESH'),(22,'BARBADOS','BARBADOS'),(23,'BARÉM','BAHRAIN'),(24,'BASSAS DA ÍNDIA','BASSAS DA INDIA'),(25,'BÉLGICA','BELGIUM'),(26,'BELIZE','BELIZE'),(27,'BENIM','BENIN'),(28,'BERMUDAS','BERMUDA'),(29,'BIELORRÚSSIA','BELARUS'),(30,'BOLÍVIA','BOLIVIA'),(31,'BÓSNIA E HERZEGOVINA','BOSNIA AND HERZEGOVINA'),(32,'BOTSUANA','BOTSWANA'),(33,'BRASIL','BRAZIL'),(34,'BRUNEI DARUSSALAM','BRUNEI DARUSSALAM'),(35,'BULGÁRIA','BULGARIA'),(36,'BURQUINA FASO','BURKINA FASO'),(37,'BURUNDI','BURUNDI'),(38,'BUTÃO','BHUTAN'),(39,'CABO VERDE','CAPE VERDE'),(40,'CAMARÕES','CAMEROON'),(41,'CAMBOJA','CAMBODIA'),(42,'CANADÁ','CANADA'),(43,'CATAR','QATAR'),(44,'CAZAQUISTÃO','KAZAKHSTAN'),(45,'CENTRO-AFRICANA REPÚBLICA','CENTRAL AFRICAN REPUBLIC'),(46,'CHADE','CHAD'),(47,'CHILE','CHILE'),(48,'CHINA','CHINA'),(49,'CHIPRE','CYPRUS'),(50,'COLÔMBIA','COLOMBIA'),(51,'COMORES','COMOROS'),(52,'CONGO','CONGO'),(53,'CONGO REPÚBLICA DEMOCRÁTICA','CONGO DEMOCRATIC REPUBLIC'),(54,'COREIA DO NORTE','KOREA NORTH'),(55,'COREIA DO SUL','KOREA SOUTH'),(56,'COSTA DO MARFIM','IVORY COAST'),(57,'COSTA RICA','COSTA RICA'),(58,'CROÁCIA','CROATIA'),(59,'CUBA','CUBA'),(60,'DINAMARCA','DENMARK'),(61,'DOMÍNICA','DOMINICA'),(62,'EGIPTO','EGYPT'),(63,'EMIRADOS ÁRABES UNIDOS','UNITED ARAB EMIRATES'),(64,'EQUADOR','ECUADOR'),(65,'ERITREIA','ERITREA'),(66,'ESLOVÁQUIA','SLOVAKIA'),(67,'ESLOVÉNIA','SLOVENIA'),(68,'ESPANHA','SPAIN'),(69,'ESTADOS UNIDOS','UNITED STATES'),(70,'ESTÓNIA','ESTONIA'),(71,'ETIÓPIA','ETHIOPIA'),(72,'FAIXA DE GAZA','GAZA STRIP'),(73,'FIJI','FIJI'),(74,'FILIPINAS','PHILIPPINES'),(75,'FINLÂNDIA','FINLAND'),(76,'FRANÇA','FRANCE'),(77,'GABÃO','GABON'),(78,'GÂMBIA','GAMBIA'),(79,'GANA','GHANA'),(80,'GEÓRGIA','GEORGIA'),(81,'GIBRALTAR','GIBRALTAR'),(82,'GRANADA','GRENADA'),(83,'GRÉCIA','GREECE'),(84,'GRONELÂNDIA','GREENLAND'),(85,'GUADALUPE','GUADELOUPE'),(86,'GUAM','GUAM'),(87,'GUATEMALA','GUATEMALA'),(88,'GUERNSEY','GUERNSEY'),(89,'GUIANA','GUYANA'),(90,'GUIANA FRANCESA','FRENCH GUIANA'),(91,'GUINÉ','GUINEA'),(92,'GUINÉ EQUATORIAL','EQUATORIAL GUINEA'),(93,'GUINÉ-BISSAU','GUINEA-BISSAU'),(94,'HAITI','HAITI'),(95,'HONDURAS','HONDURAS'),(96,'HONG KONG','HONG KONG'),(97,'HUNGRIA','HUNGARY'),(98,'IÉMEN','YEMEN'),(99,'ILHA BOUVET','BOUVET ISLAND'),(100,'ILHA CHRISTMAS','CHRISTMAS ISLAND'),(101,'ILHA DE CLIPPERTON','CLIPPERTON ISLAND'),(102,'ILHA DE JOÃO DA NOVA','JUAN DE NOVA ISLAND'),(103,'ILHA DE MAN','ISLE OF MAN'),(104,'ILHA DE NAVASSA','NAVASSA ISLAND'),(105,'ILHA EUROPA','EUROPA ISLAND'),(106,'ILHA NORFOLK','NORFOLK ISLAND'),(107,'ILHA TROMELIN','TROMELIN ISLAND'),(108,'ILHAS ASHMORE E CARTIER','ASHMORE AND CARTIER ISLANDS'),(109,'ILHAS CAIMAN','CAYMAN ISLANDS'),(110,'ILHAS COCOS (KEELING)','COCOS (KEELING) ISLANDS'),(111,'ILHAS COOK','COOK ISLANDS'),(112,'ILHAS DO MAR DE CORAL','CORAL SEA ISLANDS'),(113,'ILHAS FALKLANDS (ILHAS MALVINAS)','FALKLAND ISLANDS (ISLAS MALVINAS)'),(114,'ILHAS FEROE','FAROE ISLANDS'),(115,'ILHAS GEÓRGIA DO SUL E SANDWICH DO SUL','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),(116,'ILHAS MARIANAS DO NORTE','NORTHERN MARIANA ISLANDS'),(117,'ILHAS MARSHALL','MARSHALL ISLANDS'),(118,'ILHAS PARACEL','PARACEL ISLANDS'),(119,'ILHAS PITCAIRN','PITCAIRN ISLANDS'),(120,'ILHAS SALOMÃO','SOLOMON ISLANDS'),(121,'ILHAS SPRATLY','SPRATLY ISLANDS'),(122,'ILHAS VIRGENS AMERICANAS','UNITED STATES VIRGIN ISLANDS'),(123,'ILHAS VIRGENS BRITÂNICAS','BRITISH VIRGIN ISLANDS'),(124,'ÍNDIA','INDIA'),(125,'INDONÉSIA','INDONESIA'),(126,'IRÃO','IRAN'),(127,'IRAQUE','IRAQ'),(128,'IRLANDA','IRELAND'),(129,'ISLÂNDIA','ICELAND'),(130,'ISRAEL','ISRAEL'),(131,'ITÁLIA','ITALY'),(132,'JAMAICA','JAMAICA'),(133,'JAN MAYEN','JAN MAYEN'),(134,'JAPÃO','JAPAN'),(135,'JERSEY','JERSEY'),(136,'JIBUTI','DJIBOUTI'),(137,'JORDÂNIA','JORDAN'),(138,'KIRIBATI','KIRIBATI'),(139,'KOWEIT','KUWAIT'),(140,'LAOS','LAOS'),(141,'LESOTO','LESOTHO'),(142,'LETÓNIA','LATVIA'),(143,'LÍBANO','LEBANON'),(144,'LIBÉRIA','LIBERIA'),(145,'LÍBIA','LIBYAN ARAB JAMAHIRIYA'),(146,'LISTENSTAINE','LIECHTENSTEIN'),(147,'LITUÂNIA','LITHUANIA'),(148,'LUXEMBURGO','LUXEMBOURG'),(149,'MACAU','MACAO'),(150,'MACEDÓNIA','MACEDONIA'),(151,'MADAGÁSCAR','MADAGASCAR'),(152,'MALÁSIA','MALAYSIA'),(153,'MALAVI','MALAWI'),(154,'MALDIVAS','MALDIVES'),(155,'MALI','MALI'),(156,'MALTA','MALTA'),(157,'MARROCOS','MOROCCO'),(158,'MARTINICA','MARTINIQUE'),(159,'MAURÍCIA','MAURITIUS'),(160,'MAURITÂNIA','MAURITANIA'),(161,'MAYOTTE','MAYOTTE'),(162,'MÉXICO','MEXICO'),(163,'MIANMAR','MYANMAR BURMA'),(164,'MICRONÉSIA','MICRONESIA'),(165,'MOÇAMBIQUE','MOZAMBIQUE'),(166,'MOLDÁVIA','MOLDOVA'),(167,'MÓNACO','MONACO'),(168,'MONGÓLIA','MONGOLIA'),(169,'MONTENEGRO','MONTENEGRO'),(170,'MONTSERRAT','MONTSERRAT'),(171,'NAMÍBIA','NAMIBIA'),(172,'NAURU','NAURU'),(173,'NEPAL','NEPAL'),(174,'NICARÁGUA','NICARAGUA'),(175,'NÍGER','NIGER'),(176,'NIGÉRIA','NIGERIA'),(177,'NIUE','NIUE'),(178,'NORUEGA','NORWAY'),(179,'NOVA CALEDÓNIA','NEW CALEDONIA'),(180,'NOVA ZELÂNDIA','NEW ZEALAND'),(181,'OMÃ','OMAN'),(182,'PAÍSES BAIXOS','NETHERLANDS'),(183,'PALAU','PALAU'),(184,'PALESTINA','PALESTINE'),(185,'PANAMÁ','PANAMA'),(186,'PAPUÁSIA-NOVA GUINÉ','PAPUA NEW GUINEA'),(187,'PAQUISTÃO','PAKISTAN'),(188,'PARAGUAI','PARAGUAY'),(189,'PERU','PERU'),(190,'POLINÉSIA FRANCESA','FRENCH POLYNESIA'),(191,'POLÓNIA','POLAND'),(192,'PORTO RICO','PUERTO RICO'),(193,'PORTUGAL','PORTUGAL'),(194,'QUÉNIA','KENYA'),(195,'QUIRGUIZISTÃO','KYRGYZSTAN'),(196,'REINO UNIDO','UNITED KINGDOM'),(197,'REPÚBLICA CHECA','CZECH REPUBLIC'),(198,'REPÚBLICA DOMINICANA','DOMINICAN REPUBLIC'),(199,'ROMÉNIA','ROMANIA'),(200,'RUANDA','RWANDA'),(201,'RÚSSIA','RUSSIAN FEDERATION'),(202,'SAHARA OCCIDENTAL','WESTERN SAHARA'),(203,'SALVADOR','EL SALVADOR'),(204,'SAMOA','SAMOA'),(205,'SANTA HELENA','SAINT HELENA'),(206,'SANTA LÚCIA','SAINT LUCIA'),(207,'SANTA SÉ','HOLY SEE'),(208,'SÃO CRISTÓVÃO E NEVES','SAINT KITTS AND NEVIS'),(209,'SÃO MARINO','SAN MARINO'),(210,'SÃO PEDRO E MIQUELÃO','SAINT PIERRE AND MIQUELON'),(211,'SÃO TOMÉ E PRÍNCIPE','SAO TOME AND PRINCIPE'),(212,'SÃO VICENTE E GRANADINAS','SAINT VINCENT AND THE GRENADINES'),(213,'SEICHELES','SEYCHELLES'),(214,'SENEGAL','SENEGAL'),(215,'SERRA LEOA','SIERRA LEONE'),(216,'SÉRVIA','SERBIA'),(217,'SINGAPURA','SINGAPORE'),(218,'SÍRIA','SYRIA'),(219,'SOMÁLIA','SOMALIA'),(220,'SRI LANCA','SRI LANKA'),(221,'SUAZILÂNDIA','SWAZILAND'),(222,'SUDÃO','SUDAN'),(223,'SUÉCIA','SWEDEN'),(224,'SUÍÇA','SWITZERLAND'),(225,'SURINAME','SURINAME'),(226,'SVALBARD','SVALBARD'),(227,'TAILÂNDIA','THAILAND'),(228,'TAIWAN','TAIWAN'),(229,'TAJIQUISTÃO','TAJIKISTAN'),(230,'TANZÂNIA','TANZANIA'),(231,'TERRITÓRIO BRITÂNICO DO OCEANO ÍNDICO','BRITISH INDIAN OCEAN TERRITORY'),(232,'TERRITÓRIO DAS ILHAS HEARD E MCDONALD','HEARD ISLAND AND MCDONALD ISLANDS'),(233,'TIMOR-LESTE','TIMOR-LESTE'),(234,'TOGO','TOGO'),(235,'TOKELAU','TOKELAU'),(236,'TONGA','TONGA'),(237,'TRINDADE E TOBAGO','TRINIDAD AND TOBAGO'),(238,'TUNÍSIA','TUNISIA'),(239,'TURKS E CAICOS','TURKS AND CAICOS ISLANDS'),(240,'TURQUEMENISTÃO','TURKMENISTAN'),(241,'TURQUIA','TURKEY'),(242,'TUVALU','TUVALU'),(243,'UCRÂNIA','UKRAINE'),(244,'UGANDA','UGANDA'),(245,'URUGUAI','URUGUAY'),(246,'USBEQUISTÃO','UZBEKISTAN'),(247,'VANUATU','VANUATU'),(248,'VENEZUELA','VENEZUELA'),(249,'VIETNAME','VIETNAM'),(250,'WALLIS E FUTUNA','WALLIS AND FUTUNA'),(251,'ZÂMBIA','ZAMBIA'),(252,'ZIMBABUÉ','ZIMBABWE');
/*!40000 ALTER TABLE `nacionalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(90) DEFAULT NULL,
  `Login` varchar(20) DEFAULT NULL,
  `Senha` varchar(30) DEFAULT NULL,
  `Email` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'UsuarioTeste','Muito','Bebado','bruno_c.xxe@gmail.com'),(3,'Juca','Bebidemais','1245',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-29 14:15:16
