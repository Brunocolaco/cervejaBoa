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
INSERT INTO `copo` VALUES (1,'Calice','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((ÿ\Û\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0>\0\0\0\0\0\0\0!1Q\"Aq2BRab‘¡#‚’±Á\ÑCS²$34s£³\áÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0!Aa1Qÿ\Ú\0\0\0?\0ûŠ\r‘Žn\Zššq\ÎV¼@URžS0ý\àš6\ÞG\ëŠ\r‘\Ê     ‹t«4vÚª±\çA\änzµ¤š–^f\Új§—\ÔMT\ì\Ö	[>\ë\Z@\Â\ãÞ¬T\Ò\Ù\ï5•MŠ7½\î\'Ž¸\É\á÷Š\å\í¥\Õ\Ïd ·Ò¶Zº\éš\çzŠ.µ\Ô\Ïôq·—mxc!¨~\í®\Öw€qû!sŸ“\Å\r•‚\"\Òý:™æ½¸iðÂ¿\É?k\ãW”o¹Ó³wÃ™Ý­\ÙXó†+j\ìULùL›§¼\ä\î ù\0µ:\Ðlõ\â\à\Ó]®cŽ@ŠYG\äWO/\Ó/­\ìMeòM\å=\Í\Ò\Éck¢’va\ä\ç.\àOr\ïÎ°\êÖV\Ól•™ŸŠF´þhW¥Ž\0\n\Ò\'€{\Ô1\Æ\ï9 ø„\ZšZc\Î&~˜1\ätŸÐðÀòJ_\è\ÇøB`\ØAyF\Ñ\à\r\ÐG<.\r÷¢w\É\Íý\ÐI@@AS´\Î\Ón`õª)\Ûÿ\0+Q+\Ò\Û\Å\ßj¬”f\á]Nz‰\È\Ñ¤»Y\Â\Ù\éWMÿ\0sP©¿8ø\ÍZ,”*þ:u\Þj	h(¶\Ñ\Ú,/—º)\é^|DyB¥\Ûp\×x«E‡PeU\ÔT´t\ã‰M!ö\ËU~\'ÕªŠ  ‡w·\Çr¶UPI\æ\ÔF\èóÐ‘Àý…>\ÍW>jV\ÃV4\×AõSŽ¥¼5¦y®¸\îYiº \Â)j#¥\Ïpk[Ìž\\5\Ú\ÖUU\Ës\ÓÍ»ˆ¸£óW¯^˜\çßµ¢\ËbghmsA9ºQƒƒÆ¡­\æ=ñš\×5Ï¾~··^÷k$v|\Ó\Üõ[{Z6¿r\Î:jv\×Y-ùòº¨\Øñü°u¿ð3S¾J[….\Þ\ì\ÕC\ËRAWn)X1\â\æ5cæšª=\í+\Û,G“\Úr>J\ÃQ«¯ô”€	\çk\\\î\r`\â\â|²3zSIQQ|¬m%\É`ÿ\0Pò;1\Ä\î‹ÓŸ¾«¯¥¦Š–ž:xF#Œij\ä\í#\Õs7»\ãUU~¨ñ–÷use¹\\ú\åWv\ï±({´Y=<UI[¶¢š±\æh»`oa£³¨Ÿ[\0\åHZ\ÛI®.~‚[—s#Ÿ,ª*v“h\Å¬\ZpÀ÷åŒ¨%¬n~\Þ.>6ª£d-·;”\á5›·ö¦š]O z\Þ=•œ\ÚúÍº\ÛIn§S7\r\æ\çzN=\\{\Ömu“”QsWžœ=\Õ6ö6FuS‡g«#\àVµ‹\Ê%–\Ü\è)…<\Ó\éi:\á2jÁ<O>Òº˜–\êg´;Œ:Á\Æx‘ð*\éŠ+¦\Ê?hô%K\éÝ£~\\ý,õ†\" tX«#¯\ÙíŸ¡°[\ÛEH3\ÇTÒŸ:GždþFÖˆ8–§ŽM¡¹oY0ÃŽ}\å\ÙO¬\ÇXú\Z\\\0Y‘Ë‰?ºº\Ö8\ï¢\éŸ$\ÛH\Ç8–Cr|qƒœ5€ph\Ê\Ìâ €€€€€€€€ƒ–·TR\Ñ\Þj\É!‘º[Èœ´\ç\Î#€ôUb_kG\ßh\Ã\éXøˆ\ä\Z\â|49Éy=J ¤tŽ\Æþ¡\Û\ÙCFœjÎžq\ßÞ”‹U@@@@@@@@A\Ãl¦]µ7V;´\ÖSA†ó\Ò\\\çg‡µ>³k\è\é…™\ë¤*\Ö8Ï¢\'™h/Rf\ç8\É9\äq…žG~¨      \Â*\Ô\í0°¿\Þ\äx\ÖUT\ÃG<\ÃC^\Ö\Ðqôýý¨9{@|/š¢R¥cr\à{YŽ\ZO¹V0•Irª«§|Û‰\"{\\X\"’Gö±\í\ÎÑ¾Ìº*\ZªºwIqÉ™\Ë{\ç˜\rkZ\0\Ç5••\Ò2x\Þ\ÝQ¸HÞ¬ þH\Óv¸8pA²—F\×:‰þA£Ê›‡F\Ù<\×`ä´ž\ìŽô]n\Ñ\×1ÛŠÁ%£ù\Z8û¤ppö‚§›U_,ra\ßV\î\Ä\Ì¢H\ä=œ{\Ôò\ÔKmú+}42Ë †\î„mq\Î9œŽY\Ïzé¬£lö\Ù2°])\îTJÊŽ‘\È0s\\\ÒN}¼0³.µ}4»Ô¶¦f²ŽªY_%>\ê¢^z\ÞQjpn9“Ïª\Í\Å=Ú®\ÕW1CXNú¥ ³Àc’\Ì\í¬}?c*öªå»ª¹Fi¨Ó£z1,\î<\ÓÍ­ý«{«zª     ñª£¤¬ˆ\ÃW\'ˆód‚·øN\Ä\ßòi„?\íþ\Ç!1<P\ëö\n\É\\\ÍÜ»Á1¥„3û@C\Å\è»f¨\äÅ¿\Þ7‘t®w\ÈðS[\r’´d\Òq\ÓKsã¥¡Zx¬ ¶PAƒ\rœ{Dx”\\J@@@@@@@@@@@@@@@@Aÿ\Ù'),(2,'Caneca','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n\n\n\r\n\n\r)((()++++++++++ÿ\Û\0C\n\n##&\"    \"&$%###%$((&&((+++++++++++++++ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0E\0	\0\0\0\0\0\0!1\"AQq±2Rabr‘#$3BSd‚¡¢Á²\Ñ\Ò%4Ccƒ„’”\Âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0!A1ÿ\Ú\0\0\0?\0öT\0€@ \0€@ @ \0€PFôr¨\É\Úl\ÅGW4‘S²Y.\Ðò\Z\0ñ‚ø–ÿ\0T„1:üÈ¸6@€\Û5™1\Ùõ$>«oÜƒM.`\Ãjjù$-«¶­‹\Øöuó€ô€A@?\Å=ŠŽ)\Âvsj7:ú{´t\ZB†‹d‚\Ò:A‰¨rH\Î<\Él.\Æn*‡j\0 „¼R¨Q—[¥\Õ#\Óô…hp \0\î8|ýˆ>šjF\Ã1¤¨žx!eSNøÄ’\rNß»\ÅÝ½j%ýt\ÃSn>q\í~\Ì*\Ê!U«Tu\Âk}G±–÷Ç¤„\è±Ub-\Ù\ÔÀCg„\ï-¾özZ\áÀþ÷Ab\èø§±œ¾núÁü*\Ð\Ý@  ]\0þ8\\Ó•£\Í\ÄT\ÓLb§kt¿H\çq\Õ\Í=\î/™j(›¥\'H¶§Hò\ã\Ún¦˜YŒ\åº\\·%6-…™\"kfdu0\ë.aŽNm÷õ v7¥©é©‰\Ô\î>¯Ê²ÿ\0ªÝ©â˜¨	1Ý…¬Ç—\ÎÜµC… A@\'©«qô¿e¯þ\ë*[™©¹^	]N\Å\Îo¬\Î{0©T!ª\Ú`”µŸb\èeö\\ùbS\ã\ÅeDÛ¢ª{\'\Ë\î\ç;\Õgr\Ý\Ö\0€@ j˜\îT\'\Ãwâ’Ÿ:¾!\âÊ°‘‚F9‡ƒiö\îTr¸ 2\å)¢<YNñ\íŽÿ\0Òªx\éi%\ÛRÁ/\ÚF\Çû\Ú\nÊ·Oô/õOr0\Ó3‡¢\Î\å°\é`™ø §®¨wS\Òþ!\âÊ¢\È9Œ°\ß\ìz¦t^¥¿­\ái<6À]¯ w\Ý\ãþUùÍ¢yôOr\ÈW‡7\ç.=lj\Øn°\0ƒ\\ÃšUVßœNz\Þ{Ê´9Yk/\ròž–\ÔI\ï/+U<3\ËL-À°\àxòh¿„)Uk~Î‚©þL2sJ‚¶\Z9\í=q·¹n†+\0@ !\â\í)¬)ºj\ç?\Íj†\Ë#UeK)i¥¨y³bayö	ã¤’›+\É­/%,\ß\å9¶\ï+^§†ô0rjH û(\Ø\Ïø€UK5Í±Àk\ÝÓ±sE½>o\îNCKGS@[¡’Àd6iH8\ÜÇ™•£ø^®#ðk*c\ä^æ¸›¼7¨ut­!\Õ.n¢Ä€Dr\×=\Í\Õv±\Ñ\Ä\ÛùrH\0œ|\Êb­>iÈ—•²\æ\ÓGÍ…„o\ß{\È\ë;¼\È1t­\ÅdC¾Ž7M/\Õynð\Æõ\ïâ’}Ç–«F§|›{^\Ò4ñ\ì\nÁO\Í~!§e®9­wA#t¼wƒ\ì+Hkðý Ý®\ät\r\ê+\\™§‡\éd\Ñ\ëiøñj•7~\á\Û\çA¶<×†\Ê\â\È\ä.p\Þm{Xy\íd|d£\Ðw\é<”\ZkqÖšId§x.k]bA6 _ƒos\æUQŸ±\\OÉ­š®_›\ÏW¢§5·\ÜË¤\08nT…•ó­\Ø-Xm;\ê«^\ÆÞŽŸœc¿Ö™\î°`\ë%J³\n©¬³ñIu<’+ˆG¬x¿\Û\îE2c\ZÆ†°´pp\n	A\ÉxQœ\"–”87”U\Ä$»ƒ>M¦\ï\ãeaT \ËT2i’†¶hC!˜>#øI¿¸­\"\ì8>9N\íT\Õ-x<A\Ö\Â} < Æª·3\Òó_…OT\Ï*žXá‘­**›³Mk>—.\â÷ôi¢“óiA\Zq\î‡\0\Æ=´±0{\ÜSE˜*ó}o‰†\ËH\Ëx\Õ3D\ß\Ó\\SQŒ™w™Ž¼—WS‚\çv\Ý\á¢\êŽ[?\åF³ˆG4ó\Ìf`|³<:\í¾÷-\ìDz†ƒ\Ð`\Øt4tˆ\àcG.6ñœzIXiy\0€A\ä\Þ*¤¨© \Ã\âf\Ô\ÇªE‰¶ÿ\0r£ˆ\Â\ê2mškUI\'N—9\ì¿M¬wY\×cƒ;$\Ô5»,nxÇ“´‘¿’a§-\Â2¬\Þ&c™¤ý\å\ã½N¯N_\Â\æf™€{?Ô8\Ó&_Ã­»7L?Ü“ÿ\0¤\é\Å)ð\\>3r»ýw4\êp’¾=†VÅ™¦.h»€/“w²\êœr5z]RÁ\Õmo<ºBX\Ð/\ÇO}•«¹vAS{ë—=‚ß²•£-AL­\\´L\nñÜ¹ƒcÑ¶<N••\Z<Gµ\í¿S›b¨\ä\ë|e\nñ:ªœõ6]C\Ü\àPQÀm$›J,VFù¥‰¯\îP1‡ c”\Â\Ð\âTOoù´¿È¦\r\íÊ™‰§û\Æ\á\ç¦)òu/\Ë9•\ß\ãaõJ|P¬ðuŒ\×\î›¢‹¯cLB`§I\à3ŠM¤ø¤¯67k#\0o\í*˜cI\às+Á#dõUO[\Ã\í\Ð\ÇcN\Ø\é`ŽžŠž&\éŽ6\î\rh\è6‰Jƒ-¡TF\Ñ»ˆA‚PJPB\éA(  …J\0 ”ÿ\Ù'),(3,'Cilindrico','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\r		\n\n\n\r\r\Z ! \Z\'\'**\'\'555556666666666ÿ\Û\0C\r\r\Z\Z&&,$    $,(+&&&+(//,,//666666666666666ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0<\0	\0\0\0\0\0\0\0!12q\"4rs±#Q‘’¡ÁRSa\Ñ\Ò3Bbcd²\Âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0úp\0\0\0\0\0\0\0\0\0\0\0\0\0U²\\\nñÕ¾V6H\ár±\Étºµ>Y€\Ë]7\à;\âo\ê]7\à;\âo\îu\Ò\Ûø÷³÷0L“5\\ˆ­²«U\ë@6€\0\0\0\0\0C¸W°\î©e\0² H¸£E»nñÀ\0\0\0\0\0;…y_\ê±ò@7¨ •\ÜQ¢ýã€°\0\0\0\0\0\á^@VÃº¬|\n.\ÜŠ.;\Çd\0\0\0\0\0ð¯ +a½V>H•%xJ+\Ðð\Ë\Þ8@\0\0\0\0\0¿Ü”\n¸_T²€YP 	wðþ	{\×}\0¶\0\0\0\0\0‹ø\É@§„­\è\ãì§€U@€2\0°Å¼sw®út\0\0\0\0\0ð;’\ÏÁ]z—ûmðÚ¨A“\×Ñ”UÁ\ÖñOß¿\è@\0\0\0\0\0¹@\ä`/¾`ª\à+\ítyÙ©§_ò%ú\Õ\0\0\0\0\0\0‡nP<\æŒO›\ròG\'¹Ê€t–@ÀŠ™-¼\nº\"ýe\Îõ\Ô\ÍþÀw@\0\0\0\0\0!w\àô:®ô’F½dL«·bô“\Äö»a\'\nú”d[VÈ\Ú¿\'\îÏ\çû\ÓÊ¼\î»\Ê=0\0\0\0\0\0@ù&\rS\æ—H¨«#*\ß+\àM\ïue\Ím—¸\å\Òi\âN•\Ë\Éõ Ò©¤~V\áõ/_SŽ_’~z¹\ê uT‘$µ[\è&r5\ïÚˆ¬\ÙuEö\Ú\ÐY.4ŒbD\×\ÕNä‰»£»¯“\Ø¤\0\0\0\0\0\0‡lj¯\ä\Ä4N6\Ö\×\ÎØ£l5\r\Îd\×vËª&\Íöö\éÙ¢x¬­\\µ\îU_\æG{\×fð7\Óh¾?I&xª\é _¿.\ïe\Ú\\n»\Ñ\Än!4\ßm™dkzHˆ‹½zIeù(Ÿ@\ë%¯Á\ß[=µ\ÕI&T²]m¹\0ô \0\0\0\0\0ÈŠ¬r&û(\Ð¬x\ÍDO\èÉ«TÊ»\îK¥€ú­O°¤…ö\çþS[“‹6õ™¶ø\\¤òo±h\äzÆ«U\Ò=ÍºZè¶²\í\Õ\0\0\0\0\0\0\0\ç\Ô\à8ET«4ôP¾eÚ²\äDz¯i6±˜Uif5\ÍORI\"\Ðù¾Ÿú×œ’/‹€\Õ\æL/Z“:–7\Ê\Þ½¹\Õ9+®\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(4,'Conhaque','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((ÿ\Û\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\06\0\n\0\0\0\0\0\0!1\"Aa2BQq‘’¡#$CRb±3SÁ‚ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0ûr+k ¡¥’® \é†!—3\á\Ð Öžº:†k’i>\Ö\á\Ü\ß\â\ï’\r|\à®O¥\Îû$úJ‰õô”\æ|Fú\ÚvJÈžK_!\ÒÌ´\î}™A:\n\Í\íÎ¾W²1ñpAnš-1„ \Ê \æ]‡,\Ó\ÌzG3	ù\áE:\àµôpz­\Õ3¾–ÿ\0h:``aPU¸À\'£’?h\Ù\Ô\Òs)ã“½\Í÷÷ •\n_Ç¹\Ô\Í\êÇˆ[ÿ\0\Ý÷(:H5p\ËHAVƒf>/õ¸üŽ\è-aPjƒI¤DùOF\ï’\nöˆLtm.ô\ä\Ë\Ý\ïv\å\äAJ3Ë¯-\î}\Â\È5AFð\ìR\Çê½­øu)‚\ä#4x ‘6¼ò\ê!“\Øð¨\é(0‚•\Î#\'#øÉŸ²¸.·f…Psnl.-ð*\àèŽŠ \×(\"¨pkZOMC\î®	PeF#GÄª\'Ph‚9\álð¾ú/¹Gˆ÷ \äZo\ÌuS\ì÷®°m¤\ì&ot‘ûr:Ž\å­\Äw2²¦Pg!(A«\äk\Z\\\ã€: ¡l¸6\ã$\Õv©Xyq\Ë\Üò=->\Ð:e]¨3”\Z  óü[Â´÷\Ú`öö+\à\Þ[³¶\ßN®\í\Õ\Í.5\ãŸ\Ínaµ7ô\ê9­nÿ\0VUŒ×·°q´ˆ\ÃüÂ¦˜ròÏ¹\Ùÿ\0ŠE®‘½±\Õ\"\Zv²fŸ]²´Ÿ¤$Z–¢\á$ºS\ÍÜ÷\ÊAI\ÜSI\r¹\Õ\ÕQ¸5™\Ö\Ú\Ì\ã1„…x«Ï–¸X,\Ö\ç\Êþ\éªN–{ô³$ü\ÂDªöøÇŽ\']ª§2\Ç\åF\áûF7wÄª>©OO\r4\ÓÀ\Ð\Èbhk:\0U\"\n%¾¼\ëš\ÌýÒ–º%w\à*Ê¦»›_t\í:´6Î‘\ÜFOôµR1m¡¦…\Þh°‡i|¡²F3\ã¨0 \ïUSS\É!”ó}V\Å)\Õò\nU\Âj‹»›g\ç}_óÁ(o\\c\â\åR;–%\Ô\âh\ê®nÄô\âˆ\ìóœö²<R¬{\Êzh)¡lñ¶(Y³XÑ€U\"#Ç´õqGKp¢s„†VSKw\Ö$=‚\Z[#u{B¹©¯?Ä¶«\í\r°T\Î÷ˆ\ÜZ\×~6žC[¨\Åx\Üõ	G\Ð,–Ák¶AG¨\É#ø²8—<\î\ã“\ã\ÑE^@@@@@@@@@AN\æiDPŠ‘–™\ãÑ±=¼\å½3\ìL\ß%¢m¶SX\ÝPm–\ã9 ‚?¥GC®\ê8†´¹\ÛÔ \ã\ÖW\Ü0\ÑIw\å\ÎèŒ±8º\Ã-\ÏvU:µ\äi\Ö\Z\ç\r‹óÿ\0D\Ô/sŸK$Og\'9^0$\î÷t\ÝE^Â„\Â \×!r‚µ\Â\çEn€\ÏY(‰\Ù;Ÿ\0;\Ðy+—”f²ŽJš\nmq´I)n\ÞÌœŸ€V%r©xšñw_?\í>ƒ£\ÒA;\è?ß²\ÔJˆøV¢\çPÖ‰Ÿ£P\æ—J\á&Œun²\ZNz\îQ\äþ½¼\Ç\Ã$‘=Žü±lñ@~ò$\ÈEzè¨¯b\Þ\"5\Â\æ\Ê\Ü4Hd.‰ g©q\É\ßDs­\Ü{u\Æ\é!lp’K±!\Çq\'\ZJB½M‡\è.¥\É\éjŸœ1û´ã®—\rŠ‘k\Ñj\n)©Rõª\Z\Ðso¶múC\\\ÒyGTniÁi(G“É¨]ù;7š\çói\Ç\ÙZ‘<\r$§¦k\Ûý8\ÃÁû÷B9µ~N]P\ê‰k\ê£\É\Ú&–>$¡Sù>d˜\ÌóL\ä»H?0õºxn¦6ÁO{ QÃœ{.=wU7ë“\Óp˜Lþ[%õ¤vd\é\à\çn­\"fy6¤’Xå­¬•\îŒ\âC–W²¥9{6v\Z\Ö7f´´x\r‚7Öƒ!\è5@@2c½\n\rPA@Tÿ\Ù'),(5,'Flauta','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\r		\n\n\n\r\r\Z ! \Z\'\'**\'\'555556666666666ÿ\Û\0C\r\r\Z\Z&&,$    $,(+&&&+(//,,//666666666666666ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0B\0\r		\0\0\0\0\0\0\0!2\"Aa135QRq‚‘¡±²\Ñ#$4Br’¢³\ÂDTbcstƒ£Áÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0úp\0\0\0\0\0\0\0\0\0\0\0\0\0P3eDv*ŒuÕ»†®\Í\ÖÚ½\ÚÛ°ˆ\í`kv“@+cvq(Ñº&Ä·NŽ\Ë,˜\0\0\0\0\0\0P3d\Óo\\	\êzü@ºN%c\ãO\Ç\Ý6ÿ\0NOy€i\0\0\0\0\0\0\0…6§LVð¡zzÏˆIÄ L\\hk‰¯ðÂ¿‰\éðL\0\0\0\0\0\0(xŠ\ì\â+\ßI™\êc¿H\ÉÄ r‹‰\0\ë\Ðs±\Z•ð\"‰¾•‘Àj\0\0\0\0\0\0\0…#v\ïM\à\Õ5Š½R±ñûU\0\ì¹nÆºß©@\ë\à\Üù\ë\åþkcû‘µ}®X\0\0\0\0\0\0(ù±®\\ªV%\ßM³R\ßð=²û\Z±\Ê\ÙclÕ¯j9¾%\ÔlÇ¯W´\n2\×?\å?½K,þG=Q¿…\rp\0\0\0\0\0\0 WQ*!’\ê\ÉZ\æ9:œ–P<¶Y©ra¬¤™~qB®¥™:o\ìµ|­²~`\Äy&2\Ç\Û\æù(¾÷ó[\ëP7¨)[GGOJ\Þ#di\æ¢ \0\0\0\0\0\0 \0ù\Î:•\Ønh‘˜{Qf®jK¸rÙ“1>³¢F-\Ò\Ý)`;¸E5V)ŒF˜›œ…»\ÞNœ\rs¸v\Ý}^©}:=\0{$\0\0\0\0\0\0(\0<¾y\Â\"¯¤¤\\è¥¦ª‰7ñ­¤k&zDý•ó‘|€_”¨¹#+™}´Ž©ð¶Gjù4DW½Ëªªª¨„	\0\0\0\0\0\0\n\0\ÌÄ—\Âg\êX\Ý÷dc¿\à	-OP¾]Zÿ\0½\è˜\0\0\0\0\0\0\0¹ƒ¹_e=\äp?¢Iý\ÍW\ç\Èˆ\0\0\0\0\0\0\0¹‡¹_e=\ä€ý^ªª¯\Ïx\Z@H\0\0\0\0\0\0P\0d\æw£0iõ¶\Ò\Ä\Ôó¤b\Ã-J\Ùi\êö~­eJz_·ú€\Ù@\0\0\0\0\0\0BÕŸ¢§E\Þ\Î\ÆÛ®þÀ<nfÌ”õ©¸jH”0®Ü’#ªõ\ì6\Û	¢5{\ë{ø€¯,c|\ê\Ö+\åÂ¤²¹d\ÛG\Ä\å[o9\é«UtT½ú@÷q\Ô\Ã#vš\ä° \0\0\0\0\0\0`M‘òô¯sù.\éÏº»u#Ø—]UlŽ°\è²~B\å}2\Î\Ç*Y~Y\îõ9U\0²|¯‡\Ôö\çT>úöù\ÝrTY+\0‹öe}õ]ä²¾þ4sÀ\ÜcQFµ,\Ô\Ñ:\0\ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(6,'Lager','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0\n\n\n\n\n\r\n\n\r)((()++++++++++ÿ\Û\0C\n\n##&\"    \"&$%###%$((&&((+++++++++++++++ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0D\0\0\0\0\0\0\0!\"1Qaq‘2A¡Á#$3BDR‚’“±\Â\Ò\áSTbr¢£\Ñ\âðÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0úþAF@<‚°\ãx•L2\ÑW¥l\îªJ¤)FŒd Þ·Ï›\èËªR•Œ\àß“\\¬7õ¿–ŸÖü\ÝÕ\Éj>\Ç\ÌAT±\Z\Ë\äUÿ\0\×ùÀ\Ç=¤t®¨[Õ°¸‚¯R4•W£L\\¸\',¤\ÞA!FƒI™\ZS\È1()»h?\â\ç\Ýµ,\È\èYsqj{©e\ÆiËºH›\\BŒ€M\0²´ \0%\ë÷Í²\ë›ôe\ëb0+|\áV%À#,½\Ç>´ý$Šˆ@D*Â¡€Šõ{\ê\ÝõKÓ#\Ì\0r\âÀÁŠü] n\020,\ÌÒ‚!–õr©Ë¡°4\Ã\Å@6@00\Þr§t\É´\0¶[ET€Œø„^\î_¤s\ì|ŸXR|”\Ø\0|À`\ËyyO¢/Só\"\Ä	\04¦ˆ$]\ßyõ,û¸:’€\0F§Š0aµ\å^Tþˆ.ù¿ú–\Ì±YÄ*DC RJK\'\å\àv«\ÜaÔ²\î\à \0)óƒ	–û\Ù—3¯(Eôª\\½07D¡0 ·\"\0\0À¦Õ¿uƒø•\Zó>W\â\à\0!]ò{@Ï„Z;[\Z4¥\ã¤\å/\î›s—¥¯ #¤¡4Q Zd\0\0\0Ed§/3ÿ\0\ÝÀH\0\nk\Í*”\ã\Òó\à\0\0€Z@`\0\0\0S^Z\'«©}ÿ\0¨\0ÎWS5\Ífü\ïô¢\0\0\0\0\0\0\0\0,bNÓš\çŒsÿ\0(²8§\Ô‘fœ±Û¹y#Ew6\\\0\0\0\0\0\0\0\0õ\Å;{\nõ*p„iñ}­¶—ÁÇ± 9V#,Nñ/\Z5b§öy¢Ž©\0\0\0\0\0\0\0\0Ú¼Rž+V®hõ\ÜB\æ\Òiy(9\ï*Kè¥“\èÌ¸=B¼ —\ÅyÐ€öe\Í8¾Æ„nx…,+hn*\\\Ëwm{+EFO\ãVz©8÷$\ÙG«2\0\0\0\0\0\0\09ûIŽ[lþwŠ\Üü­7<¾t¹£¥,\Ã|-\á•\ÝI\âö›«\é\Ï\\±X-S—7*/,øpe£³íŸ±7*^^[§Î¨ÒŒaõ%J®]\â‡í‘°´b´b7\Õ\Ôy¡Rœ4öp·\Þ(\å\âž6ZT§¢\Îwµõª–ðœ*¤²i¨\ë“|Ro¤Qõ½†ÚªU€[b”¸NkE\Ä>ehpšõ®¢\Ø`-HRU¼4ð¼¶{;Kj0¬&¥M\Öù\'\nƒRŽ}Y¢Añª¾1¸\ÊK\ÙT\ãÇƒ”\'—|T€§û?c²\ç\Äl\×\Ú~RE]û½b©r±[U\Ù°(¸ðŠ¦•;\èWŸ3\ÓN«ü9.ò\Ä}WÁ¦Ç½À•J»\Êõªºõz\"\ÚQ\ÓÜ€ôÎ©Dpû0\r\è\0À`V€I¼À‘dQ\0\0ÿ\Ù'),(7,'Mass','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0			\n\Z\Z\"\"$$\"\".....0000000000ÿ\Û\0C$$)#    #)&($$$(&++))++000000000000000ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0D\0\n\0\0\0\0\0!1A\"Qaq#2‘¡¢±Á3BRbr%45Csƒ’²\Ñ$c‚\ÂÒ“ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0\×(\n€ (\n€ (\n€ (\n|cj0|\ä±5\ÂZs¥´$¨å½¯¦ƒ…\Ðñ¦f²—\ã°ò›^ ”¥>\Å(Pv%òx¶¤÷\åù(\Ð/xš\0»n	*\î·ÌŠ½\äUþÎ—øÚ‚.n\Ó\áX{¨jyr)s\Í+A)þ¤\æh\n€ (\n_l¥™[Q-GƒGtžÀ\Úmñ½Ti¸J0\Ø\é\áf\Óð¢%.šŠ÷2hÂ€¸ \Ïü\'µ\r<R¾UE\Ëf¤ªV\åj½\ÊR³÷‘\ÐWµ5)@PAbY\Ä\ß[‡¤¥­J\ïQ\'¦ª5,`r\n\ÚO²ˆ˜K·¢–D,(\ÐFŠ\Ï<#¨©\ÈmŸ°³\ï\nnÂ¹Ÿg#ýÒ¡\í¿Î¢¬t@Px¥¤¨ðô…x\ì\çÞŒ\ÑqkZH\'*o{zTXv}+v.õ\Âò\Zdk•kÃ«¤4î ´F‰\ri\ÌL‚9yGGý\Í\è\Ã\â)D>¡ký+£\â\å†D£>\êJ-þó¿ûª†\Ô\Ã	iD.Nœ,ó\ßû¨ªN\Ó»’C;\ç­\Ð\Î\áR‚\â(U¯X »x:F\â\Í##‘•\åmõ‹ ªŠ¶\Ð@\Ûÿ\0@\ç\á?\n{eñ(ñ\ìe‹*B¡\Ûa­T9ƒ©øø³pPnÊ¥œ \r\ß[Ž\Ûs¢4\à°(¯3‚{ª£\Ò\å\ÈšŠt)4†\Ü#y¶TR\ÙÝ¸Q~ŽñH¶kuÚƒ‡fvŽv5m\Ç@}™+Kkm\Ãk”ôRB‡_ªƒS/\í\å\r®õ:\ç\É+\Íþ\Ð\'\\Ðœû :z\êøT)øx¶ò@‡5“Z®[I9\Ût\rN\éÁkÛ˜ \Ê*J‰Ÿ©¿ü5ü\r‡¤\É#W^6Eô\Ôõ\ÕF‰³øo‹(Àx»¡ö\ß\Zhð7O ƒDY\ÂHª\r\ï—U;¨A=T)Im•:³d +¹\"\æƒ\"Ä±EbsÝ–\â¾jx\Ú\ÖJ@ôQ\\‘pÉ³$Ç¤?ue\ZeUõ¹\ìµ\É\åPi\ìv0\ãc\Ç1\Ç÷„t’Ð²A\ì7\×\ÕQKV\ÆMhoa\ã2·\éHx\çl«´uUG“$=ˆl÷Ž%9\'C9òónDs\Ò±\ê¢,ðe\"l&%·\æHm.Õ˜^\Õ\Z.@¼wG\ÜWÂƒÀnF\êÞñU\Z|\ãh\ÈG\"4zTå²‚p§¤ª¨sð\Ñ»h§RÝAÏŠ%ó†Iñd\Ýõ6R\Ú{U\Ñù\ÐSñÍ\r\nˆ/!™j?¼µ‰\ÓÑ¥\×à½¡\âø„‚:eÔ¤*\Ú\Û-Í»\ê4¿Pö\r\âX\Ä[t-\Èø\ÈÈ¿yº¨VÆ«ô-\Þû•¼\×ôº»{**mÿ\0¡sðŸ…³©*Æ£v:=Zš¨\Ð\ã‘ù\Ò\Ú:\â û] °HMº¦…V”S–\åDy´˜ò>º¯‰@ƒ4 X*E\ï\×\Ñ\Z\\(\nw,1÷\ÇÚ„\Ýý¹þj£—c\è\Ù)ä™’½EXú5w\ZGf8\ë\àt\ÕF‹	€q\ç\äýv¡2„utÔ²O»A0…­Š»h\Ä\Üu\Ð(f±¹°\ë¢=IIM€\è\ÐBmL“yayIòmž$©zXº£›Á\ÈZ0\Ùm9ô‰‘r9\ÙHE¯ê¬®.4QA\åŽ;!_f@ÿ\0\É\ÇOÊª96*ÿ\0“$/\íÌGõ[\åQS\ï›0\á\êIøPb›+ûiƒ\Ú´\ÕF\\vSG‚¢°}Kv‚t\04¢R/Õ­¥k•=|h…Š\n&\Ö\ï?8!F.(Fx%\Õ7õwˆÌŒÃ¶\ÔT¶Á+3s\ÕÈºí¡‹}Eýú¸¾ OA*$öGGK\ßZ…T9±ì©­œ†T,§‚Ÿ?\ÍQp{\rELHý]\ßÀ¯…)²úbñ­ö‰÷\rTiQúf[ƒ\Î\ã\Ûú —\Ø{h<\Í~Š}\'•†ú[ˆ 3\ÇN\Ê\"«µX;“c½‰%6—!Œ/û¤T;Õšþ@ïƒ§w\Ñ\'8<\Íø	ô F±r Ä±\Ñc\0\ì÷‡’k’G\r\ëHO·€ ®\ã\rn°ø\Û;Erg+v¥ó²Žw\ÞW´š¨·²\Òe¶,†\Ò‘Ø‘aQI•ú³¿_\nGg\Ü\Ä\â¬òQ\ZE&ª48n\îö¡l…].D@q7ó\\\nZ‚H\ämA9¼òÅµi\Ì±@°sTõó4Ôª!©¥¶ó/‰°J:\ÔtHôš½¡˜b`òŸ¿”K}rRŽTûhª~\Å\íZ0–•Q]”\ä§\î\Þ\ì¦ù¬”e²­Ï¶‚ò_\Úš\Ö\Éâ«‰=O½B¸Ý‡\á\é\ã\Ë\Ä$k”]\×\ÞP\æ£\Ù\ê˜%——Šb„+xeJ©a¾9y“õEN\Ð%Ä…¡HW¦ƒ	‚û1@¨\ÖII(C\ËŠ3ôsY€\áU\Z–ƒ3…°¤6\áy×ŽgŸ_œ³þ(;T\Ñ\Þ\']GG\×@ô`•°‹ùÀY]\âˆt$$õõPr=˜t\Ýó d¿\ÙÉ—û.\Ú\åF\r!`ùÛ®\árÿ\0:+>ÁZ\Ä\Å\áL\ï\ßÍ½e\ÍW«ž@s\'… ŒœÄ§&\"!‹«¸¼\ç\É4\"_\Â0ü5$Dh%KúGOI\Åþ%ª\ê5\Û@P%\Ãf\Ôz \Åvr|RkŒÈ½ŠIºMˆ:j=uQyƒmD^$‹$”¥Ç•m<\ä\Ý#\ÕDt\'i0û\î\Ão«ùd|h¦_\Ç#¥[\È\Êu§¦ó¡]\é¸ öŠ£Ÿó£§i.£Š“¥\\÷­gO@ qÍ·\Ù\Ç/ý\âP\à)^f\ÉMŽš\ÛZƒ‡i$G\á²*4k\ÙGz-` u#¿G‚ø\ì:Lœ·|<[sÊ…e—Ö¢¯t@P!\Ô´´”¨~«\Ðb\Òö7i\â:¡\â.:‘pd…ƒ\Ú\07±\íP\Ó8V\Ñ\ÇYO\ä\éE7\æ\Êýœ¨;\ÑA\Öµý\ÒÖž°\Õ\è¤\â\çD\áÿ\0ñYÿ\0­F/{-Ð®Wþ[ B‘´ŠP\ÜaŽwˆC\ã»4\r£göºC¹„	]©\r¿2ƒH\Ø|f…-©¶Kï¹¼-¤\æ\È,Æ—Ó•EYh\n€ (\n€ (\n€ (\n€ (?ÿ\Ù'),(8,'Pilsner','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0‚\0d\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0A\0	\r\0\0\0\0\0\0\0!1AQR‘¡2a±Á\Ñ\"#STcr”²$%5Cbdq„\Â\á\âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0Q!ÿ\Ú\0\0\0?\0ý:Ö‘³\ÅN„B1\Ä+ižÉ’!ž^}52\Í,ICtv\êGFç¶‘\Îjª.\nœ\èoK\Ü3¹ý\ÊOq–Ÿó*Óª¢OÄ¥ÀE7— ù\Ï\îr{o\ÔT‘ùô÷þ\ÊOqz\0©´\Þ).¯´©::m$°º>~o9=Ž\É\ÃG•»Vú\Z\Ïò,\É‘²m\Z¶A´\0D#I€\0¦\Ó\ëð\î)\ÕU\'\âRä¥°p­º·ù‡/it\0\0u\í*\åú‰\ë,J\Ûg\ZËƒ¾•¹?\Ùd\0\0H\0YŠKo\Å\ß\îŒ\ëV?½©\î.\Êtn\ïT?\é`j÷*¡p\0…$\×2\â¯ *f*—ö\çr÷a=…‘\Ãfn-Ð»µ—w®N\à\0\0\0\01#$¡IV²$!$Eejl\Þ(d\í#Ø¾\nž¢Ì¯»&šN\Ä\Íñ\Ê{K\0\âMÕ¶¡\Ý;+ƒ´­½ü(`‹\åfc|x\ÙM\êš&v\Z‰\àn\0\0\0\0 \0Á2\0\0\0q]\Óõ|‹\ÙÃ»•\ìjå¨¦ª¦oi¥giªž»l›\Ú\nwõµ\0\ê*k\×nñn‡©]\"ý_j–\Å;>7SÊ½S¢}®wüp\0\0\0\0\0\0\0\0\0\0WÙ¸R¾/’•\ì\îwÀò?”T–û\Õ\æ\é#–™Y4\È\ÔÊµfQ\Ø\éL¢§\0=qMa]õeÖ§¡Ó¤iý\Z\ÔöªœS\êûv°=dv\ë|«\Ì\Æ3¥\ÎrðDCn„ª†\á¥\é+\é\×0\ÖmT5\Ü\ÛMs•Q{°X™µ\è@P\0\0\0\0\0\0\0\0ù\çôZ\èøa—Kf\ß\Ç\×>!ô\ãÁò‰Ã©4m\Ñ?u[%#¾¬±ªú\ã@(¹|¬òG\'·7FŸ\nh÷-Fô¹\Ü\Ö}H[¼‘¥,\Ö\ìai(\â…S\Ò\Ö\"/Š–ñQ¥-\Ëk®ð#þ£dwƒOª\0\0\0\0\0\0Ž\Ò\r´8Rb7\ÜMAa´ƒ\'ø,½ƒŽ·SY¨¦\Ü\Ô\\i\Û7cm2x.P®ºŠ\ë54Í¡•TTó$Òºg67¹\Í\æ\ØWpEN~)\Ä\Ñp\äŠ\Í%R\Ïl¸W\Ð.UR,¤Ñ¦z™Ç£%ky6\ÕVù£šÏ«bM•\ãL/\ÙT\ê\Ã]‚\Æ7¯\Z®uZò\ë%\ÐX£¦­¢•dŠ®®xeUgÁU9\Ðúe§UD”M]@‘\Û*šˆ’$’7aW­«ŸÁV\é={[\éuEª—<òC›_fT\ãü\ÏIXý\å\ãT\×O\"¦±1U:²\å_P”Î¼}²	á©…%§‘’F\îg1r\æÝ¤<¦•²\Ò\é{KmöÕ•a\ÚW¹ó?m\Îróª¯±ò’6±\ÛA¶…z\Î7\ã\à\ï\Þ +·À°s¡ ™ \03\è\0\r&@\01P\0Ö¦]\0\0\0ÿ\Ù'),(9,'Pint','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0‚\0d\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0@\0\0\0\0\0\0\0!1Raq‘\"2AQ¡±Á\Â\ÑBS’²#3‚ƒ¢%Cb³\Óÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\01!A2Bÿ\Ú\0\0\0?\0ú¥xH\ä\Ø*w±ó\ÛÞ a\ÑW\íG0xã¥•±QR˜˜d:¨¾öo\'áº—E‡\ÓF\Ý-´ñ*¦[\ã\ãozó}\æ3¼-cðø?«‡\ÑPp\Ú~Ÿg\Ñ0e¶\Þ\Åù\ï\Ý\ì|ö÷­ðºc\ÊÛž¡ôXµM1ô[°}RA\äE¥£Š|‹ö®i´ö¾šy\ßI][J\çF\ç¸Á1m´\Æ\çpõquË™¾­¬\à\ÔgJi\ã\Ô\çr“¤\\•ž¸v\"\"\" ‡\Ã\çj8‹ÿ\0?\n€þ™$\nN¢ñ¸Ëµ*þl8L-=fW•(]J<T•\éT•·,Yï¤¬§¬iEÁVU3ù“\íIÎ’j¦]Ô­\r¹uv)r\r¥\Ìa\Äf{üÖOVò2}kOY\ß\Çu…‚(˜Á\ÈÖ†Ž\ÅZ\"Á°ˆˆˆ‚!€ÿ\0:f©ˆ\â\Ç\ÓÀ:„z½\î*L£;>\Ðs5+Û¤TEKY\ç\r&7{X¤\ê£\ÅJ©xPYpVdoU™yP\Öù–mjª>)?\Ú?º­ô°¹NÓ§5p\ËBò\Ì1\Îy4w½kFVu\ìGMƒPJÿ\09ôñ¸õ–…œ­SB\Úzx¡g›PWV-„D@DD\ÌÉ¦‡>\åª\Ðò\r[f\Ã\Ü\ßC\í\î-*T£\Ù\ÂüÁ”ewûu\ï·Y‚O¢ª…zW…·+/<\ç«2Z\È-Õ»Lw©„û)\Ã\Õ6‘‚S?Œm©}K‡D]¿\ç#Ob\ê›´\Ð\Î}QŸr\ç[9h›h¤–\Ý\Ð\Ñ\ÔÉ«Õªf6\ß\à´þY\Ï\Ô;\"\",šˆˆ€ˆˆ\"™þoû»?3„\Ðæ½¿2‘U\Û4ž/”©\êom\Æ#Hûÿ\0t7\æRø$\ÞÁƒñ°;¼]_qx½T”=bH\ï(,©\nÁ\ÖuÕ¤°ó\Â<.©\ßð²„l„³¦39½£ œ}os\Þ}\êAž\'srõV9\Í\rd€=\ëS±9EV\'šgidr\ÅJ\Â=L\×Ã¸…¥¾Y\ÇÓ«\"\"Å°ˆˆˆƒŸ\í\å¤\ì³‘¼°˜f\Ó+ÁHò½@ªË˜dÀ\ßT\r\ã\Ô-ðZÍ¯S\n½š\æ\\.\r16\ê ü\Çkü aÎ½\Ý\Ðzˆ\Ç.£Ngiª¤ª•QV%w«ª“\Ê+a8+W0\â\å\Ý\\\Ù\Ïu;œ#_5\âCý7È°<\Zc¾R\Ä\êMÉš»”ôFÏª«iN\rÁ¤\ãk\Ç1\î‚R®ø1\Âc\Ùe;\Ý\Ë-L¯ö†ü«¾I\é\Í#¼º\Ê\",\Zˆˆ€ˆˆ49\î-öMÆ£\çR¿Ü¹¯ƒua—*˜/\àS\ÉÛ¤\Æ}±®µ4?\Ä\Z\îCÿ\0i\\Á’}\Û\ê)	\â\"™€t2¡\Ä{UÔ¹¶\á\ß\Õ.U*È¢±e+UP\î.[:§…£žK¸t¸.\ê\â\È\Úg\Üeš§ƒb\ÚYÀ\ëswcþ\Å;\Ø\Å3i6mƒ±¢À¶Gp\é‘Ë—mò¢\Ø%47\ãQW6\è=ß°.Ã³8·;?Àk^Ž7þ¡Š¼…tDY4acÑ„Öºö´/7µÿ\0	ô/ž2.=—ð\Ü]µXenü\ËvB\Ú?5jfð\êóA½¯Ð¾“ A\nQ²¬™-k«\Ó\ÓÔ¹ÚŒ”÷Œ“\ØWt´F\Ü\Ú3¦¾\\ùƒ]Í“\Äi\ÜÓ¤‡Q·\àÂ­;7P?„Y‚¾OPm>\è\Ö]F\Ép\Êe§šºžW—¶@\âP+e†d\Éð¾‚¾6úŸNùUŸÇŽcõ\ê)[˜£<˜®/\Ç\ÓölŸù-3+#\Ä\áŠ\\N©\îslR\ÓO¤›‚\ï°Ã†×Žc5ˆci\ïC±}’`Ø®iû\ÃW]‰?¶z\Ù`-nO\nÓ’\"{KS:rÍ¨Ô³ª\Â\Ã\ßaTN´»x\â4‹l8/Ç¡}•!4\Ù[€ð1\Ñ\Â\Ã\ØÀ:Ž\å_´â®®‚zù\â\ZcºZ/{Y­ž+¢µ¡­\rh°\0\nrZ-=:¥f»Tˆ‹7b\" \"\"\" \"\"\" \"\"\" \"\"ÿ\Ù'),(10,'Taca','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0			\n\Z\Z\"\"$$\"\".....0000000000ÿ\Û\0C$$)#    #)&($$$(&++))++000000000000000ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0=\0	\0\0\0\0\0\0\0!1AQRq’\"#3Ba‘Á$%4Sbr¡²³\Ñ\â2CU‚¢ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0ú\à\0\0\0\0\0\0\0\0\0\0\0\0\0S\ËÁ‚I~­ª\î\êd\rjYk\'§l¯s\åj+‘\Z«ª§\Þ\×£®\Þ\ïòÅ¨\ë7»ü€ÁYU[K˜\åcU\Íj±u\Âg\Þz	x\ÐG/\'­v>òd \0\0\0\0\0\Z7uÅ¶£\í7s¼»¿2S¦ Â€\ÅJoEŽ”À­Þ¶R¯Dmow\Åø¼\0\0\0\0\0_x_’5ŸY,mÿ\0¤_€Ù¤\0bP\0&óh;\"ü\Þ\Öõ+}\Ò8 \0\0\0\0\0\nËºýi³\Ýk”\r¦ù€1(\Éý\0`±¯‘¨oV¡ÿ\0Š5\ß-@\0\0\0\0\0*.\ßK¡Oµ\"ûš‰ñwû\0¿Í­d_+\\Î‰š¾ø\Ûûp\0\0\0\0\0Mvw\ÎT)ö&_\Óu]\äš,€_\æ€Ó²*­\Â\âœÈ°þUð\0\0\0\0\0Ÿ\Ú¬WSýºhs\ësDý07‘þM FuQ@™—§¬\r=]ù®Ss-CcOô¹üÀ^€\0\0\0\0\0P\í|2:\Êú¨Z®š\ÞöV1©Ê¼%Ì‰\í\\€(\êcž’F\í\æ=\Í^”]Q@\Ø\Þ\0\Õ\Ô7j¸\é W½Û¬‰Š\ç/F5P=lµ<‘Y`’TÝš©]S\"t,Ë¾‰\ìj¢t\0\0\0\0\0\å\ÍG\"µÉ–®Šž 8*)V\Ãs’\ÃP»±\"«\í\Ò/#\áv¼<õ£\ä\ì\ìý*X\îp=%K—*\è€só=\ÛCxeª-icT–\âþm\Æ\ê‘v»Ÿ\Õ\Úx˜D\ÂhœÀz\0\0\0\0\0\0€9ý­Ù´¾\Û÷!zC]\n\ï\ÓJ¼™\å\Ü~5\Âô¦¨º 2‚\éµVú—R×£U‘i$‘§\ì^f¹™j\ç·:qo¬¼WT\Å\È\Î‹†C\ãG<ýMX‰Îº\à¥\ÑQCJÌ²&E#\Ñ8¼>L¢~ m \0\0\0\0\0\0n¶a•·‹MÆ[\rDóxD®bH›®kŸ•Ž\ÑU¸ö¹°ö;}*\ÕÜ™¼1e’ŽIœ¹G¥;ÕŽ|môêœž ;\0H\0\0\0\0\0\0—i*_ò¸\ï\ëø$¨¶8Üž”\ÕJ½«S.@»\0€\0\0\0\0\0@\08´»ü¦–†\Ìtô’xT\Í{Ñ\ËQ[{\Ë\Ï\ãoc›	\Ò\Æ\Ã\Ý)Ö•Ö—\â:\È\Ý$ûœF½$Iž²9cVó5\Î\Õ9´®\0€\0\0\0\0\0s\×Í¡¯¶OÂ‚\ÍW_|\"­{5\åL#·´\ì•ºm•úfð™C]HŽ\ê\Ó?>ý@ª§´\Ün/Ì•w\nOy\Î|\rn÷µ\Z\×*ö¨d ªµB«Çª¬š7££›¼ô\ì\ÝL\áyõ÷yn\Û\ê\åbG=¦\åQ\"r¾:G&}x_\Ü¦\Ów©¸=Í–\ÝSBÖµ’T#ZŽUôQ7•\Ù\Ø\0\0\0\0\00\0\0\0\00€\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(11,'Tulipa','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0C\0			\r		\r		\Z\Z\Z\Z%$$$%((((((((((ÿ\Û\0C\n		\"\"$!    !$#$\"\"\"$#&&$$&&(((((((((((((((ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0E\0	\r\0\0\0\0\0\0!1Q\"A‘aq¡23BRb\Ó#EUr‚¢Á\Ò$CScs’£±²\Â\Ñ\áÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0!1\"Qaÿ\Ú\0\0\0?\0ýÁ           „€€ƒ\ÎZm5‡}¼¹UœHþoywƒŠ£@Ù¦?”«\ëGü\nE’ ~U¬ÿ\0vƒ¡gŸó_œ_v‚\Ô~rªó‹\î\ÐC­u@p¹Tÿ\0—ü)X\éë£»Öºz\éªakY¤ii\'9\0xðA\èT¢}G÷®AmH3\í˜55®ûmAŠ\n–ó«~\î³?ã„¢\Ú\Ë`-®¸0ýv8{Áÿ\0¥Fš€€€€ƒ—¸1Žy\ä\ÐI÷ ­ln(£\'›»\Ç\ß\ÅZ-¨(·Ýý´Y\ÖýT^PB	@AN\ë&šBÁò¥\"1ú\Üþ\nÁf&è­\è0 \í}\Ð\î_MUýT€;ô]\Ý*Á  „€ƒ:¿ñ•Ô±x72ô½j\r‘()\Ýc\ÞPJ\ßR°®\íóúEx½ƒ>\ßŠQaA(3K\ïE¿R&üIZž\r5@@@@Aò¨ù—g¢°gl¼…öv\á$\ÍÁ+Â¹z“Æ²Êˆ3\æiŠ\ïÿ\0\Ñ\Í„žŽi\Ô\ß<•F‚€€€€€‚¥Òª:[|ó¿“Zp<K\0¬•qõ+›=¨­”ô\ÏùÆ·2~›Ž§|J_V.¨>s\Â&Œ°ð<\Ú\î„r(3ÿ\0\ÒSTŠ+Œ¦ªw\Í\ï–H:\Æ\ãÀû9­qü6\Ókšá©§ ò!dJ{\Þ\ÖX,þV\Æ\Íôi™ß™Ç cr|Õ˜Ú—%[;nw\Éb»]!4”l:\íöóò³\á4\ßk\ê«\×I;z%†„î¶‹mÞ\ÔwQNÿ\0¢ñ\Èõ˜>\Åe\Ðüò\ã\Ù5ÞŽC&\Ì^ç¦9òHþ ZpVù±qU¥‹´z:\ÑOsª®ƒº\Í\ÄQ`û%{ð}\ëQž\Úw¸ö\Æ*\Zy.l‘\ØÁ-¥˜h‰\áþHvÍ§\Øþ\Ðo‘¶J\ë\åTQ\Z\ÓO\Ýõ±®Ê›„Æ½N\Ìöia²=µR·\ÓnŽþAÀ¡¤ž>²³snbõ\ë\r<\Ö\Ý\Û\"¹[\èi¦\Î\è\×\Ó\ï4¸´–ñe¸<rµŠU¦Àlý<\ÖÚŠ_O4U°išR×³=æ¹®y%5\ÑeD—ð=5»ö•\ÇÒºº\Ëu\Ô;õQ\éõð%\"4TQdj\î”t±—\ÈüãŽ–G\È ò—Iö²÷Q¢†\ÑPC‰#\'Ný\Þ{5º<t\Ó\Ån1wY4öN\Ð_#\Ý+i`\ïkd»\×JZöü—1º\0kLðz«v\Ô9¬\ÜÞ }Kfð\à²_¶\ÒÌŒ‚\ç§M·£žFcxp<°TW\Ñ\Z\Õ\ÐkM š\n\é±\Ûh\Ê\×T\ÚoLž?¡\r`|o¦ò-Mv:–­3q|a‡µ:YpúZ*ˆ‡\'\ï?ð)úX–ÿ\0·ô¸fý ”`•¼=\Îr»>¿?\åFÝ½„7d§aûrÇƒ\äSkõüq5wiuPþ&\Í3„¯#ö°ª}©‹iõÁ¢ªz:FgŽ$wûao\ïY\ÑÆ½–\Í\Ð\\­tNŠ\ã^k\ê\\s¯\ZXÆŽM`9\'\ÖI\ÉM:H\×mAñRÁ&¡ªh=!«Sm|D«U¨ê½@\Þ k( ¼ª@\É@A\nJ%Aõ-b\ÅWv9©}j\'Sº¢º\É\ê‚5ªµ;ª£­N\ê‚UD\ê=T\rGª\Ô\î¨ “\ÕA=T—ó[Åšÿ\Ù'),(12,'Tumbler','ÿ\Øÿ\à\0JFIF\0\0¶\0¶\0\0ÿ\Û\0C\0			\n\Z\Z\"\"$$\"\".....0000000000ÿ\Û\0C$$)#    #)&($$$(&++))++000000000000000ÿÀ\0\0‚\0d\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0D\0\n	\0\0\0\0\0\0!1AQ\"‘23Raq’¡±Á\áBCbr‚²c¢\Ñ\â#$%DSd“\Âÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0ú\â\0€@ \0€@ G3\Ìq—\r¶AI³Õ¸f7)\Ú:ŸÔ‚A-W·\Õù ‘ý)¢ù\Û\êü\ÐG¯©\æ\Þ\ïškê¹·»\æƒ\Óf¨\'x\îù ö÷T°_;výßšLõœ2÷|\ÐA=ul,\Ï\Ôv\Ðlv’@\ß:£hP\"©ñ@¾ƒm#<ÀŽ\ç‚teñ=\È+ u¾A5G\ÕA]\ÌR@\ÍKy\Ï}¤ÿ\0\å‰\0€AGˆ  [†›Àñ\ä¾QüE\è-?\Äv:\Ï š£‚ô	q>½m{\ï>oQŸÔƒP€@ ñ.ØŸøJþR%\é±}h*\×\Æ\Ð\á\ï@\Õ—xŽ\Ä=\Å\á„To\ìA\0Þ\ïÏ¤Q\ZÇž\×F\Ä\Z\Ä\àŸBM5u.ŽNò\×5µ]J‚6ŒñøW\Èºµ–\ÚñÏ±’­\Í\äžW\à‹œ5\â‚A\î=Ž*\ælm/y°knO˜m((Vb´t42¦L‘[0ó\ßpš˜,U´XŒ\Ñ\ÈÞ’Ù˜\ìc	.ly{3t\0ƒ\É$¥\ÅÌŽ7\Ìù©foÕ‘­p’2G0\Ók \ãŸ>¤l ŒI&]i€=f\Ä\ë\å-i\á\Í¸:\Í\ØÀ4os\Öö 2ev\ÓqÁ¹›k\0;W›)cœ\á¸_¹3	¥\ZC‹É‰WL*)¨Ë›º¬x6\ãŽ\âƒA…‡;l„¹\æQ$®q\Ü»c7½\0€@ \È\ât\ç\éð½S\\?4DrÕ*™\Þd\r†÷:\Â÷AÙ†\ï:=Ýˆ+\Í\âŸøO¹K@Z„\Õ\Î~Ú¥\çøŠ\r‹¶ÿ\0\ÇýO%\Ô\0ƒ?·-H\ï >\ÒßŠ´\ÚJ^ß‚\ÃyA\ÔŸs‡Ð‚Qµ4§“¹[Czš\'­\æeµ\Å‹G\è\ì¿\nx=­¹@\í\0€@ G¤#¨]É­w«#J\nØ›¬h]À—g\É¶\îš &ðZƒ\Û<z,\ÄÝ“©w(\Ü}ˆ38µ³ñ!ÿ\0bG\ÐPk°hòAo%±³\Õ` ´Œu?2Ž\à‚–(oE‡\Ëû\Ï\ÔÂühX~\èA\é/‚\Ô\Û\à9=\'“S€Ö¿”ý%&\Æb\Ð*X8\ÍLÿ\0±\Ìo\Å\Ã	vh\ç<5ò4z\Õø ¾€@ %\Ç\Å\ßJ\ÞÖ°þf W\\û\èõ¾C\â÷Yúf¥ˆý\Ä ó&\áÚ‚_²(2\Úy.¯Fª\Ç³ \í\ÙñA\É\éÿ\0À\àôcqš\0Gš7g?¡\Í%\Øcd?k$¯\ï‘\È\Z \nq\à2R\É\äL=  \Íc5\r\nšf\íu,¬¹P?ÑºŽ‘„S\Ë{\æk¶û~(\Ü ð\äŸPbhO\ÏKGJ?\ÔN\Æ\Ûó5|Á\Õy\àÈ¤›\Ùaú3\Ñ\Ñl“\Î\ÌÞ±\'âš\0€@ŸIž\"\Ã5\çt21Ç¿/\Å]-enS™U\çtyE\Ø\\z\Ã3­v\í8 “\0Å¦Ã¨¡¡š£«Á|1r\ÂA\ÃbO\ÒZŽ%Zwg‰\Íø óý¦§\Ô\çúJš\Å\Ä\äwuDtª:µ¯Ÿ“i©ûö›%–·\Å(e’	5Trk\ÊòÆ¸\å¸Š\Øm]]tÒ±Š^C·œ£sGuPl°hõXMg{aŒT º€@ )\Òxõ˜\r`±u™š\Ãi\ê\íÝˆ3z;ùs¤<kƒ˜w\Ú\î\ÚkKL\ç›\Ä\Ûó°G¢$‘œ}\ëû\î‚7`Ô¬-³ŸÇˆþH=E†\Ñ\Ç.´4ºKZ\ïqv\Ï0;],caqh¶Ã¹k£¼Alº¼<[d \ÓÀÜF\Ï% w \n¯\Ãh^o©h7¿W«´~ ÷\Ñc\æ\ïX \çDo	$‡ \çBm\É\Ö\Êo\Íû½…—\'¬ƒŸG\Ã\Å\ÒK\Ýü\Ðr<.‚7\çl@¿›‰w\ê%´\0€@ \0€@ ?ÿ\Ù'),(13,'Weiss','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0‚\0d\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0E\0\0\0\0\0\0\0\01!AQa‘¡\"2‚¢Á#BRqr“±²³\Â\Ñ$\'CSTbcd’\áÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0ú¤\0\0\0\0\ã4\ç*¨º\\¯5•½amt”ôñ;%k\Z#$\é{^ªX’7¢x¼\\_ô\ÝIÎr˜¨\Ùr\Éx¨\×ó:>^X\Ñy\Ò$üÀ\Îz\ß,ðbªšI§’Xe¤d\Ñ5\Ùd\Õk\Ü\×äœœNŒ°€\0\0\0\0\0\08r£Z®]\É\Ærb\Ý­¶\Õ97¤N^\å¿€š¾\å-ò;Ëž5¨r®õY²/\Ú,HE\áf#pÝ¥©¹(\áû´%ÀT\ì\0ƒ­\Î,Sg‘?xÊˆ±¯Dô	vM7K#¹R©\Í\í†Bp\0\0\0\0\0\0\åUM4_Š\Þ\Ô\Èõ\0AaL1iwø‘\' ‰\ê&%\ïv„§å¥šhÍ•È\Ù¨ vœ*tñ¯F~GöDôüD\Ù\ç$Ø®‘Ÿ\Ë\ÒI\'[œÖ§s\\N€\0\0\0\0\0\0\0\\µ\'ƒ\ß/t»›Â²©‰\Ñ#Ò\ä\Ñrý[\Z[$ø5´²\Ó/\Îb¤\î\á	Æ§r¡\ÕQ:€ˆ²ûõòñQðX\è\éS\Ín¥\ï“\"x…\Â(®±\ÅR\ä\Éõo}Rù\îW\'r¡4\0\0\0\0\0\0\0\0o\ZgØª\Ó|HW¢L\â_¼\'²+›N‘`Áuµ	¾žH\'ÿ\0I˜\ïQd\åP9ÈÄ“­.¹Î‹“£¦‘È½:W.òDƒ\Æ\Ùûœ‰\Ç\Â\Ë9së™^\åb\ÝN”vújfù0\Ä\ØÓ©=FH\0\0\0\0\0\0\0\0\0Tö®Ÿ³\\L¿\ß3ºÑª©õ\Z	¼\"Šžo\âF\×ö¢)W\Û,\éO²\ÌPõå¡’4ù\\šS\ë,6\é²\Û\Û\ÍO\Zzq]\Æ\Òi£µ·’K­W\é‘}Eˆ«m\r\É¶\Õ2ù1]\è\\\å\æE­ü@[€\0\0\0\0\0\0\0\0\0j\ïdEjÃ€ ·µ|{¥Âž‘•S^µ\îa±\àDŽ6Æ›˜ˆ\Ô\êL·\Êö\Õ\í;gø–¯Âž\Þ|\ädm\î\á\rÔ³1‰®G#\Z¼zœºS´+,¥\í‘Îf—º˜üºFGXÜ¹â•²~Ð•Ô‹ºª›\é[ù»AµX\Å\å2K|\è>\"¯`E––vT\Ó\Å4Kœr5\Õ\çEL\Ðö({\r¼{y²Œ5T\çj‘”©Nõþ¨•c_³™|\0\0\0\0\0\0\0\0\ä\ßd­·m®’\ãweRB\Êx|	Xõ‰®F®k”Ÿ9]š&Jœ\\‹™°-W,!_K\áÁ%O—;N¥Ï•\ç\æ¹ñò©¸ov[eò‰h\ïµÔ®\ßDI#~\\—rô‘”˜.\ÅEH”\ÔT^\r7Fˆ¥zqr&þNà²µ\ìUøs[¸[tk\Ål<yv”ý¡\âŸ6\Ç_CÁO\\Œ\ÑÁA#¡r.ôÕ¡Q:|dSx¿Z$‘¯‘*\Þöy*ú¹]§\äEqú+Ánº{aSa¥ª«MÎ©\ÎV§š\å\ÓÓ¸†©þ\ÅX¤‹fó¢p«Fúù_L\ç·J9ª‰ž•\åMYñ¢\"gžF\è<¡Š8\"lp±±\Æ\ÔFµ­DDj&\äDCÔ¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù'),(14,'Yard','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿ\Û\0C\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0‚\0d\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0A\0\n\n	\0\0\0\0\0\0\0!\"$14Qq±7ARat‘¡²Á\Â#Bcs¢\'23Sder‚„ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0?\0õH\0\0\0eO.X\Ü\È\×ZþR[à¤…{5\Öð\Äd\áV%K¦ø\Çw¢•õ\Ör4—ù25ß—2ûH\Ê\Õ\á1£ÓŠ›{Ê•Ar¬üÛŒ2bgsSq¸[YU6ó–D­>š±‚\êŠ-\Úú¬\åP¤\0P\0\0\0\0\0\0\0\Ãÿ\0…š/-Š\ßZ\ÎdU’\\»\í\ÙWµli¦}˜ T›³šW7\Ô\ë%SP\ã\åX‰<–±‰êº³FO«\ÞT«\ìDC¡rU@\0\0\0\0\0\0\0\0\0JjW\Ä\æ\ê\"SpõœM%‹\":Y0í»ž\ÔE\â®Ô²_iUtvh¤Á\Å&s¬M½Ë½Gx\Ûõh‹²\Û|\ç£	<À\Ëcpþ‘b%fðhW\n¼\Óg|Â¯UTU\â¢\ì[\Ù+Oe¨\êvb¡ý+¯\á\ÛE\Ü>L35$W*ó­\Ò\Û;MRú{]Þ¦I¦>µ\r|\Ñû\ÊElv:,<l|Ž•\Íj\"½Ö»–\Ü\ëc\ì\0\0\0\0\0\0\0\0\0V··¥|ª%+2?Jø4±*†\Ð\Ù\Ú\ïyL‹Jö\ëN¢¯ž>õ5\ÚoCok½\å2-\'ðÉ¨¿\çÄŠ\ÙÀ\0\0\0\0\0\0\0\0\0	š\Ã9d~‘ò´¦\'ª-ž‘ò´±+¯K\èL\íw¼¦G¤þ5ñ\"ùn™Ð™þ\Þò™’ødÔÄ‡½\ÄV\Ð\0\0\0\0\0\0\0\0\0\0M\Ô×–§¤|­)	ššò\ßú>V–%w)}Ï½LƒHVúÇ©k÷°÷¸×©]/Ï¼\Çôkn®jjýü)\íyµ€\0\0\0\0\0\0\0\0\0õ÷*cø¾)oúZT\â¦L<‘\É{s59\Õ|H„­j9zWÿ\0U\\\ëu¯‰;9‹©(\Ëzfz\Úd\Z\"—\Ô\íMwõ‘§\ê\Ô2þ%[|$¾-±¯[Wi™\èr~Ðµ1\ß\ÜŸªB+h\0\0\0\0\0\0\0\0\0Í®O“O#cc^\Þ2õª\Ù=ªJ\â3-&|E¸_8ª‰ö/¨ý:¹L¨\Ö2CF\Âp¼t‹\â-\Ú2ö{UV\ê¶Øˆ`1\äT…×†ˆ\ä¿?.b_¶\Ï,J\ÝgÍ”*qý\î8\×r¯|nÜ¢ª-›\Í\Ï\æ3ý\Ì4§\ç¬ófûQ©_\n›~µdU¶Î¥ñ‘xü™ªµ\Ç\n\Ëñ½#ý\Ô\\lVN¿·Î¾5?>E\ÓMD\Ëy³\rUú9\Z·…²iyl7F£¶ÛÔª)¸\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ù');
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
INSERT INTO `nacionalidade` VALUES (1,'AFEGANISTÃƒO','AFGHANISTAN'),(2,'ACROTÃRI E DECELIA','AKROTIRI E DEKÃ‰LIA'),(3,'ÃFRICA DO SUL','SOUTH AFRICA'),(4,'ALBÃ‚NIA','ALBANIA'),(5,'ALEMANHA','GERMANY'),(6,'AMERICAN SAMOA','AMERICAN SAMOA'),(7,'ANDORRA','ANDORRA'),(8,'ANGOLA','ANGOLA'),(9,'ANGUILLA','ANGUILLA'),(10,'ANTÃGUA E BARBUDA','ANTIGUA AND BARBUDA'),(11,'ANTILHAS NEERLANDESAS','NETHERLANDS ANTILLES'),(12,'ARÃBIA SAUDITA','SAUDI ARABIA'),(13,'ARGÃ‰LIA','ALGERIA'),(14,'ARGENTINA','ARGENTINA'),(15,'ARMÃ‰NIA','ARMENIA'),(16,'ARUBA','ARUBA'),(17,'AUSTRÃLIA','AUSTRALIA'),(18,'ÃUSTRIA','AUSTRIA'),(19,'AZERBAIJÃƒO','AZERBAIJAN'),(20,'BAHAMAS','BAHAMAS, THE'),(21,'BANGLADECHE','BANGLADESH'),(22,'BARBADOS','BARBADOS'),(23,'BARÃ‰M','BAHRAIN'),(24,'BASSAS DA ÃNDIA','BASSAS DA INDIA'),(25,'BÃ‰LGICA','BELGIUM'),(26,'BELIZE','BELIZE'),(27,'BENIM','BENIN'),(28,'BERMUDAS','BERMUDA'),(29,'BIELORRÃšSSIA','BELARUS'),(30,'BOLÃVIA','BOLIVIA'),(31,'BÃ“SNIA E HERZEGOVINA','BOSNIA AND HERZEGOVINA'),(32,'BOTSUANA','BOTSWANA'),(33,'BRASIL','BRAZIL'),(34,'BRUNEI DARUSSALAM','BRUNEI DARUSSALAM'),(35,'BULGÃRIA','BULGARIA'),(36,'BURQUINA FASO','BURKINA FASO'),(37,'BURUNDI','BURUNDI'),(38,'BUTÃƒO','BHUTAN'),(39,'CABO VERDE','CAPE VERDE'),(40,'CAMARÃ•ES','CAMEROON'),(41,'CAMBOJA','CAMBODIA'),(42,'CANADÃ','CANADA'),(43,'CATAR','QATAR'),(44,'CAZAQUISTÃƒO','KAZAKHSTAN'),(45,'CENTRO-AFRICANA REPÃšBLICA','CENTRAL AFRICAN REPUBLIC'),(46,'CHADE','CHAD'),(47,'CHILE','CHILE'),(48,'CHINA','CHINA'),(49,'CHIPRE','CYPRUS'),(50,'COLÃ”MBIA','COLOMBIA'),(51,'COMORES','COMOROS'),(52,'CONGO','CONGO'),(53,'CONGO REPÃšBLICA DEMOCRÃTICA','CONGO DEMOCRATIC REPUBLIC'),(54,'COREIA DO NORTE','KOREA NORTH'),(55,'COREIA DO SUL','KOREA SOUTH'),(56,'COSTA DO MARFIM','IVORY COAST'),(57,'COSTA RICA','COSTA RICA'),(58,'CROÃCIA','CROATIA'),(59,'CUBA','CUBA'),(60,'DINAMARCA','DENMARK'),(61,'DOMÃNICA','DOMINICA'),(62,'EGIPTO','EGYPT'),(63,'EMIRADOS ÃRABES UNIDOS','UNITED ARAB EMIRATES'),(64,'EQUADOR','ECUADOR'),(65,'ERITREIA','ERITREA'),(66,'ESLOVÃQUIA','SLOVAKIA'),(67,'ESLOVÃ‰NIA','SLOVENIA'),(68,'ESPANHA','SPAIN'),(69,'ESTADOS UNIDOS','UNITED STATES'),(70,'ESTÃ“NIA','ESTONIA'),(71,'ETIÃ“PIA','ETHIOPIA'),(72,'FAIXA DE GAZA','GAZA STRIP'),(73,'FIJI','FIJI'),(74,'FILIPINAS','PHILIPPINES'),(75,'FINLÃ‚NDIA','FINLAND'),(76,'FRANÃ‡A','FRANCE'),(77,'GABÃƒO','GABON'),(78,'GÃ‚MBIA','GAMBIA'),(79,'GANA','GHANA'),(80,'GEÃ“RGIA','GEORGIA'),(81,'GIBRALTAR','GIBRALTAR'),(82,'GRANADA','GRENADA'),(83,'GRÃ‰CIA','GREECE'),(84,'GRONELÃ‚NDIA','GREENLAND'),(85,'GUADALUPE','GUADELOUPE'),(86,'GUAM','GUAM'),(87,'GUATEMALA','GUATEMALA'),(88,'GUERNSEY','GUERNSEY'),(89,'GUIANA','GUYANA'),(90,'GUIANA FRANCESA','FRENCH GUIANA'),(91,'GUINÃ‰','GUINEA'),(92,'GUINÃ‰ EQUATORIAL','EQUATORIAL GUINEA'),(93,'GUINÃ‰-BISSAU','GUINEA-BISSAU'),(94,'HAITI','HAITI'),(95,'HONDURAS','HONDURAS'),(96,'HONG KONG','HONG KONG'),(97,'HUNGRIA','HUNGARY'),(98,'IÃ‰MEN','YEMEN'),(99,'ILHA BOUVET','BOUVET ISLAND'),(100,'ILHA CHRISTMAS','CHRISTMAS ISLAND'),(101,'ILHA DE CLIPPERTON','CLIPPERTON ISLAND'),(102,'ILHA DE JOÃƒO DA NOVA','JUAN DE NOVA ISLAND'),(103,'ILHA DE MAN','ISLE OF MAN'),(104,'ILHA DE NAVASSA','NAVASSA ISLAND'),(105,'ILHA EUROPA','EUROPA ISLAND'),(106,'ILHA NORFOLK','NORFOLK ISLAND'),(107,'ILHA TROMELIN','TROMELIN ISLAND'),(108,'ILHAS ASHMORE E CARTIER','ASHMORE AND CARTIER ISLANDS'),(109,'ILHAS CAIMAN','CAYMAN ISLANDS'),(110,'ILHAS COCOS (KEELING)','COCOS (KEELING) ISLANDS'),(111,'ILHAS COOK','COOK ISLANDS'),(112,'ILHAS DO MAR DE CORAL','CORAL SEA ISLANDS'),(113,'ILHAS FALKLANDS (ILHAS MALVINAS)','FALKLAND ISLANDS (ISLAS MALVINAS)'),(114,'ILHAS FEROE','FAROE ISLANDS'),(115,'ILHAS GEÃ“RGIA DO SUL E SANDWICH DO SUL','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS'),(116,'ILHAS MARIANAS DO NORTE','NORTHERN MARIANA ISLANDS'),(117,'ILHAS MARSHALL','MARSHALL ISLANDS'),(118,'ILHAS PARACEL','PARACEL ISLANDS'),(119,'ILHAS PITCAIRN','PITCAIRN ISLANDS'),(120,'ILHAS SALOMÃƒO','SOLOMON ISLANDS'),(121,'ILHAS SPRATLY','SPRATLY ISLANDS'),(122,'ILHAS VIRGENS AMERICANAS','UNITED STATES VIRGIN ISLANDS'),(123,'ILHAS VIRGENS BRITÃ‚NICAS','BRITISH VIRGIN ISLANDS'),(124,'ÃNDIA','INDIA'),(125,'INDONÃ‰SIA','INDONESIA'),(126,'IRÃƒO','IRAN'),(127,'IRAQUE','IRAQ'),(128,'IRLANDA','IRELAND'),(129,'ISLÃ‚NDIA','ICELAND'),(130,'ISRAEL','ISRAEL'),(131,'ITÃLIA','ITALY'),(132,'JAMAICA','JAMAICA'),(133,'JAN MAYEN','JAN MAYEN'),(134,'JAPÃƒO','JAPAN'),(135,'JERSEY','JERSEY'),(136,'JIBUTI','DJIBOUTI'),(137,'JORDÃ‚NIA','JORDAN'),(138,'KIRIBATI','KIRIBATI'),(139,'KOWEIT','KUWAIT'),(140,'LAOS','LAOS'),(141,'LESOTO','LESOTHO'),(142,'LETÃ“NIA','LATVIA'),(143,'LÃBANO','LEBANON'),(144,'LIBÃ‰RIA','LIBERIA'),(145,'LÃBIA','LIBYAN ARAB JAMAHIRIYA'),(146,'LISTENSTAINE','LIECHTENSTEIN'),(147,'LITUÃ‚NIA','LITHUANIA'),(148,'LUXEMBURGO','LUXEMBOURG'),(149,'MACAU','MACAO'),(150,'MACEDÃ“NIA','MACEDONIA'),(151,'MADAGÃSCAR','MADAGASCAR'),(152,'MALÃSIA','MALAYSIA'),(153,'MALAVI','MALAWI'),(154,'MALDIVAS','MALDIVES'),(155,'MALI','MALI'),(156,'MALTA','MALTA'),(157,'MARROCOS','MOROCCO'),(158,'MARTINICA','MARTINIQUE'),(159,'MAURÃCIA','MAURITIUS'),(160,'MAURITÃ‚NIA','MAURITANIA'),(161,'MAYOTTE','MAYOTTE'),(162,'MÃ‰XICO','MEXICO'),(163,'MIANMAR','MYANMAR BURMA'),(164,'MICRONÃ‰SIA','MICRONESIA'),(165,'MOÃ‡AMBIQUE','MOZAMBIQUE'),(166,'MOLDÃVIA','MOLDOVA'),(167,'MÃ“NACO','MONACO'),(168,'MONGÃ“LIA','MONGOLIA'),(169,'MONTENEGRO','MONTENEGRO'),(170,'MONTSERRAT','MONTSERRAT'),(171,'NAMÃBIA','NAMIBIA'),(172,'NAURU','NAURU'),(173,'NEPAL','NEPAL'),(174,'NICARÃGUA','NICARAGUA'),(175,'NÃGER','NIGER'),(176,'NIGÃ‰RIA','NIGERIA'),(177,'NIUE','NIUE'),(178,'NORUEGA','NORWAY'),(179,'NOVA CALEDÃ“NIA','NEW CALEDONIA'),(180,'NOVA ZELÃ‚NDIA','NEW ZEALAND'),(181,'OMÃƒ','OMAN'),(182,'PAÃSES BAIXOS','NETHERLANDS'),(183,'PALAU','PALAU'),(184,'PALESTINA','PALESTINE'),(185,'PANAMÃ','PANAMA'),(186,'PAPUÃSIA-NOVA GUINÃ‰','PAPUA NEW GUINEA'),(187,'PAQUISTÃƒO','PAKISTAN'),(188,'PARAGUAI','PARAGUAY'),(189,'PERU','PERU'),(190,'POLINÃ‰SIA FRANCESA','FRENCH POLYNESIA'),(191,'POLÃ“NIA','POLAND'),(192,'PORTO RICO','PUERTO RICO'),(193,'PORTUGAL','PORTUGAL'),(194,'QUÃ‰NIA','KENYA'),(195,'QUIRGUIZISTÃƒO','KYRGYZSTAN'),(196,'REINO UNIDO','UNITED KINGDOM'),(197,'REPÃšBLICA CHECA','CZECH REPUBLIC'),(198,'REPÃšBLICA DOMINICANA','DOMINICAN REPUBLIC'),(199,'ROMÃ‰NIA','ROMANIA'),(200,'RUANDA','RWANDA'),(201,'RÃšSSIA','RUSSIAN FEDERATION'),(202,'SAHARA OCCIDENTAL','WESTERN SAHARA'),(203,'SALVADOR','EL SALVADOR'),(204,'SAMOA','SAMOA'),(205,'SANTA HELENA','SAINT HELENA'),(206,'SANTA LÃšCIA','SAINT LUCIA'),(207,'SANTA SÃ‰','HOLY SEE'),(208,'SÃƒO CRISTÃ“VÃƒO E NEVES','SAINT KITTS AND NEVIS'),(209,'SÃƒO MARINO','SAN MARINO'),(210,'SÃƒO PEDRO E MIQUELÃƒO','SAINT PIERRE AND MIQUELON'),(211,'SÃƒO TOMÃ‰ E PRÃNCIPE','SAO TOME AND PRINCIPE'),(212,'SÃƒO VICENTE E GRANADINAS','SAINT VINCENT AND THE GRENADINES'),(213,'SEICHELES','SEYCHELLES'),(214,'SENEGAL','SENEGAL'),(215,'SERRA LEOA','SIERRA LEONE'),(216,'SÃ‰RVIA','SERBIA'),(217,'SINGAPURA','SINGAPORE'),(218,'SÃRIA','SYRIA'),(219,'SOMÃLIA','SOMALIA'),(220,'SRI LANCA','SRI LANKA'),(221,'SUAZILÃ‚NDIA','SWAZILAND'),(222,'SUDÃƒO','SUDAN'),(223,'SUÃ‰CIA','SWEDEN'),(224,'SUÃÃ‡A','SWITZERLAND'),(225,'SURINAME','SURINAME'),(226,'SVALBARD','SVALBARD'),(227,'TAILÃ‚NDIA','THAILAND'),(228,'TAIWAN','TAIWAN'),(229,'TAJIQUISTÃƒO','TAJIKISTAN'),(230,'TANZÃ‚NIA','TANZANIA'),(231,'TERRITÃ“RIO BRITÃ‚NICO DO OCEANO ÃNDICO','BRITISH INDIAN OCEAN TERRITORY'),(232,'TERRITÃ“RIO DAS ILHAS HEARD E MCDONALD','HEARD ISLAND AND MCDONALD ISLANDS'),(233,'TIMOR-LESTE','TIMOR-LESTE'),(234,'TOGO','TOGO'),(235,'TOKELAU','TOKELAU'),(236,'TONGA','TONGA'),(237,'TRINDADE E TOBAGO','TRINIDAD AND TOBAGO'),(238,'TUNÃSIA','TUNISIA'),(239,'TURKS E CAICOS','TURKS AND CAICOS ISLANDS'),(240,'TURQUEMENISTÃƒO','TURKMENISTAN'),(241,'TURQUIA','TURKEY'),(242,'TUVALU','TUVALU'),(243,'UCRÃ‚NIA','UKRAINE'),(244,'UGANDA','UGANDA'),(245,'URUGUAI','URUGUAY'),(246,'USBEQUISTÃƒO','UZBEKISTAN'),(247,'VANUATU','VANUATU'),(248,'VENEZUELA','VENEZUELA'),(249,'VIETNAME','VIETNAM'),(250,'WALLIS E FUTUNA','WALLIS AND FUTUNA'),(251,'ZÃ‚MBIA','ZAMBIA'),(252,'ZIMBABUÃ‰','ZIMBABWE');
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
