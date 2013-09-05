-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: jamliner
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.13.04.1

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
-- Table structure for table `AuthAssignment`
--

DROP TABLE IF EXISTS `AuthAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthAssignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthAssignment`
--

LOCK TABLES `AuthAssignment` WRITE;
/*!40000 ALTER TABLE `AuthAssignment` DISABLE KEYS */;
INSERT INTO `AuthAssignment` VALUES ('Admin','1',NULL,'N;');
/*!40000 ALTER TABLE `AuthAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItem`
--

DROP TABLE IF EXISTS `AuthItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItem`
--

LOCK TABLES `AuthItem` WRITE;
/*!40000 ALTER TABLE `AuthItem` DISABLE KEYS */;
INSERT INTO `AuthItem` VALUES ('Admin',2,NULL,NULL,'N;'),('Authenticated',2,NULL,NULL,'N;'),('Guest',2,NULL,NULL,'N;');
/*!40000 ALTER TABLE `AuthItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthItemChild`
--

DROP TABLE IF EXISTS `AuthItemChild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthItemChild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthItemChild`
--

LOCK TABLES `AuthItemChild` WRITE;
/*!40000 ALTER TABLE `AuthItemChild` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthItemChild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rights`
--

DROP TABLE IF EXISTS `Rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `Rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rights`
--

LOCK TABLES `Rights` WRITE;
/*!40000 ALTER TABLE `Rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `Rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `seats` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `bus_info` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buses`
--

LOCK TABLES `buses` WRITE;
/*!40000 ALTER TABLE `buses` DISABLE KEYS */;
INSERT INTO `buses` VALUES (1,'JAM-T123',66,'T123','bus info'),(2,'JAM-T124',66,'T124','bus info');
/*!40000 ALTER TABLE `buses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,'ticket',619);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Duduy Pahulas','029292929292');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jam_data`
--

DROP TABLE IF EXISTS `jam_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jam_data` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `jammers_id` int(11) NOT NULL,
  `date_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jam_data`
--

LOCK TABLES `jam_data` WRITE;
/*!40000 ALTER TABLE `jam_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `jam_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jammers`
--

DROP TABLE IF EXISTS `jammers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jammers` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `birthdate` date NOT NULL,
  `registered_date` date NOT NULL,
  `validity_date` date NOT NULL,
  `id_picture` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jammers`
--

LOCK TABLES `jammers` WRITE;
/*!40000 ALTER TABLE `jammers` DISABLE KEYS */;
INSERT INTO `jammers` VALUES (1,'enteng','kabisote','1990-02-05','2013-08-27','2014-08-27','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0€\0\0(\0\0\0vàÍ÷\0\0\0‰zTXtRaw profile type exif\0\0xÚUŽË\r1DïT‘`À|Ê‰V»R:HùÁòFÖ¾ŒFÖ3t~?½&Â ‘^îÜXYáÝ!y¡Ì–¹{.î­Ò	»&Å\n^lû¡ÝýŸ¡ž~…EøðÃ´§Š¢gDÓÊóŒÚ’>hiôÙ#ù¡§A”,#¬L5;\0\0	ìiTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">\n <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n  <rdf:Description rdf:about=\"\"\n    xmlns:exif=\"http://ns.adobe.com/exif/1.0/\"\n    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"\n   exif:PixelXDimension=\"640\"\n   exif:PixelYDimension=\"552\"\n   tiff:ImageWidth=\"1\"\n   tiff:ImageHeight=\"552\"/>\n </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                           \n<?xpacket end=\"w\"?>bH\0\0\0sBITÛáOà\0\0 \0IDATxÚìw|ÅÙÇŸíWÕ»dË’å&Ë½áŠ‹ŒqÃ€±M5¦%”„N’7¤Ð JB	$@èÝ6cŒmÜmÜ{·lÙ–¬rÒétmÛÌûÇžN\'éîtnÈÏ÷s˜»ÝÙÙ™gfõÛgfv&eðtJÕ5 ()Œs‚ ‚ gWMç^DQ™äS)Ñ€è…öz\0ÈÊÊ{vcÊÐ­L+)Ãì`˜(µaÂþbbNÙún¦ÕsÇ”8¸›‰)e“ì[Ok$‰½ÔÌjäðfbbíÃ´¡¿2LLÖjÑQ˜ØÚ¡•C˜˜;kÌí\Zb*&Æ.Ð6û\0ÐÀÿk%±ñ\Z[ÎÍÒÑ˜SF>¤õs7î§4V+Äœ2˜-m£u[±qä,iøß´uÄÜ®!FÝ¸­µD„zÓ¶$nëÎ¨æ¤gª«ÆÔw|¹ÊÊNÀ•WM“$‰I0™­ÐæJLLÀ{A9ÛÔÖ:§_1™IîwY/[]BB<ZAAÎ\rNgK‰Ž†@As_çŽ‹qª„RJ(¡(ÐX¡&0C) \0Œñ¯1\rÈ0Œ‘&ÚQ”\ZÉ`9Že†eYJiÛ&Aä‚!>>Ž‡Ø*¤W\'ªªjº®ëÔ@ŽcxŽx¾åJ)J)@)PJTU\'ºN!”²Ã²,Ëq‚ÀÃ2\0@—åPJ`€ÒÈGñ,Çq,Ë0Ì©ÁTõË²Fy³ÉÄ1-~ž÷ÒQMSUr’$²x	 ‚œ?8VÇW§ª¦Ê~yFAÖÐì¤.	öt›¹Âí;æ¬ÿáTÍüÃe&“Äó|è!À0”RMÕdEéÒ¥KvvVrrJbbBm­Óá¨>uªìØ±c’(òÏ0\rxÃ\rGiš,+YYY]í6›Ûív:ëŽ9ròäIIA8Žƒ¶.¨m¿nM§Çµ¦¡T•…Ì¾C\nsíU«¾Ýæå8MùÉ›½ÞYï%¼-ÁnåÏykSªiŒ5³g×NñžÝ?’Ô`Aó×¹sŽ(Š­¨/!Š¢¤ì?‹ûç¦d[x£SÅoãhŽMº$+ibnÚÚUõ²Ær4<$@)UT•„‰ÅÅ=zt³ÛãX–“e¿ ˆ			¹¹sr:?qBQU–eJã(UUY–½ôÒ±EE½m6Ërªªð¼gÏËë’••uâäIYQ9†5üç„G÷8êjÝ~?&¡Í‚M‰ì¬gí)I’â‘iTÁ§šKîtëã?›Ø+³nÍ·[ëY\rùéEï4ç‰?ÿnv/÷†5û}¼ðcôRÙåt¸ü¯Î›xãÎ€ê~Gµ»ÞãW91ŒÃM5—?÷Î¿Ü7cPžwí·[ê¹3 ÀºR[]ïòøu^’¸¦fó»«j½\n’ÐhuªÕ;\\N·ßG³ˆ“‚\\Üpô!hB‰ªjÙ÷òØB3UUg}Ë4é¢éÕq½ïY¾»R×xžg 4]—Dé²Ë&r<ãv»)PJŒ)Ë0ÀXmæË\'MZ²ä[MWy^`Y 4Mç8î²Ë&Š’àñ¸)PcÂ9x”=ÎvÙe—}óÍESE†á¸Ö4„êwâŒ—ÿ63Ê?~ôáo\\vKÆ‚)U\\Ú€?¼}GO¨øèá?,r›¬<%u”Ÿ”ª$¾ÇÀN@!]L‹·Âµ×§Tö@á/^}xˆ	üÛž¿ÿµ=Ô$¹Þ~ùKÿ¼2ÔÿøõsÛ5»ÄF/^›ž’«¾.fÈSÞÒükŸzàÕ¢= ´”È>}Ào>½»+@ÙG<ñU½dã Z½7óúW’µKžüå‡•6+‡\"Œ ÈÅ+À­ù ©Ê.)à=5²ìŸÈãL–Çdß±ö(Ïq\0\0„¨Šré˜Q”j>¯FC`\ZÐ4UÄ#†.[ö=ÏrÀ°„E–ÇË²àóú\"¥	‚0jÔ%ÆQ­p³ê\0\0è¾zŸO!:¥\0Àpœd6Û$C©.Ën¯¬è\0Ãr‚ÕÎÃ4¸vÄëtyySR‚ÄUÜžzY\'F‚`±šM\\´S3¬(Õ.ÿç[¦Qñ¥K·Êf‘óG,\0%ŠÏïñk\Z¡\0Ë±‚Él77ÈÃHfyëûŽ™“o\Zpíø”ß,®£D\ZpÛå™\0pòË·~ð ;ÜQŠG|u.ËIf“ÍÄ7%Åë÷øT°œÉl¶ÏaW$\'\Z›m<Û–5cVïoþ¹ŸXeë°k&%\0Äg\'	Úi\0®!gM£”a9É±-lqf‰\r»\"g¥­£9B†”ø=~Ÿb\'Æ\'˜¼‰@äŒ{À”‚¦©“3¬iÔ«:\0PéUª}ja²ÕHp°Ök¸,›¤ûê3l	“3mß9ŽãU]ËÎÎ2™L^¯Ïpµ!”\Z“¼`¬dfFU5³Ù’•UUQ)r¢®ê6«ÕëõÀŠ+5MkV¤‰\'¨ªjUYYÉÓÖî!š×Žø|)îºyb¯ìŒx‰PkJÖ-|ç­U•¢‰%²&ôžñëëÇõË0‘¥_î­µÒç<ÿú\0(ýàžGWzy1ïÚßÞ3¦K²…ðWîßðÙ›ŸnpÒ¦\'nú“ê>Úõª\'\rä]ì¶-ÿ=‘:9|18†ê^Ÿ¹×Ô›fOÐ5*×U”XõÎkßT\nAEdEKí÷ÿ]rÙS“s®¸¦ÿ²Wv¤\\3wˆ	ÀµìÍï*¨Ôóúû#/nâï_(°º«tÃ‚wÞXQ&˜xt¯[ì6õö.œÏª5GÖ~ùÑÿ–ŸämKÃïâ,Mnlh£KMuK·?LC¯ÿÁ“KýÑ²gÍìaÜ°ñ)V†ÈT“Ýbi?»qòÀ\\«8­þü½wÖWI&.\\[¼·ÇËYŠšoÜ§š7l&¬_NšÐ#ƒ/l©$VQìƒ¯½õòAÝº¤Z9\0ßÉeþÃÇå&\ZŒ HaBá\0ª¦_šjÖ<.¢©DS+üús[Nì®¬#šº¿ÚõìæÒ\nY7vi×ØT³ªé”‚®‘Ì¬LŸÏ§ªªªjªªjš¦iš®ÿ×‚Û}>_VV¦¦ë”‚¦ëYY~¿ÏØ\0\'Ž/.g|&NÏó¼ªªš¦úý¾œì,]Ó£¾ñÓÔ£Wh|ÑàüÌx‰!ŠŸ€”wé¼‡n) Eõ˜‡Ü{ÿä~&½®²Ü¡Z“$Ÿ¯ñhµÞYSë<]í%º¦[R¹¾Î£‚)­çØ»~uE†_%MÝm\Zù§‘Š¡Ë>¾ð¶ßÿß¬!]¸ºŠ\n‡&Ågä\rí›JUZ/ÖÌýüý\r^\0Ó€[gœvë¤4\0ÿÖ÷?>D%h­x‘uàâ:¼éÛ{°^…(^¦àæßý~ÎÐüx(I]ÇÞüÛÇ¯L—Ýša—â%@4\0€è:4íK¼=Ñ\0º[è4}jZ/½§OJð+\0\0Ö$+K7äßøè£³çÚˆÛ%‹ÉÝ&Üñ÷’ÜþpmáÕeKË\"š\'R&zä¶Žbd=b©dÝOS†÷ïšjå@•50³N—ÎB,?øÁ~š~øÆqÙ°£¦À]ïdbˆÇK	€¢´„G¦_úÜ—ßÏì’ðÅ±ºû¦ŒîÃ¸H}-\0¢çXÍD×†¡D·Y­Š\"7ó°Áä†-:Ã0º®Y-J@‰nµZE	âóù‚GtK×\0@×u‹ÅB	‰á¨‘¸–>öÈ¿Ž&N}â™[ò­ƒÆtföaÓsRY\0(yóþ¦RgyÉn\rŽ/V|þøï?=¥³‚gD Ç^àÚ	Öx»5iÈOÍîšÜ»wâ\'Ç\\m½jQŒýGüÉ£¯àY÷Â£/ÿàëtÝŸžŸ‘ÒP—Æê0oÑ¶¿õ¿½ƒî,L*¾u\0è‡Þ}k«Ïb2³Ñ‹çZú‡Gþ}$áò\'ž½­«eÀèNÌî#¾„17LHðm~õ]U—1ù‘ççvë4íê>‹ÿ¶E\Zi×fÍç\'\0¬êQÓhm¢3¶+\0@É—óõ93{Œ™>àówã®hçŠO÷¼qD¼5ÉÂhŠ}ôM“N}øë\'>;®§ÿæï·œ6(~ý÷®Ìmaâ¸øÍœf½$|&VÕ\ní0²&Çl=Ã?<òïƒ*k2ÇYŽ¡x/ È‚–¡”Z¨jH)\0gU»zÍÐ>o­Ù~ãˆ¾½Iæª	\n‚‰¨Æ”-¡0†Y·ncË¼GŒf$–L¡”J†1|_CqÇ4¾Ï €$q„Æ°Žˆ¶‘y¾ÈÔî?Pù‰Öd+G­|ËfÇÄIÉy·¿ürñË~öÍ†j•\néMv‹™ Äï3Ýpÿ—Ø³­\"K£Œ~G,jÓbè:“Ñ+\0ü{—îò˜šÎÜ6«/+ŠÞµo¿=îÏ·÷à\0È‘ß\\î¬fâ÷¶Z<FàœÖB×DK¢…£:“]Ô\0ü»¿Þè”âøòµËÏíÖCè\\”Æì´EÚÅn:é®ò\0Ø½U^Ê6–ŽÆœh\0µ®tÃ·?Lù¿KúÌ¾n¶¹+¥ß~µ×Ü ^²YY*\'…ìkŸý×µÁ¢%d\'\nàÓ”m¹±ÒÏçGÈ„\'Žv™>;¦%»Õëƒô‚ á8²þR†a˜zŸ,é„ÒÀøåþÒ²Ï÷×]?¼ïüÍ{»ôˆïxŠ‰aY·ÏÏ0Ã2Ãø¼~Ju\0`vìØ1ÆÔoPE(ŸÏG(a\0|^¿ñ¦+†aü~Ùx*˜e™f¾oÃŸvB ²,/Òj]€£¤a]Ñ\0ŽaX{ìíGÿ|üÊ+®(.ê2tÚ½Cç>úøûŽÀIX†¡”ÊPUaûÞqßå¢^ºìÃeûäœ+n™Ø™ieö™ÆZhx9\n„DÏ„EÇÊ/vÍýM}±¢’—ÌT‘c)@ÈICÌD™†W–ÇA\"ïbt×©Z\0‹³ÂE¾¡xkŠ“\0@©÷×ïúr•ã’I9£¨;æ¯/¯\"\0˜ãÍ@ccã7›*\Z¦û©û‹ÌL˜¶ø¸¼¤ÅÆÇ>”	Ót…^ìFŽ-Ãà4\r‚ H;ç€4*Ü‡¡,Ëª÷S DW‰®tú^Øçüå„!Ó3„G.þÒ~çÞZ¯±‹RrÄ-³,[[ëÔubÌûz½^ŸÏçóùü~¿ñÅëõèº¦kš®§³Žå8\0†eÙº:—q”¦é\0Á¥[e\\\0TÓtMÓtÔÕ¹X–VøÆOŒP“ìÚ±¥oÿõÞÛŸø¸\02.”Â*^\0IùY’âö¸<\ZÑ˜¸ì4\0J¿ÿdÑª•«¶Ÿ’ƒ7T\'\0`NM–t]oú“ÄØ(zå¡\n\00õ™<,…2–”$©éÝD“Ã0 ëÆ£×:(Ñ#/òIÕS»KÀT4uH‚\\¯gŽœP\0\0Ú‰=•zÄ]U\ZÇ3µ;7o^»×+²,m,aLñf\0P}\n%\'–/<jÜnø|›‹¨^\0@Š3ñêée\0\06KÅ†ÏÞÿøw?þ`áòo¾ÛçæX\Z®-€¶Ü˜J#emeT#³z¬Rüà?øi÷§µUÐ„ˆ‚°Úáé\nTÓ\0Àb¶Ü[Ü³—R©V9ºÚžt‰TYB5/\0\0\'®¨ÖDÁÂËó|uu•ÕjÖuaËã5ÎÆ0¥ÔxÅ$!„çùÊÊJã›Å²¥°aÃ¦fEÒ4•jÅóBCÐ4ÊJ¨¦ë”U5mÎ‹OŽ³ºª«½|Z\0è•enPü?¡ºƒxém¯&úVýî¡÷O.qC¦-oîóÏ>å5çš\Z¼,â8\\C²…þ÷ýéþgóâž&?_8Ã89ÃrUk?Ý6åÞ–¡w=ýî]Í*C£:Ú”RÊp¤6Bñ\"Î³¢kãûË§ý~|Âà»ŸûàÎÀ½Yùâ/vÈ‚(GØå£lþ”[§\r¶Ãà´c?üz¹Û*Æ-XÁbf@óiÀqµk>^:xf®kÍâ#”Õ¯\0Hv‰k>ZwùÃ#l}n~ìí›U•«üðôý/ùN×¿Ð¢-˜œ«žm±Q¯\nŸÉ‹‡\"·u#3,çˆ1C|Fä¬\rAk:Da…‹›§æ0,Ñ”,³Þ2cÞWwVwÕu	ñj¬ nqÓ•nÎf\0€çÅššÚä”I!Ëp:g¼¼™R ”êD§„²,[SëtÖÖZ,6`š¥é´ÿ~Ç²,cŒ‚B	!^Ÿe×ë¨v˜­Òª[{pi`Ös²ÒW˜–’ºëä¦¥Ÿ¼±Ù\'šéêW^ít×µ{%™-œ»‚ð<G~øÌ{ÜmÓçeåõ\0\0ÙUV²§Ô\"W½ä•w³>cdÕáR9¶ÉÏ˜ŠAA0y7þí±ç§^1±_¶Mw¹¬=tˆ¦R\ZnÈ¶øÉŠLøâE‹€Í	ú·Ÿ|ºöÆ\'õëdcõºã}ôæ7\'9Ï’»$A9½õ‡òáâJÖíws\\C_\"„Zl&\0\0UV)p=øÉŸ#¬ šFÓTYàD›Ä±¼Û¿ºlÎì	ýº&\nKÜ%§	/€Î·l‹Mn¾K˜’ÌLØLxªªL{Œ,˜ä˜2Ä!hA~Ì¨‘ÃDQˆ’‚ãx¢“µþñtOU‰FEX^p1Â¯OÛý’Uã/°ª(:!]»v1¼Þà›4\Zß­Á²D§GŽæx^$–eŒ£¥ùùy”àQ\0@¡–Ê=z€a9&¦?”ÈnÙO•$›Ä2”xÜ²FÑb2ó Ë²[&À‰qVtÕëÓub¼µåEÁ,±,\0¥ºß§*šñîÞbx\0]Q|jÃ¸2,ÇKfAd€êšß§)$«ÉÄ5ýÉ†œš‹\\By»]­ª®×(#fOûã7we‹Ÿ¸ïƒ2ÉîÅ#šâòêX«]\nŒ’ÒÅƒˆ\'5\\WUQýŠn¼—B³ÈçíÃï¢Äç‘Êš,¢úV+¢¹ÝªŒd35/2%žzYF´JfŽ1r–ŠÊ°¬h’$Â¶¡\"e­­£9¶A~”\0’AUU–ÿq®A’D‰È\0Ëm‘¥×]q²h–$)8èK•eY×ô¬¬‹ÅBCV,šêõzËËOs+™LÁ•V„PE–udee˜Íæ† †Çéº~òä)Bˆ º®wÄ „TñYÇ<ùüÏòˆßã«Õ\0PúÁÃ^TËˆ,¾ñŒ HG€ëÜ9‡e[y›£®ë’(i,¿Ê-œP@b¨•¡õ„Ý«ŠÕ[?õÆs&K0¨Æ\ZS†ã8`hmM­,+ÀP–c)\0!º×ëu8j‡(H¢$cG±@kjj5MX–%%~Ùï¬už>]ÁñœÀóš®wÐ@¢ƒ-·{×.ÉqqV²ãðæÏÿùÆ¢šˆ/NF##Ò‘<`žçbIÊ<ËòÆ+¬Ñ	¡,Ë°,\'‚ L¸xÀ`Ì“¢hª®j:ÑQ„YŽx‘–5Ž}B)pÕUÓTB)1Âó<\'ˆÑ	Ñu\n´#º¿\rþ™_Sub¼o˜áQD»+\ZAŽC+‹°BQatŽãÍfsÃÂ¨¨ÚÎ0”R–e(ÃJ¬DÃ?<FjŒ^§‡[E\'‰œ$\'K)\0%:UQra:îFšOàz42‚ O€cý«C)%DQÕÃÁÖCA~ÒŒZ† ‚ çÅF; ‚ Èy`T`A9ç¼zÍ4‚ ‚œKX4‚ ‚ \0#‚ \n0‚ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚ \0wêŒcÆ-¨;“«§W<3÷Ë\\í*FôREÚ{ÖêÒ! µ_¹cl·DŽa†ò/{v—ÿ¼uAP€‘³\0uï}ïžKòÇÿß;{Üø²ðß¶\'¯ùå+;	\0\0hu\'H—t	í‚ ?Ix4×²{nüçV´Ã…rjg™ñ­ï{×ý\"Wv*¶í‚ è#!CŽŸî_ùòíãº%pÃ˜²†^÷ôÒrµ!©ßýÞ¯¯\ZÔÉÎ2Ã0bJ÷17?»ä¤bäpå÷tß_™½TN.yfî˜nÉ‚‘¿”Z8é÷öyè\\ˆ0v£zzÕ+w]V˜*2ÃÆw=ï¯+N«¡åi5R¶ü¯óFu±1#¦õ™úÐ;;]¤qoôr¶Þ(3–2Ûù`¡M´Î\\çZ<>Æª!r¡1jä0ŠüÔqÎhÏ±ó¡?…4Kó/zr·ŸRJýû^)†éé7Î?­5ædì|§V±à¦ô0‡XŠ_=¬D+ÆØùÎÖÊ|öêé\\-7ÊGþ3#¹E&~¶¤Z§±%PJÞ¼²y¦Ï¯VÕ\Zû[+g;\ZåxU‹Þ‚œ\'ÐîØ¨•óþ³©¬¾vÿó²M»ßx{¯À»åÅgÖ*\0\0]XzÊë¯ÙõŸ«\0*Þ}è•=¦+šÿÕ^1Ã´÷ï½S–±O¯<áV5ÙuüÛ‡ó\0¼ß=óï=þµ.rŒùë\'ß»íÎ\0€îw}´×á®ØüêUÉ\0\'þýËWöÉ1%8õáwÎw\0@Þ]ó8ŽóPO\0 »þrË_vÉC9ÛÑ(ñØÉ‡ ‘‘”[ßüû­ƒ3m	=f>zoc[ùÞÓ\n€VwÊiü®ØðÍòÕæÞ·~VcÜ•~²oØu=RŸ\'QJ=+~=v/ü×SüìÞWòÜU¦ü¤êN¾ò½\n\04÷µgg÷J²¦\rºí¹Ç§\\zË¯ÌËcIP¶èïßÉ\0\0}ï}xj~Rç‰>2\0\0Ž|ôñ9†rž‘Š ‚Œ\\\0ä,ŒÛ\n‰ž¤W¡\0–Âéƒ9\0\0ð­ÿëM—ä˜ÓûO»ëÙO¶V©Ñò#Îmo?2½WR§KfÞóä–ì÷¶+>µíÓÀLÃê!\Zz,!_ËœÕº4Ãwdõaã[·q=­u½gÑ÷ÿ}`b®™‰)ÁÊƒÆæt†á²oÛdl8±õ„C9ÏHEA>ã«J°ÍÚ‚%ÁÜÐÄœÈ‡ÊŸ;ï·ævç‚I«v,zí7³¥÷¾íó2-|nòžgÇš÷üW|ÀtûSï|õ÷aíoN^âÃ¨7U½µ$ž9óui{]%M<`¯#p;!ÙMá®‹Ö¸«Ü*«zýzålO£ÄP5A:Œ\03!?¼²Æ’ÆŠkw%Ç¶ð7òo|{oÍ¥ÿùãíSd	\rÅý÷þ¿î;¡ëÛþÏ¿m£\0\09÷®ÙýÝëÞ0,Uh×³¥ÜÈÒŽ5žO©8Pa|³¥Û¹3^Õ¯ºñ»|¡{8KRÀÁöT»õ0n5kN0ßF¼WIš.¶X931¦r¶¹Qb©\Z‚ C€ƒBEÏ¸úží.^¸¸îÅ·>öú¢­§¼Žµ¿-06žÞ{Z\0†\rô\ZVªU[:_ÒÍÆ\0È\'·„¦ibGÊèi|;ùÒÜûßÙRîÕ”º#KžýÅ_›su’ÎP]ÑX[ì*¯h§ïøæ¡‡›òGŽ9øÝîú@÷=?iì­/}wÜGcH`ÎÙÕHP²îˆ¯]6-A“ÞCÕé0p$Ÿ¸™Ö]+çÑýì°g‰%$\Zò®?t3,š|Í›»keÙuº,0€ÚyHg	€5\'˜ŒßUJ+Ë+¼DLïxiÓßßÚZyrås¿xéX ;¯£žB—i³º¾ïÿ÷ÜÁYVAJ(¸ü«¼Æ¶!·NÉáÏP]¤ìþuÓ»^~ná—·jû»ÞòêéÐLøœ+î\ZÅ\0ÔúË_¼ßé­Üüï‡Ÿúvå›ÜùÆ!%–¯¸c\0PþÆC/­=í<øî¬d£\\}žÞ¯ÄPÎV„¹‰¡j‚\\˜´ã9àà±ÁŸ¡»š}´7ôg³í­æKøpãÏð½êÕKïÎÓ#Ònøâ´F)UK^r§6úrÝ¿çéÍï€ƒ®éw®ó´õñSR·á÷ƒÂk,Ó÷w?ÔJÏP]¨¼ï™%çØf9ûþóò–õdÞüeeà1ßVxv=?ÆÜ\"Aá¯ÖÖ\ZK9[KÆ\Z1T\rŸFópðàHNmì«¥~üDòœŠ¾Ø?’‹ÿ¶iÃ¿~9¹O†áé2ñù£nzfÉÖÿ^™Î\0Ÿ{ËÛoÜ64\0°d‰\'ª©ðá¯—>yUQ\"\0€˜1pÖã÷­úc7\0€ŠwþôÅ)½m7ìñÕûþiî¥=Ó\ZT‹‹Ï6ë·ìZóøsÆêbÏ‡/{öú!™\"\0€-wØì?|±ñŸ£›{“Ýîš¿ûÛçæÉ\0`\nÆÌ{þ»-¯OKecL`)zhÉ¾ÅÏÌÛ-I\0\0&¡Û„»þõÃš§GÄ11•³Õ-‰­j‚\\x0£F[½fC»ÅÏá [Ür@8úÞØŠ>ÔŒÑåvŸ @Ñ\r:‹ÚŽ<‚œot]ôÑG=!øh‚üÄ8tQUpò5xüÞÌ…m¶%–Ûöv… H3TU}æ™g~øáÚÚZÔ`¹ hs8Â°rØleV,‡´)ÏV3A‘F°¢ûå—_ò<ÿÄO$$$°,¾ÿA~šŒ ÈOŽU«V\r>Ül6?úè£qqq¨ÁrQ0ú¦rÞÉÏÏ_¹rå¨Q£,Ëƒ>h·ÛQƒ=`AÎ:º®÷êÕkùòåcÇŽ5›Íwß}·ÍfC\rF`AÎ.š¦q×¯_¿%K–Lœ8Ñd2ÝvÛm6›\rU@`AÎ®¬ë:ÏóC‡]´hÑÔ©SM&Ó7ÞhµZQƒA³èó<Ïó<\0Œ\Z5ê³Ï>›9s¦Édš5k–ÅbA\rF`AÎ–lŒB\Z\\\\\\üþûïßpÃ\r’RÌƒ\0\0 \0IDAT$]qÅ¨Ár^ÀUrQxÀÆ(tpËÔ©S_ýõ»ï¾ûÛo¿õûýø´‚œ˜ã8´‚\\$pÐ	€Y³fùýþÛo¿ýÿûß„	$IB?AP€9Ã„eÙ~ýú=zÔØåóùæÎûå—_:4¨Í‚ \0#r0Ü_‡Ã±víÚyóæÝ~ûí¯½öÚ/~ñ‹øøxŽãDQ4›ÍÆB-´‚œ;æQ€ä\"ð€O:5sæL§Ó9cÆŒ;î¸ã‰\'žày~üøñÆ“H‚ ˆ¢ˆ†Bs	‹0‚txNž<9cÆŒ¾}ûöìÙó•W^‘$éÞ{ï}ÿý÷)¥v»=..Îl6ã‹±äÃÌ¸bÊü‹ÐÒ!ñx<6›-##cäÈ‘?ÿùÏ}>ß¼yó>Ì²lnnî»ï¾[\\\\l6›ÑP‚0‚ gú.›aŠ‹‹ï¹çžŽ7®ÿþ¯¼òŠÝnïß¿ÿš5k|>>ƒ„ çœF}‹Í²=öØäÉ“»víš@)ýÝï~wÕUW­ZµjÏž=3gÎÄGä|ÁõíÓ{æ5³ÑÒQxÐ AéééFB–e333àv»¯»îºñãÇ§¥¥áâg9?0A#HÇ`#êQÐÓ•$iâÄ‰#FŒ`Æjµ\n‚€VB`AÎ0¡ÒÜ\"I’$Ih9Ï÷Ç8Œ ‚ çA€9œþAAó Àè#‚ \n0‚tT¨&k´£÷|U\n¹À{vŒ˜ç€;\0ÿ.î~ýÂ*øEª^ß½øßÇ´pIëŒK· ®½gjyxÝâkMøÙË««P³zõê—6aÐµ‹ë~š¦V0¬¡~Œõ¼9g±ëœ×(xÞVßŽÚE¯Ttc\Z	˜–Œ[Pz¦g®Ã_ÈÙžÙý˜{¯C­ðSgî‹7øÍ“ëê)\0ÐúõOýßÁ_œÛåMî+»×~õÌãßT\0 Uß<ö§ÏWíªP~ê6Ÿ±¢vÅŒø3—¡zzûÁ:rî+ûyÛQåY©ø+(¥”Rçü±	cç;ÊpÆ[9{{¾z;\n0rî1ÝÿâØoïyòÞ¿ÝÿíØî/2ÚµÏ\\U˜À0W8çÕ½¾@rÿ¡ÿÞÐÃÄ0Lö\r7”R¯üî÷;K›6ê‘Å†3~c,=\'w/™¿­\0ê·}q¤ë”^–À½jÙïÆer“~éo—|dåø7d3Ã0¶nSþ¸¬J¸1ÜáuÆÙ{Ýóð5ý’š–¿bñÃ#R[ÏY=: >pÇþð„¿¹wprŸG·ùk W|óÈ¨4Žï<óŸ;êis×!ÌÞP#lyš™®nÁ¸„+¿w~eBoÀ·ÿ_³ºJŒ­èöONj‘lZæŠ&ågÞ¦y¶<¯ë#½ú=µO\0eÏã}zýªÑ¡k˜Jµh£&™Gêlí¦E/ml‘ð½¥±	ƒ~ÿÇ«»™ÆÜó–OKO~yïàøÐŠ´(j›„¿^ZäàÛò`¾OîU\0@Ù÷d¿žoÐ:¡w®•?¼v]ž5uøƒ_–k‘¯—6\\1öç&};R!›öœè\nZëíáþàÄ~m†½\"G¼ðÊù›4ô¾…eZ»\ruþù¿_?H‘Ÿ>úéOfv-~uõk—Ìüô´N)¥¾m¿ê–=çýCõrÝž×§&&Îþ®žRçü±ÛçÞÏ¹¼%ïÍN±LúÊI)q|9»`Âßw:ýÎ_0ûK‰°±‰§ô]Fÿíéáw®óPÏú»º~ü…QF\ZR»äŽËŸÚèð{Ëxýæ‘?_VG)u~5Iä†ýí _uî{÷Úì¼û6y#løü±,t»çóCužò;—ÎÍúÔÆ*çÁnÊ&ÊÙçåLã_ÝUQíÖ‚U 5‹oè9éÕÝNçÁçfÖ4ìÞÐê‡)Ol¦ÓËßŸ˜6èÏ›Ž-½;¯ËÝ¼‘–9ô{Ø\n¶Ì3xÞÀïÆ_vüÂa•ªG^œÿ³µž&MÙ²e¥Â7\\Ã!‘:[BScF¢Y‚°½´1·p%	ÍŠÜ[?Ø[ë>öÑìì.Ón{bþgHEÂ5ªMZ–$LîÕ·ç{å˜Jµã¯ï~ÏoØÖiZÈôëÞÙç¬?¾àö!7,ª!zlìWAŒý9ÔÚ­2,\\·l<]ÔÞþNì×f„ÌHŸóÖžšš/+¸6²õ¢ê\0ç€;ÊPFúŒ¿< ÿºøW¾ûÿrE:\0`êÿìÁ“^W`ã\n¯š[D«ÜÆ«¥ÿÝ_Q`7w™z}‘(k\0àÝýÉ†äÙ3\nã¥øÂ+ç$¯ÿh—\'ÂÆðpiÃ/×~[RìÛ5ì¨™Áoï®–ÉÝ»&IæŒ!WO7-ÿp·ÀÜcê0ó¡¯Þÿø»ÃÖ+ß;yô¥ÁæÃ\0ÖAÿúŠ‚8Kcù}{>^<÷Æ)ñÝfþþÁÞ–Èg\0KÑuÓÓ’­ýÞ»ç“u‰3§õŒïvõïîïmi6›uoØòÄh:ïþEû:Ï»®nñ?Ž–üc˜9ò¡e~[Á–y6ÇÜ{Î¥ÎÏ–•+ßV9tV‘%l“¶¬TØ6j„‰ÐÙÚMË^ÚXƒ¨%\0k¿‡~M¯knñ¬|GåˆÛ¦w©H˜¢FµIË’„ÉÁÚwÎÐÊùëzÍ†µ£ç™#u¿Æl{?üÄœžñ¶N—Œ5¯ýh—7Bý*ˆ½Ç6¦l­dQûs«½=ÌœØ¯Í™›{Þ÷øu…‰‰½¯š“¼áÓv\ZêÂ‚Æç€;Bþõ÷÷7÷¿ÿúüà«µÊµoüþÎk§Œ,ìuýêº†ÁS..ÃÞô®K«+w›ŒnÏY“$oe½ac¤1ðü‰ýj¿Y¹kåâê>“º™\Z²už:¾bv\nÃ0“|Í²£%@,¸ëÃ·g×ýû¶Éƒ;Ç\rxt]…Ã\0œ=­YùÕšc.sº\0!9/Yˆ|v\0àl)Ö¦o5çI—˜há\0@HÉOnöfÆè{Ã–\'FÓéõ•^KFßú¡e~[Á–y¶ÔÖ¾×¨øhÅþ5ë3g€=Â=U‹J…m£ÐJ‡ílí¦e/¹$À\'ä$ð\0\0œÀq–dkó8Ç-‹\ZÍ&áJÒ2ûÀkûýtóÉ­_œ|]?kÄî×x½&uI\0€ÌL}¹K‹Ð ±_±÷Ø`ð«VKnµ·‡ùƒûµ!s1­{š\0œ5Yª/‹h½è†Â9`äÌ6&,ìÀÊÞg&]ý6}Ý]½¹àå!!UšÇ¿áã2lZ½L\0@÷8d[f<ac$l½§{ïÍwæMëkg‚^zÎØª†«´¥Óã\0ø¬«_ÝpÊï-ÛôìW¯¾oµ\'ÂÆ‡‡+|¶Í{Ú¥€V[Z«E;{˜Ã…ÄÎq~ÃeÓœ\'Z[öÆnÏ0\ZcM2ùš¸Š‘=Eà{Ø\n¶Ì³%ö79õ¿×_ßÛíÚK#†Bj$)lÃµÚÙÚM”(MÑJ\0À°Q\"<…-jT›4/I¸˜„K®íºýµ×^ß[tÝ ¸hÝ¯aþÿÈ÷ûÝ\0@‰ï”ÀGjÐ˜»qÌ=Vw•×é­\\#mèÏ1ôöæEmÃ¥!sÍyÊ©€î®–r“„v\n9‹È\'6—Æœ<iâˆŒCo¼°Ée¸¯èšaµ_-;êVêöÎÿ¸zèÌBK„‘V¢²Iƒ/O^÷Æº„‰C“ƒÊZ4{·ÿp­¢Öí|mJfß?íS\0ü[êš=ç}.>)5ÎÎÕŸ®×\"l{xøò÷½~LÍ»ïos¸Ž.|æÅ]^–¶n.ºnœó£OwÖÖ[ôì‹;=mÙ»=ÞÄz*jýÚhî9¹Gé{_ì=¹â¾‚¼{6z#Ñ“\rWÁ–y¶</ØßP¸ù•é×ŒNacîNaÛ(˜yìíÇ¶$?öºh‹MÂæÀ¦Œš•òÕ3‹ræ‹¥û)eÿ¸çÕ=nÏ±ÕßÉã¯ïc‰pHìÝ¸•ËKÊî÷÷¹/üË‹Û<‘»P£l64nôncooµëÆ~)€gçÏ.:ævîþâãúñ×õ¶´ËP‚\0ãp‡Å>æÙ‹×ÌÎŠ+˜õIêÕ}mQ|ä)/=Ýé—Ø¥¤Ë>òÊß§$36F|ªOÈ¹tt:$\rßE\nÍö/¹.4‰	CŸõÖ½=E\0Sÿÿ{ã¶ÚßõOM]nXsÙëÿšacØÃÃ—?~üs¯Œ\\8)-í²ÿ¥ÎîŸ–haÛvøØg_ýåäôôIïgÏhoËÞØíi.¼jÈ¡Ÿ^ýMðÁJ.kÖË¿‰ÿK¿NW|_üüoY\"å,-+Ø2Ï–ç&¾ÿÔî¦3\'dµaþ)l3§±u¶3òThØ’üØë¢-6	Ÿ—9þÚ~	#o\Z™È@Ý/~ÌÛ/Úï›3þ?=^øË¸x&Â!±wãè=6~â¿^¿lÍ\r],‰ßJ¾n=rjò†Æ­Ú-cìí­vÝØ/%\0°÷›“ð¡qiÓí™1qÐ.C]\00}öOþê·¨VH€*ŽíoÜtÅûÓWW\\Û­jÉmƒÌ_¼í½E´Úä§FÝ‚q]^ºÿXGx(œåxô€‘Ÿ8Ê¡ÍéÈ0¬”zÙ3Ÿxcªo4\\ßÞríw£ÿYOT\Z´	r~=à¿¿ôÜ/î{\r ‚ çÖÆÇAäÜ0.ÂB~óä¼§Cš½M•:ÇøIüœ>öáß Œ|ÑÓjÔšH\\1O.ØSÇLæÜÇ ŠR’˜Dq=¯~~c9gnSìÓñ.ƒŸÝ¾xcv§›_¼óÜ„áŠ½1V\n0†¶œ	Æ<9‘j.Ø 91„9÷1ˆ¢Ððº`¢8¾¿§þÙ[^Ü+_`æúñ¸ ~öúvÝÒŸßþí¨w|)ïà¹)|ìVºþn \0#gŽp±hÂÆ‰H¤åw‹@=-N\Zó$$€køè%±D×iZ¥VâÅ\ZÃ\'öˆCQCèD·[ËH,Í‚ÉD	Œs.bµbê–0BÒ€koíY¹ñ¸µš‘ú^ìá­‚FíKF+w›\\œ.HQû‚íœSƒG½0ÃïŠt	GëÛÏR·`\\Â´%ÞêoÌ·$]­Fº¦Z	ºÕv+óì\\”ÐòïF[¢œ„ê!nR‹PÂ.>xç¿Jè\'O¤X4-c†DÚØ,jMË :1†»‰½$Æè:­FAi/%zŸØ#E¡Ýn‘\"±´)æÌÙ‹AÝÔáBéÞ²µÏMéûç}rk	_†˜Ã[…µC •«ÖÅ¸)Æ`;ç%èSØôaƒwµšs”¨>±^›1Ç j5èVû¬\ZÔ«y9ÊY€¬Z\rA¦ƒ…Tù|ECB¸#)MË˜!‘66Ÿ¤iT\'Æp7‘¢—´5ºN,qZ&0QÌ‡¢‡Ð‰n·èQebŒ9g-Q«áƒ‚8¿¿2a†³äÌx7óoÿ²‡ØZEÂ–¡Má­Zhå”¾±nŠ=ØÎ93xôôaƒwµšs”¨>±^›1Ç ‚Ö‚nµÏJm½xÃ\Zª¡O7`Õ†èm­•äÜAãcHð±hZÆ‰´±ùˆj˜ :1…»‰Ï§Ñub‰Ô’–g‰=âPk!t¢Ù-zT™cÎÀY‹AÔjø sÀ”êUÛßÿE[“WaF¨H˜2´)¼U;Z9¶ÀM1Û9gž>lð®VsŽ\ZÕ\'¶k3æDÐZÐ­öY©­oCôºYßh5(¥ajwÞ¥«#)MË˜!‘66¿ZÕ‰1ÜMlñ|i£Ä´iK>M&/™Ö*1ç¨!t¢Û-zT™cÎ´ÃJ1Ç j-|Pl„­H„2´)¼UD;´/pÓ`ðhéÃïŠ!çˆ=?ÆRµ1^P´ [íµRÛ.Þ°†\nÒ¬o´”©1T%AFÚB¤X4-c†DÚØ|Ð²EP°§hó$öx>ÑcÚ´).P~dÄ¡P¢Ø-l$– q~Lœ–3ƒèG†Š^Í°ehGx«ðñs\"):SÁvÎ’Á£_˜aƒwý˜pRÑý‘ý0ö˜f±[)zó5þg¨H}#üu.Ô…\np‡ Rà£–1C\"ml~³Ü\"¨NØS´Œy{<Ÿè1mÚ(šÓöã\"51rd»…Ä\ZL¦ÝqZÎH¢°™´ãÌ°ÕÛ1ÚÞ*|üœAŠÎT°³dðèfØà]ö6æËåßÌVíë‡±Ç4‹ÝJÑ›/¤ñÃ*Rß{]‡uAñÙGïá\"âŽIË5™‘6\"í3&rÖQ+¿™Û©ð±Ýr¬‘«·þcrÎÈ–¨ØÐí0TGèè#r¡Ò!ƒað®3b¨Ñ7˜Ï>zïêÙ×c[#‚ È¹=`AAF~:`<A`äœÓ¦Ø5‚ \n0rf8_ñaAP€‘Š³ó§eD‘ÒÖBý\\PñFAP€‘³9=ÿÞ?”Ü¾öØüK—ÿêé->\0Z³ø—w­Ÿ±¨Ò_»lÎÖ{ï]\\cÌ×º¶¾sröÂr÷±·û-}äžÇ¶Ox¿ÔSòÞ¨ooÿùÒ€Ä®ÿËš‰_U:¾¿q×C}[v–7~ÆŠÀs±+fÄ9—=ú¼ùÙ=^oùW7•ýñw+ÃÒî}›\nßÚ÷ýoûš°yAP€;*ç&æOøS·%Ä\n‚ Ò\0>Þ!871 iD‘À‰ÁR?¹âû¢„XAAÐîPœ›˜?-\"Š\0´9Ä\n‚ ‚Ü8»1ÂE9#¡~AP€‘Ÿ¸|6cþ„({ˆ•vDÝA¹ÀwA#MÅ²ËK÷[1#m ‚0‚ ‚t8p4BüŒµ3Ð‚ è#‚ \n0‚ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚ \0#‚ \n0‚ ‚ (À‚ ‚Œ ‚ (À‚ ‚ \0#‚ \n0‚ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚ \0#‚ \n0‚ ‚ (À‚ ‚Œ ‚ (À‚ ‚ \0#‚ \n0‚ ‚ (À‚ ‚Œ ‚ \n0‚ ‚ \0#‚ ‚Œ ‚ (À‚ ‚Œ&@A`AAFAAAP€Ai?<šàŒSYYYUUÅò\\jrJJJ\n\ZAA>»¸\\®Õ«Woß±£ªª\0RSÓzöè1zôè´´44‚ ‚|V¨®®þüóÏØ´IQQ ¦æ@IIÉÑ£G§OŸÞ³gO4‚ ç€Ï˜ïk¨/\0ˆ¢¨(Šñ\0víÞýÞ\'Ÿ?~­„ ‚ \0ŸI4M1FžŸŠ¢d¥gfvÎ3~Š¢X^Z²råJY–ÑV‚ \nðcçÎÝ«W®6¼^EQzôèqÓÍ7Ý>÷†1£GÓìÝ½·¤¤m… ‚ \0·!¤Õ4ÕÕÕË–-+«(€:§3+=sÖ5×ôîÝ;77wúôéyyy†0W×:öìÙƒ&EApV4M;~üxii©ªªv»½S§N<Ï‡M¹qãÆ\Zó¾ñ		“&OêÞ½;!„’˜˜8dðà‰«ªª4M›‚ ‚|±ãõz×¬Y³ü»åÕµ\0E19#»aÁƒwêÔ‰e›Œ?~|ÃÖÀÔ¯Ïë5rä°aÃB]çÎ;K±\0 ¾¾Þï÷Ûl6\0e¹¶¶Öãñ˜Íæ´´4TeAà‹7~üÉ\'ÁG‰E9~ø@yiÉö½.;zøðáA±Ô4mÓ¦Må¥%F²ìœì	&X,MÓ‚¹	‚š¹¡ßû÷ïß¾}û‘£Gë.{B\\ïÞ½‡žžÏ\n#‚ \0_¬”••-_³>¨¾uN§ŸdE\0(/-ùìóJ—ËU\\\\,I’áþnßº=èþŽ¾âŠÜÜÜf³Æº®_ü”Mæfî5\0œ¬©-))9tðàìÙ³sss±	A.pV8P^ZbLèŠ¢8räÈœ¤DEQŒ…Tn·gÑ×_¯[·.èþ\Z:ª(J×¼®#GŽäy^UePA×u \0TTT9›Rít}úé§ó,ª¯±\0víÞýÅ_TWWc ‚ |Ñ!Ëò¡C‡A€þýú]}õÕuuu›6mÚ°qCMM­(Šn·{Éâ%ùùùÇÝ_\0_<>##ÃxÒWgu\0Ð©Æ¦¤¤$èO——–ãÕÆ)DQ´Ù¬n·\0DQÜ½gÏšµk§MŠóÁ‚ (À^¯×\'+ÆwQ{õêe·Ûív{jjjzzú‚…\r®®u¬_¿\0G¶ÎéìÙw@ß¾}›=³Äq\\MMÍ¡ã\'[žÈxS‡¡ÙË—/ßºm›¡Ð[vî:dHVV¶‚ \nðE„Ïçs×»‚œššj¨²$Iƒ\rª©©Y°p¡±wÃÆ\rŠ¢\ZRj¶X.Ø/%%EUÕ&–åù]»vÚÍÔ7· ÇMs®)((`YÖjµž.;]VQ.Š¢ãô©S\'O \0#‚\\àp®w8Îj7›Í†#«iš$Iýû÷ÏJÏN_\0 +=³_¿~<Ïë!‚púôéuë×“Õ·G?¿en÷îÝ-999ùùÁ½§ÊOcC ‚ \0_\\„º°‚=NŽãŒYUUSSSƒJJÿýƒ³¿ÇBÖ®]{àÀP÷WQ”>EE7ÞpCNNŽ¦i„ªQŽã’““ƒÉü>_,¯ßBAP€;®i\ZÞ¹ah°$IÙÙÙÍÜÙ¬ôÌþýû³,|ÜÈàãÇoÚ¸©Yâ>EE×]w]nn®,Ë@PAÝP÷ £l2››½ëA¹¸¸¬¬Ìår¡BÅX„FW•²\0PXT˜““ê:‹\"¯(ÊÚµkiÝ ú&%%NŸ>=\'\'\'°RšjÆbiÍ¯UT5>}‡ÖF¹ˆ¸ëÕÿ¼•’7zäˆ¾}û^$Æ„ºžj½K#„eYŽãB½ÛÆÄªßf³™L&¯×Û(À¼tøðþ­Û¶†ª¯Íf›{ÓÜž=»)9Ž\0]×%I:å8U~\"°RÚf³&&&b§D¹¨=àòÒ’-›7ýïÿmÚ´é\"™•´Ùlö„8\0ðy½~Õ¯«ª!É\\\0¦Ù{%»wëv¸áy¯ß³båªššÚÐl¯œ1£oß¾^o`žØX¨e,ïÚ¶}{u­ÃPëÔÔ´œœì”‚ µ\0€(Š55µ¾XpâÄ‰‹ÍV5ô•ÎÆþššš ÜŠ¢XXXØìÍÏ¢(îØ±c×Î¡k¯.6lÔ¨QŠ¢4ËP’¤£GnXÛ¸Rº¿~)))Ø)A.Z[6Þ;±yóæ–€:¤\0‹‚\0\0f‹EQcf×‚æ8Îëõž,+og%+=³k×®A_ÖO®©©Ù°aCh ‡=z\\vÙe\0`¨¯¦i,ËB,‹ËåZ¼äÛàT±ÍfÍÎÎÞ³gOMM¦iÙÙÙ¹¹¹ÆK§A‹H€\Z´yËãûÑ£Gëêê.žéIŸ×k³ÙBo8X–­­­\rNÖ@aQajjª!«†s·}ûv#6°‘&))qê”)qqq²,ó¾\0@áy^Q”¯¿þ:ÔW6	¦¥K—:ªÆ¶R“ûì?eÊ”8\\–… Ò!½¾H;F’˜lŒŽ:ªeeeÞõõõŽ*Gƒë/½OŽãX–---\rNÖÚl¶nÝºI’\\ŸÅóüéÓ§WoÜ:F=eò”‚‚‚À²çxž×4máÂ…ß-[:\\]ë8pð`0NCu­ã»eË¾þúëÐ\'ŒAŽ/ÀYYYYÆw—§¾¦¦¦ÃÛ¢²²Òå©\0³Å’ššf¼	\08àÜn÷–-[½T%¯K—ÜÜ\\C}%I2–S­_¿þøáÁÁçþýú\r<XUUªÒà)?xõêÕ_/^©%yÉø¾jõê={ö`7E¹ˆX„¤¤¤ 8:º\0kšVVVfˆŸÏëMMI±ÙlÆòo†gœN§Çë5Âú¼ÞnÝ»§¥¥hš¶}ûö-[¶°,Ëó¼ËåEÑOYc†xìØ±\"Ï«ªJX¢ëºNuã½Z7n\\ôõ×†‹ÜLz +=sÐà!)‰É~Ê\Z§Û¼y3:Á‚ >Š\0ÇÅÇEÂUW§i\nÏ‹ÕN§sÿ†Wj¶Xºtéb¬p6ÜÜ¤¤¤þýú:uª¨wo‹ÅÒ§¨ˆçE–U***¾[¶lëöW^1½OŸ>{÷íUjjm6Û¤É“RSSý~£ïËp,ËnÙ²eÁÂU••ñ		Í¤7))ñ’a—8055uÓ¦Mò‰±÷DEµ³¶.=#\r;+‚ ÈE!ÀÇ%7xÀ\0à÷ûEëÀ¼oß¾S§NN§±Â\0õÕuÝd2¥¥¦(ŠÒ©S§I“&	‚àõzA(..¶ÛíK¿[úê?^µ\'ÄÙ“Ò&O´X,ÝºuSU•`XÐ5Â°`2™<øÙçŸÕÔÔ†ªoÓ™š–Ö¿_¿‘#GæååcÔ=zôHIL6H«õ®jG\n0‚ ÈÅ\"À<Ï_<‘á].×Öí;Ün·(Š>¯7¿ ßˆ—\\c¥ëz^~×É—_¾zÍj“É4yòdccBBÂ¤I“zöì¹téÒuë×g¥gfffæååÉ²¬h\ZÏ²@X\00™L\'OžübÑ7§Nžjæûžµp’\0\0 \0IDATvÍë:iò¤>}úX,Y–UU5^÷!Øã ¢<x3„=A¤ƒíÑ^I’°Ã[áÀþ}öï3*Ÿ0 ?AšUÜb±Œ?¾°Wá¢¯¿Þ¾}»±FÚëõ*Š’››;gÎœ[æÍ€?üxÝºuš¦±\0\Z!ˆÀóUUU_~ùåñÃ‚êkd>bøð›n¾iÐ AÇ¹Ýîà;¥++N	Ûâ’B†\"Aî|1˜ÀívoÙº-èþ\Z<¤ [÷Ðø\n„c5–$IÓ¦M«ª®þøÃãããsssµA1bDffæ7ß|óÅüù‡cäÈ‘V«\0jëj¿úzñ®Ý»C_›Í6aüøÁƒÇÅÅùý~c°šàxVUÕmÛwÛìq6›\r{*‚ ÈEä{=î°Êt0Ž?¾ÿÀ~Ãý5[,û÷³ÛíªªÅÕP_]×eYNHH˜:eŠ`+--\r VUÕëõvîÜùÚk¯3zô†?ÿüs‡Ã!Ëò²eË¶lÞ$Šbð	¥¬ôÌ+gÌ6l˜ .—KÓ4\n„\0\0ŽãöìÙ³}G@€EQì[Ô»Ã7‚ zÀMàxAEÃ5ì¨õ×4m×®]n·\0|^oÏ¾ŒLãO4…$ËrNNÎ¼ëçHf³,Ë¡{©N½^¯Åb™>}zFFÆ×‹¿þðóÙ©IÁŠôèÑcÌèÑ;wnöp\'&Q,))Y²x‰asEQòòòúôésñLÆ#‚ \0\0ˆBã^Ÿ¬´NÐpT×9zTQ\"˜ÌË ¾½7G†\rA¨SJ4\r\0’’’Œ×Z¥—@@°}^?Ç³C†ILˆ_¸dÙºõë\rß×OYCŠz÷6lX\\\\œÛí¦Dç‘27YÀ¾#G¾ý~µ±øÙOÙ8›mÌèÑžAä¢`^E1‚Þ]ïr»Ýï½Ä•§«ª*€UýII‰Ý\n\nX–õûýÍ%Ö¥`<bDi b<wD)èÖýZ«mþ‚EÑÄ>}û\r<P”$Ã÷eYVÓý‚ pë÷ûwíÚµaã†ššZÃà&†\\2lØÐ¡C±\"‚\\tl6›íIi55DQ¬ªª¬qTgeeu4ØáP”Àz«¼ü‚äädÃÑ§zàý‘A×¶YPdcÖ6t°\Z\0ŒµTFbÏ—œœ<cú´u))^¯7))©S§Nª¦«šGà9Žãt\0Ž\0àÔ©S›7o>pð 4¼KQ”Ã‡O™2£!!‚\\Œœ˜˜˜’w\0\0ÜnOYùéÂÞE)(¡,Ë\'Nœ0š)Š’žšb±XE!„ Íj\Z\\¨\0:ÑTUå8ŽÖØÈ°ªÓ„]Uu\0{\\üØ±cG}}½±²šçyUÓ)0<Çz<žÝ»woÝ¶5èø\Z\Z<tÈ«¯¾\ZŸA.FÖ4-..® ?o×Î†O¶cÇŽ!C†t¤ „º®×Ö¹ŒGrm6›ñ¸mÐ£mæò\Z\ZLCÐÆižçC5˜\0 $©\0ì6kP€ƒ¯Ú¨©qmß±£¤¤$4~pRRâÄâ‰ãÆ³X,Ø;A.FÖugùž={ÚlVÃ?+9vlÿþýÃ‡ïH°â÷šÍfC/ƒ-\r‘`hÆ/]U5M3ÔTÓ4“É¤kÄ‘6žÖu=ø-ã\'Ãrv»½¢²\0APUõÐ¡C{÷í5ô}ûMœ8±¨¨—=#‚\\¼\0\ZÑrrròòjj6þÙÆ{÷îÝa–b….uEÁjµªªªh\Z\0°\0 Q	1•5ø¯®‘€67HoÐns\0Ž?~âÄ‰nÝ»ûýþí{”—–„>c’˜<dØñãÇw¤A¤l<3zäˆ];wjqðÐ¡\r6w¤™à&±¦É>_kßE‰Nh£gl¸ÅF²Ð±ëÀ¼/Çº\\®’cÇU­ªªlîøöí7aì˜ž½\nÑñEAŽcEã¾  `ð AË–-3V*­Þ¸¹¨¨¨c,‡nö¬Q}}½®ª†Û\ZÜô’ƒ/¤ÔT…PÐ4eÙ ¿+Ë2ÇqAõÕu]Ó‡(„¤¥§À $°Íf;vÜ¨‘#q½‚ \np\0EÑ\0@ÑdI’FŒ±s×.ãõLå¥%?lÚ4mêÔà®I’$šÌ†\"ºÝžšš\ZãÅ“Æ«%\rA5þ…†‘ä ¦êšÊŠ4JåÙ^Bæƒ5•ã…òòò\rk×7{¯g^^ÞäË/ïÝ»7>k„ rq$ÙÐC]ºtéÒ¿_?Ÿ×\0Š¢lÙ¹§ºººT^Åœ¬LÃ³W¥¢ªÚçõ¯¸¢D×T…]QUUu]×t¢¨ZP}\rÑUUUUÕ ô\Zh:	¹¦\Z‰GYClAã¼cF¾yÞ¼¢ú\"‚ Ü\\€/š¦I’4räÈàªÝòÒ’}ûö¥¥¥ýÔg‚yžOKK>TrôpYîY™-_ºTS¿¬\0€ÅÊ7syƒvH¯®S`\0Àï÷‡®·š:}êÐ¡CQzAÐOÐ¥“e977wà€ÆvEQvîÞãv»;@ýóòòâ¬vcp¸¦¦vÇŽ>ŸO×TEö+²_×TY–ŸšNü²bükˆ7\0hªêòÕWÓ	\0¨šn<.\\WWŒ.<dØáÃ‡£ú\"‚ \0GTßÐï,Ë%%%\ZZU~âdéñc þC†\r1ÜSQ<¸mûM\'ÇQ`eõËŠ!¥Æx€ñ…çXMÓUŽ67~t=è%€ËårT9‚§ÈÊÊÂÕÎ‚ HëcÈyMMËÊÊÊÎÊ66V×:-iù®¨Ÿ<Ï<8%1ÙðPEÙ¾cÇ›·Ô:ëB“cû|>ãÉ\"Ž‚S¼ÁÑi]×[ªõ©S§ªkF‚äŒì´´4ìv‚ H4˜ª”ª\0!Š¢H’Ô­{÷`‚ã¥\':Æ(t§N¦NŸš””hx¨Š¢ìÚ¹cùwËØ¼åøñãÁWNBÃC½‚ <×¨¾Á…W:Q5=T° Îå:zøhð\\Ýrs233±Û!‚ ‘_E©ò:(Bˆ(ŠÙ™6›-ð<Ò‰“µµµçî­X€5ä;Ã÷ ,;|øpŸÏ7Á£j\0PVQ^]ë8 ŠÝ»uëÔ©“Çã€ŒŒAŒh\n>¿Ül$904ÍóÁUÀ±’’`|ß»¹oß¾ø’gA$š\07òC	(Šb‹OÎÈ®Ú¹ME—§þ¬yÀ:Õ½Š&Rƒ3•iz©§*9ž©Ò´R\0àùÎu4ÕHgKè&ÅÛM$…ö/ÉæyþÒK/aÉâ%\'kjM	.Þ½gÏé²Ó~ÕoOJËÈÈˆ4}kˆ® ¾i=zôà¡CÁø¾…½\n{õê…}A‰&ÀFäŸÐh„€ÙlŽ3	æÎë9c¬i\nUD)‡ŠcþúuB½‡:Ê=pÂâ³€Xf¨ãÌžJ\0PM¢qzj’ˆ+ùt’)ÑR §õàùÎÞ…39>£^²$IÃûõpl~Kp»ÊÕ?eY5ðìPu­#³sÞ ¾½ÍfsèJÆ÷ ³ÛìûÑ£GwîÚ\\üœÙ9oÂ„	¸øAiE€ƒÁþŸ½wŽëºï<¿÷Üw?oèÆH”øI™’õ²,Ù’mÙ±Çv<ÞØOœd¼™Ýl²»5»U³ÿlÍVínÍT¥¦2Êî¤*ÙIS;™8Î:–Û±#›¶%™¢&%K\") H<\Z@¿û¾ÏÝ?N÷E£»‚I‘ÖïS0Ý¸Ý}»ÑºUŸþžó;¿#Ü+zB‰ßìfS˜).ô}ÛpÎCçE!]åâù.›ˆ±f€ÑZ>›ËñíVFwÜˆ_Ì¬\"Äë˜ÿ–H†&É‡q÷…ŒUó0¤ëÞÊù¿²‹ß¹,;uà#íÜ7Ÿ¹\Z÷®Z[ºrÉÊ$LSìeÔ÷éñ±ïûçßš{ãõ_ÄöÕ4íÉ>233CAq\r‹-o[«]Û±OÜ	Øó¼Þ†;ÇuÝÚ•çôúÿ§\\<…g˜ãqÀ¤¶e#CmCe r¼§ñÂißÐ$ù°3=k¤T¦>\"Éék¾gýêü©§LÎæ÷?p÷~\0À7Ÿ¹êDÌ¸¨ÌZ-WîÝ-¶\rî¼‚õõõo½uåÊ•Ø¾\0ž|òÉxà—r‚ âØu]lÞŠ Þi NÀoc=+‚E~ùYþ‹ïšÒP®‰œ-Ú&ã\ZFÿç›:l·÷pdpácÉq…‰Ù«§}ãÁ™?e\'>¦ä?	e|«é VÎÿÕÜ¥Ó¹Lv÷û\0x(>v¸æ]õ~p1UuCâ\0ççjë+ãcãÃÃÃÉdRVUTG\0Ç¶—––.^º(ú…Å\'ÿð‡>ôäOÐÚ_‚ bGæ›‡…‰›ÍfÕie>MÓ’Éäu½˜S_—jÿ™Ÿú›(<9Úy72ô¤+ÔkêÐ\r\0‘i¶Žë\\G„ëHq­“ë\0€íÆÎŽ\0zg&æÏœ^ú‹¡ÙŠÉde¼÷ÕWßñwïñ=Z~¯W< dÛ÷} Ô;\\¯7Îœ=;wñb&™ÌPUµÑl:!jë+õz£sÇ…T*ùÄ‡Ÿøð‡?LS¿AÄN,FP»v·]]]­­¯d-€¦©©Tj‡/^tù›¸ú½`þ[Â»\"ònä]S‡n„Šîªùä`!r\Zò›ÞŠ0\0@VJ!s\"Ž]`šk’mÇbŽSrœ‰…‰3«¯{«¿ÇÎÜ«þ2Û¬á V^üþÜ¥Ó3{FÆ&îòPŒïbaãØ}‘Äê/ÞXä\\5D´çy«ÞÆþ\ny7¾=33óøcÝÿý4òLA\\_îjtåºîÅ‹Wk¶!@>_°,ëÚ¯Àá;/8çÿL¾ð\r‘za¥£ö¬-#*¸jÞ03ÐFuäÕº\rcZP_Þ••RØtä„6Ç®šX“t®cö¾V¬a+‹¥e‘‰ÛŽ×%ÇåÓÞs§å«Ÿ¨íù=kä€¸§<ÿ“7_üw¹Lvô®=È[J= \\²m6\\¿¡«É=ûÊP^ò®HEýÁø«‰1CÓzßB*•4Tãèñ£?üðÄÄ]aAÄõ	Ø÷6MµÊŠºººúÖù·ÄH,€»öïï,GêKÖ¼•ÿÄOý\rkœŽ:&zD£…¦5kd÷ëÈ«©á¶¬‚úY‘t^•l—»Ž¤¼	0u@áØµº!Ë}@ÜÖ]#ÃX˜X\"Çç¿¥¯-ú‡¿¬NÿJJW_þz©Z™Ù3RÈíØ%Ûàú a°ª[.Ú³£•{ï’­ûÎ;·tu©Ú¨u–Yiš&¥÷îÛwøÐ¡‰‰	\Zv&‚ ÞŽ€Å>\0EQdV©TN½ð‚hê`(7xðàÁí‹ÂàJóµßÁ7žë€\\–×´#©ÔpKºñ‹ÖÏÊJ	ž#ñE![fêâÆé\ZÌÔÅ˜¸NˆÖƒ7Lì:­38Ndè0t”k¼qÚùLÌ+ÊÔükß â/ŠåÖ÷gEÜpªÕZ¥^ªVfvÝ{ÿ§EM¼¯ÙlÎÍÍ]¹r¥iÛŽmH§ÓªªNMMMLL$	\Zs&‚ Þ€ÛöP*W^yå•¹¹¹¸?Ô‰ûOl³ª5jK¯þ€ÍkSð5¾ûM;Â²\'\0ðp€\"Oá<«/ûÆiYª!„¬Ð¹~íµCÐÓ¼£Ÿ5ok@¤š­L,îsä²°]8¬´¨”ÆÙ»b›\0Zñ·X Ÿ\r@­RŸ»°`êÄÇYâ}\0‰ÄÁƒ<ˆöî¿d\\‚ â†	X8xm}}iqñâ[ãìëyÞþýûzè¡m†XKoý0yö÷ÃÆiÄö5ŒæèÁLöa¡^\0A8/ÔË+§\"åÍPº\n¤¹žŽªªcWQªM7ÊéR	¹LÒ\n¶ññÆ]z\Z\0sk\0¸í28Üç¡¢€¢·2±«ˆJ	\0`I•c‰ÍL o•æˆ©_a_½Q.m\03»î-ÌþƒÞUL¤^‚ âØ¶í×^{íâ¥‹]KkÆ†G?þÔS###[e_>÷‰Sÿšó‹uÎ¹,ßõq+ûÔ¦–§‚p>rN†ÒUÑøÊ^¶Qªõ¦[ŽÛ)¯É–©\0\rdÌáþI\\O3·Ö\Z»¶]¸÷¹¸–\0†(“–\0žTk}nrkU•°¯S­+ÍRµ’Ëdïê+êÀ].AÄMð©^¸råŠØ¨Õx2b3»v}öWž:räÈO\nùÜ7üŸýë¨m_\0Mkof×SqðÀ´Qî-òÊ©Ð8ÍÂ\Z×ÓB½…5Õ/€jé–™‘]5o›LÑxà1Eë¯ÛÀÛ&31.\r§º¤ðb­ëaV‘¡‹Ê¬å“•Ôî09îú\r‘}0§|D™ú]+AÄ­ðÜÜÚûãrÕ`¾3“¬žØ=rèÐ¡¾ã®!PzëÇ‰S-û¶D8þTjæaÅ¼Ÿ{‹vôýÆ×¸Q¦´—íõ·Jz£¬úe_µ’ƒZ.#¼«(:ÀVöíº«WÆ\\O3\0¦žFÅNíñZõË¨W”ëÈåÕØÁçõbÙFaÔ©Vu¢ö*—ÉŽýìNšYAÄ\rpL*•º÷ÀÀ~¼X.ÇÜkõÕÏÇ+h;Y™Ó:ûû¼mßÈÊò»>cdŸ\nùnî½g_Ï~>rN\"¼ÊŒAxöëË…51™¬ÍìÉŒMHŸmÛ.½ÏíN·WÆ&i˜YHZà¶œvÕÚeSMénÝE½Z*úH™VN‡ãÈ—Š+02V¥ZµWûŽÿÎÀô#t¡A·ZÀ}pè#\0c§¾ùÏ]X:ûõÿé}¿öGÆæ	Ñ0¸b½üÏxãtl_6ñe#ÿy\0ðÞbÚ¨x˜°/WjöœD.“ÏBÑcÃµÆÝÊ¾â¸¸Ñ–±0q—†ÅÄ0Ò³¯Ëf£b¯è¿(£d¦•k•FçƒK/]nÆµWSïÿlD•VAÄf;µ8{àèÈc‡k¢;ã=<žËdç.žîëM²¢°æ?ÿ¿ñÆéÖ¯V–ßõmæóqêí¬+5¡F{ÙnÙ÷ðŒy×prWaC±©w§_$ÚÂîðt×À5×Ó\\O3±¼Xe‘•3\'3{ïËæs>êÕr‰E†.¾@ÌH«bðyêÄÇ1™.‚ âV\nøî!ï‰÷­–lÅ2¯ÛÈ[{ï°2÷·ëOÆöuÞú#¾ò]´W±‰/\'ò¿ÙT‹ßŒ\ZÿYÊ´6r°__nœ™Ó-sð¾{’»\ncÎ}µÚ)ãÀÝdåŽÔ»é`û‰ÌH3E‹„†a\rÅ;=D£#Ö‘q¤2¨W%Ç¶ÒÑáAsêÀGÆŽ•.‚ âf°åôG÷y‡Y8Äå$€À^@Ê\Z;öþ™ËWç.œÎ¼üõÜÔ¬¬Œóß‰^üzÄ=\0‘¡³Ù¯ÆÙ7Æ³ŸÓ@Z¤ÒÆ•Jca-91hÞ5Ì¶Úv0pÃõHl·P]v‚†íT«F&ãT«\0R£Ã™a£5dÝ;4-†£Û¸´R]vÄa]Mê¡(ï‚èŸ%ZvX9k7Êo¡T¬Z“­³åsþi;7Y«år9ºJ‚ ˆ[\'à‡Ž.T}Ýõªœ½‘sEhù½Ó‡Ì]Xzå¹?·&î*ø¯põ{qÙs8þ”1óy&exTmP)ã4¿ßnýªh<ðPª&\'“‡&{Ý®8Ž]]«$\Z@Š‰ØÚû/Zy3?96þÀXŸôÜ>mãJå¾Úy+o¦³©–¿-ÀÔy¹Òéàr	VN‹ƒ§æÿôÙŸN}øc¿¡1‰.‚ â	xeÍ52zÐ°Õ(äL€W<—™½ïƒ«?{æÅùSO#:3´ò]\0‘ã5§§\'þ™,†ájlßÀ}#rNŠÅ¾â ½l#—Iî*teÖÆ•Êú[¥âå«=ÒíO¹h—‹vç’»¶\\ ä®Ë]g+írÑÆù\"€ÉÙüØ®œ9blÎÁ5å%`ï”·ðÒ¿z%èÄ}÷Ó…BAÜ\"wâ;+%\0\rMÜ5³çêÜ…Ó3ê+Q:’-²²©C_Ñéˆ{LÊˆgñ¨ê7¾†ðjk!¢h\0oVïÕ—/]>_¼Þ·nåMÃÌló\0} ´òæVF¿|¾xù|qr6?vt—‰5\0Ð\rkÔ\0§5j=¡z§O}ktbrbŒÚ`A7ùóŸûìÝ÷Þ±|ö×M¶…iª*!bš¦YWØôúÞhÑJGbð™Í~Õù\"¢p“¶‹ÿ%Ô.JF:âa,]IK€)-õ^^¿tòÍ×~|¾ºÞŒŸUªVL½ÏÄp©ZÈI5?–cr”ËÍ¼¯>žítyëÌí_5-›QC&³ì@’Ecù	Y<±óåªëMæù#\Z\0¨ª¤È€öÿ’Þ›¯¿0WßsðàAjûLAÜŠ|ù|ÑÊ›ÙDoä$t€ËITÌ _×Õd.¯FŽ\'Ÿz\n¯÷\rß8\r`£‹dçŒoëçêÏ¼ÚOs™¬˜©52%iÈîºÌådnŽ]5ÌŒ”ñ™¢õ©‘Þô—éH!ytvï!7\\¤ŒU§\08vuìè®«/_Šç˜Eøž9˜`©Dès€íÂ0\"\0Ž÷ø¬ò=÷7î½WlDA7WÀ¥j@:›Bµjd2±ƒÅ²±z&r<\0°Ò©C_‘”Ñ(l´2.ÓÂpÕo|Mœ»OÉ:Î}ÿT×˜sgy”afä„ÔÆ½É]íáØè£Û-ÿD].\00Ä“Äö›¢æ¹/×*æ‘,•ëÅ.€dh¼ûÇ^ûö·¿=;;»ÍPAqcœËdKÕ\nÎcr6ït8¸d\'}gÅ¨»¦\0|ü©Dâ‰¨Ý–Cb\Z€ øMHW¡ô+\nÜsßÿy§}E=óÀî\\r°Ð)Ý·ÉV+7ÃŒtrWÚ6•¤¹øúQœõóŸ®}t„©ºÑÚ4	\0p¬Ð8uòÏ~ö³÷?òõ¤$‚ n[ÎkNøHœƒèrë	a#[yË’*\00’7f¿ Éi&ùÓ$¦AÒ}ûŒoœî,¼êL¨ëgê—ÏÅi­ÜìÞã{ö?zpò‘éä®aßí£p—§—)Úèñáý´ò&€rÑ¾ðr@¨è0u†èË‘Ë«³£‹ß}æ¤ëºtÅA7„-‹°²Ã÷¨AiyáU¯f’n$‰‚,ßiÖZ›+ð]¿bŒþªÄ€@$~°ö4WûÚ\0÷êb)7š¹÷®ñÃ©¡£»4+¹©xê}ñPÀCxu+YŸàÍú¥‹‹^#-hÉHŠZ•X¢AôhJþÛWµ±‰™ññ	ºh‚ ˆ·ºÃ;úÙù×¾DwEaXieæaINƒZVó›/‡Ê›ÛDÒä®Â=ÍlÚòè]ŒÿŠÆž< íùÈ]q§-èìVu˜XlÁ+xo>óÃ;~¯¢(tÝAïÔAÛÜ70ýÈ‘\'@©Z©Uê•érJo™IÎ<ª™÷\0“É ä•Sb»…Êçžúd¹`0#}-Ü¬ï::öMbŠ6y<½çþ!sD†ë„ŠÝ€©KN«\ZëÄþæÏ~ö³K—.ÑECAÜ\\3Æ&ïýG÷¼ÿ(má`³±\"„$í>*+#\\>3	Ã`ÉC±ç:]¸¨u„ë‘¸:Þ5;:¼¨ªFU5\\BwÀv“\0¸ß±×“•9Þ„êMØ/¼üòËtÑA7 n·$§ÇŽ~¶Zü‘Ø~FZE\Z\0¢ÑËž\0d†æÜ[”Œyô.=£Ðu„M\0*bÀÚd\r?€l8]Kn:èQUEÅTk­5T*R@*ªDõÜbP3â5t8ÞÞ)/“+œüñÉ\'žx\"“ÉÐ¥CAÜ¬,°¦š:öÕÖª¤6rx4ÞèWˆÂ\Z¯œbn­ç7\\qÂEI]àêWk\rñ u{£b†‹ê·4þ†‹R§}Dk‹Q%B°”*J–„íÚ5I$~\0³£‹.Ì---ÑuCAÜt+Š2tè×§|$—ÙèûöËòPçÃxT\r•7¹žî.~vôp=êô\\T‰âñ«01€°éÜ\"·ãx×»‚2²éÓ©M%ì„T¿4»yæÌºn‚ ˆ›.`\0‰DbêÁß¶r³íPœVÆ?\0IÇæñgQ~Å¯ÛsmûÆÒÝyÇ¯j­Šykþì­ÞU°Z”A9±é}\Zºdhùœàõ7ÞàœÓ¥CA¼vº¢&=r`êÄÇsW^‹¯ií5ZãÏr[¿AÎ·”ÞÕù¹Ãs[<ªDRvg{în¸É	ƒ+µ¨ªŠÖÐŽ]íûX±WRŸÆÑ€< …°±y¼¼eßÕ³å„¬¯ªƒÐ®8¤ŸŸ››^__\Z\Z¢«‡ ‚¸é–Ñ|Á¿\0i>ï9Ø2hdõ³RW‡æÖ0oŸP\\˜Bö¬2´é$¢ +\\”µ…S«ËNÂk-;vË6Š.€rm]ZãÑ  nHk­<\Z–WÈÖ†\ZÅÃ\0Xéäu\0ºe65KW“ú@¨\"@ÊJ}¿ˆº“²~¹}’(“³Î/¯,,,€	‚ ˆ[!`ÎyÌGŽ\'šŸN*‘ÙùLUåÔú½ÀB†V«ÊPÙ³ŠÕV[Y«ŸfírjX^­ô{3Š„KHf#\0K’¸!Ž\'³‘Ðp£\"H–[w­c%~Lf×`½ËÍÀðÄ8è}-×z#a\'\0´6Ÿ\0ÖŠK¥R‰.‚ âV˜I~`/eiù½LÙ4yÌ½E1õÛ»ó`0‘Rk8eŠÔ»V?W9»\ZgÖnÊ›Ãw;Ñ\n1g§‡šÑ€Ó²sÕ\0\0 \0IDAT&pOz£Ö+µšìM§ÏWGÍ,ŠƒâÞô¥³âåbCÇ¯\"Ü¼þòëâ…²Ó­—+\Z’9(Û	ÉŒì5Q}bóé×•ååeºt‚ ˆ[!àˆ{j­MÙÊ:y¶¹z+ž\0Þ„á¢ÙïTþàt_õÊÖÐåŒaåf“Ñ>\0—s™»rCÍtÀÄx«>Ù³ö€¦(Z\"‘àLŽŸû ‹\"°GÛöwì¦ã(ÞRÐ,X¸²”¨­8Î¹ðªÜÞVŽ¿ˆ×_^m‹Gï\Zžìµ8O¨\0pùòå ¨\'%AqÓÌ£Ò¤J”ßÑü§¢Ë	„°}$E‡%œ–Æ×_~@£\"ýe#ŸÉY<=}ÏLfyèþÄî{ŠÀT2aå×Ð³šÀ×T\0i]3\0M–p€ñ\0c,bŒ‰†ÔL’¸¸$Å03†é…ep€ÙIÔ\\OõüºçåÖVšz©\\	üËAy~ ü‚ÊýC9 šp°¦°ªã{žG&‚ nº€}§UK•°^\"¿YÎ«/‡Xñ¦¼†+ÃFÇ¢[ipT¶†ÂòêÅ]©ÕgŠê]ùÌØ¦Ùq\0Ik`\roŸ¬îy)­µ¶8|\0%u£Ùcq\\†XZÅ8çŒ‡Œ1±dH<±n[ñÁ‚—Ì&ãW*“˜xð\\ùÉÚ¥¹š5ïÔOíK={°\\“­¡Â`ë¯Š2k’ÓjÇÀ¯U›Íf\"‘ ˆ ‚x{°>N5Z{0Hæ`2Óì®Þý)È	Y€ŸNÆ?bªuúR«ïÆxºi&ãSåŒ\r¿ÆöMÈ\0ƒ1ŸÉ\0„_·Š¡ÂÊœsÎd•‡²¢Ægè¤Ù±Å¯œJ\'‰š¾k#õšƒe³\Z06UxWµ èê!‚ nº€·!Šl±C«GçŠ[±ËB\nrÁgy4jýìô½€d6ú°s€“Ü+ž‘´ºÎ¯£ÑåNCjÙ÷\Zé^€H–e•oôI#Œ¥Þ%{IVHG 7*R4Èü\'3\0€ãtœzqAï„ë‚î‹†¼ù\rénîzÑ™†7~›£Ð»ïþ9øÇ\0ð”–ì3¹ì\"ihªˆ°†„­\"ožçÉ²¼)¸«*cLeñžLÙ²d´Ç¢ãœ´šk«RÖB«X\ZùI“©,„.›¢§æFV®×ëv{Ã`‚ ‚¸‰ÖMUø\'(\'zŸã¡(+Ú¦&”±t·ðqr<›j•u\0r*çÑ„®g=¥i†¦¦u\r€!qÏšAÐl6×ÖÖVVVšÍf­V+—Ë®xŽ]uüµ¥+oÉó4M›™žÖSWË²rV6É¦2™¤iBÓŒd3Õ¶YƒCµúFs,–…nÈv©7ÛÍ¦øtõA7]ÀO°º\'€%ÖÚÓíí·Á]nÎ·s µ¤É­Zr<\0¬Vu€ ²P[¨Î»Ë‹W®^Y­Ùne½\\.7êÕ«‹­•¸“«Åm^$Þ6á\'M{jjj(Ÿ0::–-ŒLäóƒ“““š1VÉÉbè[«cg\ZW¤Ì®ÁäˆÜu¶Èñ\0ÍxÖ²†IWAqÓ,, ²×*K¡Ý^’ã!èÞFÛ˜8yx¦rêJ«°qåÊ\'ÄÒ«¯.Ôëf½R\\Y¹²0ï|µXìíûÁOhí)amGïÿt¬.ŸZ-(ÿâµ§›öÔÔÔüüüÔÔ€¡|~ttlx¸0ª®>œrÂl\r2¦2¸ÝS¿¾ •Jš&	˜ ‚¸ùæ‘î§“hšÍ¬´9t²ò¨ëHÀ›G¡¿ýôÓóó­Yä‡&\00Ï€8¡I÷Z%Wòuý‘§›ü·-ùt“Ÿ@Ôéc$t¡d¬Ÿ>}\ZÀß—F\0¬Ý£Ð\r¸N—ƒKÕ\nñ<?¢\Z,‚ â˜1(æa™Ý£¾<5ŒíWåôU²¢ë{-¼ŒO™o¾U.®š\' ´Ö\n¸÷&Øé¦toâ–j?<;f_]º7ÁN7yO2æ\0N	ëu\0dkH·:®½Q~u~q@&™6]=AÄM0\0ŒL‹nP^ñœœïlÄ(_Û¸[TcÅµÐÿÃÑèóÑ)cË@¯/»0ÇF:µ¯.™c#öÕ¥®‡ÙW—Ä©b‹W9åmÚiú@ë¥£A&&€¹Ïã¿-ÞŒÀ`~P×uºz‚ ˆ·Íu„KEžjÊV¹&©µÀ»îbAúZÏß¢úÄø5_º×ÄæØH—}{}ÜIoŒî²/€¡B^l¬d¥X*×‘ƒì+Ú`½VN§UU¥«‡ ‚¸ùî$&­tTcW#ïçQX‹ÂZ\\‰Â\ZÓFßn×“‡gÄÍ‰\'X¯5…8»ôÙ)ZÅ\ZÿŠ±›{eÜuªÎ¨-øL²@¶†òw‡ñÙk\"Ç;7¯]YZ×62:zÍ6 A±\0¯ã¡FÆžž•/œI\\|±Œ‘æc~:)zLÊ	ƒ×ç`\r!®ÃÚ1ÉñìÀÑ»Ö_~=™NhR<J,nô&×Ø¬Â¸AyM™¹¥•øHë 5ˆ-F¤cNhRœƒß÷ÁP\r²p¨ÀÄø³ëûJŽgÖl/à9Ë\Z.èÒ!‚ nQVÅH?(¦B“KgCïyÖü	[-ª^àõ9f¶F˜¯Ë¾­|lLìÅ;ñÄ¦:©kÚ¹‚2swë¾\\¡3åµ®Ÿ¹÷´¢KŒ?OÜm±T@kü¹£´¨À²,+—ËÑ¥CAÜ¢\0ÃÓ›ŽøÅJjwjðÅœRu	P‘÷¢¢„Í»÷­|îw0yh2úÑY”‘ÌFqî¿½öÀÒ\0¤-^+o8¸´\",ž%B°8ÛV…]ñø³3t8rC”ª@&¨+ªí%B@¹&UKe`hÏÌž‰‰	ºt‚ ˆ[\'`EßN\nç/ªö:\0–25´–ëhÈ‡î«\\O‹–XLÑ¶ìÝïàø]¾ð\0ËÁûÅQmáåkfß\rûŠä¶\0ðZ¹uoiEï\Z‚îZŒ$F¡ïÙ}Ì\Z²ªÅÙF4¹ô§û¥ðHÞ/…o\09l…ìµÙÌâœ_{~mà»gw§R)ºt‚ ˆw‚üùÏ}öîƒ‡wøh‰éQèòÕ(vU1g\"5+iÅÀW•Q‰€Ädð<Sú„àžƒÚPRöÊ‹eê¿OOÿãB¢4³6×ù\05ÚÊ¾jÚâž#þ•t#ò\0p\ZÌHpÇVÓ© Vï<Õ˜*-ú\0oâh˜˜úçÖžG×›GÒ”çf•H‰ÂÁÈ‡¤\rqgÐ«Ì.­3œ‡÷ÝðÄOLNNÒ¥CA¼®»”·a€7 Z[Àë›í°z‹¬?¦ªÚî’ÓŽþnåØ‡·{ßiK¨Wmßˆÿm‰9Wˆ…Ý[íMúðoyé_WÇ~{p\"Û´½¦½i\'	–hÕH7k+‘öe§~kôsÖ|zåìJà…tõA·NÀFj„M…g{¥6:FiÈs=ÍÜ\Zâ½¯‡”|¯?ú?\'³:J¶¬3ýÝÆèÑMŽn9w§çlJË¦â4Üû€®QègŽxé_¿T}_2m\0p*.€„Ù¿v,‘Þøºº@ýìÊÂ_½vé™9§îÐDAÜ2ÈcOˆ–X¬ù“îÓõ¶ã\\t´³Øt¼ƒ°œ;÷7ia8¬³âÑOõé­Ñ®´êrmìà^â“4F~;óxé_Ð¨mÒgœ€íÍÍŸãì8¾p°¬3\0•Ÿ-Ì=}Þ)“ƒ	‚ ˆ[\"`\0lòI>\0¥ŠW<\'òºÍSÃr°Àu‡à:_Ê¹Å=Âm1CG?ð‹{þë8þŠªæÞø+nx•úö/R9öá´/¦6´Ýé`¶¹1o¶~È÷÷zèrûÜêÜwÎ7W\ZtA·BÀ²2®þ²dh(×”‹çÅ40K™¬¾Ìœ<ä1ÞÞ½`ÃÁ½!¸c&xáÔîÊ³»ì\0%{h×	1¼aßvy³_+ÇÞÝÞ¾búµK+’Ó)ÝdÚ¿2/â=±ëÅzç4pg@`Ÿ[½ô÷sÐ•DAÜtó‹,f‚yÝ\ZæFQöÙnåÕØÁ-\rw9¸ýëê™½•gnùJ9SâãÛ4yî²¯°râé¬ÿ¼|KNoFÇ(tWîÍ¾›ì~nµøF‘®$‚ âVØH\rˆ9žrñ¼HÀ÷f÷÷Z§ƒÅj¥…Éòsj(ûP²ƒêÞùé§º‹õ¾~­7¾ÝZ\n\\Z‰ss\\„õhòÏ%\'™3:CpŸÄìöŸÙÓÀ½,þdž¢	‚ ˆ[!`\0|ìWÂ=ŸÀ§EŽïÒg¦‡àmRõ@>rÍ‡éûÒg–b¡\n¹òZ¹WÃ½öí$¹øògSÿ¦óH‚Åp¼i+oõ-¡<WŠ‚ˆ®\'‚ â¦X×õ°ð[› ÿâù.‡ÑA\0ý¢;r°œZ\Z:qZÖY×¸n‘ô!kèÂÁ}£p¯}7âìæ5Hg–Ž|»ÿgáE\0\nÃK©Ì|*3o»N<\nÝw\ZxãuyåbÙu\\ºž‚ ˆr}°ºÐƒRÊâ«?ˆü5)U‘‡âÆXª3°¢ä¬2UŠÚõVkoowÈâab´‚4w.B—3¥%S$¹þY½Ø©§Ë\0p\Zp\Z0“\0\"Ï?(­Ài\rw\r>0ÇFÊÔ4,ýVN›(ÖZË™|/ð½`lvmbß•ÔÑ¿»ÿÐËC_áÛsÏýùÒÙuçj~ltPÏ¶NpE‘£0ê|«Q…;9=`˜tIA7]À’$±Ì¤,IÅWQ®2e0R³‘Hš\Z)MY™¿Ì¤P88âá&óPÌ\'†××w\n[	\0/HÞ‘Ó¬[+ukeY*8…–†ãŸ¶z¹c÷Ú·xt±uª=…ÁÏ¤øb¾R4\0$ÓÆ¡‡.=þjáè³£é¢•ÕÈyöMöŸO6švCñ>öŸ8öÄ½a„æÕ\Z\0E‘Åw‚Îï\0ŒÑtz\"C—A±”wø|IN³_X]~%[‹¯|—Qa?¯Û­š,m•9î:Ì×Óh/LÚØ²°½9ÒÄ‰·šé‚ÿÝ<¶(Èr‹{2<è<ójX^ÌF‹Ù³\0\Z•–gK;\'}kp¹=dÌFu,­!ŸÜs4Å,_zÿéý\0F>vvÏØó(U¤rkùÍ7ñýç</à\0>ñÉO=øàƒº®kySËë\'çÇ75îÈcWœ(ˆ¤­¿CAÄIÀ­S¨c®4­^þYä¯EÒbh35#Æ¢e$CcPr/G‘çà-¢ph¥ÜÒÏ§»FwÂvÓO…Ç™io=Œœf£\"iÄïJîÈJÑløÓµ¢Ù(çêëf1™Ä½â‘lOaü£‡GŽ\rF‘5\Z	ÝÕ÷\'î:;:4ÛEHA Tôÿð{òÉå!\0GýÝßùË²\0(šbÍX\\“ÝK•ÎàcŒg2Y¦2ºª‚ ˆ[!`\0FvJL£nKòJ¨JQBŒE·,FA§Ù9-~b3­îø¼ï@4S¤ÐåòH3¹‡\'wçÙa%¥gó–ç rš\04ÿŠŸÖ_h\rŽNYÌŽ>2¥çMn»pîs\0µ¦ËMØ.€„‘ãý›ïþîR\nÀèèØïýîw÷ÝwoÄ}IJŽ§<Ùó•.‡.7we­Ý9&“€	‚ ˆk£Ü³0ÆØÌ§ƒ`gÿm´TdøA0ø¸bNˆ±h\ryFÕLe¼]x-F¤±yPzôXÉ9¡·\'¥¨‘vVC\0Pôä®BrW;µä²\\^rË6Šn¹¶Þù+=\0@ßk)“#I+»DðrE¨W\\¸DÇ.a_Çï/_\nŸ~] )ì‹_øµûï¿¿ûóR”ñû&*çÖÂ¥M·\\ÇLA7OÀ\0Àesö¿µè…ßÇRÑ­ý½:x_ThuäÐ´#^drÿ,ƒÃfêÌ­Å\ZfŠ&§–ŒÙœ»¹¯TË¾Ž×Ä¦‚™‘NîJc¼UŸ<xö²m˜Ç®\ZfFÊt4Ípk(¯òvðmÑÏ¾xrÀ5…}þÿè“Ÿü$c}´jXÆÄ£3õZ×q3k(šL—A±nÌ4\0H€¤øæ=kA&Q:©úHZdA*R³­ùàä OIîeîxð=1+,…^çÄpÄÃTv½ôêáÐåQ‰´[PEƒ<3¹Ôš3nÿðÀO ¦TIçâ_\0Ì­Eõ\ZœfÔhpÇ‹x$²/³¨7\0HåŠ„bäù/_\nÿàï\'Ci\nûôg~õ·~ó7S©-·W’r}Íqë£Ð9säè¨ž£eHAÄ-NÀ\0€D\"‘=ü•+«ará_Z¨qç»\rvÕ°÷*æ„‹æò“Àw%ÛÛa´kDZÊøJæ\\XÜ#¤kj|ctb;Ûd‰¹5n·[{¸ŽdÛÉT´¸r©Ý7£TôÿÃÉÂ÷Îk\0ð¡§>õ•¯|%“ÙnA‘‘2²Ó–}n£Õ—9”Ôòd_‚ â]0€¬iJÿã¥ÿÒ‚—\\:[I5SÃP0Ñ2ºþdÝ<°Pv#Óä®Ý€í2S&6fÊåÖ\0²°o³æ\Z†zMûŠm´¶crîs9n¼%ÔÛ.¹9^¹&ý‡“ù§_WÄÈó‡žúÔïýÓ¯\r\r]óÏLŽ§‘3Ã¥†˜ýÍN[FÊ ë‰ ‚x× “ÉïÿêÿfujþO÷íCfõuÛ^wòi>æÙI\0†#sM*—$ Tt@ËÄåÊèDfûâ³5k.oFÙ^í«[n»ÌÔ…qãÈË}ÎT¶|7«WdßÈñÎÍkÿñ$N.+«ÅâP>ÿ?ÿk_úÒ—vb_\0ÉBÊJÚ%\0r¦5“£‹‰ ‚x—``@øcÿËsÏN-¼ô¯ŽüœQÆR™ã,«ê0\00u¡FÙu ¡¢&v´åìä|åòTgfç¼ƒö¦Œkê]y€ˆ¼2€x‹Þžjgaß¿|)üÃ“…«‹ËCyìÝ»÷sŸûÜ—¾ô¥D\"±Ã?0húh/P}h*QHÒÅDA¼ûþÐ‡¿ôwyúûr_éôÞ)O24Éqá¸‘¡o88Ö0\0Ý\0\0§ê­\\lÖ†[~;\"Lœ‘ø\"·€×›Le¼½aQçÊ¢î*äŽçÎàû³…ï×¼€åóøÒ¿øè£êº¾SûÚÁk_{eùù¥¡]isïPn–â/AqÛ€®ëûØÇÎNNþõ·¾å}û¿|úPyß¾–7mÝ×ab\0ë¥äü¹#¦±D«ÆXÜàõfüŒÎÉ]Y<Q7ºÕ»9õ(ýœÿô¥ÙsçÎ\råóšÂî{ÿ¿ñ•ß8tèPßGýíë…?ÿãÓ§ÿì•dÚÞ—µöj	®$‚ â60\0ÆØ‘#GFFFþöo\'¾þÜ7ö­=ûø¬’Ë«›¢°ãtŽK¯þ?³óg—ïþÀt¼ ¾1::\'7*Û½R<ÔÜãÝ¶zƒ_3O.å¡|~ttìs¿úÙ~ô£…BaççüÜ7~ñ£ÿ|m½>sß¤¹w(7Û¹¼	‚ â	XP(¾ð…/üüÐ¡?ÿÿü§ÏÏ=8øÃ\r\r‘¡KåŠqñò~4’@l_Ûufî»šVúœ×Þ¼ïæÑf´ëœ…zŸ_û+h\nûÀ#}öW?}ìø½Šr}ŸÀòÏ—_ú“këu\0	S³öjŠ¿AÄí*`\0Š¢?~|ffæ§?ýé÷þnô›óÆÔÒ§•ó9?—oY3®<óäfÃ:©Ìülf±Ûµ=Òí¼Å’zf-üæ¹csbÁ.ÏYÖ®ééO|â?öØö+}ûÒ\\i<ûþèÂËé€ü”Eñ— ‚¸Ý,ÈårÿøÇOœ8ñÓgŸ}æ™¿ÿßŸ{cÂýøûð ™Ïùë¯ÜýƒtÚÀÀp™å_{Š”Ü)ÚÈÐ»òn±¤žY³_|Í|~­àX]-÷îÝ»wß¾\'Ÿ|òû)¼wxá|úÕ^öMæŒ±\'ö­ý%‚ î\n…Â?øÔ§~ä‘3¯¼òƒ?ûÍOþáÉõ{óöœ?–€àµÛEÎCc+z5·Š¨cõ:\0	(ý—V’\0N½aUKeá]MabÀyttìcŸüôûßsâÄ‰ëšîíbå¥Å7þúua_\0{†‡äé\"‚ î$·Ì:0ðØcÝÿýWæ?÷µ¯}Gþ£j\rõ®Ç¬-TþäY>;j‹H?¿8*nTKå³îÝzUè=­ó#{öÌ?vüÈ‘#³³³Û4vÞ	NÙ9ó\'/6JŽÈ¾\0’rº¥ÓDAÜy$‰dÅÜw*sÕ®»š¶÷Ý±ï]9¯=ýúäVO_-FCù²¦°œefbrrbfzzrròðáÃcccétúzË¬úÇß3Ëóg–6ì›6ÆQïI‚ âŽ0Ç…¿;ÿƒñƒ¥«‡…ç¦ÜõOŽÿ“‹/WWkå*\0Çß(¹2TÀ`~pxx8“Íäóù\"Ý˜ .þäR£äˆwÀÈêé±]=AÄ)àÀDG‹.ûÆ5Æ÷|þpf&Ç9÷}ß÷}Î¹çyœsÆÓ…1¦ªª,Ë7Ö¸]4–\Z«/-n|9HÉœIãÏAÄ)àÊBåçðÜé§ß%W]Ndw}ò®ÌL\0cL×õ÷‰¼ñou®ìTÜdÎH¦[	8x89HÍŸ	‚ ˆ;JÀ\\:yñÙ÷ìÜÏ.oõ˜éLÝ?q›|F«5|pMJ˜š9”d:-ÿ%‚ î¯Ÿ_?ûgßøë×»†;¹÷ãûïúÜ!E“o“Ï¨8·.npMŠRÿ\r‚ âÎps¥qéïç^ú“WæËµõzz ÕwðyÏÑ‰{þ›ûnŸÝý/”Öìì«­Ê A7\\ÀÈª,)Ò;Xu¾²|úê/þòÕù3ËBº[ÙwdÏÐÿÅã™Ûis{±ï/€„Ùêùlê\0ÎÈÀAÄ\rðOÿà§©´žÝ;˜ËIUË›º¡ïÐÇQ¹u·±X/_._yñêüO/­ž/Á7¾Ñ•ƒGö=þ¿>>|ÛLýÆ†jdõX½­½]ÎL0Aq£üÆ_¿Þ\n|ƒæ •I\rÑ ™JëæPRËª©ªiMOé²!|Þ¨8‘ÚÇ+9öj£xf¹Q²×*KVãöB½7ºì;ýä¬|›}@Üí¤ÒeßâÜú®š«˜\n]@AÄ\r0\0Ñzbõ|i%q$îD!J‚E.8·Qsâ\'ÆÇcûöÆßø1Ýóþÿñ¡áû\'äÛïbš,ì+Ô+ÖìÊÕêí3QMAüR	8vp,Ô¸òÊ|ùš§ŽÛu°ëÈûž<xß?hðî¡ÛôJ¨©´Þè8’HëÍš[~c-¿?O!˜ ‚¸ñy·3ÎöÜmèµo|<.Å:þå£÷|éžìDööý€:VC	õŠ«/\\ÉN[c·ßŒ5AñË€ûZy‡î›€ãã…)ëØWŽÏ||öößÒ »w°xf@³æ&Ò£îKß;o&fè2\"‚ n˜€“ice¾Oúv¿®;.{†hµñÅ{ŒÜÝ,Òc™|ÊqüMŸCV]~ñ;ç\"Onÿ\0õå ‚ nŒ€ãŠª®Èß!â¹ñ˜óÝ˜žýÌÑ‡ÇôDâNQVf\"#$qqcÚÛ0ÔÐå\0Â¥Æ¥¯Ÿm<:3ö¾qš&‚ n€€ÑQóüöè¬vÙ34uxdê±Ý»›¹ãŠ‡µŒf%ËB½]Q8tùêç\ZWk…##ÉÉÔ\rQ§~[AïAwš¸«z\'ˆÑæƒî:6:ýÐ®Â±a5eÈwàgÄ+±Ï­6*®ppïcêgWìs«æÞ¡ì´•O\'“×ˆ£ \ný0ÿeY,1E¢ñm‚ ˆ÷¢€»Ö måàÎ’«dÎ˜:<’?<\\?bÞ3³+9’¼©ûõÞ²Ó–¹w¨ñÂ•Îƒ²ÎB—Ë:·ØçVís«È™¢]‰™5”¤&vV5E,)æ^4¼ Œ\'ƒ0rC\0P4YIjŠ¡(²¤$µ EVé\Z%‚xo	øáß}Ð^m„KÕK5±ý@ÜjCtáØ˜$N\\“¦ÌádÎ4§­ñãc™B*9–Ö,ãöÙÑè~L¦2|ï˜}nULýv:¸ë‘¡Ëå’m—l¨ˆC9³ût%{#:+,•Ö´œ\rÈ2ƒ¼ñ¹I\\¢Qh‚ ˆ÷€ïþü¡V2#¯æ:U×YkŠ ÖEr(iš,!+†ÂÉ¿ŒŸ”µÛ\Zybvé{çãÔÛq×&O/5º¦7-g\ZÜ¤çÀu RÓdI•d\Z|&‚x¯	¸u·&‹ü—($ñÞ^ðÊ+µ+ÎúÉùíÜ•’cûŠ&·i]Z³ë@ªcy1AñžÐÊ–÷púpú|ÙõÈôÀ#Sböw\'O‰í[_Þ˜;çÍ(Öpß’.USâ¯F‹è“\'‚x%àj½Ê3ãN¯ŸºÁŸ—©ìúàÌUS]ýá\\oî´rç°s³æ²„Ä›‘˜M\0·µÁƒãøH*õš»2!í…¡h²¤¶Î)s2¨š â½%`»é\0pGÓ´D\"A\ZîÌÁSì2ræÂçÂ¥ÆöÁíÑæ8õn|Â®cÂhÂM\0Ñ ¹ËIÀ¤O— â=/à\\‚ ¸çy†aÜéi˜sÎ9ï\n”o;_R…äâË‹•skáRÃqüx0¹wÒ7Î¾MÛc^€k­Í\r“	Sl´,~•ôŽ\n6Y¢” â=\'`á`ñoðz½îû~:¾³,¤Ûu¤÷×·÷GD}/›\0\0FIDAT%\nÉ]œiÈ¯¾VŒ5Ü7øÚ®#ÔË:–o™íúg³ ­PM€lÈt]A¼w¬ëºçú!âŒèºn†étZ×oë’Ý ÞÆSÄŸÉ9W¥7(oùñirv\"›K;GG+W«å7ÖDÃ¬fÍ©·i{\0˜Ù5§O“A$s¦ãøqsNY‘%Ÿ³”¬È\n€ˆE(A¼—œN§=Ýk6›žç¡=TA¥RÉf³·¡ƒEØ\rÃ°ï½²,_óé]þÞùè4c,QH&\nÉüBc¥Þ¸R³+ŽÈÄëÅ:oFkåj«{Iic‹‹Á‰l2g&ÒzrÚ2‡’É±´1®§RI¦ÉŠ®Èª,)¤^‚ ˆ÷ž€EQEÓ´Z­Ö°mÎy¬£f³)Ëòí3-Ô+¾(låZ!æ®»cïdz«@œÈ™Ü€{¡½f»U\'ðBßö½¶€E£JI—õ”žJˆÎÏLgTóLñ^p¬át:†¡ã8\\¸sÛ¶u]¿MA¬ÞN×jšâyAl\\qƒ1v£Š°®ýÉšŠØ¡µûØFÎ&ÑA€¯õEI§ÓŽç…¾/Ë²†²,»®«iÚ»îà Çé+³0ŒdYÞÊ»ïŒ¼KA\\€E|Ô¥fÛqÄô}ÿ&	u§:cÌ÷}×uÑ1}!ê¥µËAÄ-àÞè¦ªê;	sñê 0Åˆq§z{©zçnc½¶‚@×uR/AñË#à b/ê¦™N§¯WÀq•r†A^ÀÛý¦9ç‡ÄúÈ^Üì2r†[U5‡m„¶o‹Ág‚ ‚x{ö<¯Ñh½%‰ËÚyÄŒK”Å2â¾ƒÌbÃÛˆ€Ä6õÊà\\ø8ìLÃQÔµ‘,ËâüK‰cñd0%c‚ âŽpµjÝ÷}Æ˜eY;_,ê“]×õ\\ßç›¼«lN¥¢åV§†7Ü¼ÙÇbê—1ÆX(IroüíJÆBÿÂÇŠ¢ÄÉ˜LLAÜîö<¯Þ¨‰Û†aìÄ¾B½õzÝó¼8«n¨‘± ^Ó1àÜ©áØ¾Éíz+Î9À€1p¾i†¸ÏËu¼«8+Š\"b1QA·©€›Í¦¨yæœ‹EÑr›éºn¥R±m;‚Î‡mÄSÎÑvD‹.\r·nó\rÇÉx³‰qÈ²ÜëÝmæ‰cûjšF\Z&‚ n;wê-Ãååå†m[™LßÍ‘êõz¹\\«ƒÐ1«(Ê¦ÙßN_2Æ;–±VHîöq§‰ãd,1Hl#õnV3È’^ï0u§•ãjÆ˜ªªˆ	‚ ˆÛHÀ‰D\"•JÕª‰ÉÂÁ•R©^­¦R©L&£ëz<(]¯×———E\\¥O‰³ËÇ±Ñ±¹I$ooŠÀ\0Þ1[ÜiâX½BÃEÔÂÁ,D wª¸oOJÎ¹øÒ †¦ßá\"+‚ ‚¸Öu}ddDôœêÔX¥R©×ëªªš¦iš&€jµÚÙ c›Aà®ÑéM^l§Xaâ`ó\05ÚwHÇ2–Ö©U1UÜû6újí¡iß÷UU%\rAï¦€…ƒ\'&&ÖÖÖªÕjà{\0â4,ÚD—J¥ÞL	lj}Üõ€¸2¹×‹¹ýÌÏÇ¯Øˆ[±˜1ÆÐˆ7½Üæ¡i×uIÃAÄÍc§jÑu½P(ŒY¹EÕ\0D<ÜÊ½pÎE8îzX\\™¼eJÎE&æ@ÀyÀyïC\"p¡ä<â­r­ˆ÷?YÜ¦£o&îzÏ®ë:ŽOiAÄ-MÀ­‡*J&“I$žçÕªõz£æû~§·ºÖ;ÀÛ9@-6½¹†ƒtŒfEÔèXÈ;X—z¾[„—Ú;\"lz«Œ1ˆ¾˜è}ÿñWZ=LA¼;Ž5¬(Šaƒ|ÀiS¯×{äVó¬ñ¸´(BîŽÃq×*¦\r/v¶ÊjïéÛ;UÜZ@Ü6±ÄZ±˜ƒo–/8ý¶:Ç¨;ß¿ëºŒ±D\"AÃÑAÄ»#àØ[Œ±T*•J¥‚ ¸téR³ÙT…I˜ñPLcëyÖ.Uó–Ñ[;vq²8U÷	ÛXL+ýÙÛâíybñº±V9c!Ð­aq£^¯wV}AÄ­po&nE[Æ¸hÙž!ŽM¼•Œ;q×™7†;šX¡k°±)î±ÕÖ9°1\\½q~Î€M«˜º¾]ˆs÷­n6›\0ÈÁAÄ»/àXHqÉqg¬d<ä¶YÔµZióNí›Œ;}/)îÌéñéúQóízlu½ºø‹ÉÁAÄí\"àL&³¶¶æºnWœ×ÿˆŠÌx&m$ã®Qåí\'ŒÅlqïòâÞþ>å@—‰£îà»iES,cñæÅ»`í!k×u©&‹ ‚x\'Ü˜’\"Ã0²¹\\_w²vg+\0AÈð<ê^Å[s›åLb;añoßô­£Þx0çâ}ˆåL[­hÚþ¯7<Ï9˜ ‚ ÞÍÌË6ëõz½Þ+01Ýµ« Zs·¢n«¿2ûõŒD{”;öâVu[½\'ìª :¾†tUPÇÔØ¼%b|Cì´HÑAÄ»)`´;V^¾|¹·mE×´.6wÈâ\0‹Ú\"ÜZÆ}+¨ã³mÕi«KÆ}Î&\nÇÚçRëZOl*Úê|iß÷IÀAÄ»,`\0™LfllìÊÂeÏv˜›ÑQ´±ûÀ£>2¾¦‰;ç›ûn-Ê§E—¾9£gˆ®ž—\0|ßïmjMA·ZÀ\0r¹€:¸7Ç\nŒÇ¨¯k€\Z=•ØØz€ºÓ¢°+Ã¸5DË-@eJœ†;×GàÛwß$‚ ˆ[\'`á`UU———+•ÊÎŸÕÑ\n#.<æŒ10&4t›[7Ûê<UßÇÄ&Ž÷„ˆë±7æ‰àóÖ#{Ë§9çÍf3‘HP&‚ Þ}H¥R†a,--­®®ò~ÅÆ;LÃ7„üÚE[ÀNG§»NÕµª¸KÃ&F¼S|*1¸ÝñuAØó<Ã0Ã \rAï²€…ÉÆÆÆ2™ÌÒÒRoiôÎém‹Ñ%ãkvÚÚêlªªö> s“Ä>=/Û‹‰;¿SpÏ›%\'	MÓHÃAÄ»)`ÅîIëëëëëëïdálçbâxESç<±`çE[h7 Æ¶{ÇóÄÝ=a£Å¥èAxžçyš¦Q\Z&‚ ÞeÇQ¸P(d³Ùr©R*¿M\ro3@ÝZÈÄ“n[´ÕwI16WP÷VlufâÎsv–kÅ&v(\rA·‰€º®¬\\¶V«U*•Z­¶Ã¹á­qïÐ´h³…ö>×[±+y«½ãï\0TUmímÜÕ“± #\r\'	Q\\?=n‘-Ë²xbç^LA	øfiX×uY–Æ;p×s;#l-Ÿ…\\´žÆæ©âÞµC][Atž\\ÌwvŸ–eÙ²,UU›ÍfÃ¶CßßtÂö#E\Zv<¯s{D	LV\0MÓÄàvgkkŠËA$à›H³Ù\\^^îÛ´ù³Q¨Å9cLdâxªx›Éà­‚¯¸+NÆ©d:I%	ñe\"‘HÔj5Çqº¤Þ¹–©µ¬™o?¼ý›\'‚ HÀï(žÆF‰½âºîââb­Z‘õ&ý=½3Äq&Þx?Ò–Ô½Xœ$‘HX–ÕU]%}½^/—Ë¢gçzâÖÙÄycààLô³·þ6@A€¯ƒ Äæžëû×•,EQEÓ´jµZ©lg_ÆX.—“e¹^¯¾·Ã––×ôq÷õºOAªªšL&‰Dßnœóz½^¯×ãö×}+¶Zwq®0€3Nö%‚ Þ©€ƒ ¨Õjëëë¾ï;Ž³ÕÌ®(5ºæÈs:WÅu]×uí¦ã¸¶ëº¾ïû¾/NþÛÐ}Þch¯GRd&1Y–eUUuÓLš¦®ë†al52\\©TŠÅbçÐqWq[Q„¡¬ªœsÆ6\ZJA@&&‚ ¿\\×]XXØIIsWqS_R©Ôèè¨ˆbt7“ÉA†¡°{BÌœóÀ÷‚¿íJ®®Ý5MSUU×u±WTŠm_mÛ½ë£zÚrp‡¨£(ìi´š\0&‚ ïÔaKKK×Õðy{dY‚ k!1|­ëz*•ŠE†¡ëºBÌœó€óÐ÷…ª;cnßê*±ØWQYUÆÄØ¸(HVUuço¬+XÇ7DysW&«Ž\"Îi\Z˜ ‚üvñ}ÿô˜ì¥R©ØÍ†¦étºïV»b([(¹+ebó#Ñèªkp8¾}CVßf³YQÝ[·…-ªš9çrû E^‚ ðõáºn³Ùl4\Z­f7Ï<¿.¶\ZÉd2;Ï£¸åKiu]^^^îrpW\nï\nÃ0~‡²,‹(O9˜ ‚¼œsß÷E÷‰zµºM½Õ;GT_¾|yllLl0|Û’J¥cÅb1ˆx(Êª…bÑ±+¢®ë¢`±zeY¢« ‚Ü‡ šÍfµZ­×ë7Õ»½9ûêÕ«¢ßÅíü	&‰ñññr¹\\©TÇél¹Õ5î\r±jóÓÃ0¢LAîcÁ¥¥¥R©tË¼Û‰ïû®ëÞæ (ÊÐÐP:^[[«V«ñT40A[q: r©²¶¶ö®Ø÷ŽC×õ‘‘‘ááaY–#¾©9eoójú¸‚ HÀÛ¡éê»¸I€hAu\'}šŒår¹´K²Ã0Œq õA;p6›œœkpo½Ìòù|ßÅH·9©TJQµx]² ®ïŒ¿4@MñžEÙI¤Ûþ4\Z\r!Y–EEôM}g¢#Õø™jš–ÊdDÁZo¯iN+€	‚ ˆ.C!‡††â.Ç«««7[ÀŽãÔëõ;kºõ™*Ê€e¹¶]©T8còÕXñ~ÀtA€¯­–XÉŒ±›ZLÄ9/‹‰Dâ]\0‡$‰ÑÑQ]×ãVQ{¹¯Â˜,Ë¢ïtÜÏò&mLAü’8&—Ë…a¸ºº*ZßöEšªðhKý¸®»¶¶–H$îÄ1ÛD\"aF¦=-É\nÒÿöýfCA€¯XùZ©TD?äˆ‡<“ ¨šiš¶m_sŒZQ”‘Ñ1MÓŠÅ¢ã8ñ†ƒØ¶íûþ:ÌËd2;o¨IA€w„®ë…Ba`` Þ˜(ÞVÈqœùùùí<00000ÀK$žç‰þÒAø¾o%”³¨T˜ ‚ ÷²½Û%‰©©©õõõJ¥âºno4\Z\Z\ZcËâ‰DÂ²,t¬ ½Þ-	‚ â=$à­“ õzÝ¶mÛ¶…YUU°,«wâó]ÙÔˆ ‚ ~©,’n\"‘Ð4-£~½AÄ#à8×öŽQAÄ{š^%‚ 0AA€	‚ ‚ A	˜ ‚ 0AA€	‚ ‚ A	˜ ‚ 0AA€	‚ ‚LA	˜ ‚ HÀAA€	‚ ‚LA	˜ ‚ HÀAA€	‚ ‚LA$`‚ ‚ HÀAA&‚ ‚LA$`‚ ‚ HÀAA&‚ ‚LA$`‚ ‚ AA&‚ 0AüÿíÝ½NÛP€aWâN:0€¬ÙèF%ªŽ½„^‚å­c+õ:t@¢#£GØ@‚¡×’–Ž¬ãŸ†ÄÎqœçQU!•’üæ³€\0€\0\0\0\00\00\00\0 À\0 À\0€\0€\0\0\0\00\00\00\0 À\0 À\0€\0€\0\0\0\00\00\00\0 À\0 À\0€\0€\0\0\0\00\00\00\0 À\0 À\0€\0€\0\0\0\00\00\00\0 À\0 À\0€\0€\0\0\0\00\00\0°‡\0\0\0\0`\0`\0@€@€\0\0\0\0\0\0`\0`\0@€@€\0\0\0\0\0\0`\0`\0@€@€\0\0\0\0\0\0`\0`\0@€@€\0\0\0\0\0\0`\0`\0@€`gdYöòôà\0\00\00\0 À\00˜ˆ£“³ß»Åbñóû·ãÓóy/âóã½ç@ÿsÀOº\0ÃÍõŠÈ›Û»ðñr¹œk]Ê²ôXå9€\0^g¨É8$ðùË×™ý\roõîÏõïÃÃ÷HîèälÆ‡Ë²¬Î/—ËYNÀeY–e¹ù9àÙ?ü¤›€ô°û‚\0lÕõ¯îÐn¼k‹ÒNÃ¾j&`W™ÁUÐ°5½º¼XñV#•ÜpjŒ\núüx|zÞzþµkû°÷eR}Zo¡S=˜gq£ýožçÕEQ¸k^ojÜ°ÁQV»*;v}«ûòéã‡I-zý?ôPM¶=U;âhÿ>­¾¦¥Ðãæ–Ö–§€»&Ýúd\\¥7LÀáK­ŸÎcõ=ZÓÖ¹ë{Ò¾P``\'ÓÛœ~Š¢ˆöªá;«™8šŸª­k·žvn¶6ú¸~ð¹y ºçK;=·.S´ÊÍc!ÑºW£› ÀÀÿ ¬ãÀc}·nf£“³›Û»höÅÃÉÜ|~k5Ç;<µsÀ­OŒh•£c!Íuo½	´«F™þÃÅõÝn4è´~žç]_J;¯Qëjh<Ã“š€û_–­¾”áµ\Zãñ6$˜[ƒó<¯/ýª¹§º­º>øÔ¸ýg¼	x:«ßšØUV¹õµÚËÓCQ.ã2«î7«‰§yö.:ÜÜ_×·ÔoNîè<à%WŸ€£WKW—]UîY÷èS‡ X\'Ãa|i}wJ´±uK}ûPÃÐ°ïA\n[šWc5·gmmr_&Õ§æBG[¢—VÍ[E7©>õ3%ÀÀÛ2>ŽŽK‡]j³©õ-]§€›ÿGÂy‚ç€û×´kY{¾\'ó~b†\ZŒÒîRŸ€šþUÐL“‹°`¿âúŸ´Scæ÷³ßü>`˜Šýù}Àc¼¯)9¿xÅç€ŸôÀ!h˜ÖNjö÷q±XXè= À Li&EkíÕ	™CÐ\0„‹°\0@€@€\0\0\06peÙëë_\0lÓ?q‰·Ùèµ@\0\0\0\0IEND®B`‚'),(2,'test','test','2013-08-01','2013-08-28','2013-08-28','ÿØÿà\0JFIF\0\0\0\0\0\0ÿþ\0*\0ÿâICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0Ì\0\0\0@gTRC\0\0Ì\0\0\0@bTRC\0\0Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0öÖ\0\0\0\0\0Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶Ïcurv\0\0\0\0\0\0\0\Z\0\0\0ËÉc’kö?Q4!ñ)2;’FQw]íkpz‰±š|¬i¿}ÓÃé0ÿÿÿÛ\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9ÿÛ\0C\n\n\n9& &99999999999999999999999999999999999999999999999999ÿÂ\0XX\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0\0ðÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0t{´³Šîmzó¯A¹çqè58/A±ç^„yç WŸz$y× ÜóK©ç“\'šz]:ôY<ãÐîy·£Áç^‹ZóïB<ïf¸ü‡œzBù·¨Ú<«Õ*õCÊ½Pò¯T<«Ôäò¯UƒË=Pò¯QƒÌ=64ô#Ï=§˜z|eé«œgÕùOo©Õæw!ÔŠK™‡i•ÒÉPâÂXÒm†˜›jª¹¥”ógj‰g9S—K6Å™‘^x¬F•®Çm]ç§H‘Çb\Z[xª«PDo²Å4rm³¹<ò  \0Æpk¶»\r$ÐÛ,ë¾ô›[*$V·+ÏoˆÓ“ØãÙòüe4÷^»^¿Séxð~–N…¾eÙ7—]L9”—ºó½9zYçRgÑëãïçSÞªŽ¾<ýK=ÊÕè<œ2zÙ¼}«}<|Ï‡Òeù—ÑjÎÜ¾V^‰ã;š×oJ\\}çÓÅæ;y¶b‘e%«Ñ¾õm“Ùçç.®y{åÑÛ—Xï<_JÏD®–m«òã¹¯2z½š3VQÈk¬‘Éq“i£™vÈºð=ž¯™3ˆÎp,ïT—ýG’ìié,óló–üßzz­Äô›ž[ÐEM{4º\\|«×«ÕnšåÏH+é­vúÞ[«7´5ê9t¨s¹-zÿ\0)\'¹ËÅ{Ìô&¹Þ_Ýksâ;Ðj÷FýsÄKIˆ«¢—ÛWÛ^ñž²7—‘ÇßO_ˆ-9ã‰Ü®ž~ßNºÛÞ½¬³ÃêïT9ÝŠlr÷ìI¹ÙËrm32Ýd“I6Æ¬	hYÍ£/‡0ÖwÓ©e,÷a³“Ó†uéôywó›Ö¥‡IëH¶6Ûs×éhß8®F½shío)ù%ÔŠ…ê%Þ7ÅÏAàûØz7•½,±Ñì›8t·=j¬öíRÜqá6õRÇ½s€45ÅìVäS:÷|–»zÚU4ÔèuxrréÐåreÔíkÈÏÕbö›é^krÙW…é´Ö+ØŽYs­\n±Óâô¶Ôòþ×ŒÒXÓµÅíYÕÎ3¬o¼rlW›Û»æ½òéú8²âv%ÃQú/5è*\\k²VÚÆVº\Z±ÑÅ9k©&Øxîï™³§%®5éú>\Z½þß7×SÜãÃØ_£o¦ÚéðIe¨øÜþxõ|îoT‹oAšòU}fÖy8ýL¸9ìrú=7SËus|Ä^_6ü—~ñ:sò-ëãóÌpíÅ½?OY¹y·®v$(s¤QÒæb®ž$Å¹ìqúötšés¼\ZR^Þk(}“ì—ù»Ý’.‡u±é¹Ö1gUÓ2öy±T°A:ÚÛ›cÑÎÕº³KÍóÞ“Šx¬YÛ= Y”áã»-yþŸJìvú|I–ý¾iC–µ\"·mÐ¥Æë™±´=±nç“ìböä×Ë]-*O ëkÎòós©žT×;Y¯™ŸUC—Óë©. ÒyµHãš+ksïs2ó.³Ûâw’í{Ú³Í­ÙÓW‡Ý†X«¶uŽ•ˆ5“¯NHš’jV0ŸlfL™ˆwbÛÛc1=KÜ®üú¹7”\\þÇ¤`ÇhìÁb©Ü¡U;xâhwñçô;Ý¯žûlêLñ±«\\ý©ë>ëÌv<ßYÕÌuºÈ}w6Ï\rq«sfÎýMÎGO8Û“ßó;qd[ÔÒeL½ä>®o¹‹Äz]=½NtvI®‘$ñðã·£C§^9œ]g³Æë¥ø÷Õ#ŽZæ&çÇ/oŸ•©éF;mòèW¿ÅË·¶¹Ëlë/Ox¥,QµnrÙ­fòÏŸíðå³^Jxí¾~õ³ònj°;8ú÷‘ç£ôÛ-8tôæÝn«„ÛÉv`Ýƒ¯ÎèÅ¼Uô>~žNç¦ÎwÅß§_X›ÍúO1Óœô}#O-½š²õ·§ÒÌåkè*[u–ÜÑêígï`—Ët¤¡\'˜Æq«ž×¹%íd‰ ’ºÁZzöô©ËÞ›V¸›gM¤ž×;¡‹&Ò×çeÌ{e´×®ŠµdÎ“ôÅh.K¾t¥ž>]9œî•Í£ á÷×KÓø{øžžzù¼®ÿ\0_·^G×m>{&4ªP¡Ñ©s¾šÍdwª9ô¸«_ž¼^)®~£‘Åêo—ºÒ´yÍ¬SÑomÉ‡S½\'—¬{M¼sèÚ|Ò*úT8ˆú,> ¼sžÇ©ªÛŽæ´W\"ZQ[®¹’µë;ŽLç;k˜ßxä^®9Îvß©ÅÄ»=Û{×žéyNÄu,q¢;ñsúvW]Îm<ÜYK8»´hz.…yÉ=41Îéë¦f¤:Tkk7(b¶â)¤ÓmãÉ,,.wžçÞíMq¬g»ÍéLóq-¸åã³±ÅßµÅ‡§Ë¬àVp\0Î3©€g«Êë—q1šÚÛ\"êb¸²õö¶9%‹g]ŒÍÆ,ÖÓÑs¢Ù,g§5×žÓÒ+ÍÍÞ/^®’M%]Ë%ˆ¦Å\Z½ÎáÍ›C±çq¾†ž?ÒuÆ¶*í¼f\r¶­¤Ö¢O^<éœë[ÅY\nü¯kžü†{õãM%€¯Ðçô\"çOˆéó£ÙhóoÐØÎY	µ5š\ZÐíñ;ÖtXŠæÎjíVsQ3NÉZç7i´m<I¶»ëØ¤‡­Úí‘²<¦ÈË¾ÑTîúŸûù®‡úe<ßªÒNW\\Eã«jyÛª¿c\'\\÷ñËÑ:\Zs¤Ôº©v8çYyQXå©3°1ŠVž®®/Q¿\Zæÿ\0A8:ô(/.¥ªºc8É™£½”Õ:ÜœÝªM[s\\žÿ\0º—c²Ôƒ3k$zÉ¡¦ÑW\\Ùä[—¡s&ó×šI1W°í´—Ÿo[dÍ¨’,Å>)+Øzšûíi.Å8º,^G’ú%Sæüo¢ù¼þèìßhsVq_jšzíh÷ÊýºÛæú‡›Ôµ)Ü¢Iv•¸ß@ÆQœØ$mµk”3.n\ngZÀ3Úâö“DÎØ×˜sb¾õíhô^öô­É,ÐL“kœè,SÓmåµ-\'Fxã;²ÇÇ§¹^6_[¬y^ä‘åì3Àíi*KšÓÉ%|!\'}4\\e„Vñît7ŠÆ.6ëNœLµ6çßçU‹UìGRN>TöŒåkvÛšå“VÚÖpF Ï[“ÔN†ºb7Ó\Zšé˜­Åy#ˆõÛZ·ÔáõâÌ°ÌÍr(Ðèóµ}T•sÅzJ;f]ÅjûŸîns¬A¶m¹9¶q©-R‹N¶þn\nõ˜ñê·‡¯nœn—7Fpcd»,gWa‹y$ÆºÔÜîkæ“lcUÌ{Å\\Óm2ßxßÁ©“@g¥Íé™ÁŒgGÑ,ZKC¤š¿ÏœíM^fm²Ì§Íêòu®õÏ%w.æþj<ßKŸÛS·¯tb¦,Å–Ë¤ÔÐÃ©4zŒà\08à3¼r%£Î5.Ñmd±æ3«Êš‘zZûcM„rd­$øÒ¼Wuª\Zt5ŽzÔ5mbg¥Íé–±‘®3¬b=£¬Ã¼5¬{ißBv­òºR]Î»DŽÏI1±Ex±Šø–m)ËYÒÔõÈ` C8;\ZfMMˆ¥nmœo\Zf]ÈeÌ‘¤¸’±¾ØM³®MµÎ\rv×c«\Zî4Ä›Uz÷£Ž8\\ôù\"ÄQE©>‘h²ELi¾¹†2g?c…Ö:›Å.fœ>÷¶Û\\Û­kóÕY:reæ÷ôœ^“ƒ@\0\0\0M¶Æ¦ÍD˜×ô˜ÆÙ”‹y7#“}ˆ÷ßk™sÉœÔi÷*¬îU–|•ócj¨¹¢W«Ñ¬¾Wž7¦ºÅ$Z˜c5®7DX-|O¬Dß:ùE=;’p»\\]LíËÖ¹ÌÏ\'B8RÙóÕëôj420Û\r[`ÃlšÉ®£:ä‘†35‚9eØŠiv’=÷–\"Ûiˆ÷“6i‰’èßj`ß1’\\i©&5Ð“fÙiËåB³–X`e–p\0e¶02ÀÎu5À\0\0\03–p\0g–X`g:ššš±³Q¶06j6j6Æs¨\0\0\0\0\0\0\0ÈÃ#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06íq}´pÞÖ„|õœh\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&àÕ¸×Öù;‡Ñ¹žWr±¶tÑ¸Ñ¶7\Z7Vó·\Z7\Z6É£}L%Ø,fÉ«q£}L6É£q£aªL\Z7Ð7\Z7Á«8\0\0\0\0\0\0ÆOmêüW¶ËèÎ‡ú=w\'µÀ9Þ¥¹¶¸š<¡·\rt$ÛWÉ{J§™õ~[ÓWžéó{$ÜÞëò}\Z-Ëµã}·˜ôE7ÞØè5òÞ®¹ó¯Sæ}UzœX×*Ü/O“ç_Eò>š­+Å_9Ýæiïrß.Ïþ¡ó\r>£b;µjtõOœò>‹ó½°\0\0\0\0\0œGô™ý(ô–9nyþ¼2]ó>“ÈW«ßYOëü®(Ó–­v|ï{ÎG«‡}9Üá÷Ž/j—Ecó^5žÃ…ÙâKÔ–	Îof­£—=[¶\\ñÞÇÆž»0|ãÔù_O§°ãuø¸]éq¯œ>ÿ\0›ô5Îþƒóª×ÑùŸVzÙké›¿Ë¾«ó=O¦KÙ¾GÖy\\œß˜ý?åú\0\0\0\0\0\0]úGËþ–øÓYf“Lü7µùíŸFÌ9\'ì<g¬+V³	Ðçõtˆá›ËTž›ËúrlÁ\Zñ(Þ­g áú>·­ib«ÌÚ97*Ü²ÿ\0šô|r¶;{,õ>_ÒWµãô9X½C¦¾c±Îô•S[±Ç‘·WRÍ[Ü˜ô<úˆ=E˜QÀõ~7ÑT?;÷¾\n°(\0\0\0\0\0oªü§éÙt!š¬ºÍÏèüëèŸ6³èRYG‘õþGÔT4ó×¡cÏÇ°ÍaÄïp;&¶ø=…¡Çïy»=O»Ä‹¬IRb¯j^ÜY²_;ê¼që6Â>Yè¼ï¦ÓÓñ}):Üë§¿ç}Rù×Ð¾|Eôÿ\0š}&·äv™Oå=½”e—Îzÿ\0êì£óO¤üÖ‚€\0\0\0\0\03ôŸ{8ôô¥åF½/Þ$ù¿³ñôý<ïj&—\\Em|ÿ\0f»ž[»çOI{œ^ß²qû\\¹s‰×çn?O’v1Ç3ÔxX@§Ê=~‘j_Å/:yßGåý{EYr³­~1_ÒxOmRG_Bô.ç—Å=Ï*åbiâ±š¾…_×ãè\0\0\0\0\0\0šc	w®&„6³P]Ò¨ÌõÅ!U„ÛÖm\\XWt„XÍa¼Õ…ˆ0,æ¨µ[,BÎj‹ê7š°±šÂÊ°ž=¬VsTZ†1œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\05\0\0\0\0\0! \"12#3A$04@%5B`CDPp€ÿÚ\0\0\0ÿ\0úu#ço†Ì¼6d4¹Šð©×„Î¼t4™È\Z=A^\rP¼tt‰Âð©×„T/¨^P¼\"¡xEBðŠ…àõÁê„T/¨^R¼\Z¡\r\Z ¯©^R¼¡x=Bðj…áÁª-àÕèõx=Bð‰×„T/¨·…N†“9^:\Z=A^\rP¼\Z¡7C©rð\Z¥à5KÀj—€Õ/ª^T¼©x\rRð\Z¥àUKÀj—€Õ/ª^T¼©¤/©^	R¼¥x=Bðz…àõÀêWÔ¯©^	R¦Ò§†=´¡ôˆì$qtcÓí»~\r(¯Ç»l¬ï±öj$^öØŽà\"¿ÂxìZ±+¿à¦K}›ìWâ/îÖÏÜ«+&ûöË}Gø»hŒ¦Á@ÖrqF4­dÀ\nãµ„¶ÖZÛYà¬œ@+\r£ù«,V*È\0_Š²x6Ø¯ù>Ã°ÃÛh¾?¹ùÙûŸmš;þwÔ?¶‡üib%ÑÈöLÙNp	Õ1öbî­µìykÁY²÷\níUuoŽZ	Œð™XÔ_uß\"/±8‹Eòtiåj.$=Hl\\{B8”hHÀ$|i¦\"¥‘‘†Ì\nçjê#Bx“*¡OYµdpWýÎÏ÷Øûlßq¹Zƒ›ÓíC]ÓD5\'HkKŒº|ï`‚\\Ä”üá®1´•qzÉæ¢W%G/3Ëe™­o;¯×Ô…IWÔ™bŽg3è6FM\"ó4ÂÙ\\ªc|uØKì¹ˆT¯sÜŸQ6Lžl‡ÚÍ÷ª©!SÊîIl[T2§cJ»Ó)¢]$K‘!t@(a»+EèÙsLÖâÁÈòZyÎtœ¡r…ŸjAÉOWÎ¤p³EÂ÷²w¶Ì÷wŠÊV²—x]‹ê$äu)ïARÐe$Èå#ÆðöOZe‘¼UKŠ¡P´¶\Zªš%\n8ÜE,Lt_P·jeŠ(ôé¢ïRø„°˜_$ÓSÓ»Ä`L¬†`cz†žLË¤SÓËÊ!sÑ¶\r‘ÏF±hØçŒE]0º/„mš}‹@YIi—C\"¦§tCe‚\rUZ<±@úx]T÷éª¦Ž­¯=äR™²ä\r\"F‘r®‹ˆMÈÕ¨<\Z/-?ÜŒÅ-ßÏL—4{œ{©ÚXØ%«V¶¾ž¦QÐ×¨èlÞž\0¡c!|‚7ÉÑÄ[J*bl=SYN£ÅUPÌéK3LPN×·+‰@Á /K×Úè©%b¦‹—dlë«•RLe@W+ÀSHæÃD×O1ˆ`Ââ`~IóYÑL3pçf‚ù1EŒLJˆgÌÝ×ô”\ZÇ Ð¬mª%ãRU¹Í©©½6Á¤®7.7&ú]õƒ‹‹9d+nÔÃtâë=9Ò&—ÚûMy:f!I\n°„#hV‹+4(,g1…_2l35Cñ½¬é*ÚÉ:Æ‘¼m>««®ê«ø¹ZozÉþWíMécŠ.\\ž òˆrœ–ªoå—·TFÙA&8o›§sçäàË¨aln˜ú,†—·ÛgvU®îâ¦•¸íJ	nNˆ£Lò™€•ñwáÒ±†W\\1í_…ù\ryÖ«ßÎT6ê”°Ë3ÅÊ:ŽªHÓ\\²)D…ý,aµ3D\"l²Ã$$‘ÈÐ¹š§qâ‰Í-=-™1µÓ¶I\Zy\ZÉ‹¬yOª™þ1[+S+TÓr*\'e,ž¢¡Œs §c•dpE”2©Fš2ZÀÑ·eÈÆ àUK®nBcÄƒ§nz»ËÞˆÙ™,Š¹ÙÛQÈî¡íkÄ”bÒÒÈÆE$ñ©FdËk$Nyâ+Œ®2°+ŠãB „LÁI5\\\r³tèÁdq0=´®FZ|)\\Ñ=­³\ZQ@Ù>x£DRFtìc\Z‘-Ž\"ÖÊ{ÉÐHàÁru<|o V×ácÃ¥Š®S¥ÓÈÇ;äÇ‡Œ€YF¸×VZ‚Y<Ù2wµ\n–9WSÒºŸj/‡m®Uû;â=©Í«ë8‹©iê\n‡8EE9{\"Šf‹Üf³Y+…S?½Ã\'&|¯bgŒ(ß˜î¤/Xsã›’ «Ì­\"~MY•r®T)\\¿>àjên©7JM¡¨b†:¥í±– çÈ}¬×ÌÜÇx„©ò¿Ë;×<‹™è9ÏMôµÎÉÀÙC~)*ÚÀÙö;;ºÄ¬J©ƒj?…× F`©Q¿8ÛñgjÊÆ9©‡š9$j•åÑTÉ„M–w9¤ãä¬²ˆìXNheSÙjÿ\0Çä+¡2’Ïnúsr«É°±]­¨°Y,Š¨’@r™ÎL¦˜5†÷“ªK[ã‘}0ÅfMNÅ,ñ½Hç9}Eõ­G!`tî°³‹`s•½<@dÔÃ)0X\"Æ§\0ª-Ãµ\'ÁSÕ;¬cøÔ<W\Z¨ÅÕ-êi¨Á`™U4q@Ó+Bçœ£+Š$”à¢Þ~ôþîb¿zŽê²#-G2è¤B‰é´dÑ4/ÃÚ ¦á}ä\'–¥F×š”o‰Ì§@Ç>:H\nÁ¬Ž&‹¹ù]%™¤DceLŒŽëdãdà´=‡bªäAÝ»&ÅÈ¼>kñJÄÚ‰£PIÌõ¤^û¹<ª·µÛ(äˆrs‡¤ÂnÚzoš†N7q<ÆL6Möò¾ÖÊÏÓºÉ?»`vkŠxÛÃNÖðX*Áô·“6BŒæ(ŸZò$¨’6EWPêŠ‰/HùKô’£ª«bÔçÊA%Õ;®ÌZWR½í’¡Ï.ŒÈ\Z%\n9}B¡–v¡LYFó.­@úUÕÓÓŠŸímAöÑ²°E¨°({*…O÷\n=Õ4ˆÓ5§‰Š å*?}£ö˜=€VPŒ*”ßf›øê¸Ú›«6êÞº©Q*3ÊŸ#ÔuJÊ«GNÃy&îÚaúš³m6	ìÅî³)¢éášA.1{ÃÙ1ÛO÷ß²j\"ë‡w¹žVjÓ+8ÔY“&&;§:Ê³*ZÇ&°=ÕLú[QŸA}—*æ\\åuSÍ“êO<çoeÄb˜ï©åãh¾R6Î‡»6—ÓXï”ÇéE;Y*\Zõ\\ü©šãÊïµŠ,º‡(eª“’šÊÏLl´µçüxa	„ªhò|2òËYM5K¤ –0Ê°Éb\n½Ø‡X#(	³Ù³_]=õ\rMaqödÙÐT\'‡J‰kœ¡”Püéö¤øYX\"“ÔgËÝƒ´çv¸µÆÒ°Ý’+ù»=“>SüéÏ¡:FµT¸½Ó<Ì}ÍbŽh°{Ó`ôB.&,Z±\n@žç±Îk›KZäú*»¹…Ý“FG	Dt”ò2V»½Ñ±NµÙr\0…/ybáŽ\'CI\"u.u;˜C¬£•ÖÍêHÞçˆ&B	Óa¨RRJq“Nc‡†\Z¸°j?…•‘	Á9¨¦¢??ÆðÉž!+Z}\nû»Þ/dë;,œäØœƒZÕR	2»ÐðÙRÎ½.ceïPÁ(o(|y4\\•Ç)O§‘ENöÎÛ]UÒf± 8ÆeÉ²<Ýd³²iLš2kê9ºÁÂâ\\ep®Â„Aq…€]‚Í\ZˆBuu3P¯î­›*]¨¾Ù!f\'H¤Wº€©;<|7µÅ;ìž6÷r…Û¸dÞ6ù+N0™9\\ê¶#Ø}@²¥ÅÝcÊ<’\Z2ÀV9ËŠÈÙ È¤XÈšç9Ç\06EÄÛÈ‹‹KfÀÔTŒ°êà±®…xŒHêMGS(êR\'jR\'jR\'jFµ\Z”j9FBS$,/¬{£Ú“á\"Ä¬J,EªÊ#gÌ_gÈT/n’;^¦76xé#|:$ÏDÃaídç†¢d+ˆ‘ÓFW1!+•E,\0º&Úœ<>eMDØžZ¯\"ú‹ÔŸ*2©eº.C\"Ô—\\×Ž*ÈËf—).½ÉôÃÔ=u.YOC®9\n{ßÜ¥øÜEy¾Ý7z+ÆðrËÕfEègâ¾¡ÑÕÒT5Ôî¬…¨jB*™”q¶&÷;[b\Z‘K$¢†ê8cŒv’êèÉ‚æFWdr$¢¬I}3½·ºÉV°†ïLÌŸ/Û‰ŒrÂ ¬Ä©wU?Û¥ø+++\"ÔXŒeœÚfãáb©¥±\"ê^ç”®bœö›a”…4ÎÓÜÛm’Ãyëb…:®yÞ“*$<b(—µƒAz%wÞöUs´FØ^ðbxM…ÎQ´1Oö¡Úš7LóBå40±ª«ö’“áeeeŠÁq®5Ä€²>Fìn›WaÌÉ”]9oéÕé—%8\\ð.ªÕÀºÊuÖÀ™U‹w–©ŒUoz¢¥»ñVÒJ×2©ùDn$ŸŒ‰.¾H]Ä¿]ut\0D€®ç¢Sœ\"d@TÈØôæ)¸.‡Ê§íÁä°Ú«ßÊˆõä¢ø+yÜ}gß`›»¾D 97öhªœÇöUÙ>¥ÎZ[\0öEÖO‘¡•Ï|ò8èŒäžVVE×9+ìq»žç–3Êîwo ÷©øAäî»ªŸ—‘ƒ»š€ú’ß¨>ÛÝe™Y•r®v¸Wº˜÷>Fîÿ\0“¾4ß\\º¾÷Y´žF]Î†æ75pÆ˜Â¯u\'´ÕîÏ­ÉrA\"tL]@bdÁÁÒ.EÈN)Ü¥5—\\ŒˆI3¦s,Ð»®ëºb©ö€mKç]\n¢(ØGÏu}O8É #z¶ÿ\0ueÝX«e•„’ÝÌ7nÁ7y>gÙ™Ì’\'8¸ŽW:„!œ¡O\"lMƒd¡–™¢œÐÌ‡·tB,%q=8=ª¦DŽ†®²º²Ì®@‹‚pBªF§ÕHäIrŒb#ï.ŒR\0×¦{T¨6„EÕ†ÓZ·d\r“g±}UüÔ?líuutQ)å8¨ßvï7Í8ÝJ\\æ}1Œ\Z¯¸Œ]¬\0û­2¤Í¼²ÓÅ*›Hˆª&¢2øÜÃû\r÷w+»>5?(|†ëº“åût_ UÕÑD¢SŠ)§»Oa°ÞÛð®®®®®‚V+JŽFÔy.²	ÒÙ>©­Z¤­š§öïµÕ×}›ñŸçÐÒ¾F\Zf5LÖ5ïÛ£øy	WNE.ì6Ô{¡O%úb…\"l(Q1tŒjñ¦Ñ¶À¬ÁÈrF`«“,‘}—(Y8¯Zª¤çeT/Çö[ïÙFÜÚ*‚º)ÀuÃö›îCì®w(û«y/ÛËKñºººº%‰NÞ\'X›½NÐ;è¦ìÉ¾ÙxM6h+WÆJ´+mu›TÝ<­®¤áì7Ý1ÅŽ3Ìårv>ÍR}È½¼‡Û÷)~;ŽÇÈÕ¸MÞ£ÙS8p:[È³)®7ßPoÂÈì‰‘—°.¨êðÔQÔ®N¬r5rj¤RO“a¾þWüi“*[ŒÑûyìƒJ·íS{_bŽÇbŽð97Ÿà´¹˜$«ãtÌÂ×	ƒSª~¤\'V]\Z•ÔÈº‰+Š.Ùò9«•Ë7+ŸÜo¿–OŒd5.Îhý¯äw°e‘¬QØùiþ>B;l|‘8&¯ÂŸí¬°—©z2¸«®ëºî±+Šì{B3e(›þû|Ò|b 1ýÞÂ1È.å`ò¸Íð[µ••–è×–éþ;~6ü¢ŽíQ›´!ì¦ûj×…mî³jä\\…øþ“wººº\rÉÚ±	­{/Ïç|V!=¾©¾žû{„HDù)Üš›´Ÿ7s×ºÇÒ¿Òb±A«ˆX´.Û~\Z‚¶á‡¾öØ\r¬¥oÓÚ—âçÈ¹W!EÅ]3\r‹JnÎøþ[³ll¬¿ôÿ\0 <—WMî½‘\nÛÙb¬Š²²\nÛØ5Zè6è5b­ÚÝ¬¬§û{S1þÿ\0¶&á›cîÝ­tØ‰M…tátŒ\"±‚?zÞf++ ¬¬¬­·çº-VX•ˆX«,U—âÝ‚°Þ¢Ü;S|]òýÈÝ‡w|›´lÐŒ¬jç\\¯UÏÎÝ²¾ö*ËšÔŠ²·`ƒV*ÖXv·¦È5Y¬n½—¾ßò;ƒÝ~oµOÚÚ›ÙçÕ½jÅb‡•†Ê7“VMR[6ƒœQÑ†–ÿ\0Ëä’ç¿žÛ[k,Jöò‡ æ¡Š°V	¸«µzP,µÂô«±zlÅ“BÉ·.jÍŠíYµfÐ²jk‚/jÈ,‚%«0§-1NþK«««ÿ\0fûÝ]]]]]]]]]]]]]]]]]]]_ÿ\0½¦Îøü6tý2¡‘ÿ\0áÓÈ4«•¨?þMþŸ%©‰zþ~Åbåb¬JÅÛbå‰ÙŽ›š±>¦«‰X•‰V;X¬J±\nÅbV%bUŠÄ¬]¶%Xìâ¸¤F7À%bV%bv²ÅË,\\¬vÄ¬\\¬vÄ¬JÄÿ\0WB-â³\nÕØ:-ƒ¢Å¶ÔþD5¸ê¸¶NÓý-Œd@#U¤ã:`ýX59¬r¯ Åh¶Ç­jØQGjAˆUq€µ@,6âÌ\\ÛWúÔŒ}&NYf¶ëäµ\Z\\6Ñ=ðºÁ¨µŽUºncNn5á ¬Z±j×mÁ¥‹ÖúV,ZÃ£ñF\\MNˆYôÍ•µô¦ô´YëP¢Ó¨Í•{È­dý\0ßHì™+K–¢Üèô¿á\"äJ‘¹7Kaï}a§d#üi×’v…¬Û¤ˆãaj¼¦Ú‹-KC©…ÂäkIRãgh?,‘!+…#CuŒ±AäŒœµ¢xt_å^è-A¹Qû:6ý,lœñpJÖô´GZ­Uz©èÆ4Êª;ÖvZÑ±\0¢	Tdø­Š«wéôçZ•WÊî²ïÇÔ´ÇYî}Ö ç5®\"o§‡Ýbµ–þ’&Uñå+U¢¢¦²­ÿ\0j½¥ûº¹Åj©tòçSê¨m‚ª6§}D¹>W¼hM»ì‚¨C(Æx~Éî\ZO‹\0µàÿ\0KJv¼=ÁÌÖg!OKpµ—~¥¯WT_íóU¿cO¥Z‡ó²(öZowÙNÌ¥i²Ô¦µ&„ëE¬:ô°¿èæS½bëS$ÑÑÿ\0ê½Áº¡«…\ZØ­\'y4#cîµB:J‘Hdr™ßäÛ*ªpt‰ù–­´mqTïÎ2.ÚÖãYÚMÿ\0r¥ü?éR;\ZœšUÁA¤£(D»ªºú€Ú‹ý½‚«kz]5­4x=#e˜T¥­GqrË½‚ìµ³h4obµ;ôôÿ\0jæ÷rüj-ý%=8uÅE+j«ü\"tˆbýÜ\0µ`:->0iJ ‘°°h+«Yhkt¦†Ó--Ù@M–©üÈ¥ô¹0Ÿ%ËP{º_éGóÒP6AÁ_¾MU®ËR¾ÔŸí®ª¿¦\r,V¥ëC`®W©k\0šm°Ì­[øÔíD5vÛQþ%‡M’¿ùûfß{D$âµKôš{IuQßT\rÙv¾º4þ–HñE7€°9káSNö@Ÿî«Gé¤=à9@}‹B†Î²6´¦õbêî*ý¥Ø«:m:Ý&J¢¬Ã=Â éMÞŸ(ö¶ Ü©tK\'ª_§ˆ}9Ic®Îê¿ø´ŸÆº¨˜Ç©zb¦ûÚ%îZå©´ôÚñ\n£ý¯uVë@÷»+’ c„3˜t˜Ÿ¸ÕÚsB`ÿ\00µtÓÓÝz2¤v,Óä½!‘©înû€ZAR´8ÚªÜ\ZñrUÝë;Ýiß2åY%¤S‡=šS{úVªOO­Ö0P¼>«S\0QÑÿ\0Wò–47ÞÐ~KT¤ÓÛú;5Tcâ™5VØÂæ; Ã”\0%Èe«´ðBãÅ˜Cý¯ Zƒ¿Gý=%ß£ÉV?ôúDƒ¥%Š¢F\Z~ sK.‰¹bÕ[‹itÜzOBÔl+K²T_&µj&È9Å¹ºÔ™lµVZ–ŸJvZ\rÀÆµ\'~ŽŠaÒò£ƒ{)%\rd†òh§¸D¯Àº•Áú¶ÖjÁŠ¹€§ZÙ¶6ÅSŽs‚Ô{ÒÄÆ\"qB.ø-TñÒOF•­‡–\"µ3¦ÒdkbÊ%ZötêŽµ˜4‚²Eì¶£T×Š:OB¯þUî²Pç“V§Ž0Éx¹”Æ£•jn–š\"™í0iO´÷WºôºmS\"±Ë6_šËP­«I²bb21ª}I±ªÞ½ÓÊ *P%ÂÔì)´ïäª}Tð»Ñ’.F¦(Û_WÔ»úm‘ì\\ò§K#ƒdsW<¨ÊòÐ©™£«\Z‰°šFŽ¢Te{Q*ê%BWµsÊ#Ü¹äžUÍ \\ò§K#‡4‹ž[5Å§žTf‘ÂèO(]D¨ÔJUölŽbê%]DÈÏ)WAÅ§žUÏ*ç•sÊº‰“¥‘á®-=DËžR¹å]DË¨™¹ßþÎÿÄ\0#\0\0\0\0\0\0\0\0\0\0 0!@1P`pÿÚ\0?þ¿¥.´¥)v¥úž$!	†B„!CÄë©‘ô!¬LBiv½O)Áò¸âsÓÐ½3—-?\"ãPÖ!1å–qY¸e/tÌ&VPÐøœ`õX}—¦âæ\'/Cù}‹é11=_,R_#ÉÙà¾Ÿ\"‰—j—ç¢‹®tü‚ÂÙª%\n#Š øâ0˜Ü•Æ.¥ãƒ ÎEÍîG‘tº~H6]¾A»ÝKÜ™ËuØõZ½V­k;¡	Õz§èoÚ{1i?•/Ò¿ð3ÿÄ\0&\0\0\0\0\0\0\0\0\0\0 0!1@APp`ÿÚ\0?þ¿š„Ü!5:MÂ„ýèÞÓ)utÄË¤Ríù.È£)Kªr(†ÄÆÄÊ<¡ŽWTLär^Weð]BBô‡à´j‰BŒÆêˆ¥)–PLûˆæZ5D§TBiív¤\Z‡\"ˆüë‘FÏ“#êaLpˆáû‰¢{Zz{EÕ(‘Jq8’<DŽ\'bÄg”ùÿ\0dÇêÓïºc•è›Òèõ6´Œ|h¿&*Ëày\rSì£ì#‚GÛBèú¾®$f}¼˜”ü˜¸S\"k÷½’?K¿¦=]Rïâ2ùf(fNÅ‘ÁÈ·t¢}!4˜õ’ÕÞ1æc¦´Õ µž\"Äà!¢t„&év÷’ ±\ZÐ‹§”(±é	:RøÂ{hâBâq!øD¦8“SKT¾„õln˜ü˜ü®Ok³béNG\"úCÆn”¥ÔÕ–å$ôCg#–©ÈL¥ò›_ ý‡¬² –§ªýDOE¹å»-?iå}ÆÊ/ŸàÈCÿ\0]†ŸÀ²‰é¾¯Át}«ÚÓÒÓî»!émy=­=¡öb/‚Úò{Zz^+²–×“&—Eå?ªÿÄ\0;\0\0\0\0\0!12 \"Qq‘Aa03@#BÑ¡Rbr‚P`€4C’±ÿÚ\0\0\0?ÿ\0äë\\&ë?&èy7Yù7Ùù7YùgÔ²òÊã³òÍö^Y¾ËË7Ùyfû?,ÝgäÝgå›ì¼³uŸ–o³òÍÖ~YºÏË7Ùyfû/,Ýgå›ì¼³}—–o²òÇÏe—»7Ùyfû/,Ýgå›ì¼³}—–o²òÊã²òÍö^Y¾ËË7Ùyfû?,ßeå‰â³ÏÝ›¬üžÏ/suŸ–o²òÍö^Y¾ËË7ØùÁõ,|¿àßcåÿ\0û/ø7ØùÁ¾ÇËþ\rö>_ðo±òÿ\0ƒ}—üì|¿àßcåÿ\0û/ø7ØùÁ¾ÇËþ\rö>_ðo±òÿ\0ƒ}—üì¼¿àßeåÿ\0û//ø7Ùùfû/,ßeå›ì|¿àßeåÿ\0û//ø7ÙyÀç)YÑtn÷Þê5öqïÁ?›¥ÿ\0@´í|»š’…–œà§ÈEn]ø%Äøãt¾áü‹_öß.åT¨sMV¦N¦lÃ)fWÐf·ºß©©©…(´9I%FfÎW˜Õ¦©™än2Ìmª55522»TjU¼èÜÆïÀý{&z”Ì¥YLFôk÷6ª¹Ò÷( VJ„ºõ“IŠ™ÓÔª‰ûD¢«Ó…_¹Ïe…{Y‘ÅfÓ}\n`}Æ•ªQ’êU¤ßsž]ÇúFäÚ1cƒ”Ã,™¹™MùdØûõ%¯Q~¤µe*Ì˜Û­Ë£\ZZêfŒÎµ»#d:¼Î}=ŠâejÊâe[l¡BN/3{&è—Z¨3iž·fjkòm¥ZåÀÌÁ‡1RxLí’œTŽ}Õ!ð¥…™Û”øìçufq\"Ñ\\C–\'WîbÄÿ\0ûŽ-	Fs¦~šæê:¿R˜ª<zŽŠ/!ã‚*¡BJ5ÅM\r’ðEà•+Ð¢LJ)’œ£*uO+¢’Î…e—Å¡EiBŸâh(ÆÑ7w¡éR†ƒå-,#*IQÅ*â7\ZÝâ44­+AFiQú£)c}u—sšÓ/cê3›3C=8uºÛý¼x±f$ãˆ§ÂÍ3ŒJQPô”[}OðÎ†Ò8#¡£Äø•3ŒŸv7\n–˜¿ý	º÷0ÙÙ©öq‚¤óö0Í51ÊµFÆEà’ÌU”0špM*QŽ²£è<Šš\Z¹z\Z]K«™œ\".fjdJÖ+žåT8{Z”õES)¨ð®aIî¦fh¥\Zgv£áÉ!ª$N4ôù	£âG_^NYPX¥éõ=M¦P2»j6#D[*]4¤•©G8¿ÍÎç\Z3c\'ÁiSSQv½iWÒíMMMHÔoØ–h›Æ´dèV6ÒBŒ-”ŠaË©_ˆÈ­jÇMO¡)Š¡™©“3Êù/^-®©II.æL£’+ràUÕü›oÅÒøIº<Îia^ìÃÕ>šòbÃ¯,L¬›%9£äf)³aœI;8ã}ÕþŸ»Mx>,b‘ÊÌ³&ß§¡”Mˆäz¡e¡).Äí-!ús’’þÌ|¯Ó1Iú]W%Á©‘„É˜m5š©ðììéÕð;´4¹]…ÉÐ¤’c•œÜ}Œv¯/a;77tRSÂú•””£èø\"ë¡©©­úß\\9ÝkÉÇÔæ’Ÿ#;cë£;îaÿ\0Qÿ\0S—cÇd\"³W¶,rJ¦è±ÅiìR6,¤,LâêUÝšŠF9¯î0ü:.¦zqþš±êbø3‹ö3³›+88ät*žF¦R+‰™£a”`±î¿Z”œQ;HªI+ÝÚp¡.¦§-¤iÐ¤Ð§e¯BŽ\\*š³SV,ÍU\nTª5dBpmbFæn7›¸\"½ÈŒÔÔ…%L&sg%«¡Ík•ø\\³4LÎ%¬Ó\"ðí2‰¦%v¦ãpë,Š-Ê¡6mn‚}nÏ†}¯|\Zè{‰˜+I#§%ù3Î„^e#6Ø±S¯s)}›÷àeŒÿ\0æUp@Šêh(.††—,2§àKã1~»eSÌ«õ23Ìåy”k2’_Øå_ØÉ?Qt6›OAª,ýÍÑE>\"2š(:×3éÉFçÌÍÒ5g­ÒËÓä5rkQBP¤—©Qá¦!ÅëBÎ¹ŒÓoVÍM¦‰\Zš¾\Zô#î¯cŠÕ3iª7Dúˆ«´5—ƒ÷˜ã_q<\Zµ´.ªf¬ç¶—“)7ù-‹IÇµÔGÄ—¨í¡YÅvm¯ÖúAæU4ÌêÕFz¥¥Ó]8¥Ú÷Æ¯ö1Ç¡•1F]MÑòjŸo“$Y¾—²ÖÍšåô,òZ\Z!åê…Ã÷6Õy²)ª•Š‰bRêRŽ®ú~Ø”Z!Y\'’ÍŠ%\r“hpÅZ\ZLòŽ¨Õ#;H\"2³_§u«÷â•ï‡A¡pacy´Í—Éh’é.	.ªéö,û]!dhiv¤dÞŒXfªÖ‚¯¬†éè4BìÍ)u?÷\'¨åëè9K^÷+KÛO3VŒ“fi¢Q´Î%#Ç•1;õÈøv™£R}¯wèhiz\\¹|«B7ÅûŒ—bÍ>†HMMoV”­ÉR¯BTè$EÓAE=n£1Ïdsð$¨¢…šm‹TŽjù÷áå„L”|vx¿pÑ™dÌ¥e„CÄŒM›˜Ÿ2Óä§rïÁT{™ü®÷æÅ%t»¬qªœ¯£(ÚÀd«…UÛv†††‚Œ¶ÇC“Vj‘œ“0ÍQÝHª²”¢f)m¿C‰aÊ….â„“¹Ó%èUf}a¢1ÆT3µ>©IZ\'’t‘ú’«:‹¨ñ§[ßÈ\\9èbZ‹äÅœ¨þùL–}JŽZ÷*Š2¬ÂÓ’ôcÄÝœý†¥$êhÍ.³mèïø˜’G6e,¬ÒH©ž…UÙš˜bÈ´\'Õðhiv¼;‘¢>¡K<ËDãé{»^„\'Á™…•»N\n_­ópcèR¯1”eh/DR©ú’ŒQ‡–FI\Z]™ÔÍÝœŠúdŠO3”¡ž†”lªº\rèæ­™FFVlÊÉy6Å¢¬}iÊlÑù6š]âß\\i‘íÃ[¿Ós¤œåäË‘Ã‡6rGòÎi:û•_s–Éx2E%fÓÅŸ¹õ3íS´Š¯±¾nMÈÈÊ†¨ÎEJ–¦/„åÜÛNÔç–„šÑßø=\rMY«?q£3ûXñWÒê4ES2Î¥Ò¢œ¨ÍÕìŒ662“+kit‰EÃWB°K¹ú¶û#–\nî[³¡•\rO^Rn¦¦¼¡§}ÌÍ¢m4¹}¥0”|xYTs¤n7•tlÛýÁ”%àÙ3(H«ô‰YfïÖ¯Ø®ƒÙõ(Œ-T¬m%ØÖîS=~C3eRÈÒê.¸§îsSö?õ.O¥Ëï*\n5™ûj~Ãö\ZÀß|O¨èÞQMTæy_þfa®¾ˆÇl»#Ø•­”²èfs(Žbº#¤.«àËB‰˜™ŠÒJ7¿\'èV—?¾ú¨«ùJÎn°wV3ÓTRý\\­•+LýLŠËAÓ(zå[A.,ÝJD¬Š~ÔS‚BáÓç3O¾Cù¾*T¥s2y‘rÍÐÐÊN™««Ð~Æi¶ŠÂuF45Ïƒ–\'5NˆÈ§¥ú^Å{Ã…S©ÍýLWbªÝÍôãWJ¼/¿Ø±•M]™Ê®ÕÚDÎØ¥™KKsêQYÅK£âÓ!âYœ«ó2àÉšðF*•}Nkh/ÁÍýPÔgŠõ~RhÏ;ÝÕ¾­xŸ³oÖìÊ\'ÃR·8Otx¹à™[983%{’£ù™É³NÁ¡¥Ïæ?»ÐÐÐr”Z8ô3´Š1AÕ}¦,PŠ9¿©ðrMÊçóË§Èöf¦rg­Ù£B¹\Z/hu9&û21œu»SVÌ£äÕ\"ŸJ]Ì6‹?—¡†1«2³Šü›¬ÐÔµâÕü­>Ý]wã†©œÒlÓƒT8ÎŒ­e–¥Fgk#9;ÏìßØ«£×$bž¦änð~ïß,ý¾Mñ_Š›åøGï“bü³\'}Q§6þ{*5ÄþæœnÎÖžÅc%C÷?Á±ù?bü•Çù>ÈÒoòeù?jüüÎG©¡¥Úšýžu­I?ú2fótSKõáÒìþÛQß”ODg/¿\'O»Ðæ»Dh®Ëæf;ßÍ§áÊæþç_ŸK«Äø´»_˜øåÿ\0KË†]¯pÍ(aO¿ËçÏî*îÕ©³a_·ËŠƒàÏƒ?‘.Å©¯¦¨Õ;µ>¡W&ÿ\0%yPù’cNoíu5WÐÔ¥MMQ¹‘ª+TW5FänFän7#yª5F¦¨ÕÍiÿ\0‡êÑa£UÔ§/‘Ú<8Rëÿ\0d¹W8äŒ_é?Iå‡?û&}ÅLéí¦ö†ŒÐÐÑÝ£4»qa?ƒœ©v†ŒÑš_£444f†Ží\rÚ3K²‹6KÁœ]ù#FhÍú3FhÍ.Ñš3K´4fím^¦ÔN‰\n©fÍ¨JÊ‰dˆÚÚ¥ØåWRQ¯àø\"ÈU#ÐÚŠ8¯´³¥:©µÈ³ÓB®…¶™£OÜˆä´4D_£4Dè•Ls\\¦J†—|H,½n´å©¡š)†¿ƒ”R})z3Dh¨…©ŸØÚ‡Hét2Z\Z+©(¢o£û;HõWZ¯bËµÖ‹£²»%[­µH_ ËTº”dH*S#RÝû™™™ìhXÍuºlŽF†ªm\Z Ñiu[+t\ZÑßèE{•è¯´ít;]•Íôû:uWZ/ô²Í{]dýî°ú¯´ºÓ±¿§¦YÝ¥K|¿uÖHÔ”º\"Öïù\"ÏµÊŸµ«¦YöºÎí	÷-.“L³­ÖZ5­ÍëÐ¤KGí|ãìI{ív\ZåK­{}œ.’4!*iuŠ¾×ótûÎïéû”ºßý×YÝ>´¡iwü‘Æ…\ZºÐ³íuœž†ïìký‰?rÒéu,î°lÚZv%—©™\'ïu}ÆZ/r®ü]kÛììß¿·GÚû_ÍÖˆVèZ·²éJº\"ÕõwVäº²wÈ‡b—ndó!Úæ§éY\ZÈ’^Œ´ºYoÚë\Z«´4 TÉ››#ØÈ]iu¥z}œ{•¡¡©©­Ï¸³ºÓóu§ûHVü†ñ7\nhZpVš2Òïù\"ú™3ReŸk§þËµ\'Ü´¡™2XVýK:2Ì“]	wº>èkêÛ->ÒÚôïoýG­ÓºÒVys\ZëýWY¦r“\'S#?óì7]Óºd;\Z‘§îTwÏ¹iK¥RÎïéîŸ6t3ÔÍ§BkØ´VŠ™Ýe\"=®§µÖ¾ÒËµÒdngü¯´©ª\'ØÖîÔ·ÿ\0uÖLÚIS*»þD)ÐzõwL³íu™¥ÓîZ,ê®°º]‡ÊÈÖ,WêEôd{]‹Ò—ZvûHû]>Æ}J“ì\'î.k±zš–Ø…]Öë}·{ *\ZëÜÈ­qÄûGtË:t»YÜÛ$ýËC6{\Z].Ìô,©MÆ¦)Jˆ¤gWs#ÚìÑê÷}£‹~¦äN’DÔº›‰Ñ«£g=L™ª3’>4êB¯3z,3LÝr-ªýJbB£ ê´2hµyfn‰¹>bËBy­:Ž-Ò§Ô‰<Ñðí4êU4n5T><Ý:³r7/&øù)fBrõfRF¨Õ|ËSròj³5¡ª\'šÐ4t7ÄÜŠÎhËjÓí9dÑ½”sm®†öQÉßEhÏ¨ÌíÔSt>¤„Ü›hú’>£2“>£9¤ÙE7C{+›ÙG&ÍìÞÊ§F}Ism]”Ù½™ÍßÊè}IRFs•ÕN‡Ôföofö}I”›+CêHÞÍìú’>¤ŒäßþgÿÄ\0.\0\0\0\0\0!1AQaq‘¡ñ ±Áð0@ÑáP`p€ÿÚ\0\0\0?!ÿ\0útðpk\'þOÍ?äH·ê¿äLÞ_ò~eÿ\0\'õÏâa¿êz”Å?Ó‰ýHûD\Zþç¨Ÿ÷>Ò‹—újÿ\0wüŸÓ?‰ýÃøŸÛ?‰ý“øˆýÏSúgñ?¸û‡ñ2ÿ\0é©ýCøŸÐ?‰–¿¡êbßÐvŸØ?‰ý“øˆ5ýÏPoè}¢?ÐûLÉ£újýâPþ ÿ\0CÄCúiýSø‰Cí? ÇÄOþïùGÊÈ?÷>Ðkþ‡¨Ÿô>Òÿ\0è} Ö–\Z4hÑ£F…\n)’ºÐ£M·è§?¢úñ¡ô™jQ¼ÐaDÆÒÇíÖäRn\"ÅáŠˆûO3;ÌMýÅ‰g´ªAÖ¸ú›½A‚*â/‰[Â\Zí/ÄöO¸è¬Ç´âƒÌ&\nâ·;Ly	_F\rÏ AÐèÁÿ\0¬~§ÇMô…ƒÌÙ,–F»NO1ó9´¹\0ª#È´F-NTjPfRŽÅÊï±„Tµi™Q¨ÑÄÉvDµf *“ÌË´weŒAÄÀaž—Ì¥ÄœÊÉÅJU.¨s)!dn`9»@uÂ‚á†¿Çq×—FlJ*Q	ÖØ˜¼Åj£×2™±ªrE½Áp‹n™E—h/G$©—™ƒD[… ,¥|EÞW·§|¦®m¸\n\n€á †…€Ô-LþgQ\ZYz‘v¸ÝÄ´%º1\Z<‰ƒ\"(¤_©ÈAá•2p\\u‘m³d?–QY­œ¡OÊP8¦\"¼ùrœ%ãr‘^#\'ÉýÙ­€œf+»ˆ”ï,—ú/¥ç/¦‰Äã«S\\E°HT15½bîVîæ3—ÌË\r•2°ö8ãÄÁÍÂ#“ºàù‹\'„â°¶\\Š\Z˜æw‰ûä\Z-†æÓ0\0î;ŒQnc-Ö&Â«9ì‡ŠŽŠ…Å…Y\0MkšŒ3¦cTe£¦VßŠ*k˜aUÝÐp¢Ü9… cÞ7F°ûÔ¼Tpó«ÆÍ¸À{u «Z”ŠüÒÍ_Ö+}ó(1ˆužæ[Â7ÂÄ‹UÞ,À_h$³™g/¤D\0$ô`j¬fbáG2”{Ê>¶Á\0Z\Z³r¡‚÷”ÑŠó*êWi/5ž¨Ì>:R‰ˆŠw—4³Œw\rLùÕº”‡‰ˆÅÀê½GñP!ælaÄS4-²/Š/uˆžJF¶#8|ÀhYÄ5¨F¯€¤\"/;ÅLU­3ß‘™gíˆV°MY!20æPSá.È=¿!\'B‰XJÙšþÑnò­ÒÉp•:¦÷<ñ‹A=¦•·pŠi—£‰™EQÂÐèYRµô–†ŒÙì3›AX:õ?0]`B;JÅ<ÜÒ”„H•YdD¬ˆEØI¥—IiH!cû·ñ™^EE·Dÿ\0ÌFìBÇ™½ºõ3îž\'‘ƒÊ1èF:¡ªôF%Ã2ÌóÉ²2™ê¡x™l„rWoËtkPvªg2‡oÌz\\Y¦;AˆÅøªL€×›!s	^÷‚éj.s4œ¹aÅ²šßà…J›Tñ+2ÍKõ-x„°B’rTßâ-áÓ€,B­\Z–÷F»à(\"´¢AÌvÅŒôÜBÁ] 1`v–YµKw‰L²ÕwXLP6ó9–û©’¥1}å%ÀÒ‚V˜ËÅQU*/((A™øé\'dP˜w®{«#Ù¸Æ‚Ä£d)¬°½ã,¦W5j&íúGˆÇ©Œ‚ñLq¢\"ÊYDy±ên„õ›%`\'*fîÝLnÂ>ãÉoÌª\\ßf þ)\n¾‘:‹6TAhÿ\0K<L\níNŽeÆYÆåO±t{D\\L5±<yMÃë)–9óîL^`\0\"Ç’<+ÄE‹}Ô¦µU\\3èØ I÷Ø{¦|—(ËWG9cyÁ§™f1| \Z56J¢‹–5!Ã\0çåíçËÌ¹ÞŠiód³Ðy—\nn\'8&WÈ¨ôsG3¢xbô&©¦Ë°5-…}%]I}áp-÷ˆàÍÄjÒX—4ÄÄ¸·„#Íú˜î0ãævMº1»8Y»¢ËÜ\Z\n=ËA¬JÍ°òÖ„b£LÉÀtM6¾Lf/v§”^ãX}ÝM®0ÅAJ_8Äøš|Þ¦&è÷!V/©wS3\0@í±–àßU«5Ê[”0¬5Ä[—‰C—+•ˆ×1+”¨Ð*|Âb‡²i8¬ƒ‚d(Ý8Žî=^aÑ†ë$Õyœ	/XìbA•Ì*ùbS\r9Í—„;Åÿ\0L¢Œ¹—ˆðÊÁ/pè§<Ä¿r^ã-¬’â¶WÁ2h4€cß”±5‹5üæTš.êqU@hÇÜP7Âs5\nš&.Rõ4¿1in^61pÆ& VÊÊ Úw¸ÖÜ¹t‹Á»í\nûOŠY*ò!®˜…í©~qyîW\0ÆX&¹AaÒ[ku‰íD@‰p¹˜ÕäRê^6žÒ•‘¿1«MJÔã§\0Ã1”<ÎÏv`¶Ýà+°*=)˜ç¢Ø;[G÷Gg¥…œ„e\"X\\ßÐ¥¹ ¥p0Än`Ó+Þy¥`oT¾;Ë$ÜŠ$Ê¹\\çW±0ÅdBÆ%ê9Mç}}bûŠ‚ÚycÞg‘}±*#´¼%c4–Ùg\Z›axGßDoC&qÅK¡‹˜xˆIí.·½CvÂCâ»°Q²­óe–LØWÁ¸Ñ26ö\'Ð_Îa¦et\"_çr*%s[j•5y™:…4c\n´ÌXž8&ÇÊ1‹êL3(ÝÎ•ò–Øñ‹j­PÖp»%‚ZŒyAçh²ÖäÅMÄ15`ç2ˆ* X–\r5	‚>`?Q€wˆ°tÇrïSW±cÉ<±Žâ.À‰ÖƒÙ¸¬Üªm9JTjž7y~Ò£é.£Ò@Ö¥¢µÆãxS\nÉ¼³í$Hâó+Ì’ê7X³Ìb¦¢ÜËâi”¤$a¼JïÊçOl£°|Ä\"÷BQA‚ 2A|3G…F§”0^e@’ÉXcþæS—ù€çêïõ•Ó¦ïrš‚ŒÏ$w)¡2G³Ý¥ûFËŽ]j«%¼ÅÜÞ§aG†Åõ6ßZsNGJ†¡µrï9\'SPµ&&LpæZAó-ú±YKæeÑÀZðCmÞ í(w™îaÞ]ˆ5)ª‹†2ù•RU7Øÿ\0‰•ùM4Â°x¯%Y›==E‹Í0BçSÄ=ˆ°\\åÐWÃ2äoæ*Ë¢–Ï¦dœ2»_´ã§\\#Í\0;—s¼ÇˆìïÑbè.™Ü?R±ÑdD)½\0Ãqâ3m´§Ò¬AÊ.Ã±YŒâù‹ètf±AÓà0åL(âamÇ‰˜˜‡æÌ„ÍXü G˜¾‡K—ÌQ.é+™“ýžÁ\ng9Ê™Ž´Èr¥á;1}Jbï2ŠaÀOç¹\"vÆ^¯™7ÊÆª„e…~óW˜Kù%º¦1Æâ+Î*<î.:ˆ1„rÔ±„›¢ú=ióLt~âˆ8œÓGF\ne6ó2Ëel¼\nèuf™Ä•÷‚d/’¢-\'‚kî=fõäýàDgDxð\'ª\"/º/÷11EØæUv<KùI_¶#<ÊM»ŒeŒ£Øeq\0×sÂ;]>©b²Ë\ZùÆŽ2ŠöÊšf¤I›-7ÏÐ\"·Dµ	f2Jy;¾Åk£æJCgl@¾•vFˆ—´­+NŒ«ÝOXÖ)ÊÜ`R ÄìõÚ¬Ã--Ë0á1ÕŽ£^Ž‘âVŽK€WˆaÔf=¨À<ÀùPqnTìO fšž<·ÿ\0‰Ot|Ñ˜;5Ã3ÅŠq,{[2ÜéD±sÄ!¦—ê†ö{<E‡Os4’¨}ò¡0W˜µ4&RWs-îÇLT×/²=µCøO²´Ù0jr0u€2Â9Ì8KYMÀ\Z‚bV ŸA3 ìæ1‡?q±1jj	hžB,“3ÐßBZ9‚ÉÃ Â˜<ßEËcB³Ñ ˜	e;2Â\0Vù”w’æ?¼4¦fsº Üîá–J~a ÷lœrQÆUÆxPB½i„ªöóaí1*¯µÇ5Ž !¯¬´—ÊŒm \Z²ç D‹Ó0êÖ<Æ½°î•!´Ðý#fÊÞªp‘€=°ªÖLå/°bp¾¢\\²;KÃqLws{ÄAôË”{L4S£~´aé¤i˜^HÏœŽž¡ÓÌ\ZŽ#¾ñ–JeÂ,ÑôªFkg1®·|G×ÄîWîf^îæàšZÊ0Grî×â4Ñl[;±©¡Í‘°—FÈx=ßqçiuhzœ&øšw>\"ÜYŠÜà1«µŽp\n–Û=ðØQ›*dŠ–¼ °!š}b	r51¾G÷ƒ¨‘ƒ¤Ëq”%Ý@¥¼„w¾¼Ñ¿˜Kñ/ý;¸•+åŸ}¶#ïF®–9ß‰.\rôEQ·kS…®Ñ|JÌHë8™\"®q0Ç¸åæZÁâ:¯¬G7|I\\3ªç9Y(åL=¤\0Éyˆ.\'±+QE•êÜÄ\'‰(íÂÜ<ËL³¹f–øÜÇ`;—3Hò2„F5/ÙÜÆûÔªØ&½Dˆ8H½†U¨)²ÏÙ¯(ØøŸÊLþH‹_ºè¿‚ôDm=Ft‚»!xX¾„2à©˜R\'WOÜÈdœ½Œ_dB\nÓªç\rÀàl•·r»(Ž\'kÇ‘Lâ÷±%[Ì\0öë¼Ó¦g ?ÙÌ$°¾B:\0©¿ºP¼Ñ¶×¹.B›£á!‚½ª¿›>Ò|œ«1Ð>PñbW	ñ´/y‚›F±eìÏD\Zƒ¶TwŸžRn¾!]GK¬‘´\\%œGê…·ŠEBè‹ÜF*…;~\"Ò¿–ù—úî_]žæ‘ÌN‡Ä°}Ì¾Q~ˆj#$ÍÀ¼dˆ“.SpR6VdÂäîB©¹ÏŸ‘‹â=”LKïÙ‚2yrÇÐBYðéƒGÄ¦÷þeÛø”ây¨Ø]@º…iÌ­x<Å¥¨:þ‚8¥§kË‚$Ù˜u!ô€rTË»B´10±Læcrú¿´1}‚ó	ög‡Û–c£a/¼þ£=+ôn÷õÑkQ;!…æ7%qÜ?@Îã\\ÊœÐ\"µpþ<{©@{„˜ñh8á£ö‘ÉØïq\\Óè•æ£|6÷€»:\Z7,N	Sì€ÑÉœ¦c\ZF5ê#iJó‰ÎLwÝ\n#µ;t7–ÅE\Z˜Ll6AM¾ÔÍ´ßKZ¢ö³/0—’kA.@b=\"¤/„¸ñú¦âgô9†ß¹¤£ÖËˆ]Ôõ€æW©·SsHÊ+q1íàŠˆ„x•/$ñ\nW\n$Ÿýgæ£ÛÄ­»äø\04W‰æYƒá\'pÝº’S8«W,œÜzsP+Ì¬¹Ì¯¥å•êÁ£led»\0fáºûÁqˆ»ÑÎwˆøGo,g¥8~âóÓíbpó7é¦Å,¥_lDâ/Ðff0æhÌ çî0áR¼JÆ¥…]Å7Éú-¢ÄznŽð±‘UYŽÓ®Ó˜­Ma€»cšœf¹Ž/¼cG*<LQ”m¹r)J²Â¥GVKÆHê\rÞÌ.àFñ3’—SrÖ#k½‰¡ˆHõÞ%F¾ü \n”^Ž—Ò<^fòåçÂÄï|ÇÒ&£Úy–	L±ø”8Uº;ƒêM{D¾^nÉtîUÌ*¹KLê~ÝCô\"¯œ¹¦	TÜ¤¹}BÌ÷6 ­›…(AÄ\Zv9!}§wU,ƒÀö•§x\nÂ#˜X¥©â8IÁ4;Z¸b(<ËŽ¨}àže²å\\/›ƒ´v#ŒÁïÎfMdP.bWÄ;*|&G¼x|Ì“‰–‹ÚÛ \Z3?è™‹IàÊQ‹Ü¼~ˆÏT$8LÛÙcç4–1O„—..—¦çF¼Í÷SÆ-RÇ_Y¶?™OæÁB^ìMœBþ2 @­,‹¹™¬Å3‚<ÝÔ³€6š¸©b¹fî(C<º¸3j“_ÜÙ¡è›e`ùXÅ…¡ÒRú ”œˆ€\rÕ÷é·Üß­o™Ý02²ó\0u©w]b8‰¨·\0\\[ýÌrE ›#Ù)–å-Ÿ¹4¸†¥ÂmFa‘íah@3ÉÉ-ï-=*^%wI§´D4žà%u¨M{²[ýîEßöŸÓˆ½tt)OQ~è=\0UTgîÍ/YŽòæ\\	€îº+é_øyŽ½ÝCöKEE‘>%óè1^%b\\=¯¡†‘èö””Ñ^“ñ~¡n×JÚÿ\0M;Ä¼Ïý	žùø·ßøuÂ»Á+pðan\"4êb#û`ÅÊ ï}Í#ê)•y¸¦^ïÓ]xý	£ÌR6K—\n5ÇJ#‹2Î›Ç¦¶fz¯0Ã·€þÂ–óÜœJØ8µí£é¢Õ#ãp×Šýá¹fØUzg‰*d]z$?r¨‹~¡-é;ËwþÒ”‡‚·ðO¹<7K0,äyª,ºs`írª,XfJT´ÉÒâaúžg™mt8â8,Ï9ç<ÚãÖ\"ë§Ež¹qb\\Ú*EñË¨%X™†ÍT\0hS¤‚>‚h>¼Ê+â|D›©Þ¯ÜÅ½€ËÜÖ£¾¯Zé¦a3ùƒ/düôu`GsÆo¥Ænc¸C=„NUÍY‹â\rôYr‘íÐÆf*e+/? al¯¨APf5k¤€\\f‚ê=É,R6§`²õ£ó\rKú\\—ªF¶~À…4Ÿs›&ð¢ò¬øb~4^¨A+àcò¿ˆ–ßõé¯¥Áš—…î£}ôRÜG©„eJégèæ<ýÊj~ñ5uÐ–Û(2ûÁ]2ëëk§ït<òË`F= ‡¢æ™t_7Ä¾-ßÀ¦•5‰ü¢ÎÕ^!â§¤Q‘ó,Ý¾eö1Œˆ÷âÆbîQWô’¿Wžƒ-èó	D»±[ëŽ¹@e8ÝêS¨ßnVþ—OÜß&\\Þ\"f¥\nÉŽ]ÄâÓÒ¼ôÈEeô·K‡0âž¦í¾eÝÛÛ/„2»â™Šw”\'yœ´àBõˆ®×ù÷—/ ËÄ8BáØ5pC3ØÁÜA#â_ÚÆ‚)pEÔÈq.…âX»Ž‚»EÑÜ6ï¼ªæT]8œî9¾Ñà‰‡0TÉÔz,ÊØú‚ú­&I„ÇJcÞŽ‹Üb\'l)Wð?Ã¼%‘å=ÃÍ)áD4)±ÑÞ5\n|%Ž¢QˆÕjp1Á¦vµeg&§š”<fæU>º›÷JMÇÜÃ,%^µ1’fmÄã²Ù}r[¡c ¿OMzå¨ºZ²›Ðœº·¿ë%þ€•+ ½\0væ/à°_Ðm©ž8Ü6/ës\Z058Ì®n`ê£ORñ2C™¬¹š%7„Ûž·ªšÄs™Ÿé·Ü9‰]3±Ñõ¢µ—T×¨zàÆ‹y‚©]ôLTS´¹,†^\'/Þå8Ä\nb°Ì§f\0%šËÚ9ÝÃ®×œÇï0\"eb…Ï•éÄÙ†V|§¤qâz_ —»Æ=k­ôY”1c¦kÔÅô1XŠó(Ù¥4Äð÷N	mþj†©Sâ7]+PH†¼Á9.æ‰_2•©™u§ˆÒ’>%8T@ˆøg%â^ðÎÄ.ËêkXëˆPÖù`jûJ$ø pÕG MÞ&«´\nìcª¥îf£î_Gü(¤¢\\u7ûèYGÏ\0ê¦â_¢NÁùa1+?Ê@±Ê\\÷Ô½\\.%8÷‘Ç<Kš{…ÔlÞŽÐ\Z¸b¤-¢h_W3Ã1ë2Â‚‚TÊ¹feZ²/\0™N‡08RûEJq\Z¥qGˆÒäŸeˆ¼ÀÀ’çÌÅK2ÞB¼1\n2%ÅV%”wéh‹ŸXíGÿ\0j,!öK\0Ð•{ò$[3ˆÌÒƒ³­oôbPÊè£¿EKTÉU;½*j9¼K!†¾¤<70e!Ì*\rô¨lœµúÁ‡¹sˆZ¹w¹¤ÝîZ2ãúTýùƒ5Lödó8hÇyh¡^ãÂ]óšW¸L’öÞåù­û”ÞáN˜æ3å—._K–Ë—/õÛÞ[Ý–îË—.[»-Ý–îËweßù.\\¿×råô\\·¼·yinì·v[»-Ý–îËwe»²Ýå»²ÝÙnì·v[»-Ý–îËwe»²ÝÙnÿ\0þ(©R¥ô‚i·	¾ŒÆ?ú@ïY–v%FšÎÉjÕã˜ÿ\0ô…†FhÁˆÀ¤§?üøÚOÄüT«hø†¢}OÅJL8gà¢;_IRÚóms*ñúD•-Ògã§á¢{_Nƒhgá£°‰v—Ò~\ZySðÑ\r‰<¹ø©IŠÌü4«hé·!¡È•Ó`3ðÓðÑý‚Zgâ§â§â¢[Dh\'á§à¢YQÓ–ÿ\0Iøiøh‰²WúlÕµ8ŸBY0ëPª¥6Eh}0X(qL|Œ–+È¦€Õ?¼Jåò£PÛAêaºúf–Ïˆê¿¸jjKDA¸]gÈ@PN½‘pìå‰À}’´Sˆý!º‡xŸùèBU£ˆ­”=GU0¬GÇF‡˜)Ic-ˆá9% p\'1…š1\Zê§ÄF€¿S\\ýI¾^ör	·éJç8}Aˆž•2[jgÆO¡(˜°êhˆ¤hþ)¨â,öi(fZ?Óåj%8Ìy\nUwNJŠ®2ÿ\0(5‹…K5A \\S™y‰d°¸€–x%¬ö•íÂ-áA]K ©S­ÿ\0Ò8/p•¢–©1„BÈ&OíÜ°¬`Â+\'¦¹¬“$µFúÙÅÄÞò÷|~ðxf~ÖVöB«Ì@ˆìÌî¤üÂ­x–JÄU1OqŽ‚ë…ô*Û~ltùŒåÅ!næ	Ú%Õ¸l}Gý/`%¼a3üíˆv„=Õ?™J\0\\ÚP‡b÷†rÔvú3Špðõ+Ìs\0†2ãd3øÏòL¨¡HdbZ½·6¹@nLÖf¥XuŽT£„`übqÌ×Ö	VêçÞe3¡YÔÒOHÞ µ:žLnf‰\0{„Dx%«2´’ÉÅD¶2ÿ\0ià7ûÄŒ®ž´£YœÃ0ÿ\0¥iï‰íÀ‰1IAS½ÆÏûÀE{|ÆÆ1fagoá¢å/xÁµæÌ‡ïáQÕI^Õg¥Ôy%»CèU¤sÍA+;õ+Èfi)—ªæzýçÚâ‰ˆÐ‘}QÌ>ôtZ\\¹Uê)Gb¨MMª&0áƒÀ fä¹š¥Lkm%ŒÔ¾}Äø>hÏ¶K9š=?h‘‰oôÞ)“&ª% ÌÎTRÕƒµ@Ñ¹Uâ’…G:Ÿa\r4AaÍù”“3´Jªë¼ÂWÞ;G,Ð!lª‘ðŠv¤V›â»ûF³xEÍm Z&]ŸH.ÖE\Zè×ïû„“|•¸ƒ¿Ë˜éH_Ã+j_As+.2âVtae”ˆêU½ˆ!›n6$¶¾øvÁ\0šcW!;½Ë3X?igaHôÿ\0OR2ÙqìÜí_Îw_Öé.^x	5ÇËÄÅŒcy›AŸÊXi¹~‹¸Š¤MËÌ9@žŠ€.àým´4,«¸ÁUgX‹‰h|n6µ³¼&‰¥â.Ã~ðæ+Ì;¸¾¦4v“[¼Y\0Þ*]ªXhå†¦!¥;×ëÖ6ós’E.3ÄaÀåuØø—BêÌû„4]9†¹Øý¥.F(Íê?é:˜É¦Oí	Úí)ß3È&vIÉÓpT:s{0.×\nn,§¼*ÁpC¦È7”Ú*p4Œ8¹RÝÇ#8¸Y}j(ç-õ\"Ž.ºŠ}0rK\rÌöq	xÓ0^ðºLXI÷¿ÞÉÄ­œÀ«‡#US¿Žèxf-Ûº=ñÌqÑ€ê¨Í€WRîæÁ4Ïqi>Å(Ò@Sö”k®ÿ\0úb%é¼,)—<¬Ò§é,X`ÝøœÇ² ])¡5ùÏRÃÞ30å¨þ÷•ŒKõKD!xúÊ\0çù%ÛPB¬¢eÅ0iŠŠÏTŒ+ÅF-Y—FBöÄaç ´õtNá}@.ª}ï÷Š¾­T.âÙ@TÖnf¶1¦©¹‡pQ·Ù1}ôy ÄÈUôëÙ÷Kó1–á2m#¬Ú[\\Ãi?Ô_ƒdûÄm©KáŒ(RÆQBÍ±(öQ@\"Í\rË )Ÿ+éã².q ¹bŸ¼Æ\Zï.q,æT-j*WþI¦V¤?(&Ê•´@YRlù3åmÇC›¥©ÇÖ\n<ÄzS“ï)ð~ t\Zœ}J£”Ê êá§ÊV“»ýc*ÆFëz•E¢4j- Pš%Ì%ê™|¦º\n¿¹‚1HÉôˆ&Šîˆ+ïÀ]šÐÆŠ¤ì~°(Æ«râ0#2E^åJ¸dó7îÖÃ4\'´{~¬§{pù”Á£ÜÒû°%ã˜ÿ\0ÓG†­pù!ðÛlF—^fFX»ˆ]2€a4Á6Êó;ñ`JÛ«¾¬	²1’=ÎÑ\Z[?&`Ë›bó(hžåäœ˜ˆnˆ1¯Ç©hŒŠÁ¹w÷&ÇÜšC-¸ÓFX°QÌ}¬6ÊýyPçpÌ0’ö€ÿ\0Òß¯>4clq|ÇýKÂÃ´üœð…`×Ò~N6Hx^‚5‰PSÜWs2’{Š°à£‹Ÿ”šƒñ?)?+\ZS^ççfØ@@G\0ÿ\0¼‹³ór€Ï,ƒ˜²2Ø»„üäh¡ÂËCèdÏr.–{ŠvßK«mÚ~R~JlWÌ½ÚÜ)hrOÎÏÉÊ?ï3_ßŸ•†öYn¹?5Rç¹UV?3óòïÐËÿ\0÷7ÿÚ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ØÐK<Œþµál³Ë³iÐC0À\00ƒŽ8ÁŒ»\"@o$_$×Ì\Z”	­C\0\0R	 Æ\"m -à°”Ê±,H¸2‚´\'Uë§J“ˆ6XwC+Ñ_ædm&üÀjã ¥‡Þ€$CGhÊ8Ø,Ùh¤×1€hAÒ×VŠ¡bIŒ<h¢K>kÇÐŠKc˜pyzÞPÒD<\"3`Û1%&¢`cÆ‹m¥¸Q({\rGÁ° PB`aüd™D\ZÅ}ð ÕP\n†Ÿ½£,RITiÙ•?$è–ÇæÆdÛl€Jl=\ZA×¥Ú`ª\ZF 0ÏÈ!PT™Òb\"Ô+_³€HÓ±óð„‹4Þëö\Z=zK}`¥t JA•§qŒ`«È±“\",„8¸”Ï‹Ì«ãª3…0ÿ\0em“\r¸|\n¬eh\0žaÛÍDÑ,QM\Zš€U`d»:¼\\K0-åÖ.~&ð2MÄ‚0T\"˜å2/ ê¡ó;eøE­Ì\n¼Ï X`2È²â	?lr	\'ÂÓø~ò¡%~oî6Acš‹Î€†(iA˜c*„Á¦6™rÆéëìõÈAî¸QMj \0¶°SÈfEnS_`iîºqÀNd‡Éì$JÒºRubGPÈÝcksê‚ÊI<€›ÊYYqüÑâ@‰ÂÛ4W3ˆ{Ï®ûæ5CÀþ l2Éi€Ñ†$XõØ¥‚Ûi ‚‚uƒ¶E ¤¤…Ä*ì(*,\0CB\0Â00@0€\0\0A10\0\0\0\0\0\0‚\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0Ž€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"Žã°„8h\0åÁÇ\nc‚\0\0\0\0\0\01	Êå‡Í59eXœÆ•“äU\0\0\0\0\0\0eË]÷S?0…AÉ9$ñ#Ûfâ;”\0\0\0\0\0FèÀTËÎøçP8 ‚^Q)9pÖ@ŒX\0\0\0\0\0\0ÙÁ)LW[îý­–™”4£Öì6•”\0\0\0\0\0A	ÜÂ¹._¿™Mè\r»r‚$…¬=À\0\0\0\0\0\0‚0C0Á0@Á ÀC\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0\0\0!1 0A@QpqÿÚ\0?ÿ\0?‚**)QAi•C**/Îùj‰÷X†ùÑt‰`°*±¡,\'ðcýÍh£M‰5•…\r‰cT\nˆ”‚VE\n·¡ÿ\0Dï…-\n¢±¹…BØÜ)H:pÑ.xBìØ‚ÑÐ1	³­ˆ®ÒCp>Â‹BÄ†ÂèlÑŒ‚A¥‡X¸\"h€Ð´*ÃLhˆeÅ½l[\Z§\r„£\ZtÛˆ3â8Æ3¢\r¢îÈ­’ø4˜´1¡7Ž0žV)sgX°¢ÛHmlæ…yWDÌu‡€z¯…‡Ì$‡Ütá¦R‰ãv.A:Ž•:8bX2|7D…M¢–&àe\"Ð©±1=áóåÎ¢bTR²±Ñ	 Ú| ÖÄ©\"ÞHB)(»‡Âa1Á<h†Pn½	¡&DH&†Ñø†Èj~¦Ãˆÿ\0å¤lJæILŸ\n&\"\\&&-BD\'ˆþÁlCBqFh‡–ØÈšX2üŸ‚\r›.$s¸XEƒž‹bpIÖY‡ŒbQØ{Êd9‰–RŠ0ëÂÄMš)QPö#‚Ø´>ê-;„¨…Ã\'ÁJ\'ù,cBLÚË«BP{(BIŠ6HAÅóùà$O+\n,\'‡²±) ‡±|)¬%‡Áa\"\"¡2”«¿7xy¾\'–„½)DY†h¦$Ð°¨Jzý\'‰ñ~¿2ˆA¤Ä’ðñ<þ‰¯ç(±pÖKˆ/’^º\'â—Ã\r\n#Eù¢”¿\n,º-HyAk3â‹š6,R—ÄŸáÄõ>‹ÄÊø?“ù¯Šø?hU÷^Vþ«,^Wð\Zú¢—Ú/Êú¿äÿÄ\0\"\0\0\0\0\0\0\0\0!1A 0@PaQ`pÿÚ\0?ÿ\0çÁ¾Z²jÆËV­YjÇŒÛV66­ZmÚþY¶6qKß!ËI—»í#!\'¤0°»K¶ÞñYlÛqêAä¾–Hß’ïn“¨o–ÞÛ\0µ†K>™êD›¶~ÊH2k&^[°-»D¡–ð°·ŸL“„ëƒ>[8Ùv&\0ËFÝíÉ2e©õ¯ø¿ñƒÔ	¤‘£ò%›\'x16Æ¤å°Ûl´&aöÑ9„Ë¨ˆ–<˜žz…¤ýI©;.ËlSÙg}[ÜÒÖ_xéfíibpL;bžPÍ×»BÊÎ Aà;KSw’Ìƒ[o¶? uÂµ•dÏm>_2ÆOV²œ—rÂ{eê-Ë{œc	6˜Í™‡Qu·‘ÚºX:ˆcÈÛÃå›oYœŽ¥Ž˜é nÄYöK«ÏW´—¯„Ùka6Ë´$¸Ã«Žç¯ÃrÝ³dHí²äÝî[ÅµËõ+;¿âXsÈg:l	<ŸÄ+ILžÉ‰žCu»C8½pÄåzÛÞÎS>Ý€N\rKÁnZ»[.ßm;´µòpŽ³,Øá1Ãê5le›\r‡® –—KP?bü´°ƒ ‚tFÜï–þsƒ¾tŒ÷\nìfuÄï94”¡.œkØòäêaÜ¶·‘Îß8!ry<0÷–m¤¶Vˆ3^£PAe¸pë&z‡f:ã\"kÇÖf¾Ze¶o±äì<†CläSézÝ#®âw†ìððœØòˆlXmYÅ–±Ä;o\r¶œòaoS§¨Èx-‹ËÙ­›IB[²’ qœ¾^É–l3ÇfÏß²„;gQËrFGH²?Oœ=Ê	àE¶~3y	œ¤ÝËÈl2ÞÁü_8ddLpÙx/pYy;øK¬§Øí/àc’ÝçÈÎ—\\Ã/+Õß2¶\ZØ~vœ/oÁ{À[øÛÖgúW£ýç/}Gäþ÷üUxà=àXX{”½p6ËÊ|àrWp¹mât‡!ßç<Ž¸}áò˜ò=ž>] Ÿ#ÛÆo¼^²uýÖwÃä-Ù½pyÌÞ.·©ò=™\'Èó‡Ù¼1ÜõÃï}™#Þ¯œ>Ï‘3xà=pû7ä6\"BI6¡–w2pw&ß85>Yd›ydG÷Ïñsÿ\0zÿÄ\0-\0\0\0\0!1AQaq‘¡± ÁÑñ@áð0P`€ÿÚ\0\0\0?ÿ\0ý9I‹ŠJ[ÚŒŠˆ.1`Æâ÷‹@Öi©«0µ@û—>Ij³’¥eð—I$\n`sÔÊ[‰d«!>¡³ðX½ÃPà‘#q\\í|„¼é©¹QU¢¼„¼NîcFÈÃLS.;Ã-€“wßRŠÄ‹l*X˜³‚v’t‹n0¬Í\r%G™B¶5ã–‚ÇŸþ-ªÕ«V­ZµëÅùNwåz´xªú‹þQ!àÌˆþ„djT·‡ô\0AÅ—Mñf%NcqÄ‰`xe\nè¦QnÀba€Ž`<-¨gÛñÃ×/ñ×¼¿€õe¥ãÎÑTÄ»˜å„S„tŠ…(û\\S À5ŒmÆ¡Q‰ˆÖæQD•c–¶NréË´ŽZÙá]s:Îª[äLqG\rÈ€ƒ#Ì–å8Gûð¤r{ˆ“—¨1h‹ñqòÁú‹d™ŒÆžQBÖb·†H“´tû^-±‡M\n¨\\QÙ/7!b å“ }3k¸;\"ŒtU	D,ÆÛÔm$Ìr¹GÖæÄÀ…Âih7k\\À;F|Ô»G‹t<Ê¥\0x\nƒÏ<ÌÆ18Æ5D4g&> ºP«ï©š*£cÌ#³õ¬Ä»\"ˆ\nÂã-4F¥ØT°\"ãpŠY®%#\nÑŽ­R¶W_3€â,¸Ìí£Ã\\¹üöaøñ~Fãqû†I`6j%B§”±¿rÒà„Ê»F;†Fí3\r&˜©O›‘sUÅÆì#Ô+‹)±°ì;\0Ù‚çLB8«‚ÜƒÞ¥ lLÅIÜÐ\rê5y¨S¥u9ÖZ\n…áÔ~\rjÀoÃ¯ž\'¢‘E<Ê„1Ã&9æ2ÙíW­@[1å°êU¼D»CQµ¯šê\"©ž2Ë‹^°O0@ŒÖuÆ¡„Ü\'Ê´—	ÁÔÁáL,fÆ y”í2üb©š6‹6²à}³HÖ‚­×¹f„Å).\\*…ÂU(æ\\XcƒÝEcwÔªÔ¤ÇªãË+K5~&×\0ŒR‰ÎR¡pjmrú	t;ó(p¶Àb\\¼í\0,ÐxFrðd¸Í6â(\\.«S!‰¡m*@¨Á6Y3ÊŒÊ·\0\n0åéˆ\\2*¢›n	8j´¢?æ;@œ–û”‹a}]J‰Óþ#`h«~jyÃRíž$ƒ©ŒQí*nO’†C-ÆÙQF+UÆ~¥“è\"ÞaT¬å—°;«*ò¬¬“$¥·„0÷µ,ð\r\Z´\'Ràö¶•1ºŒ«Ã¾â\r<X›‰t2|R‚Œ4]ÆÌ¢6—5FÚ»ó‰‡—S\"+«qÒ\nÂ˜—˜èž\r±º¨,u™ƒ´Älrbî%mø‰²]:ˆR»W«Œ‚d¡ˆHjÑð‚¸éYN	ýÓ÷•jRÑÜÌ-3Ü¸í‰‘£r¼ 8èfb·˜£mV®0BæÓdYg™Ñ¦bthõþ{Al4Ä0Æb1Ñ–%HóQ:Š æ£Êª/çÂ=KFÎN1+J—\n°øŽÑÄ­RlîFGRVšª3¸B€²æ@<3X#Å\'Y–@­~æ\Z‰4ž`AÑ¥Â@#|¦¸`<ä3ørûÁ}G|ÊâÝÄ…JÔ½\0\0ŠŒEÔÄfà-ÜŒÙñwÄ\'ˆÁ¦ ÆP6B´x·^b:<Ê>..‰ksâ%\"·«(åc¹1,a+ÆÊuXÎÇ2õ\nóÀ:q¼F\ZäŸø•5}òÃ¬ ¨Ô	@s\0äüB½øŠ€ C©b§ú‹(ëO3(àæ¼\r(ÆàýýÆþ†&3Â¢!´.˜å%%Ü,—žâÖ zÜ£¦«ss–˜,J‹£á¾	´Ù†¾fÚ\r®`õ\0ÈÜ´.e¥Á‘ŽÐ*ÿ\0˜ïÖªÝ`Ê×FõÂ1`dn*ý5\rÛ\Z§©l%œJXaŽáHŒ¶NRÎ„¹lÒ‘nŠàEÓ­™X†Ó·÷ˆ6B/Hã¶\0†+}K”vK„‹0\0\'‘ƒ6T4èÌpì2ædÆÂ9Žhà\\Ã2B¹`—0ŠãY–%qÉ,jœ@ÀÕ¬Ábÿ\0pHÑlaX2g·øQ\Zá8œ\"\00´=”«²RÛ\nº\ZÜp\njØ³Ñ h!.;1Kú47ÌÞ =ˆ]…¼ê!ÎlÔÂ æ­s6ˆQ6“•c{P\n·Ddqó—ÁˆýÔ¼!ró\r\"o1G;­Ê‘E°¡Â˜Ù¦8,c¶ö@\0^æ@V‹3ipg3@ÏˆÔƒ’™… \ZMÁ¸ÃÊó(sÂæEÁ7pm \"¶„^5>7*l:˜KäˆA†f-DùøeV¼.|Ì\"ÆÃÌ¥á©æQŠ(¬¬eNËÉ(äwIhä‚‚P0—X•ã˜Î=cs¡þÃ.âèé*qU%(r©]SQ¨áfÛ‡mä9%õ&éœB‡5ãQ½´û„SÌ{áß™„ªNn9³1…ÖÑt\ry…î9r8UP\rÏ8¯2²)ù˜•LÌtðf€}“xœEbçàÔŒÑ1KW-Lÿ\0Ež%ÆS²æ=$²!\nx°Á`P˜µV»ÆŽS|K*á¹±ƒ§mC†ðë—¸í.–îeƒÂî -\ZU‹PŒ\0½…ëÌïI\\?ƒ¹•h×ÔÊýK‘ÞÅmî2œ>D@‚˜%¥—ÜÑÔqlN¹‘A`\0ÓËTYÄ,Ràeƒ$ÂWŠ˜Õb=â\"È®¥ÌOÅ2€ä¸ëÄ½†~Õí’¦bŽÏ›bs¶ˆ	fÑ‚l¤\'ø‚j ãY…ü‹º\rJ¶(‘¯˜-Þ®iˆ,\ZXHbÛ|±fÂq+Ws6žLÁRëÚ_ÌyAtèCÖY/KRì<LÔš™Ão¸ÁpÊ17®â…§/Å\rƒ­ª¸-Â¶^	o”6ÔD ¡ ÀCa6Ë#¶ì®´*]’†¼ÕB§”³¹·î@u|µ*Ãe\rž7Ì¸1\ZaÈ#ÂrSão˜òòM2à\nX¼ÆiÕ(@nÁÄL™GPf;”‘¶\\á©V¯+*‘»…O€õRÜÓ`‚ÄeL¿1zl›SWAÁv	~ðBBQŠZ¨p‘ÄN¥èLGZ¡À»€ãõõú•c$£“æ$×ìŠR„9Çp#±ÌÑ²CscGpœh\ZÊ_ùÜ-§ÅŽSîÅ;2ÕÌhTÈêÄm)VÚ5@ÝÄ%ƒC´{$x\00†ýFÓ\Zf÷<Y¸f¬-N$»æ<h¯&\"”ëÅÀ@lW$nPYÖÙ…ßpZ¹šƒ¶²0Äb×Q”6(Ä«Ÿ\"·ÔGÈaš	T\\\0]«¨néDþÓ•,ÏàQ½ÆúƒPðG–;è1¼ªly!Qâg¼Y´q\'”Ó0;•)òæUDË¡‹‡}ALwÁÞaX¶»\'XKÍ¥Í3Q™õ(—†Æ¥‚åò*¢u)Óo`D­ÄN ùvF„†À» Ÿ¨t	J¤¨ée!f’Îik—\nUÙ	Ëø™Aîp€†ÌUôe±-ÛÍpÉwÄÊxEº‚d·\nl§‹‡\"NG¨·»Ìÿ\0e-:Í–ùC²º®8ÁvâàFÊ[8à‚&\\ØG\\3 ¹w‰™]™./p¬¡s·2’c’øwQ‘{TŠÔ\nõ>åpË9´Ä\0£ºøÍ¹i²‹4ÁÓ£…ÿ\0ÌhU`õQÌàÉ\r@P_Ÿ¿X˜sØ³ŠŠºÑ—t¹æs¨* ÕdJvN³À\\æ¦;²®bôÝ>Iz†^ÓmM¥%qÜü š\r«ä”­êX×TMC²`¨h<‡Ó}J¬ÄË·Y—¼ºRì–ÕQjŒÔµKaîªb\r0ZÀÇ¨‰„¸º¢ªÖdpƒx™b‡¸(Üh\\8H¹†!‚Õ2Êîóc±‘=!(³‡‚‚=÷Ä©Æ‘ÊD\'·*‰¾·øÔ²µgâ#ÊVÐar´¯2àFOÔ°L¡ÆJ#²è×ï@V±Œ‰(ûˆëc\"$[”Ho¢€3}A·¡XÂ†&BI(¶l_ºœÎeÁj†.–Êœ/ÍGr*\"Œ¬RZÒˆvTZÿ\0\"§G1R@W‚e™¸¾%â©Ú	â’WÃ3´oqìµB ¨g‰Úáo2{rÛ\n~Sxîz“¿PÄQÔÎá+éòR£¤Š \\aQY5ºÓ)¤tWR±	Gj\\ÃVšË™Þƒf!WûF¬‡‹f÷í&áÄGÊ`å™ƒ\0˜u-˜Ô®£\\åÇB\\ôÆá€ß›ª¸¶Aå3Z´®¡ w#h£Í,rPËÌ`)Ÿûe¾o€‡…”R5†LžG]K˜™	YW	x\0ÎxN*¦Í¼@–ó\ræýÊ\0Vý\\!gd§î]hbVæX\nz*1jí8Ž¿9Êñ0ðî’]\'òÛ¸ðÔÐ²¡/f2Å\rá”ÁNÖ*3·R’¼‹Óñ*¨Kn‰)éúTýB\0\nËõlŽ.ó +ˆ3Ï‰q[K72Ê!æ_#ø,”ª·ˆk£3\r‚\\[÷Ó«UÇ1ÐQ+¸ƒjÇà–\0F§0Dh²¹›I­B—å\0}OâÜq\r¿ì˜÷K|Ìå•–fºŽ\0‘ëålhû\'<§”ÀÙCo˜¬d‹[ÄCê*C›è…ŠŒ9‹¨çˆ\nÙ9»J”Ö|âfÉÉ¨8˜+àøœ¨^ò¸¥(U÷\0Bb u,&C|=J^€å;ÂXÞ7‰x‹øqš”\0Â8”Œ¾zJA~â\rœÔKUä)™K]Ò§îgan§.f¤81êÍšîl°k³’œHV *düMˆº(¬‹Ž^â-Þ.b.©sñPsßc¾à¡¿dÍ¶%ÜŒwÅ•:|AMDšÜ§uÙ\nÌx~bÓÜF”U˜²^Íö*Tl¾a, •>\' ¨¼HÊŠ™â™Œ‚[ôb:Ä!>G2•¡*\n=¢ÿ\0˜š8a¾ãÖÊ—9]ô„WÈü »€}Gˆj\n	}1È®a»¬Çicô	¾ËŽ”Usn²×õ3š®2ÊÈ€XÃ‚Xtˆ¬Ã{u+2Ë¹¶¡°Ð=1á[¼²ÁÉê^´2Ä1Nã§ßqXyd@r.ú‹–b#k$RêP£©%`»ˆWNí˜h´ÆQÊ‚Y5/$i¹Á&18{`ñ\0px3i(÷ÖË`0vŒÚS\'Æ*\"¹Ê˜P›‚Á.Éo3èµ\r~fß1×Ä¤J<ÌE)SøóÜ2ÇH>ó\0Cq19Ï…b°øœL!¸â1|â\'ŠMJ£GLH³ù¯Æ\0Ë%à©Æ¢òÀÃî2–nv}±=B¿ØŒå×˜ÇMs˜ª¦%\rLà3\\nÅV¹K\0”cR€°£šÌZB%¥® pZ£Ï	RS€€6;v÷.|ð_3)vI¢‰ò2ž™û™»Ù™£ÀJð«‰øFiÏ„v^VÞD…DZì”kh)´¸A#;,ÿ\0¢béµF	â ¼Wît#˜Ë’j ÔÆ\n¬Ì*¾#‚ª†;™!ò›M¦ÒÕ‘ÉœJ4Ì%`UJ5PØ×(&[ºXú3ø—\nñ˜ŠUðî\\ÎÇÄy?0@Éq´.~&îõj|BqûjZÂË—YˆìTp†¡ŠH&U^$	f,ÀptgÜº¢hè¿ª¡ÈK>á’\0«ÔÆ[‡ü±Y[êeÕ„ë‰âPÙG¨cF:#a¸N=MP‡,RÂÏâ`&j…ýÍÅ}Û¢1œ@Þ^¯ŽeÄ]zV 9‹P¦~b¬NoÌ³²K*ô\nÍIQÄ@¬°zÍB×%ãm™3fS0fÍAaÂˆ²b9ƒÒEÌ;C§;ÙÚy)¸7_þ8†Ò™VK)ÑH†(-ÿ\0ÄXÉ]ËôQËðÙ—KI(ÆÌŒÊk7-{&ÃLæá™z`3+¶*=öü¼D:K+„Ä aç0a†Âªˆ€‹uRÃ32J,¥S&åšS%ÒýÂ3ýXû‹Õûý±Ûå_â¨+Ô¤®c´¾%lDØ*K4©G°rTvÁ^?Pí\r,Ó˜6ÏcvowV\Z)jr¥íbQ°#W=!ôXÄVPµÜ*¯;fˆ]â†èPË\rlúŠcpV¢$oÒlé<E³‰9×YxKÌZž®WÅ±QÙ-Z)÷4U%¨4öL0¨¦¿MN’ü|ª– 9|D*®pˆÕöLÉ¼Itú(PÕp&3—¨½JèÛ®“r;Š“R&è\räÊ‚¸\\ÞÌÌ÷’{ge%ülJŽ[-êaäJ0ö•cãwÌ®±é0¦_‰f,û„rÁÕÇÄ(›éŠWâQà¶\'žv÷\n\nè­%Ì«æ5Ú˜Wlå)Ï™rU”„K|Oqå–ÍÔµÈKÁ†rØÕMj¿l$‹Ûõ\nTÛ+ýÄ/	8Â =§ˆ„dü’”\"h ¥RV³hM°FåØô”õ#øHÉ›„KçÔÉ	ÐðMx;pÂn\'™ÍJ·0ƒ¡È€ðaÐ\0ÄÌXO*ÏKl ý\0þð[5¤Žýúfr“Ý¥\'âÄy\'”²ã.Ó†^7»TKžmÃ+©T¡èÚ\râXòœc¶n8„–Qê:Ñœ<J±rÉ¿ÇÁ˜E*Éž¯IpÃA¦øN‹ì—\0Ã>!¶9w\0Ò† °6\n§Ä@ÌÊï›µc9Óåð——Ì­Œñp¯ý»˜Ð/¾‰êlÝGl£J˜NEO¨½€Ý…Ÿ;‹et×mQs¿Þ%·ÀÁn”}œ¯úÁŠ=¡WÙ\0b“ô8 wAµ,ßÄ¸Ôm¡_0ím‰«]îq\r]ù–ðºKõaxšo<¥\nIÇ‰€ùGP*È½M:5kô—t]F|ÊŒ•j£=cö*Vx±uÀôŒ+*üŽ®i…îâç\'p`»cá©oâê]õõu0Žg1×–UßRì“£ÅŸP¬[ÑÜõ‘¸õ×àyŠØó\Z¯‰”ë‚^kÄ¶	¡,,,ÁÀ€-û—ˆµî::÷@Y,cÉXjãæ¡¢+´åj–k‹.œ¶>ãÙðbçD{á.™l@Ý£ÅBPõIKeî<QÇ¨¡ðž1\rv*•ùÜhT_6b·Xe[\n;­KÔè]TK¢¼—sD|Õ-É¦0Zš	˜\r`êgš¾§ßá4´4.­€{Œ<Âº–@%LÒÑ^&MëòÅXK‹ìñ\nþ-ó,1o(¯*ù†p=Ýˆtxh@Ôœ”Ä	j\ZÙRÒ?ÑÃâ8DŒæIÆiÆj%®\"1#”pM¬&Ì$–L6Ìpb-ú™˜*5x&Å\ry€z…Z¬…T5e‚²(<AÜ]RfêÀ²)œ\\þ!±ñë2}0û= ºçÀ[–\Zûn\0µÁ»—º\ZôB]ðJÇá›¹¤Ö7.(9”ûjc l#íµ˜lŸDÎ:×\'Äse˜ñ ;bà².€!‘ºÔ¿„©@*ÐgÜ°Ø¨KÄ`‚ªàw1$5t€—ü7\rÚæXg5ÜÒMÜ@¡÷0°>%…\0uøž@jûšN«Ä¹Æ Wý£© Y¤GòÌ­ƒîPÖg¦9™è„Y%3…ê(°cˆ/Àã©„Ý?š»ñ=9ƒL¹DÌk3qŠG¦mg*!—ö&/ðAuèª?ç¤?ËÂ³ó_$©¤ÜJÅœ€œ¬|º`ùb‹IVëÄYhŽÊöÎ ¼a‹V8ÆÓ†š›ÐŒ³(\rZNfW%„mß‚:M•X1v.+¡\\FÍ`q>X3KáÝ@oØ\r,®\0À½±Hp£AÔH>\rÔ\"´[kûG%f\'ÑH#Ú2–¡€¿—MLüMj<ÁÙË¯Ü¸ú?MÊ´ Ô¹ˆ¦|Di®¢Grå/Ä\"¬Ìù8Äô+Ä8·-UFnHgÚÈ@±w©ŠŽS0qørü°s?˜®ÛQˆå%Ì„Ü06€8«ˆvOHøSÀ©|ÜGQÃŠÃ. m¯¥9•8…GQ‰œø[ºil®¹ž…¸AÌ¨Áä‰Æ\n§7~&ž,S\n¥#ì‹rg\'0€ÉÃ+vF¸ ¡ÜºÐâ)C¸ŒÒ\nmWŽˆ:±­D2T•PhZx&Q•m<®¨TøE\n9L ´`ÕúKNÇî4¡(£—MÆR)Â,M°0FÈ¦öÌ±‰AÔYý@Æ#¹²d®æØÔRPTp#¸¦[ŠKy—wÌ¨eGQÉ\rBm4bÜs5cì“ê[2\Z¾c€ê£ÈÊ÷X\n²¿Ä¬1ÝÁ6-‚ €r1 ¦Z\"7KÂ@\0èywêK•0­îW‘ã”&¡ÃX	‰N½`VÚ°€¬i‚X¡˜2Ïr¸\n–¹xˆð5\nŸ ÍàÐ2èÄ=žÆ÷9(”Ê°‹æP*sRÝ¯A€3?@VUŒÛÂUÈmøNôÑlµæ§\rMƒÌ¥×H¹ÝŸS€pˆ’³.R¥õ>6„qPº´rF;;È8é_Rê«>%5(Ñ\\ËzËÂøƒ wwC}Íß¤4ü(ÜÂÈ¨†<CíEàVÌ!~â-X†‘dÀû$4Tèé\0¿jÄE…è‚(²ˆ >y”ÑrÊzƒ8\0‡×p\nƒÄÐæeúa Òê$†­A,ë1Ð¢`³0µK¡ì÷/›%Ê±;l”\Z¼Ç~©GL,AJ¼†^+`ù)k¹W™ÐEÐØ\\3+ˆÃ-.:Ò4¸µ¨Îk,A¿SÑ\Z²·¢ÍœÊ®ó\0*ª2‡¦á¥˜Zê\"W–Øæ:Œa4²‹wR¯‡`«—ãbVo–9Ø­ÎÀÄ¶q©{¨ÂÊÑSæçì›&™ŽÉ`*Õë¾å,ÞV®nYãQ‡—> Z;så¸ƒ·ûDr¨ãjøˆê+Ù©A3÷+dsEŒ/ÈîRÓ)R¥Jø™a\n±¿¹k%f7¦ÊSôÅB¹N™¦sm”æ÷:&á\rÝ«Ä ±a±TÎ²ª‚%†»Ì E> _’+èFìËÈá!¿RÐAàˆi³–2ðÆç§0joó”Ü\'©VGðí,eÎë,²ËÜÍ¸j¾\rÌ¡o1`‡”ÄÊ˜»…\r¼CÜ*trEÜÍ*q2Ï˜rEz×â\"¾!C •ZŽÆ4cøŽùÄP6^qTXV¸úÀ©VØRÞ4ÁÄ¿Å‘\rÇqà@\nRª‡´c/ÔÄ0‰À¡ù¶ªŠ¿ƒlê/²!P+R¹ˆÈ¯XŒ¿ÛœU]¬8 ³¹‡¾Yað&VÁ1²­%íŠÚt¦-bSX#±å€D©¹b0„&?ØCiÎ3M¡Y#Ä¥ˆ»ã’Z6_îd\ZqÄïÔÙL§)@³F#Æw¸î\r|Ì;DÌ3q3€+ˆÆ‡„KoŽhe®W¸ÙíqvùRË£*«qÕÿ\0J€´UP»h}@sjý;‚‰ÉÔœ¬{¸–åŽ6£ÙCÂýEpÅó{ù©IOœÿ\0Ëâ?Ñw„\\Ç•™Ì|’õ3¸¨àõ™^u’Ç€D×ÈŽþyw‡NA¨àh—– G\0À×£r¤æ¢ù3-J8„.ÛÔl2 ÏpšŽ¿Ç*9”.)mð}Íl/~b=\r×p*ØYsKqj|§7*xì¼B½Å¸à&ÌÛL{TêG-~ð–§¹j¢ŽðÜR ³iPÚæŽæ–joi”ðÆ1^Ah\"\r®•13!ïûÐ“›ÄÌ`¾XŽCå	 ŠÆSÔA±Ûë¹‡§ŸÈ…Cy\"£¹§ƒ#ªË±ªÔÈ+ÚØ5[/|Ü=}MM@#=A‹, K+›G¹…î&ÏwT\n¸½æÊ¸/ðjîiQŽx¢Þà—à¹g+»¬G¸ö0Zê§Õx‰\0ßçÕâ•HáËi„3ßrñÉžªPc‹e\0Û?™ˆ¯º)11-¡YJþì+rÍTq¸mœ Q-¹5Wø‡@.“øxö?Ê-O@?˜\0êçõq4¿l~Ež\Zþ©– -OªŸ\n\rÿ\0¼Â0ì!ð£Z‘sóŒ~;üFgÄÊFá‘øŸŠ›¦\"Úâ2™TÆ£¨’©E]G3ChTFhùˆK™S‚:\"—GðÃñ	=ž%½ü\"x\Z÷,+1úÙ‰“Š–1óÂÊ=Äî^nd#I™zƒÜš£ÿ\0T\nÍ¢,¾Õ$ºÆ)ZÎ>%–¡·_Ì±ª^çs¢Qý×z÷ŒýÅšð,2Ó}€\\Ï§«Ó(ò;PKv/_˜¬P¿*H›)óÊ±eþrcÓ¿Æ‡ñx^&×Ã`…ƒ™å	–‡H#S€î0$Ú%#Ô×PZUÜ&ÔÛf\"”×PPZÁ/,OðccÃp±îpÆrÌL¸ ®4ýË¼f:§²f&a²%LšúŽœq~åóÊ**™Må(81ÿ\01árñÝ2ë\'8…\"+J`‹ÑGF‰•ùA…žIgð	›CÑÉç2â•êç;ãVvJêrK	fŸrÿ\0§ŠÌ¿èÜñ…‚Ø8Ü¢}Ð)Ùú”+™y-m¹b—`ëh24¸›²Ì`Pð…Å¯0øÜµà¬µ¸­\\N¡®;ýÊ”ê\'„};‹ŒTPf8›!pÐp ?röß:”ÐÐs\Z­ Ib^{¹P«Ô©²¬jÛú‰3â^eÆ3,¼“îjóû‡àVÄ\0 tH úŽhT1r”Ù\ZºF×Id¶±s\'šIå¿é)‰Sˆâ8¨ƒ4 .ý\"YH:óB<ÅZöf ñÊÅÔ=\0ØTÁµæ*59xŠÇS¾âÍSÄUð$Í\',´$3@›¢JXßR‹	•“®˜îoP³–58ô.5b»™Q-,,F‘J÷ ³.*·Ä¥EFúbæ\r?¨Mä›Bk•(ÓlË¦2¾WsšQ)Ëo0/6R8qŠ‹YbØµGú¨7±c‹Mn´ð­m:†:!m ²\rÍ¥Òe¸ÖKFe‰ÃPlpÃlæÔ©eDÁ‹P‚Û—Ä]¶°M0xF‹S…F¹|\'Þù]A£˜ ²´Ly;#á˜lÍÔG•w)Y¬Jêk9´wßÍ=ÆPbb»Š°lµDEdzŒZªÆ…d›îR¡*ó?´âÔ;%ÿ\0aâ<1n+©SäâUdyGjÂ‰à¸a%êâ=ùþ§úÊ„¶deòKÝÍœ%\nß‰˜=Œ+,K¨/€‡³ÔlÀç \"fÝpF‹Ë<ðT*+åWÔµW°æPE\ZNYAÏ1gg¢¼B›ÐˆPou4€l{†7uDÄÚxîR6œ&;”ŠËüMB¡ú˜—W»‚´0Ì¶™F;‹Z³\nÓwrÆø˜1\\c˜ÅT¸åæq%ªòb3ø`{P|†rŸÊ>fÙ±P†\nx ©ÓÃi^XgŽRå¸·¯þQBµyâW›8â¡†\\Ê(ÞzšÀd†K\rñ\r_gp`[÷.4çˆÀŒÏˆ¬Ã<Ë¬Xê €ºa`ŒæY…BT)‡wÄ@ë\"ceÇ+!¶‰,†”ÈbZiÁ9”5U¡”/M?s8¡0UQÏÌ@«ãà9½q2þÎ#˜y=ÁO(Ñ®#XÙrùŽ^£ìÏàjd&]¦PÔÊª\0Ïu5zQnpVˆÂ3˜K5Û0âz”–üVH/)’<\'CÒŠüS~¢Îÿ\0¡†åôK4Ä3š¼Aì˜Û\\4_rƒdB´Ò8êbaÔu[#æ…è\\uáã¹ñ@‡Z]µAo11Uå­‘.‚°Bð*»w3iU£ÔDuRÀ\ZÓË`â‡ûÇ‚JÂÉ€7^œÀ`³Ž^¥[mMB¾bà©Á\r\'Ã#/@CG(-`¬i£9´w*¨òjw`Ìï$Q\\.Z³P«‰±\0Â†@¸,zczK¸Ê˜Á­0Ýzy”ƒ³˜¥\"*BXî‘£»#}b€ëîXIÓ‚öŒÈ…mLÁÜ	á%é\'—q%Ì3gcñ;$¯pƒŸÆëW5..ñ)tSêZÜæ”¨Ž¥H-rÚìyx”ªŸHk¥rn!Aæ²Â`c‘€¿Cq‚à-%z9ãh-ó)ÂQi½@Ë†Æ*z*hh÷¸…àŽK\'”êf.îâ N\ZÕB®±ŸàóÕÃPuƒk—&£Uœë‹^Ž=!”°s\0/h)©rç)ê>LöeûŸ)æeüýÏœùK÷.\\¹rç™?ÜJ=ÆÎÙ~Ø#–x™þò¸˜¿¹­—ý7.\\¹rë¹nÙ{»c.\\»—î\\Ë/{~åû~å»~åû~ç™(å<Üÿ\0q:>Éâ=3ý„ó3ý„ÿ\0y;Üÿ\0q=‡¹þÂ)Ùî?öý„ü“ý„ÿ\0a?ØEŠ·Ü_é¿ÿ\0rÿ\0ý	ne‰üµ>Þ¿úJ•+ÿ\0¢8¹ÓÀüCû1øýJ›X¶¿Uÿ\0õW.\\¿ùV­1ÙªJÅBßA\'ÍˆpfG£âlÿ\0øq¬éâiæwæS–mí‰¢ÖÒ%7©·ÿ\0BÍŸ§hÑüÈç•tÜex\\ÿ\0`‹(z1±\0±¸OìƒÈ\0©,¬‚†Út­\0MKPç0…Ø,ÿ\0hŸïÒŸµ<blQêcàö”¸*&?÷‚¶µR¸Ây*jE=2Ïò\"Ë#¢OYíX¥DÌ*ÇìlAþòdûž’¦ð|ûD¿üˆN¸ªñ)4³ý’YþDÿ\0`„ß¸% /DOü‰þá	EvŸiþá?Þ\"™É:áÅ¥–AÜÆÃ©¥BÐ€vF‚•Ö\'Œ¦°Óà£,¥n-Vêi¹šZÅ;®áEªC¸Ã-\rH¯º‡TEâ^h¶ÐêehxÊ(¤p`¡^RA¨#•­Y˜à…nˆ¢Ô¨VùÊE¹–`ž©\rµG›™oUŠ9»‰à‹G4DT•ã_ñ)Zo2Ñ€ÔÀ¢°dŒSkÿ\0Ì(@;wïájj“T±¿ð•q¡‰ªmé<ÊÁèžÄ¯>êáÆA•C9£.9‡M!²µáþ Ã5É¢q®‹ˆ„ðÿ\0£LõŒ#Ñ¦gE£¨P>B[¬Þ!\ZœWßvê$çþ	û˜ƒ ¯üÁ\nQ­7OŒÇÇ•/¹wiêeSÿ\0<JcëÅ’âÀ“AÃ!ÓaR–¸•R—è¹q¹ðÔÀ!k˜x‚µc3	r•Œ„»PfÍY\n‚¯8† iy›D>a¢[ðLk²[ü‰wæeŠÌ½\rPbóîaC­òW÷ƒ‚[fbäKÉ^I¹ts*Ø¢…!ŠºÇE—\0¾ ,—µ„·1h}Äš`L§Än¢ØËTn\nÿ\0a) \Zâ´l—‰´+À4\\#É}Èf”:¦úœ¨,KV;¹zùŽ¼§ÐÌ\ZŸß5öÇê]ªGˆÊÚU\\÷/WóÅ®Âq¥ÊQÿ\0jæ9Æþ Pr²2gp œZµOìdòXŒf÷Ù‚¨„pÆbƒ#y%GÝJqï:`±‘\rO¸\nùD\0¬aÔÉÄ{È¸ñ2QJ™°•‚ªP°fß…çIî`ø˜¡þé–Ý‹ênÃIH?þb1sÕöD8`\rºæpÈpÙ¡J†µ2{œ\ru˜Äq¤Kí™›OŒîg(Þª*`ŒTÍz˜çu¨d-jÍ@6\0W“Ô¾°ª¾ˆm(ó˜¶Z` \'µÅVSå<!¢ðÀ¯PQSÌ3È:D9,#ÀÆ²+ÿ\0…ÎÃWÌ!4‚¯,î=ÑI(PLvù¯òŠì‘a”óq4®\Z„)gŽ\"µµ_¸®ØF¢À‡—ÄÔà£µ·-@\n5v#0·œµUÕK¶Ñ¶“y%«ë?Ú^€^†a¥V÷évð€Ù\rƒÿ\0jŸ¤‰([Ìuð{éP7•ƒø#iÅ›¬ùÔÊa_,Gb¿è–4(sØxœˆåf¾ u…=ËÕþa&©ç¸CG÷0š8ÔKBÜ¹ƒaŠÌb)§p¡¬ùZ&;à†¥Àoâ[†ûÊqM’ßdOû³]âúˆi—A:ïýYã2ÂSî?ð‰mÍáNa MÁÞßñ„õlfÔâå~Ún?NO¸if¨šˆ.ÝxŒz·˜Äo.#.í6ÅóAÅ°Ä	Á¸5…qZELä£ÜC3)~a\0¼ÞXŒ%4®¢44=B¶N€˜GI—Õ¼@u^Ò»ˆRÒûôDiBGHKÅi(~‹PµÈþè±\\N¥á‚“õyb»gh7o†XÆhÝ¨ìL šrÓ\0`+?390ù„…¾™^AˆË$^xÖ¹fkÅ•˜eh&ÃTPÀu/\ZpC’¶3•ù#º+ÕE5ÈˆJË¾“[•*köü\'k¯ä…Âo©Xh_d¹y\rÇSlnÚ”l2ÜÉ¥\Z½¼ÌYFÎ†¦gþb9{&4OL=%a˜ƒc{^ÔcQ™j<œ5^n›ŒŠÂT«@yŽ`ÃZ—®ê¢‘Po«Ä¬Š½‰×:Wˆý¥Qfâ(ZÒŽ¦Æ^³üÂ€¼Dº¤éŒC™äu„B¢êbÐ§Ä\Z\'Ú^R·ˆ1£¿ú—Rï?Ë3˜òG\r‹˜qZc~çøÝe.\n%²Û%0«ˆ:p«Û„ex¡”(£¸LZZõ­àºÌÔ¶6`Ò·‘3—Tç‰TµpÕB-n$< VÓÊ[dÏ>æð¼\\êJ}á,Ýz…œ8˜Rý£[Òæ±7øú‚Ú‡ÃQXJ\"Àrî;;×¯$¥´jŸé(Òæ+òA´u±öEÐUÇ0%ì0ÖÒ\0½neæM^c`a,ùÄ\ZWoË¬WJjR½ÖÄ€6½Ã°íx”÷YËÂ\n•ž`ŽŠæ¥rð)ç$2\Z|ÄI±ê—‹aPfRŽªaÉ_Îœ„¸‚ ÀãðöÁ™±^¥ØPw/š*«ŒOöœ#‡C·Q(h¸#‡¶;ÕÎ <í•Ô-ë‡ûÊqœ_…fÑ\nŸIM`¯¯û#ÿ\0h· ¯‚¥F,<‰ê)‚âM‡†Xqâw“Bá’þæ.¶þHW%Û)$Ò„/8§’e) «Öy ¨\Z.ÈT5¡¡Š—z„¨Ë \0áPj]òÔ¡Ön QLG0ÀÈÜºá®ç)Œhš@Rõ4@*‹l•‹!\Z…ÀòAvV»?IVèí‡`›ÊRÙx©OÛM)[.¢&³y†Á”EªuðÌ¦&ÄA6¬ãª#Íî`¡y‚‚\07(ö1Æ!W(î< ®¡*S¶ú‡5¿±Šsð98Ó˜\rÞHS°ÿ\01ÿ\0„Jõ“m/p\0y½bõÌwö€^fªu…WÜÄ&e-ËŒÜßÔ*Ç*lëiDÁl\\Tß*Öëu†øƒ*rwE³pÕ…Þ\n8#$\"pÉÌd·\\{ˆ±šUÅ¦0>#\n7F¾å7ßÁ[¤ú0‡ižŸõ2<ô™•@ú²fÃ^‚@®Öºû–P†,F4\\ÊhÓoƒ£	òÆ¬–†á«Â¿lFÕ\0=N\n¹ÊfëºÌnÖ	W:êé¸µÊ²1*UEeBdBæãæÍ	ˆ…z˜³W•é¸!«êYìæ+4µX )ËP\05Îc¿ø$Úe0ùó‚}bºjn‘mYD  ßf+ÇˆÏd)1Ùé¨õ	¹â™«•Ü¸¬åºBJÚ1ˆÞ@/Ô³( È¡å\ZAƒ*6«Ç1)kÌM`oIr°(\"PÒTwÔŸóÇ£s‹Ž+\r U,MÄáiŒJÏ)U-Ã3i–Œ30Ç’³P#GqƒxÕê& 7”Âœ“&m–Ë˜ŸUr™ýH>P%&)ºb[çw Œ\"P0cq6õ™‚§ŒWxÁ„›ZŽ#ìt§±‰`<Ê)”éh‰™¡ÁÌ(¬4­Ü]Å\0¤@Ð¾°všnŒÐåjìAµÏü!¨pNHêçDKÜ7`…!œ¢«ü{o.ÀeÅ…XäÃ+‡pFÀb¸Œ6aUUîj*ƒðÝ”[\0ê[VíÙšòÁôSµÌUDe/dèÊË›*vêÂ\0³R#‚J?”þ;¼¤XESUª†Î8»—ìþ#¦Ž0ª\'¶åÀ‡>µ\\§ð\"uì¼¶ÁyXå4“$Sq\\@\Z‰°²Ìƒ[-hN’˜¼_66 *>%¬\"—¹ÖJËWÿ\0Ù¿ÿÙ');
/*!40000 ALTER TABLE `jammers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'BUENDIA','Y'),(2,'LIPA','Y');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_types`
--

DROP TABLE IF EXISTS `passenger_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_types`
--

LOCK TABLES `passenger_types` WRITE;
/*!40000 ALTER TABLE `passenger_types` DISABLE KEYS */;
INSERT INTO `passenger_types` VALUES (1,'Full Fare',0,'Y'),(2,'SENIOR/PWD/STUDENT',20,'Y');
/*!40000 ALTER TABLE `passenger_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Admin','Administrator'),(2,'Demo','Demo');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_fields`
--

DROP TABLE IF EXISTS `profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_fields`
--

LOCK TABLES `profiles_fields` WRITE;
/*!40000 ALTER TABLE `profiles_fields` DISABLE KEYS */;
INSERT INTO `profiles_fields` VALUES (1,'lastname','Last Name','VARCHAR','50','3',1,'','','Incorrect Last Name (length between 3 and 50 characters).','','','','',1,3),(2,'firstname','First Name','VARCHAR','50','3',1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3);
/*!40000 ALTER TABLE `profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` varchar(255) NOT NULL,
  `origin` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `distance` varchar(255) NOT NULL,
  `travel_time` varchar(255) NOT NULL,
  `other_info` text NOT NULL,
  `fare` decimal(20,2) NOT NULL DEFAULT '0.00',
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `fare_id` (`fare`),
  KEY `origin` (`origin`),
  KEY `destination` (`destination`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`origin`) REFERENCES `location` (`id`),
  CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`destination`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,'BUENDIA-LIPA',1,2,'3','','',209.00,'Y'),(2,'LIPA-BUENDIA',2,1,'3','','',209.00,'Y');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `bus_id` (`bus_id`),
  KEY `route_id` (`route_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,2,1,1,'2013-08-23','01:00:00','01:00:00',1,'2013-08-23 01:25:13'),(2,2,1,2,'2013-08-23','01:00:00','01:00:00',1,'2013-08-23 03:34:53'),(3,1,1,1,'2013-08-28','23:59:00','01:00:00',1,'2013-08-27 15:07:57');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terminal`
--

DROP TABLE IF EXISTS `terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terminal` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terminal`
--

LOCK TABLES `terminal` WRITE;
/*!40000 ALTER TABLE `terminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_types`
--

DROP TABLE IF EXISTS `ticket_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_types` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_types`
--

LOCK TABLES `ticket_types` WRITE;
/*!40000 ALTER TABLE `ticket_types` DISABLE KEYS */;
INSERT INTO `ticket_types` VALUES (1,'SEATED','Y'),(2,'STANDING','Y'),(3,'ADVANCE','Y');
/*!40000 ALTER TABLE `ticket_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tkt_no` char(32) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `passenger_type_id` int(11) NOT NULL DEFAULT '1',
  `ticket_type_id` int(4) NOT NULL DEFAULT '1',
  `amt` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `route_id` (`route_id`),
  KEY `bus_id` (`bus_id`),
  KEY `seat_id` (`seat_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `rate` (`passenger_type_id`),
  KEY `route_id_2` (`route_id`),
  KEY `ticket_type_id` (`ticket_type_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`),
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`passenger_type_id`) REFERENCES `passenger_types` (`id`),
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`ticket_type_id`) REFERENCES `ticket_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'000398',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:39',NULL),(2,'000399',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:43',NULL),(3,'000400',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:48',NULL),(4,'000401',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:48',NULL),(5,'000402',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:48',NULL),(6,'000403',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:48',NULL),(7,'000404',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:48',NULL),(8,'000405',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:49',NULL),(9,'000406',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:49',NULL),(10,'000407',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:49',NULL),(11,'000408',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:49',NULL),(12,'000409',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:32:49',NULL),(13,'000410',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:54',NULL),(14,'000411',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:54',NULL),(15,'000412',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:54',NULL),(16,'000413',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:54',NULL),(17,'000414',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(18,'000415',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(19,'000416',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(20,'000417',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(21,'000418',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(22,'000419',1,NULL,2,1,2,1,167.20,1,'2013-08-23 03:32:55',NULL),(23,'000420',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(24,'000421',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(25,'000422',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(26,'000423',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(27,'000424',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(28,'000425',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(29,'000426',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:49',NULL),(30,'000427',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(31,'000428',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(32,'000429',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(33,'000430',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(34,'000431',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(35,'000432',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(36,'000433',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(37,'000434',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(38,'000435',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(39,'000436',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:50',NULL),(40,'000437',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(41,'000438',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(42,'000439',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(43,'000440',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(44,'000441',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(45,'000442',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(46,'000443',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(47,'000444',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:51',NULL),(48,'000445',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(49,'000446',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(50,'000447',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(51,'000448',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(52,'000449',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(53,'000450',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(54,'000451',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:52',NULL),(55,'000452',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(56,'000453',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(57,'000454',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(58,'000455',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(59,'000456',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(60,'000457',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(61,'000458',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(62,'000459',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(63,'000460',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(64,'000461',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(65,'000462',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:53',NULL),(66,'000463',1,NULL,2,1,1,1,209.00,1,'2013-08-23 03:33:54',NULL),(67,'000464',1,NULL,2,1,1,2,209.00,1,'2013-08-23 03:33:58',NULL),(68,'000465',1,NULL,2,1,2,2,167.20,1,'2013-08-23 03:34:03',NULL),(69,'000466',1,NULL,2,1,1,2,209.00,1,'2013-08-23 03:34:14',NULL),(70,'000467',1,NULL,2,1,2,2,167.20,1,'2013-08-23 03:34:18',NULL),(71,'000468',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:34:59',NULL),(72,'000469',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:35:02',NULL),(73,'000470',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:35:05',NULL),(74,'000471',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:38:38',NULL),(75,'000472',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:38:43',NULL),(76,'000473',1,NULL,2,1,1,2,209.00,1,'2013-08-23 03:38:45',NULL),(77,'000474',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:38:52',NULL),(78,'000475',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:38:55',NULL),(79,'000476',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:38:59',NULL),(80,'000477',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:38:59',NULL),(81,'000478',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(82,'000479',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(83,'000480',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(84,'000481',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(85,'000482',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(86,'000483',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(87,'000484',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(88,'000485',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(89,'000486',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:00',NULL),(90,'000487',2,NULL,2,2,2,1,167.20,1,'2013-08-23 03:39:01',NULL),(91,'000488',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:39:10',NULL),(92,'000489',2,NULL,2,2,1,1,209.00,1,'2013-08-23 03:45:15',NULL),(94,'000492',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 03:58:34',NULL),(95,'000493',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:04:00',NULL),(96,'000494',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:04:56',NULL),(97,'000495',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:04:58',NULL),(98,'000496',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:06:39',NULL),(99,'000497',1,NULL,2,1,1,2,209.00,1,'2013-08-23 04:07:10',NULL),(100,'000498',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:07:18',NULL),(101,'000499',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:08:05',NULL),(102,'000500',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:08:11',NULL),(103,'000501',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:08:32',NULL),(104,'000502',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:09:08',NULL),(105,'000503',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:09:12',NULL),(106,'000504',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:10:08',NULL),(107,'000505',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:10:25',NULL),(108,'000506',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:10:37',NULL),(109,'000507',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:10:59',NULL),(110,'000508',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:11:08',NULL),(111,'000509',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:11:25',NULL),(112,'000510',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:14:42',NULL),(113,'000511',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:14:53',NULL),(114,'000512',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:15:04',NULL),(115,'000513',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:15:18',NULL),(116,'000514',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:16:15',NULL),(117,'000515',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:16:40',NULL),(118,'000516',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:16:44',NULL),(119,'000517',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:17:12',NULL),(120,'000518',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:19:10',NULL),(121,'000519',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:19:15',NULL),(122,'000520',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:19:59',NULL),(123,'000521',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:20:10',NULL),(124,'000522',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:20:11',NULL),(125,'000523',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:20:39',NULL),(126,'000524',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:22:01',NULL),(127,'000525',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:22:06',NULL),(128,'000526',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:22:19',NULL),(129,'000527',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:24:33',NULL),(130,'000528',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:24:39',NULL),(131,'000529',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:13',NULL),(132,'000530',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:13',NULL),(133,'000531',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:13',NULL),(134,'000532',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(135,'000533',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(136,'000534',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(137,'000535',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(138,'000536',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(139,'000537',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(140,'000538',NULL,NULL,NULL,1,2,3,167.20,1,'2013-08-23 04:25:14',NULL),(141,'000539',1,NULL,2,1,1,2,209.00,1,'2013-08-23 04:27:02',NULL),(142,'000540',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:27:04',NULL),(143,'000541',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:29:43',NULL),(144,'000542',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:30:42',NULL),(145,'000543',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:31:25',NULL),(146,'000544',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:31:47',NULL),(147,'000545',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:31:51',NULL),(148,'000546',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:32:17',NULL),(149,'000547',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:33:26',NULL),(150,'000548',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:34:07',NULL),(151,'000549',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:34:14',NULL),(152,'000550',2,NULL,2,2,1,1,209.00,1,'2013-08-23 04:35:03',NULL),(153,'000551',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-23 04:35:06',NULL),(154,'000552',1,NULL,2,1,1,2,209.00,1,'2013-08-23 07:40:03',NULL),(155,'000553',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:15',NULL),(156,'000554',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:15',NULL),(157,'000555',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:15',NULL),(158,'000556',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:15',NULL),(159,'000557',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(160,'000558',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(161,'000559',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(162,'000560',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(163,'000561',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(164,'000562',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(165,'000563',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(166,'000564',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(167,'000565',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:16',NULL),(168,'000566',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(169,'000567',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(170,'000568',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(171,'000569',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(172,'000570',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(173,'000571',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(174,'000572',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(175,'000573',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(176,'000574',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(177,'000575',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(178,'000576',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:17',NULL),(179,'000577',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(180,'000578',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(181,'000579',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(182,'000580',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(183,'000581',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(184,'000582',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(185,'000583',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(186,'000584',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:18',NULL),(187,'000585',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(188,'000586',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(189,'000587',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(190,'000588',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(191,'000589',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(192,'000590',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(193,'000591',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(194,'000592',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(195,'000593',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:19',NULL),(196,'000594',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(197,'000595',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(198,'000596',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(199,'000597',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(200,'000598',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(201,'000599',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(202,'000600',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(203,'000601',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(204,'000602',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:20',NULL),(205,'000603',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(206,'000604',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(207,'000605',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(208,'000606',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(209,'000607',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(210,'000608',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(211,'000609',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(212,'000610',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(213,'000611',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(214,'000612',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:21',NULL),(215,'000613',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:22',NULL),(216,'000614',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:22',NULL),(217,'000615',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:22',NULL),(218,'000616',2,NULL,2,2,1,1,209.00,1,'2013-08-23 07:40:22',NULL),(219,'000617',3,NULL,1,2,1,2,209.00,1,'2013-08-23 07:40:25',NULL),(220,'000618',3,NULL,1,1,1,3,209.00,1,'2013-08-23 07:40:35',NULL),(221,'000619',NULL,NULL,NULL,1,1,3,209.00,1,'2013-08-27 18:42:58',NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2013-08-27 08:35:46','2013-08-28 02:19:03',1,1),(2,'demo','fe01ce2a7fbac8fafaed7c982a04e229','demo@example.com','099f825543f7850cc038b90aaff39fac','2013-08-27 08:35:46','0000-00-00 00:00:00',0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-28 11:35:33
