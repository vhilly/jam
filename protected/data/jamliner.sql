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
INSERT INTO `jammers` VALUES (1,'enteng','kabisote','1990-02-05','2013-08-27','2014-08-27','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0(\0\0\0v���\0\0\0�zTXtRaw profile type exif\0\0x�U��\r1D�T�`�|ʉV�R:H���F־�F�3t~?�&� �^��XY��!y����{.��	�&�\n^l�������~�E�������gD���ڒ>hi��#���A�,#�L5;\0\0	�iTXtXML:com.adobe.xmp\0\0\0\0\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"XMP Core 4.4.0-Exiv2\">\n <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n  <rdf:Description rdf:about=\"\"\n    xmlns:exif=\"http://ns.adobe.com/exif/1.0/\"\n    xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\"\n   exif:PixelXDimension=\"640\"\n   exif:PixelYDimension=\"552\"\n   tiff:ImageWidth=\"1\"\n   tiff:ImageHeight=\"552\"/>\n </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                           \n<?xpacket end=\"w\"?>bH\0\0\0sBIT��O�\0\0 \0IDATx��w|��ǟ�Wջd˒�&˽ኋ�qÀ�M5�%��N�7�� JB	$@��6c�m�m�{�lٖ�r��tm���ǞN\'��tn���s����ٙgf��gfv&e�tJ�5�()�s� � g�WM�^DQ��S)р��z\0���{vc�ЭL+)��`�(�a��bbN��n��sǔ8���)e��[Ok$���̏j��fbb�ô��2LL�j�Q��ڡ�C��;k��\Zb*&�.�6�\0����k%��\Z[���јSF>��s7�4V+Ĝ2�-m�u[�q�,i�ߴu�ܮ!F�ݸ��D�zӶ$n�Ψ�g����w|���N��WM�$�I0����JLL�{A9���:�_1�I�wY/[]BB<ZAA�\rNgK���@A�s_玏��q��RJ(�(�X�&0C)�\0��1\r�0��&�Q�\Z�`9�e�eYJi�&A�!>>���*�W\'��j���Ԑ@�cx�x��J)J)@)PJTU\'�N!��ò,�q���2\0@��PJ`���G�,�q,�0���T�˲Fy���1-~���QMSU�r�$�x	 ��?8V�W����~yFA���.	�t����;���T���e&���|�!�0�RM�dE�ҥKvvVrrJbbBm���>u��رc�(��0\rx�\rGi�,+YYY]�6���v:�9r��IIA8���.�m�nM�ǵ��T��̾C\ns�U�����8M�ɛ��Y�%�-�n��ykS�i�5�g�N��?��`A��׹s�(���/!����?���d[x�S�o�h�M�$+ibn��U���r4<$@)UT�����=zt���X��e� �			���sr:?qBQU�eJ�(UUY���ұEE�m6�r���g��뒕�u��IYQ9�5���G�8�j�~?&�͂M��g�)I��iT���K�t��?��+�nͷ[�Y\r��E�4�?�nv/��5�}��c�R��t���Λx�΀�~G����W91��M5�?�ο�7cP�w�[�3 ��R[]���u^���f�j��\n��hu��;\\N��G����\\�p�!hB��j����B3UUg}�4���q��Y��R�x�g 4]�D��&r<�v�)PJ�)�0�Xm��\'MZ��[MWy^`Y�4M�8��&����)Pc�9x�=�v�e�}��ESE���4��w⌗�63�?~��o\\vKƂ)U\\ڀ?�}GO����?,r��<%u����$���N@�!]L��µ��T�@�/^}x�	�۞���=�$��~�K��2����s�5��F/^�����.f�S���k�z���=����>}�o>��+@�G�<�U�d��Z�7��W���K��凕6+�\"� ��+������.)�=5�����L��d߱�(�q\0\0���r�Q�j>�FC`\Z�4U�#�.[�=�r���E�Ǎ˲���\"�	�0j�%�Q�p��\0\0�z�O!:�\0�p�d6�$C�.�n���\0�r����4�v��tyySR��UܞzY\'F�`��M\\�S3�(�.��[�Q�K��f��G,\0%����k\Z�\0˱��l77��Hfy�����o\Zp����,��D\Zp��\0p�˷~��;�Q�G|u.�If���7%����T����l��aW$\'\Z��m<ۖ5cV�o���X�e�k&%\0�g\'	�i\0�!gM��a9��-lqf�\r�\"g���9B���=~�b\'�\'���@�{������3�iԫ:�\0P�U�}ja��Hp��k�,����3l	�3m�9��U]���2�L^��p�!�\Z��`�dfFU5�ْ��UUQ)r���6������+5MkV��\'��jUYY����!�׎�|)�yb��x�PkJ�-|�U���%�&��������0���_����<��\0(���GWzy1����3�K���W���ٛ�npҦ\'n���>���\'\r�]�-�=�:9|18��^���ԛfO�5�*�U�X��k�T\nAEdEK���]r�S�s�����Wv�\\3w�	�����*�����#/n��_�(���tÂw�XQ&�xt�[�6��.�Ϫ5G�~������mK���,Mnlh�KMu��K�?LC����K�Ѳg��a���)V��T��b�i?�q��\\�8����w�WI&.\\[����Y��oܧ�7l&�_N��#�/l�$VQ샯���Aݺ�Z9\0��e����&�\Z� HaB�\0��_�j�<.��DS+��s[N쮬#��������\nY7vi��T��锂��̬L�ϧ���j��j��i���ׂ�}>_VV��딂��YY~���\0\'�/.g|&N�󼪪�������,]ӣ���ԣWh|����x�!�����w鼇n)�E����{��~&���ܡZ�$���h��YS�<]�%��[R��Σ�)��ػ~uE�_%M�m\Z������>����߬!]���\n�&�g�\r�JUZ/�����\r^\0Ӏ[g��v�4\0���?>D%h�x�u��:����{�^�(^�����~���x(I]����ǯL�ݚa��%@4\0��:4�K�=�\0�[�4}jZ/��OJ�+\0\0�$+K7���裳�ڈ�%���&������pm��eK�\"�\'R&z䶎bd=b�d�OS���j�@�50�N��B,�?��~�~��qٰ���]�db��K	����G�_�ܗ����ű�����øH}-\0��X�D���D�Y��\"7���-:�0��Y-J@�n�ZE	����GtK�\0@�u��B	�፨���>�ȿ�&N}�[��tf�a�sRY\0(y���Rgy�n\r�/V|���?=���gD �^��	�x�5i�O��ܻw�\'�\\m�jQ��G�ɣ��Y�£/���tݟ����P���0oѶ������,L*�u\0��}k��b2�ы�Z��G�}$��\'����e��N��#��17LH�m~�]U�1����v�4��>���E\Zi�f��\'\0��Q�hm�3�+\0@ɗ��93{��>��w�h�O��qD�5��h�}�M�N}��\'>;������6(~����ma��͜f�$|&V�\n�0�&Ǎl=�?<��*k2�Y��x/� �����Z�jH)\0gU�z��>o��~㈾�I��	\n���Ɣ-�0��Y�nc˼G�f$�L��J�1|_Cq�4�� �$q�ư����y����?P���d+G�|�f��I�y���r��~�͆j�\n��Mv�����3�p������\"K��~G,j�b�:��+\0�{�����6�/+�޵o�=�Ϸ��\0ȑ�\\��f���Z<F���B�DK���:�]�\0������������C�\\���E��n:��\0ؽU^�6��Ɯh\0��t÷?L��K�̾n��+��~��� ^�YY*\'��k��׵��%d\'\n���m�����GȄ\'�v�>;�%����� �8��R�a�z�,������Ҳ���]?����{���x��aY���0�2���~Ju\0`v��1��oPE(��G(a\0|^��+�a�~�x*�e�f�oßvB��,/�j]���a]�\0�aX{��G�|��+�(.�2tڽC�>�����IX����PUa��q���^���e��+n�ؙie���Zhx9\n�DτE��/v��M}�����T�c)@�IC�D��W��A\"�btשZ\0���E��xk��\0@�����r��I9��;�/�\"\0���@c�c�7�*\Z�������L���������>��	�t�^�F�-��4\r� H;�4*܇�,���S DW��t�^����!�3�G.��~��Z���Rr�-��,[[��ub��z�^������~�����躦k������8\0�eٺ:�q���\0��[�e\\\0T�tM�t��չX��V��O�P���ڱ�o���۟��\02.��*^�\0I�Y����<\Zј��4\0J��dѪ������7T\'\0`NM�t]o����(z�\n\00��<,�2��$���D��0��ƣ�:(�#/�I�S�K�T4uH�\\�g��P\0\0ډ=�z�]U\Z�3�;7o^��+�,m,aL�f\0P}\n%\'�/<j�n�|���^\0@�3���e\0\06Kņ�����w?�`��o����X\Z�-��ܘJ#emeT#�z�R��?�i���UЄ������\nT�\0�b��[ܳ�R�V9���t�TYB5/\0\0\'���D����|uu��j�u�a��5��0��x�$!�����J��Ų��aæfE�4�j��BC�4�J���U5m΋O������|Z\0�enP�?���x�m�&�V���O.qC�-o��Ϗ>�5�\Z�,�8\\C�������g��&?_8�89�rUk?�6����w=��]�*C�:ڔR�p�6B�\"γ�k��˧�~|�ໟ�����Y��/vȂ(G��l��[�\r���c?�z��*�-X�bf@�i�q�k>^:xf�k��#�կ\0Hv��k>Zw��#l}n~��U������/��N׿Т-����m�Q�\n�ɋ�\"�u#3,�1C|F�\rAk:Da�����0,є,��2c�WwVw�u	�j� nqӕn�f\0��Ś���I!�p:g���R���D���,[S�t��Z,6`����~ǲ,c��B	!^��e���v��Ҫ[{pi`�s��W�����䦥����\'���W^�t׵{%�-����<G~��{�m��e��\0\0�UV���\"W��w�>cd��R9��Ϙ�AA0y7���^1�_�Mw��=t��R\Znȝ��ɊL��E���	����|���\'��dc���}��7\'9ϒ�$A9������J��ws\\C_\"�Zl&\0\0UV)p=�ɟ#� �F�TY�D�ı�ۿ�l��	��&\nK�%�	/�ηl�Mn�K���L�Lx��L{�,��2�!hA~̨��DQ����x�����tOU�FEX^p1¯O���U�/��(:!]�v1����4\Z߭��D�G��x^$�e�����y���Q\0@���=z�a9&�?���n�O��$��2�xܲF�b2�˲[&��qVt���ub����E�,�,\0��ߧ*����bx\0]Q|jø2,�KfAd��ߧ)$���5�Ɇ���\\By�]����(#fO��7we����2���#����X�]\n���Ń�\'5\\WUQ��n��B���������ʚ,��V+��ݪ�d35/2%�zYF�Jf�1r��ʰ�h�$¶��\"e���9�A~�\0�AUU��q�A�D��\0�m���]q�h�$)8�K�eY������BCV,���z��Os+�L��V�PE�u�dee��� ����~��)B� ��wĠ�T�Y�<��������\0P���^Tˈ,���� HG���9�e[y����(i,��-�P@b�����ݫ��[?��s&K0��\ZS��8`hmM�,+�P�c)\0!���u8j�(H�$cG�@kjj5MX�%%~��u�>]����w�@��-�{�.�qqV�������Ƣ��/NF##ґ<`��bI�<���+��	�,˰,\'� L�x�`̓�h��j:�Q�Y�x��5�}B)p�U�T�B)1��<\'��	�u\n�#��\r��_Sub�o��QD�+\ZA��C+��BQ�at���fs�¨���0�R�e(�J�D�?<Fj�^��[E\'��$�\'K)\0%:UQra:�F��O�z42� O�c��C)%DQ����CA~��Z� � ��F; � �y`T`A9��z�4� ��KX4� ��\0#� \n0� � (�� �� � \n0� ��\0#� �� � (�� ��\0w��c�-�;���W<3��\\�*F�RE�{���! �_�cl�D�a��/{v���uAP���\0u�}�K����;{����߶\'���+;	\0\0hu\'H�t	� ?Ix4ײ{n��V���rjg���{��\"Wv*�� �#!C���_����%pØ��^���r�!���ޯ�\Z���2�0bJ�17?��b�p���t�_��TN.yf�nɂ���Z8���y�\\�0v�zz�+w]V�*2��w=�+N���i5�R����Fu�1#�����;;]�qo�r��(3�2��`�M��\\�Z<>ƪ!r�1j�0���q�hϱ�?�4K�/zr��RJ��^)���7�?�5�d�|�V���0�X�_=�D+������|���\\-7�G�3#�E&�~��Z��%PJ޼�y�ϯV�\Z�[+g;\Z�xU����\'��ب�������v��M��x{�����g�*\0\0]Xz������\0*�}�=�+���^1ô���S��O�<�V5�u�ۇ�\0��=��=��.r���\'߻��\0��w}������U�\0\'���W��1%8��w�w\0@�]�8��PO\0���r�_v�C9��(��������[�����3m	=f>zoc[���\n�Vw�i��������޷~Vcܕ~�o�u=R�\'QJ=+~=v/��S���W���U����N��\n\0�4��gg�J��\r��ǧ\\z����cIP�����\0\0}�}xj~R�>2\0\0�|��9�r��� ��\\\0�,��\n����W�\0���9\0\0���M����O���O�V���#�mo?2�WR�Kf�������+>����L��!\Zz,!�_˜պ4�wd�a�[�q=��u�g���}`b���)�ʃ��t��o�dl8���C9�HEA>��J��ڂ%���Ĝȇ��;�v�I�v,z�7������2-|n�g����W|�t�S�|��a�oN^�è7U��$�9�ui{]%M<`�#p;!�Mᮋ����*�z�z�lO��P5A:�\03!?��ƒ��kw%Ƕ�7��o|{ó�����Sd	\r������;����Ͽm�\0\09�������0,Uh׳�����5�O�8Pa|��۹3^կ��|�{8KR���T��0n5kN0�F�WI�.�X931�r��Qb�\Z� C��BEϸ���.^���ŷ>���������-06��{Z\0�\r�\ZV�U[:_���\0�\'����ibG��i|;������R�Ք�#K���_��su��P]�X[�*�h��������G�9����@��=?i�/}w�GcH`���HP�]6�-A��C��0p$����]+����g�%$\Z�?t3,�|͛�ke�u�,0��yHg	�5\'���UJ+�+�DL�xi����Zyr�s�x�X ;�����B�i��������YVAJ(�����ƶ!�N���P]����uӻ^~n���j�������L��+�\Z�\0���_������v����!%����c\0P��C/�=�<��d�\\}�ޯ�P�V�����j�\\���9�������}��7�g���K�p�������K���#�n��F)UK^r�6��rݿ�������w����SR�����k,��w?�J�P]���%��f9�����d��ee�1�Vxv=?��\"A���\ZK9[K�\Z1T\r�F��p��HNm쫥~�D�����?����iÿ~9�O���2���nzf���^��\0�{��o�64�\0�d�\'���ᯗ>yUQ\"\0��1p�����c7\0��w���)��m7�����i�=�\ZT���6��Z��s��bχ/{��!�\"\0�-w��?|�񟣛{������ɏ\0`\n��{��-�OKecL`)zhɾ����-I\0\0&�ۄ���Ú�G�11���-��j�\\x0�F[�fC��ϐ�[�r@8��؏�>Ԍ��v� @��\r:�ڎ<��ot]��G=!�h���8tQUp�5x��̅m�%���v� H3TU}�g~����Z�`��hs8°r�leV,��)�V3A�F�����_�<��O$$$�,��A~�� �O�U�V\r>�l6?��qqq��rQ0��r����_�r�Q�,˃>h��Q�=`A�:�����k���cǎ5��w�}��fC\rF`A�.��qׯ_�%K�L�8�d2�v�m6�\rU@`Aή��:��C�]�h�ԩSM&Ӎ7�h�ZQ�A����<��<\0�\Z5��>�9s��d�5k��bA\rF`AΖl�B\Z\\\\\\�����p�\r�R̃\0\0 \0IDAT$]q���r^�UrQx��(tp�ԩS_������o����������8��\\$p�	�Y�f����o����߄	$IB?AP�9��e�~��=z������Ν��_:4����\0#r0�_�ñv��y���~����/~���x��DQ4���B-���;�Q��\"��O�:5s�L��9cƌ;��\'��y~���ƓH� ����B�s	�0�txN�<9cƌ�}�����W^�$��{�}���)�v�=..�l6㋱��̸b�����!�x<6�-##c�ȑ?���}>߼y�>̲lnn��[\\\\l6��P�0� g�.�a����瞁�7�������n�߿��5k|>>�� ��F�}�Ͳ�=���ɓ�v횐�@)���~w�UW�Z�jϞ=3g��G��|����{�5���QxРA���FB�e333�v������ǧ����g9?0A#H�`#�Q�ӕ$i�ĉ#F�`�j�\n��VB`A�0���\"I�$Ih9���8� � �A�9��AA�� ��#� \n0�tT�&k����|U\n��{v���;\0�.�~��*�E�^߽��ǴpI��K����gjyx��kM��˫��P�z��6aе��~��V0��~���9g���(x�Vߎ�E�Ttc\Z	���[Pz��g��_�ٞ���{�C��Sg�7�͓��)\0���O���_���M�+��~����T\0 U�<���W�P~�6����vŌ�3��zz��:r�+�y�Q�Y��+(��R���	c�;��p�[9{�{�z;\n0r�1����o�y��޿�����/2�ڵ�\\U��0W8�ս�@r�������0L�\r7�R����;K�6���3~c,=\'w/���\0�}q��^���j���er�~�o�|d��7d3�0�nS���J��1��u��{���5�����b��#R[�Y�=: >p�������wpr�G��k�W|�Ȩ4��<�;�is�!��P#ly���n���+�w~eBo���_��J����ONj�lZ�&�gަy�<��#��=�O\0e��}z����k�J�h�&�G�l�E/ml�𽥱	�~�ǫ�����OKO~y���Њ�(j���^Z����`��O�U\0@��d��o��:�w��?�v]�5u��_�k���6\\1��&};R!����\nZ������~m��\"G��ʍ��4���eZ�\ru���_?H��>��Ofv-~u�k�����N)��m��=��C�rݞק&&����R���������%��N�L��I)q|9�`��w:�Ν_0�K������]F����w��P����~��QF\ZR��˟���{�x��?_VG)u~5I���_u�{����6y#l���,t���Cu���;������*��n�&����L�_�UQ�ւU 5�o�9���N���f�4����)Ol���ߟ�6�ϛ�-�;������9�{�\n��3x����_v��a��G^�����&Mِ�e��7\\�!�:[BScF�Y����1�p%	͊��[?�[�>����.�n{b�gHE�5�MZ�$L�շ�{�J���~�o��iZ������?���!7,�!zl�WA��9�ڭ2�,\\�l<]���N��f��H��֞��/�+�6����\0�;�PF���< ���W���rE:\0`�����^W`�\n��[D��Ɲ����_Q`7w�z}�(k\0���Ɇ��3\n���+�$��h�\'���pi�/�~[R��5����o���ݻ&I�!WO7-�p���c�0�������+�;y�����\0�A����8Kc�}{>^�<�Ɓ)��f���ޖ�g\0K�u�Ӓ���޻�u�3�����v����mi6�uo���h:��E�:ϻ�n�?���c�9�e~[��y6��{Υ�ϖ�+�V9tV�%l���T�6j�����M�^�X��%\0k��~M�kn�|G�ۦw��H��F�I˒����w�����z͆����#u��l{?�Ĝ��N��5��h�7B���*���6�l���dQ�s��=��د���{���u����������v\Z�����;B����7�������ʵo���k��,�u�꺆�S..����K�+w��n�Y�$oe�ac�1����j�Y�k���>���\Z�u�:�bv\n�0�|Ͳ�%@,��÷g����Ƀ;�\rxt]��\0�=�Y�՚c.s��\0!9/Y�|v\0�l)֦�o5�I��h�\0@H�On�f��{Ö\'F����^KF����e~[��y��־׏��h��5�3g�=�=U�J�m��J��l�e/��$�\'�$�\0\0��q�dk�8�-�\Z�&�J�2��k��t�ɭ_�|]?k���x�&uI\0��L}�K�Р�_���`�VKn�������!s1�{�\0�5Y�/�h���9`��6&,����g&]�6}�]�����!!U�ǿ��2lZ�L\0@�8d[f<ac$l��{��w��M�kg�^z�؏�������\0���_�p��-���W��o�\'����+|��{ڥ�V[Z�E;{�Å��q~�eӜ\'�Z[��n�0\ZcM2�����=E�{�\n�̳%��79���_����K#�Bj$)lõ���M�(M�J\0��Q\"<�-jT�4/I���K�����^�[tݠ�hݯa������\0@���GjИ�q�=Vw���\\#m��1���Emå!s�yʩ�r��v\n9��\'6�Ə�<i∌Co���e���a�_-;�V�����z��BK���V��I�/O^�ƺ��C���Z4{��p����|mJf�?�S\0�[�=�}.>)5��՟��\"l{x����~Lͻ�os��.|��]^���n.�n��Ow��[��;=m��=��z*j���h�9�G�{_�=�⾂�{6z#ѓ\rW��y�</��P����׌Nac�Na�(�y����$?��h�M���������3�r�����)e����=nϱ�����c�pH�ݸ��K�����/�ˋ�<��P�l64n�ncoo���~)�g��.:�v�����������P�\0�p��>�����Ί+��I��}mQ|��)/=���إ��>��ߧ$36F|�Oȹtt:$\r�E\n��/�.4�	C��ֽ=E\0S��{����OM]nXs����ac��×?~�s��\\8)-����ha�v��g_�����I�g�ho����i.�jȡ�^�M��J.k�˿��K�NW|_��oY\"�,-+�2ϖ�&����3\'d�a�)l3��u�3�Thؒ���-6	��9��~	#o\Z��@�/~��/��3�?=^�˸x&�!�w��=6~�^�l�\r],��J�n�=rj�ƭ��-c��v��/%\0�������qi���1q�.C]\00}�O�귨VH�*��o�t���WW\\��j�m��_�폽E���F݂q]^��XGx(��x􀑟8ʡ���0��z�3�xc�o4\\��r�w��YOT\Z�	r~=࿿��/�{\r� � ���ǐA��0.�B~���C��M�:��I��>��ߍ��|��jԚH\\1O.�S�L��� �R���Dq=�~~c9gnS���.��ݾxcv��_��܄ኽ1V\n0���	�<9��j.� 91�9�1����`�8�����[^�+_`�����~��v�ҟ���w�|)��)|�V��n�\0#g�p�h���H��w�@=-N\Z�$$�k��%�D�iZ�V��\Z�\'��CQC�D�[�H,͂�D	�s.b�b�0BҀko�Y������^�ᭂF�KF+w�\\�.HQ���S�G�0��t	G���R�`\\´%��o̷$]�F��Z	��v+��\\����F[����!nR�P�.�>x�J�\'O�X4-c�D��,jMˠ:1����$��:�FAi/%z��#E��n�\"��)��ًA���B�޲�ύM���}rk	_���[��C������)�`;�%�S��a�w��s��>�^�1� j5�V��\Zԫy�9�Y��Z\rA���T�|ECB�#)M˘!�66��iT\'�p7����5�N,q�Z&0Q����Љn��Qeb�9g-Q�Ⴢ8��2�a����x7�o����ZE�M�Zh唾�n�=��93x��a�w��s��>�^�1� �ւn��Jm�x�\Z��O7`Ն�m����A�cH��hZ������j��:1���ϧ��ub�Ԓ�g�=�Pk!t��-zT�c��Y�A�j��s���U���E[�WaF�H�2�)�U;Z9��M1�9g��>l�Vs�\Z�\'�k3�D�ZЭ�Y��oC��Y�h5(�ajw���#)M˘!�66�ZՉ1�Ml�|i�ĴiK>M&/��*1�!t��-zT�cδ�J1� j-|Pl��H�2�)�UD;�/p�`�h���!�=?�R�1^P��[�R�.ް�\nҬo���1T%AF�B�X4-c�D��|вEP���h�$�x>�cڴ).P~dġP��-l$��q~L��3��G��^ͰehGx���s\"):S�vΒ��_�a�w��pRя���0��f�[)z�5�g�H}#�u.ԅ\np� Rࣖ1C\"ml~��\"�N�S��y{<��1m�(����\"51rd����\ZL��qZ�H�����̰��1��*|��A��T���d��f��]�6�����V�뇱�4��Jћ/���*R�{]��uA��G��\"�I�5��6\"�3&r�Q+��۩��r�����cr�������0TG��#r��!�a�3b��7��>z����c[#� ȹ=`AAF~:`<A`�Ӧ�5� \n0rf8_�aAP�����eD���B�\\P�FAP���9=��?�ܾ���K����->\0Z���w�����_�l��{�]\\c�׺��sr��r����-}�ǶOx��S�ިoo��ҀĮ�˚�_U:��q�C}[v�7~Ɗ�s�+f�9�=����=^o�W7���w+���}�\n����o���yAP�;*�&�O�S�%�\n� �\0>�!871�iD����R?�����XAA��P���?-\"�\0�9�\n� �܁8�1�E9#�~AP����|6c���({��vD�A��wA#MŲ�K�[1#m� �0� �t8p4B���3�� �#� \n0� � (�� �� � \n0� ��\0#� �� � (�� �� � \n0� ��\0#� �� � (�� ��\0#� \n0� � (�� �� � (�� ��\0#� \n0� � (�� �� � \n0� ��\0#� �� � (�� �� � \n0� ��\0#� �� � (�� ��\0#� \n0� � (�� �� � (�� ��\0#� \n0� � (�� �� � \n0� ��\0#� �� � (�� ��&@A`AAFAAAP�Ai?<���SYYYUU��\\jrJJJ\n\ZAA>��\\�իWo߱���\0RS�z��1z�贴44� �|V�������شIQQ���@II�ѣG�O�޳gO4� �Ϙ�k�/\0���(��\0v����\'�?~�� ��\0�I4M1F�����d�gfv�3~��X^Z�r�JY��V� \n�c��ݫW�6�^EQz��q��7�>��1�G��ݽ���m� ��\0�!��4���˖-+�(�:�3+=s�5����;77w���yyy�0W�:��ك&EApV4M;~�xii���v��S�N<χM�q��\Z��		�&O�޽;!����8d������4M�� �|���z׬Y����յ\0E19#�a���w�ԉe��?~|���ԯ��5r�a�B]�Ν;K�\0�������l6\0�e�������洴4TeA����7~��\'�G�E9~�@yi���.;z���A��4mӦM�%F���	&X,Mӂ�	��������߾}���G�.{B\\�޽�����\n#��\0_����-_�>��uN��dE\0(/-���J��U\\\\,I���nߺ=��������f�ƺ�_��M�f�5\0���-))9t���ٳsss�	A.pV8P^ZbL芢8r�Ȝ�DEQ��Tn�g��_�[�.��\Z:�(J׼�#G��y^UePA�u \0TTT9�R�t}���,���\0v����_TWWc ��|�!��C�A����]}��uuu�6mڰqCMM�(�n�{��%�����_\0_<>##�x�Wgu\0Щ����$�O������)DQ�٬n�\0DQܽgϚ�k�M����� (�^��\'+�wQ{��e���v{jjjzz���\r��u�_�\0G�����w@߾}�=��q\\MM͡�\'[��xS���˗/ߺm���[v�:dHVV�� \n�E���s׻����j��$I�\r���Y�p��w��\r��\ZRj�X.�/%%EU�&���]�v���7���Ms�)((`Y�j��.;]VQ.�����S\'O�\0#�\\�p�w8�j7�͆#�i�$I����J�N_\0 +=�_�~<��!�p���u���շG�?�en��ݍ-999������OcC ��\0_\\����=N��YUUSSS�JJ�������B֮]{���P�WQ�>EE7�pCNN��i��Q�㒓����>_,��BAP�;�i\Z޹ah�$I�����٬������,|����Ǐoڸ�Y�>EE�]w]nn�,�@PA�P���l2����A�������r��B�X�FW��\0PXT����:�\"�(�ڵk�iݠ�&%%N�>=\'\'\'�R�j�biͯUT5>}��F���������7z䈾}�^$Ƅ��j�K#�eY��B���Ī�f��L&���(��t����۶����f�{�ܞ=�)9�\0]�%I:�8U~\"�R�f�&&&b�D��=��Ғ-�7���mڴ�\"����l��8\0�y�~կ��!�\\\0��{%�w�v���y�߳b媚���l��1�o߾^o`��X�e,�ڶ}{u��P��Դ���� �\0�(�55��Xp�ĉ��V5���������܊�XXX���Ϣ(�رc���k�.6lԨQ��4�P���G�nX۸R��~)))�)A.Z[6�;�y�斁�:�\0��\0\0f�EQcf���8����,+o�g%+=�k׮A_�O���ٰaCh �=z\\v�e\0`���i,�B,���Z����T��f���޳gOMM��i��ٹ���K�A��H�\Z�y���ѣG���.��I��k��Bo8X����\rN�@aQajj�!��s�}�v#6��&))q�)qqq�,�\0@�y^Q����:�W6	��K�:���R���?eʔ8\\�� �!��H;F����l��:�eee�����*G��/�O��X�---\rN��l�nݺI�\\�����ӧWo�:F=e򔂂����x��4m��-[:\\]�8p�`0NCu��e˾����\'�A��/�YYYY�w�������ۢ����\0�Œ��f�	\08��n��-[�T%�K���\\C}%I2�S�_����������\r<XUU���)?x���_/^�%y���j��={�`7E��X�����8:�\0k�VVVf����MMI��l��o�g�N���5����nݻ���h��}��-[��,����E�OYc�x�ر\"ϫ�JX��Nu�Z7n\\��׆��Lz +=s��!)��~�\Z�ۼy3:�� >�\0���E�UW�i\nϋ�N�s���Wj�X�t�b�p6�ܤ������:u��wo��ҧ���E�U***�[�l��W^1�O�>{��Ujjm6ۤɓRSS�~���p,�nٲe��U���		ͤ7))�a�8055uӦM��DE���.=#\r;+� �E!��%7x�\0���E���o߾S�NN���\0��u�d2���(�ҩS�I�&	���zA(..���K�[��?^�\'�ٓ�&O�X,ݺuSU�`X�5°`2�<�����Ԇ�o�ә��ֿ_��#G���c�=z�HIL6H���jG\n0� ��\"�<�_<��].���;�n�(�>�7� ߈�\\c��z^~�ɗ_�z�j��4y�dccBB¤I�z��t��u��g�gfff���ɲ�h\Zϲ@X\00�L\'O��b�7�N�j����p�\0\0 \0IDATv��:i�>}�X,Y�UU5^�!�㠢<x3�=A����^I����[���}��3*��0�?A�U�b��?��W᢯�޾}��F���*����;gΜ[����?�xݺu���\0\Z!���UUU_~������kd>b��n�iРAǹ���;�++N	��B�\"A��|1���voٺ-��\Z<��[���\n�c5�$IӦM�����Ï���sss�A1bDff�7�|�����c�ȑV�\0j�j��z�ݻC_��6a���������~c���xVU�m�w��q6�\r{*� �E�{=�t0�?���~��5[,�������P_]�eYNHH�:e�`�+--\r�VU���v����k�3z�?��s��!��e˶l�$�b�	����+g�6l� .�K�4\n�\0\0����ٳ}G@�EQ�[Ի�7� z�M�xAE�5���4m׮]n�\0|^oϾ�L�O4�$�rNNμ��Hf�,ˡ{�N�^��b�>}zFF�׋����٩I�����c��ѝ;wn�p\'&Q,))Y�x�asEQ������s�L�#��\0\0�B�^���N�pT�9zTQ\"��ˠ���7G�\rA�SJ4\r\0�����Z��@@�}^?ǳC�IL�_�dٺ��\r��OYC�z�6lX\\\\���D��2�7Y��#G��~����O�8�m����A�`^E1��]�r��������*�U�II��\n\nX�����%��`<bDi��b<wD)���Z�m��E�Đ>}�\r<P�$��eYV��� p���w�ڵa㆚�Z��&�\\2l�СC��\"�\\tl6��Ii55DQ����qTgeeu4��P��z������d�ѧz���A׶YPdc�6t�\Z\0��TFb�ϗ��<c��u))^�7))�S�N����G�9��t\0�\0�ԩS�7o>p� 4�KQ�ÇO�2�!!�\\������w\0\0�nOY����E)(�,�\'N�0�)����b�XE!� �j\Z\\�\0:�TU�8���Ȱ�ӄ]Uu\0{\\�رcG}}�����yU�)0<�z<�ݻwoݶ5��\Z\Z<tȐ���\Z�A.F�4-..� ?o���O�cǎ!C�t������ֹ�Grm6��mУm��\Z\ZL�C��i��C5�\0� $�\0�6kP���ڨ�qm߱���$4~pRR����ƍ�X,�;A.F�u�g��={�lV�?+9vl���Ç�H�����fC/�-\r�`�h�/]U5M3�T�4�ɤk��6��u=�-�\'�rv����\0APU�СC{��5�}�M�8����=#�\\�\0\Z�rrr��jj6��ƍ{���a�b�.uE�j����h\Z\0�\0�Q	1�5�����67HoЁn�s\0�?~�ĉnݻ����{����>c���<dؐ���w�A��l<3z�];wjq�С\r6w���&���>_kߐE�Nh�gl��F�б���/Ǻ\\��c�U���l����7a옞�\n��EA�cE����`�A˖-3V*�޸����c,�n��Q}}�����\Z����/��T�P�4�e٠�+�2�qA��u�]��(������ $��f;vܨ�#q�� \np\0E�\0@�dI�F��s�.��L�%?l�4m���I�$�̆\"�ݞ��\Z�œƫ%\rA5����䠦�ʊ4J�ِ^B�5�����\rk�7{�g^^���/�ݻ7>k� rq$��C]�t�ҿ_?��\0��lٹ����T^Ŝ�LóW���������D�T�]QUUu]�t��ZP}\r�UUUUՠ�\Zh:	��\Z�GYClA�cF��y޼���\"���\\��/��I�4r�����Ғ}�������g�y�OKK>Tr�pY��Y�-_�TS��\0���7sy�vH��S`\0�������:}�СCQzA�OХ�e977w����vEQv���v�;@�����vcp���vǎ>�O�TE�+�_�TY����N��b�k�7\0h����W�	\0��n<.\\WW�.<dؐ�Ç��\"��\0GT���,�%%%\ZZU~�d��c��C�\r1�SQ<�m�M\'�Q`e�ˊ!��x���XM�U�67~t=�%���rT9��������� H�cȁyMM������66V�:-i����<�<8%1��PEپc����:�B�c�|>��\"��S���i]�[���S��kF��촴4�v� H4����\0!��H�ԭ{�`��\':�(t�N��N����hx����ڹc�w�ؼ�����WNB�C�� <ר���W:Q5=T����:z�h�\\�rs233��!� �_E��:(B�(�ٙ6�-�<҉������X�5�;�� ,;|�p��7��j\0PVQ^]�8 �ݻu�ԩ������A�h\n>��l$904���U����`|���o߾��gA$�\07�C	(�b��O�ȮڹME����y�:ս�&R��3�iz��*9��ҴR\0���u4�HgK�&��M$���/��y��K/a��%\'kjM	.�޽g���~�oOJ��Ȉ4}k�� ��i=z��C�����\n{��}A�&�F��h���l�3	���9c�i\nUD)��c��uB��:�=p�ⳀXf��̞J\0PM�qzj��+�t�)�R ����ΐޅ39>�^�$I���pl~Kp���?eY5��Pu�#�sޠ���fs�J�������ѣGw��\\���9o	��AiE������w���<���w?o��H���I����,ْmٱ�v<��O�d���l��5�U��l�V�n�T��2���*�I�S;�8�:�۱#��%��&%K\")� H<\Z@�����?N�E���I���S0ݸ�}�ѺU����;�#�+zB���fS�).�}�p�C�E!]���.����f��Z>����VFw܈_̬\"����H�&ɇq���U�0��������߹,;u�#��7��\Z��Z[�r��$LS�e��������ߚ{��_���4��>233CAq\r�-o[�]۱O�	��ކ;�u�ڕ�����\\<�g��q���e#CmC�e r����i��$��3=k�T�>\"��k�g�����L���?p�~\0�7���D̐���Z-W��-�\r����o�u�ʕؾ\0�|��x��r� ��u]lފ �i N�oc=+��E~�Y���ҏP���-�&�\ZF��:l��pdp�c�q��٫�}���?e\'>��?	e|��� V���ܥӹLv���\0x(>v��]�~p1UuC�\0��j�+�c�����dRVUTG\0Ƕ���.^�(���\'���>��O��_� bG曇�����f�ie>MӒ��u��S_�j�����(<9�y72�+�k��\r\0�i���\\G��Hq���\0���Ύ\0zg&�Ϝ^������de����W��w��=Z~�W<�d��} �;\\�7Μ=;w�b&��PU��l:!j�+�z�sǅT*�ć����?LS�A�N,FP�v�]]]���d-����Tj�/^t�����`�[»\"�n�]S�n�����`!r\Z���0\0@VJ!s\"�]`�k�m�b�Sr����3��{����ܫ�2۬� V^��ܥ�3{F�&��P��ba��}����/�X�\\5D���y����\n�y7�=33��c����4�LA\\_�jt��ŋWk�!@>_�,�گ��;/8��L��\r�za����-#*�j�03�Fu�պ\rcZP_ޕ�R�t�6Ǯ�X�t�c��V�a+��e��ێ�%����s�嫟���=k䀸�<��7_�w�Lv��=�[J=�\\�m6\\����=��P^�HE�����1C�z�B*�4T���?����]aA��	��6M�ʊ��������H,�����,G�Kּ���O�\rk��:&zD���5kd��ȫ�ᶬ���Y�t^�l�����	0u@�ص�!�}@��]#Ý�X�X\"�翥�-����N�JJW_�z�Z��3R���%�����a���[.ڳ��{����Ν;�tu�ڨu�Yi�&����w�С��	\Zv&� ގ��>\0EQdV�TN���h�`(7x�������J���7���\\��״#��pK�����J	�#�E![f����\Z�����N�փ7L�:�38Nd�0t�k�q��L�+���k� �/����gE�p��Z�^�Vfv�{��EM���l���]�r�iێmH�Ӫ�NMMMLL$	\Zs&� ށ���P*W^y啹���?ԉ�Ol��5jK����kS�5��M;²\'\0�p�\"O�<�/��iY�!��й~�C�Ӽ��5ok@���L,�s䲰]8�������b�\0Z�X �\r@�R���`���Y�}\0����<���d\\� �	X8xm}}iq��[���y����z�m�XKo�0y����i��5����L�a�^\0A8/��+�\"��P�\n������cWQ�M7��R	�L�\n����]z\Z\0sk\0��28�硢���2���J	\0`I�c��L o����_a_�Q.m\03��-����UL�^� �ض��^{�⥋]KkƆG?��S###[e_>��S���uι,��q+�Ԧ���p>rN��U���^�Q���[��)�ɖ�\0\rd���I\\O3��\Z��]�����\0�(��\0�Tk}nrkU���S�+�R���d��+��].A�M�^�r����x2b3�v}�W�:r��O\n��7����m_\0Mkof�Sq���Q�-�ʩ�8��\Z��B���5�/�j閙�]5o�L�x�1E����&31.\r����b��aV���ʬ�哕��09��\r�}0�|D��]+Aĭ������r�`�3����=r�С��!Pz�ǉS-��D8�Tj�aż�{�v���׸Q������Jz���e_���Z.#��(:�V��W�\\O3\0��F�N��Z�˨W���������b�FaԩVu��*�Ɏ��N�YA�\rpL*�����~�X.���k����+h;Y��:���m����>cd�\n�n�g_�~>rN\"�ʌAx��ˍ�51����ɌMH�m�.���N�WƝ&i�YHZගv��eSM�n�E�Z*�H�VN�����+02V�Z�W������#t�A�Z�}p�#��\0c����]X:����}��G��	�0�b���x�tl_6�e#�y\0��bڨx��/Wj����D.��B�cõ���ʾ⸸і�0q����0ҳ��f�b���(�d��k�F�K/]nƵWS��lD�VAčf;�8{���c�k�;�=<��d�.����M����?�����֯V���m��q����+5�F{�n����y�prWaC���w�_$����t��5��\\O3��Xe��3\'3{���s>��r�E�.�@�H�b�y��Ǎ�1�.� �V\n��!����l�2���[{���2���O��u��#��]�W��/\'�ٝT�ߌ\Z�Yʴ6r�__n���-s�{��\nc�}��)���d�Ի�`���H3E���a\r�;=D�#֑q�2�W%�����As��GƎ�.� �f���G�y�Y8��$��^@�\Z;����W�.�μ���Ԭ���߉^�z�=\0���ٯ��7Ƴ���@Z��ƕJca-91h�5̶�v0p��Hl�P]v���T�F&�T�\0R�Ùa�5d�;4-���۸�R]v�a]M��(��%ZvX9k7�o�T�Z����s�i;7Y��r9�J� �[\'���.T}������sEh��Ӈ��]Xz�?�&�*��p�{q�s8��1�y&exTmP)�4��n��h<�P�&\'��&{��8�]]�$\Z@������/Zy3?96��X���>m�J���y+o�����-��y����r	VN������ٟN}�c��1�.� �	xe�52zа��(�L�W<����?{���SO#:3��]\0��5���\'��,��jl��}#rN�ž⠽l#�I�*te�ƕ��[���=��O�h��v璻�\\ ��]g+�r���\"����خ�9bl��5�%`�ҿz%��}�ӅBA�\"w�;+%\0\r�M�5���܅�3�+Q:�-���C_��{Lʈg��7���jk!��h�\0oV�՗/]>_�޷n�M��l�\0} ���VF�|�x�|qr6?vt��5\0�\rk�\0�5j=�z�O}ktbrb��`A7������ޱ|���M��i�*!b��YW����h�JGb��~��\"�p����%�.JF:�a,]IK�)-�^^�t���~|��ތ�U�VL���p�Z��I5?�cr��ͼ�>��ty���_5-�QC&��@�Ec�	Y<����M��#\Z\0���Ȑ����ޛ��0W�s��Aj�LA܊|�|�ʛفDo�$t��IT� _��d.�F�\'�z\n��\r�8\r`��d�o���ϼ�Os����52%i����dn�]5̌���������H!ytv�!7\\���U�\08vu�讫/_��E��9�`�D�s���0\"\0�����=��7�WlDA7W��j@:�B�jd2��Ų�z&r<\0�ҩC_���(l�2.��p�o|M��O�:�}�Tטsgy�af䄁�ƽ�]�����-�D].\00ē�����/�*�,���.�dh���^����=;;��PAqc��dK�\n�cr6�t8�d\'}gŨ��\0|��D≨ݖCb\Z���MHW��+�\n�s��y�}E=���\\r��)ݷ�V+7ÌtrW�6�����Q���}t�����4	\0p��8u��~���?���$� n[�kN�H���r�	a#[y˒*\00�7f� �i&��$�A�}��o��,��L��g���i�����{�?zp���a��p���)��������&�rѾ�r@��0u��ˑ˫����}��t�A7�-������Aiy�U�f�n$��,�i�Z�+�]�b�����@$~��4W��\0��b)7������é���4+��x�}�P�Cxu+Y�������^#-h�H�Z�X�A�hJ��W������	�h� ����;���׾DwEaXie�aIN��ZV�/�ʛ�D���=�l���]������<����]q�-��Vu�Xl�+xo>��;~��(t�A��A��70�ȑ\'@�Z�Uꕐ�rJo�I�<���\0�ɐ �Sb������d�`0#}-ܬ�::�Mb�6y<���!sD�넊݀�KN�\Z�����~��K�.�ECA�\\3�&��G���(m�`��\"�$�>*+#\\>3	��`�C���:]��u�둸�:�5;:���FU5\\�Bw�v�\0�߱ד�9ބ�M�/����t�A7 n�$�ǎ~�Z��؝~FZE\Z\0��˞\0d����[��y�.=��u�M\0*b��d\r?��l8]K�n:��QUE�Tk�5T*R@*�D��bP3�5t8��)/�+����\'�x\"��ХCAܬ,���:��֪�6rx4��W��\Z��bn���7\\q�EI]��Wk\r��u{��b���4���R�}Dk�Q%B��*J�����5I$~\0���.�---�uCA�t+�2t�ק|$�������P��xT\r�7���.~v�p=��\\T���01����\"��x׻�2��өM%�T�4�y���n� ��.`\0�Db��߶r��P�V�?\0I���gQ~���sm����yǯj���yk���U�Z�A9��}\Z�dh����7���ӥCA�v��&=r`���sW^��i�5Z��r[�Aη������s[�<�DRvg{�n��	�+�����Ў]��X�WR��р< ���y��e�Ս�儬����Ю8�����^__\Z\Z��� ������|��\0i>�9�2hd��RW���0o�P\\�B��2��$� +\\����S��N�k-;v�6�.�rm]Z��  nHk�<\Z�W�ֆ\Z��\0X��u\0�e65KW��@�\"@�J}�����~�}�(���/�,,,��	� �[!`�y�G�\'��N*���LU�����B�V��Pٳ��V[�Y��f�rjX^��{3���KHf#\0�K��!�\'���p�\"H�[w�c%~Lf�`������8��}-�z#a\'\0�6�\0֊K�R�.� �V�I~`/ei��L�4y̽E1�ۻ�`0�Rk�8e�ԻV?W9�\Zg�nʛ�w;�\n1g�����Ӳs�\0\0 \0IDAT&pOz���+���M��WG�,���������bCǯ\"ܼ���ⅲӭ�+\Z�9(�	���5Q}b��ו��e�t� �[!��{j�M��:y��z+�\0ބ���T��t_�����a�f��>\0�s��rC�t��x�>ٳ���(Z\"��L��� �\"��G���w��(�R�,X�����8ι�ܐ�V����_^m�G�\Z���8O�\0p��� �\'%Aq�̣�ҤJ�������	��}$E�%����_~@�\"�e#��Y<=}�Lfy����{��T2a��г���T\0i]3\0M�p��\0c,b����L���$�03��ep��I�\\O������V��z�\\	��Ay~�����C9 �p�����{�G&� n��}�UK��^\"�Y��/��X񦼆+�FǢ[ipT������]��g��]�����q\0Ik`\ro���y)���8|\0%u��cq\\�XZ�8猇�1�dH<�n[�����&�W*��x�\\��ڥ��5��O�K={�\\����`믊2k��j���U��f\"��� �x{�>N5Z{0H�`2�����)�	Y��N�?b�u�R���x�i&�S�\r���M�\0�1��\0�_����ʜs�d�����g�ٱů�J\'���k#���e�\Z06UxW� ��!� n���!�l�C�G�[��B\nr��gy4j�����d6��s���+����ί���NCj��\Z�^�H�e�o�I#���%{IVHG�7*R4��\'3\0��t��zqA������\r�n�zљ�7~��л��9��\0��3��\"ih������\"o��ɲ�)��*cLe�Lٲd�Ǣ����k�R�B�X\Z�I��,�.����FV���v{�`� ����MU�\'(\'z��(+ڦ&��t��qr<��j�u\0r*�ф�g=�i���u\r�!q��A�l6���VVV��f�V+�ˮx�]u���+o��4M����SW˲rV6�ɦ2��iB��d3նY�C��Fs,��n�v�7�ͦ�t�A7]�O��\'�%������]nηs ��ɭZr<\0�Vu���P[�λˋW�^Y��ne�\\.7�ի�������m^$�6�\'M{jjj(�0::�-�L�󃓓��1V��b�[�cg\ZW�̮���u���\0�xֲ�IWAq�,, ��*K��ݝ^��!��Fۘ8yx�r�J��q��\'�ҫ�.��f�R\\Y��0�|�X����Oh�)amG��t�.�Z-(�ⵧ������������|~ttlx�0��>�r�l\r2�2��S�� �J�&	� ����h�ͬ�9t����H��G�������Y�&\00�π8�I�Z�%W�u������-�t��@��c$t�d��>}\Z�ߗ�F\0�ݣ�\r�N��K�\n��<?�\Z,� ��1(�a�ݣ�<5��W��U���{-��O�o�U�.��\' ��\n��&��to❖j?<;f_]�7�N7yO2�\0N�	�u\0dkH�:��Q~u~q@&�6]=A�M0\0�L�nP^��l�(_۸[Tcŵ�������)c�@�/�0�F:��.�c#�ե���W�ĩb�W9�m�i�@륣A&&����-ތ�`~P�u�z� ���u�KE�j�V�&�����bA�Z�ߢ���5_�����H�}{}�Io��/��B^l�d�X*ב���+�`�V�N�UU��� ����$&�tTcW#��QX��Z\\��\Z�F�nד�g�͉\'X�5�8���)Z�\Z����{e�u�Ψ-�L�@���w���k�\"�;7�]YZ�62:z�6 A��\0��Fƞ��/�I\\|����c~:)zL�	���`\r!���1����ѻ�_~=��NhR<J,n�&�ج¸AyM�����H�5�-F�cNhR�����P\r�p�������J�g�l/�9�\Z.��!� nQV�H?(�B�KgC�y��	[-�^��9f�F��˾�|lL��;�Ħ:�k���2sw�\\�3嵮�����K�?O�m�T@k�������,+��ѥCAܢ\0������Jjwj�ŜRu	P�����ͻ��|�w0yh2��Y���Fq����\0�-^+o8��\",�%B�8�V�]���3t8rC��@&�+��%B@�&UKe`h�̞��	�t� �[\'`E�N\n�/��:\0�25���hȇ�\\O��XLѶ�����]��\0����Qm��kf�\r��䝶\0�Z�uoiE�\Z��Z�$F���}�\Z����F4�������H�/�o\09l�����_{~m�gw�R)�t� �w����}�w�h��Q���(vU1g\"5+i���W�Q���d�<S������PR�ʍ�e�OO��B�4�6��\05��ʾj��#��t#�\0p\Z�Hp�Vө�V�<՘*-�\0o�h����֞GכGҔ�f�H���ȇ��\rqgЫ�.�3�������OLNNҥCA�����a�7 Z[����z��?���������n�؇�{�iK�Wm߈�m�9W���[�M���oy�_W�~{p\"۴���i\'	�h�H7k+��e�~k�s�|z��J��t�A�N�Fj�M�g{��6:Fi�s=��\Z⽁���|�?�?\'�:J��3�����M�n9w��lJ˦�4����Q�g�x�_�T}_2m\0p*.��ٿv,�����@����_�v�9���DA�2�cO��X��������\\t���t����;�7ia8�����O��Ѯ��rm��^�4F�~;�x�_Шm�g����͟��8�p��3\0��-�=}�)��	� �[\"`\0l�I>\0��W<\'��S�r��u��:_ʹ�=�m1CG?��{��8������+nx���/R9���/�6���`��1o�~���z�r����w�7W\ZtA�B��2���dh(ה���40K���̜<�1�޽`���!�c&x���ʳ��\0%{h�	1�a�vy�_+���޾b��K+���)�d��2/�=����z�4pg@`�[���s�ЕDA�t�,f�y�\Z�FQ��n����-\rw9���꙽�gn�J9S���4y�r�����|KNoF�(tW�;��~n��F��$� �V�H\r�9�r�H��f��Z���j����sj(�P�����駺���~�7��Z\n\\Z�ss\\��h��%\'�3:Cp���������,�d��	� �[!`\0|�W�=���E��Ґg���mR�@>r͇���g�b�\n��Z�Wý��$���gS���H��p�i+o�-�<W����\'� �X����[� ���.��A\0��;r��Z\Z:qZ�Y׸n��!k���}�p�}7���5Hg��|��g�E\0\n�K��|*3o�N<\n�w\Zx�uy�b�u\\��� �r}�����R��?��5)U����X�3���2U���Vkoow��ab��4w.B�3�%S$��Y�����\0p\Zp\Z0�\0\"�?(��i\rw\r>0�Fʏ�4,�VN�(�Z˙|/�`lvmbߕ�ѿ����C_��s�����u�j~ltP϶NpE��0�|�Q�;9=`�tIA7]��$�̤,I�WQ�2e0R��H�\Z)MY��̤P88��&�P�\'���w\n[	\0/H��Ӭ[+ukeY*8���㟶z�c�ڷxt�u�=��Ϥ�b�R4\0$�ơ�.=�j�賣����y�M��O6�vC�>��8�Ľa���\Z\0E��w���\0��tz\"C�A��w�|IN�_X]~%[��|�Qa?�ۭ�,m�9�:���h/L�ز��9�ĉ�����<�(�r�{2<�<�jX^��F�ٳ\0\Z��gK;\'}kp�=d��Fu,��!��s4�,_z���\0F>vv���(U�rk��7���</�\0>��O=�����kyS��\'��75��cW�(����CAčI��S�c�4�^�Y�E�bh35#Ƣe$CcPr/G���-�ph���ϧ�Fw�v�O���io=��f�\"iď�J��J�l�ӵ��(���f1��Ľ�lOa���G�\rF�5\Z	���\'�:;:4�EHA�T���{���!\0G�����˲\0(�b�X\\��K���c�g2Y�2��� �[!`\0FvJL�nK�J�JQB�E�,FA��9-~b3�����@4S����H3��\'w��a%�g�� r�\04�����_h\r�NY�̎>2��Mn�p�s\0���M�.���������R\n�������w��wo�}IJ��<��.�.7we��9&��	� �k�ܐ�0��̧�`g�m�Td�A0��bN��h\ry��F�Le�]x-F��yPz�X�9��\'���vVC\0P��BrW�;��\\^r�6�n����+=\0@�k)�#I+�D�rE�W\\�D�.a_Ǎ�/_\n�~]�)�_���￿��R���&*��¥M�\\�LA7O�\0�es�������Rѭ��:x_Thu�д#^dr�,��f�̭�\Zf�&���ٜ���T˾��Ħ���N�Jc�U�<x��m�Ǯ\ZfF�t4�pk(��v�m�Ͼxr�5�}��蓟�$c}�jX�ģ3�Z�q3k(�L�A�n�4\0H����=kA&Q:���HZdA*R����� OI�e�x�=1+,�^��p��Tv������Q��[PE�<3�Ԛ3n���O��TI��_\0̭E�\Z�f�hpǋx$�/��7\0H��b��/_\n���\'Ci\n��g~��~�7S�-�W�r}�q���9s�訞�eHA�-N�\0�D\"�=��+�ar�_Z�q�\rvհ�*�����w%��a�kDZ��J�\\X�#�kj|ctb;�d��5n�[{��d��T��r��7�T�������k\0�>���|%��nA��2�Ӗ}n�՗9���d_� �]0��iJ���҂�\\:[I5S�P0�2��d�<��Pv#��݀�2S&6f����\0��o��\Z�zM��m��cr�s9n�%��.�9^�&�����_W�������ӯ\r\r]��L���3å����N[Fʠ� �x� ������fuj�O��Cf�u�^w�i>��I\0�#sM*�$ Tt@�����Df��5k.oF�^�[n��ԅq���}�T�|7�Wd�����k��$N.+���P>�?�k_�җvb_\0�B�J�%\0r�5���� �x�``@�c��s�N-������Q�R��,��0\00u�F�u���&v����|��Tgf缁����k�]y���2�x�ޞjga߿|)�Ó����Cy�ݻ�s��ܗ���D\"��?0h�h/P}h*QH��DA���Ї��wy��r_���)O24�qḑ�o88�0\0�\0\0��\\lֆ[~;\"L���\"��כLe��aQ�ʢ�*���������׼�������裏꺾S���k_{e����]is�Pn��/Aq��������NN�����}��|�Py߾�7m��ab\0����#��D��X���f����]Y<Q7�ջ9�(������s��\r����{����8t�P�G���?��ӧ��d�ޗ��j	��$� �60\0�ؑ#GFFF��o\'���7��=����˫����t�K��?��g����t���1::\'7*۽R<���ݶz�_3O.��|~tt�s��ُ~���Ba����7~��|m�>sߤ�w(7�۹�	� �	XP(���/��С?������=8��\r\r��K劐q��~4�@l_�uf�V���޼���f�뜅z�_�+h\n��#�}�W?}����r}���ϗ_��k�u\0	S��j��A��*`\0��?~|ff�?����n���Ɓ�ҧ��9?�oY3�<��f�:���lf�۵=�퍼Œzf-��csb�.�Y֮��O|��?���+}��\\i<���������E� ���,��r���O�8��g�}晿�ߟ{c������������t���p��_{���)��л�n���Y�_|�|~��X]-��ݻw߾\'�|��)��wx�|��^�M挱\'���%� �\n��?�ԧ~�3���?��O����{���?����E�Cc+z5���c�:\0	(��V�\0N�aUKe�]Mab�ytt�c������s�ĉ���b��7��ua_\0{����\"� �$��:0��c����W�?���}G��j\r��Ǭ-T��Y>;j�H?�8*nTK��ݍzU�=��#{��?v�ȑ#����4v�	N�9�\'/6J�Ⱦ\0�r���DA�y$�d��w*sծ����ݱ�]9�=���VO_-FC�����efbrrbfzzrr����ccc�t�zˬ���3��g�6�6Ə�Q�I� �0ǅ�;����������O����/WWk�*\0��(�2T�`~pxx8��������\"ݘ .��R��w����]=A�)��DG�.��5��|�pf&�9�}��}ι�y�s���1���,�7ָ]4�\Z�/-n|9HɜI��A�)��B������%W]Ndw}��L\0cL�������ou��T�d�H�[	8x89H͟	� �;J��\\:y������.o���L��?q�|F��5|pMJ��9�d:-�%� ���_?�g���׻��;�������!E�o�Ϩ8�.npM�R�\r� ��ps�q���^��W�˵�zz �w�y�щ{���n���/������ A7\\��Ȫ,)�;Xu��|��/����3�B�[�wd������is{��/�����l�\0���A�\r�O�৩���;��IU˛�����Q�u��X/_._y���O/��/�7�ѕ�G�=��>>|�L���jd�X���]�L0Aq���_��\n|�栕I\rѠ�J��PR����iMO�!�|ި8���+9�j�xf�Q��*KV���B��7��;��|�}@���e��������\n]@A�\r0\0�zb�|i%q$�D!J�E.8�Qs�\'��c�����1�������\'���b�,�+�+�������3QMA�R	8vp,Ը��|������u�����<x�?h����J�����8�H�͚[~c-�?O!� ���y�3���m�o|<.�:���|��D����:VC	���/\\�N[c�ߌ5A�ː��Zy���)��W��||���� �w�xf@��&���K�;o&f�2\"� n���ice�O�v��;.{�h���{����,�c��|�q�M�CV]~�;�\"On�\0�� � n��㊪���!�������́ч��D�NQVf\"#�$qqc��0���\0¥ƥ��m<:3��q�&� n���Q����v�34uxd�ݻ��㊇��f%�B�]Q8t���\ZWk�##���\rQ�~[A�Aw���z\'��惏�:6:�Ю±a5e�w�g�+�ϭ6*�pp�c�gW�s��ޡ촕O\'���� \n�0�eY�,1E��m� ������ m��Β�dΘ:<�?<\\?b�3�+9�������Ӗ�w��΃��B��:���V�s�ș�]��5��&vV5E,)�^4� �\'�0rC\0�P4YIj��(��$� EV�\Z%�xo	���}�^m�K��K5��@�jCt�ؘ$N\\����d�4����c�B*9��,�����~L�2|�}nUL�v:�둡��m�l��C9��t%{#:+,����\r�2���I\\�Qh� ��������V2#��:U�Yk���Er(i�,!+���ɿ�����\Zybv�{����q�&O/5���7-g\Zܤ��u R�dI�d\Z|&�x�	�u�&���($��^��+�+�����ܕ�c��&��i]Z��@�cy1A��ʖ�p�p�|�����#Sb�w\'O��[_ޘ;��(�pߒ.US�F��\'�x%�j��3�N�����������US]��\\o�r�s�沄ě��M\0������H*���2!텡h����)s2�� �%`��\0pGӴD\"A\Z���S��2r���¥������8�n|®c�h�M\0Ѡ��I��O� �=/�\\� ��y�a��i�s�9�\n�o;_R���ˋ�sk�R�q�x0�w�7ξM�c^�k��\r�	Sl�,~��\n6Y�� �=\'`�`�o�z���~:���,��u��׷�GD}/�\0\0FIDAT%\n�]�iȯ�V�5�7�ڮ#��:�o���g� �PM�l�t]A�w����!��n��tZ�o�� ��Sğ�9W�7(o��irv\"�K;GG+W��7�Dìf���i{\0��5�O�A$s���qsNY�%�����\n��E(A���N�=�k6���=TA�R�f����E�\rðｲ,_��]����4c,QH&\n���Bc�޸R�+�����:oFk�j�{Iic����l2g&�zr�2��ɱ�1��RI�Ɋ�Ȫ,)�^� ����EQEӴZ�ְm�y��f�)���3-�+�(l�Z!殻c�dz�@����܀{��f�U\'�B�����E�JI����J���LgT�L�^p��t:���8\\��s۶u]�MA��N�j��yAl\\q�1v�����ɚ�؏����F�&�A����EI�ӎ煾/˲��,���iڻ�� ��+�0�dY�ʻ���KA\\��E|��f�q��}�&	u�:c��}�u�1}!ꥵ�Aĝ-��親�;	s��0ňq�z{�z�nc���@�uR/A��#� b/ꦙN��W�q�r�A^����9�����^��2r�[U5�m��o��g� �x{�<��h�%���yČK��2⾃�b�ۈ��6���\\�8�L�Q���,����K�c�d0%c� �p�j��}ƘeY;_,�]��\\�盼�lN���V��7ܼ��b�1�X(Iro��J�B��Ǌ��ɘLLA���<�ި�ۆa�ľB��z��8�n��� ^��1�ܩ�ؾ���z+�9���1p�i����u��8+�\"b1�QA����ͦ�y��Eэr��n�R�m;�·m�S��vD��.\r�n�\r��x��qȲ���m�c�j�F\Z&� n;w�-����m[�L�͑��z�\\���1�(ʦ��N_2�;��VH��q���d,1Hl#�nV3Ȓ^�0u���jƘ���	� ��H��D\"�Jժ�����R�^��R�L&��z<(]�ח��E\\�O����Ǳѱ�I$oo��\0�1[�i�X�B�E���,D�w��oOJι�� ����\"+� ���u}ddD����X�R��몪��i�&�j��٠c�A���M^l�Xa�`�\05�w�H�2�֩U1U��6�j�i��UU%\rA呂��\'&&��֪�j�{\0�4,�D�J��L	lj}����2�׋��̝�ǯ��[��1���7���i�uI�A��c�j�u�P(���Y�E�\0D<�ʝ�p�E8�zX\\��eJ�E&�@�y�y�C\"p��<�r���?Yܦ�o&�zϮ�:�OiA�-M���*J&�I$��ժ�z���~����;��9@-6�����t�fE��X�;X�z�[���;\"lz��1����}��WZ=LA�;�5�(�a�|�iS��{�V��(B����q�*�\r/v��j���;U�Z@�6��Z���o�/8��:Ǩ;߿뺌�D\"A��AĻ#��[��T*�J�� �t�R��T�I���PLc�y�.U��[;�vq�8U�	ہXL+�����yb�V9c!Эaq�^�wV}Aĭpo&nE[Ƹhٞ!�M���;qי7��;�X�k���)���9�1\\�q~΀M����]�s���n6�\0��AĻ/�XHq�qg�d<��YԵZi�N훌;}/)������Q��zlu������A��\"�L&����nW�������x&m$�Q��\'��lq������>�@�����iES,c��Ż`�!k�u�&� �x\'ܘ�\"�0��\\_w�vg+\0A��<�^�[s��Lb;a�o�����x0��}��L[�h���7<�9� � ����6��z��+01ݵ� �Zs��n��2���D{�;��Vu[�\'쪠:��tUP��ؼ%b|C�H�AĻ)`�;V^�|��mE״.6w��\0��\"�Z�}+��m�i�K�}�&\n���R�ZOl*��|i��I�AĻ,`\0�Lfll���e�v���Q�����>2���;��n�-ʧE��9�g����\0|��mjMA�Z�\0r��:�7�\n�Ǩ�k�\Z=���z��ӝ��+ø5D�-@eJ��;�G��w�$� �[\'`�`UU���+��Ο��\n#.<�10&4t�[7��<U���&�����7����#{˧9��f3�HP&� �}H�R�a,--����~��;L�7���E[�NG��Nյ��KÝ&F�S|*1���uA��<�0� \rAﲀ�����2����Roi���m��%�kv���l���>�s��>=/ۋ�;�Sp��%\'	M�H�AĻ)`��I�������d�l�b�xES�<�`�E[h7�ƶ{����=a�ť�Ax��y��Q\Z&� �e�Q�P(d��r�R*�M\ro3@�Z���n[��wI16WP�Vluf��sv�k�&v(\rA�������\\�V�U*�Z��ù�q�дh���>�[�+y����\0TUm�m�����#\r\'	Q\\?=n�-˲xb�^LA	�fiX�uY���;p�s;#l-��\\�����޵C][At�\\�wv��eٲ,UU��föC��t��#E\Zv<�s{D	LV\0M���vgkk��A$��H��\\^^�۴���Q��9cLd�x�x��ୂ��+NƩd:�I%	�e\"�H�j5�q��޹������o?���\'� H��(��F������b�Z��&�=�3�q&�x?ҖԽ�X�$�HX��U]%}�^/�ˢg�z����yc��L����6@A���� ������ו,EQEӴj�Z�lg_�X.��e�^���Ö���q����OA���L&�D�n��z�^�����}+�Zwq�0�3N�%� ީ�� ��j����;���̮(5���s:�W�u]�u�㸶뺾���/N���}�ch�GRd&1Y�eUUu�L����al52\\�T��b��qWq[Q�����s�6\ZJA@&&� �\\�]XX�IIsWqS_R���計�bt7��A���{B̜�������J���5MSUU�u��WT�m_�m۽�z��rp���(�i��\0&� ��aKKK���y{dY��k!1|��z*��E���B̜������;cn��*��WQYU��ظ(HVUu�o�+X�7DysW&��\"�i\Z� ��v�}�����R��͆��t��V�b([(�+eb�#��kp8�}CV�f�YQ�[��-��9�r� E^� ���n��l4\Z�f7�<�.�\Z�d2;ϣ��Kiu]^^^�rpW\n��\n�0~��,�(O9� ���s��E��z��M��;GT_�|yllLl0|ےJ�c�b1�x(ʪ�bѱ+���`�zeY��� �܇ ��f�Z���7ջ�9��ի�����	&����r�\\�T��l��5�\r�j���0�LA�c����R�t˼ۉ�������(���P:�^[[�V��T4�0A[q�:�r���������C�������aY�#��9eo�j��� H�ۡ�껸I�hAu\'}���r����K��0�q �A;p6����kpo����|��H�9�TJQ�x]� �4@M�E�I���4\Z\r!Y�EE�M}g�#՝��j���dD�Zo�iN+�	� �.C�!����.ǫ��7[������;k���*ʀe��]�T8c��X�~�tA�����XɌ��ZL�9/��D�]\0�$���Q]��V�Q{��,ˢ�t���&m�LA��8&�˅a���*Z��E���hK�������H$��1�D\"aF�=-��\n����fCA����X�Z�TD?䈇<����i��m_s�ZQ���1MӊŢ�8񆃝ض���:��d2;o�IA��w���Ba`` ޘ(�V�q�����<00000�K$����A��o%���T� � ����%�������J��no4\Z\Z\Zc���D²,t����-	� �=$����zݶm۶�YUU�,�w��]�Ԉ � ~�,�n\"��4-�~�A�#�8���QA�{�^%� 0AA��	� � A	� � 0AA��	� � A	� � 0AA��	� �LA	� � H�AA��	� �LA	� � H�AA��	� �LA$`� � H�AA&� �LA$`� � H�AA&� �LA$`� � AA&� 0A���ݽN�P�aW�N:0����F%����^��c+�:t@�#�G�@���ג���㟆��q��QU�!���泝�\0�\0\0\0\00\00\00\0 �\0 �\0�\0�\0\0\0\00\00\00\0 �\0 �\0�\0�\0\0\0\00\00\00\0 �\0 �\0�\0�\0\0\0\00\00\00\0 �\0 �\0�\0�\0\0\0\00\00\00\0 �\0 �\0�\0�\0\0\0\00\00\0��\0\0\0\0`\0`\0@�@�\0\0\0\0\0\0`\0`\0@�@�\0\0\0\0\0\0`\0`\0@�@�\0\0\0\0\0\0`\0`\0@�@�\0\0\0\0\0\0`\0`\0@�`gdY�����\0\00\00\0 �\00�����߻�b�������y/����@�s�O�\0����țۻ��r��k]ʲ�X�9�\0^g��8$���י�\ro��������H���lƇ˲��/��YN�eY�e��9��?���������\0l�����n�k��N�þj&`W���Uа�5���X�V#���pj�\n��x|z�z��k���eR}Zo�S=�gq��o���EQ�k^ojܰ�QV�*;v}�����I-z�?�PM�=U;�h�>�������֖����&��d\\�7L��K���c��=Z����{ҾP``\'�ۜ~������;��8����k��vn�6��~�y ��K;=�.S���c!ѺW�� �������c}�nf�����ۻh�����|~k5�;<�s��O�h��c!�uo�	��F������n4�~��]_J;�Q�jh<Ó���_�����\Z��6$�[��<��/�������>�Ը�g�	x:�ߚ�UV������CQ.�2��7���y�.:��_׷�oN��<�%W���WKW�]U�Y��S��X\'�a|i}wJ��uK}�P�а�A\n[�Wc5�gmmr_&է�BG[��V�[E7�>�3%���2>��K�]j���-]�����G�y���״kY{�\'�~b�\Z���R����U�L���`�����Sc�����>`����}�c��)9�x�瀟��!h��Nj��q�XX�= ��Li&Ek��	�C�\0����\0@�@�\0\0\06p�e���_\0l�?q���萵@\0\0\0\0IEND�B`�'),(2,'test','test','2013-08-01','2013-08-28','2013-08-28','����\0JFIF\0\0\0\0\0\0��\0*\0��ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ �\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0�\0\0\0@gTRC\0\0�\0\0\0@bTRC\0\0�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0��\0\0\0\0\0�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0�XYZ \0\0\0\0\0\0$�\0\0�\0\0��curv\0\0\0\0\0\0\0\Z\0\0\0��c�k�?Q4!�)�2;�FQw]�kpz���|�i�}���0����\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9��\0C\n\n\n9& &99999999999999999999999999999999999999999999999999��\0XX\0\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0t{����mz�A���q�58/A��^�y�W�z$yנ��K���\'�z]:�Y<���y����^�Z��B�<�f����zB����<��*�CʽP�T<����U��=P�Q��=64�#�=��z|e髜g��Oo���w!ԊK��i���P��X�m���j�����gj�g9S�K6ř�^x�F���m]��H��b\Z�[x��PDo��4rm��<�\0�pk��\r$��,���[*$V�+�o�ӓ�����e4�^�^��S�x�~�N��e�7�]L9����9zY�Rg�����Sު��<�K=���<�2zټ}�}<|���e���j�ܾV^��;��oJ\\}����;y�b�e%�Ѿ�m����.�y{��ۗX�<_J�D��m��㹯2z��3VQ�k���q�i��vȺ�=���3��p,�T��G��i�,�l���zz�����[�EM{4�\\|�׫�n���H+�v��[�7�5�9t�s�-z�\0)\'���{��&��_�ks�;�j�F��sĐK�I������W�^�7����O_�-9�ܮ�~�N��޽�����T9݊lr��I���rm32��d�I6Ƭ	hY�ͣ/�0�wөe,�a��ӆu��yw�֥�I�H�6�s��h�8�F�sh�o)�%Ԋ��%�7��A���z7��,���8t�=j���R�q�6�R��s��45��V�S:�|��z�U4��uxrr���re��kȍ��b���^kr�W���+؎Ys�\n��������׌�Xӵ��Y��3�o�rlW��ۻ����8��v%�Q�/5�*\\k�V��V�\Z���9k�&ؐx���%�5��>\Z���7�S����_�o����Ie����x�|�oT�oA��U}f�y8�L�9�r�=7S�us|�^�_6��~�:s�-����p�Ž?OY��y��v$�(s�Q��b��$Ź�q��t��s�\ZR^��k(}����ݒ.�u���1gU�2�y�T�A:����c��պ�K��ޓ�x�Y�= Y���-y��J�v�|I���i�C��\"��mХ�뙱�=�n��b��׍�]-*O��k���s��T�;Y���UC���.�ҝy�H�+ks�s2�.���w��{ڳͭ��W�݆X��u���5��NH��jV0�lfL��wb��c1=Kܮ����7�\\���`�h��b�ܡU;x�hw���;ݯ��l�L�\\���>��v<�Y��u��}w6�\rq�sf��M�GO8ۓ��;qd[��eL��>�o���z]=�NtvI��$��㷣C�^9�]g������#�Z�&��/o����F;m��W��˷���l��/Ox�,Q�nr٭f�ϟ���^Jx��~���nj�;8�������-8t���n����v`݃���żU�>~�N��w�ߧ_X���O1Ӝ�}#O-���������k�*[u�����g��`��t��\'��q����%�d�� ���Zz����ޛV��gM���;��&���e�{e�׮���dΓ��h.K�t��>]9�ͣ����K��{����z����\0_�^G�m>�{&4�P�ѩs���dw�9���_��^)�~����o��ҴyͬS�omɇS�\'��{M�s��|�*�T8��,>��s����ێ�W\"ZQ[�����;�L�;k��x�^�9��v���Ļ=�{מ�yN�u,q�;�s�vW]�m<�YK8��hz.�y�=41���f��:Tkk7(b��)��m��,,.w����Mq�g���L�q-��㳱�ߵŇ�ˬ�Vp\0�3��g���q1���\"�b�����9%�g]���,���s��,g�5מ��+���/^��M%]�%���\Z���͛C��q���?�uƶ*�f\r���֢O^<��[�Y\n��k���{��M%�����\"�O�����h�o���Y	��5�\Z���;�tX���j�VsQ3N�Z�7i�m<I���ؤ������<��˾�T���������e<ߪ�NW\\E�jy۪�c�\'\\����:\Zs�Ժ�v8�YyQX�3��1�V���/Q�\Z��\0A8:�(/.���c8ə����:ܜݪM[s\\��\0��c�ԃ3k$zɡ��W\\��[���s&�ךI1�W������o[dͨ�,�>�)+�z���i.�8�,^G��%S��o��������hsVq_j�z�h���������Ե)ܢIv���@�Q��$�m�k�3.n\ngZ�3����D����sb���h�^����,�L�k��,S�m�-\'Fx�;�ǝǧ�^6_[�y^���3��i*K���%|!\'}4\\e�V��t7��.6�N�L�6���U�U�GRN>T���k�v���V��pF��[��N��b7�\Z�阭�y#���Z�����̰�͍r(���}T�s�zJ;f]�j�����ns�A�m�9�q�-R�N��n\n���귇�n�n�7Fpcd�,gWa�y$ƺ���k�lcU�{�\\�m2�x����@g������gG�,ZKC���Ϝ�M^fm�̧���u���%w.��j<�K��S��tb�,��ˤ��é4z��\08�3�r%���5.�md��3�ʚ�zZ�cM�rd�$�ҼWu�\Zt5�z�5mbg��閱��3�b=��ü5�{i�Bv��R]λD��I1�Ex����m)�Y����`�C8;\ZfMM��nm�o\Zf]�ȇ������M��M��\rv�c�\Z�4ěUz���8\\���\"�QE�>�h�E�Li���2g?c��:��.f�>���\\ۭk��Y:re����^���@\0\0\0M�Ʀ�D������ٔ�y7#�}���k�sɜ�i�*��U�|��cj���W�Ѭ�W��7���$Z�c5�7DX�-|O�D�:��E=;�p�\\]L��ֹ��\'B8R�����j420�\r[`�l�ɮ�:��35�9e؊iv�=��\"�i���6i����j�`�1�\\i�&5Гf�i��B���X`e��p\0e��02��u5�\0\0\03��p\0g�X`g:����������Q�06j6j6�s�\0\0\0\0\0\0\0��#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06�q}�p�ք|��h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0&���ո���;�ѹ�Wr��tѸѶ7\Z7V���\Z7\Z6ɣ}L%؁,fɫq�}L6ɣq�a�L\Z7�7\Z7��8\0\0\0\0\0\0�Om��W�ˍ�·���=w\'��9ޥ����<��\rt$�W�{J���~[�W���{$�ޏ��}\Z-���}���E7���5�ޮ��S�}Uz�X�*�/O��_E�>��+�_9��i�r�.����\r>�b;�jt�O��>��\0\0\0\0\0�G���(��9ny��2]�>��W��YO����(Ӗ�v|�{�G��}�9����/j�Ec�^5�Å��KԖ	�of���=[�\\���ƞ�0|���_O���u��]�q��>�\0��5��������Vz�k雿˾��=O�KپG�y\\�ߘ�?��\0\0\0\0\0\0]�G������Yf�L�7���F�9�\'�<g�+V�	���t���T����rl�\Z�(ޭg���>��ib���97*ܲ�\0��|r�;{,�>_�W���9X�C��c����S[�Ǒ�WR�[ܘ�<��=E�Q��~7�T?;��\n�(\0\0\0\0\0o�����t!���������6��RYG���G�T4�סc�ǰ�a��p;&��=����y�=O�ċ�IRb�j^�Y�_;�q�6�>Y�����}):����}R��о|E��\0�}&��v�O�=��e��z�\0���O��ւ�\0\0\0\0\03��{8����F��/�$������<�j&�\\Em|�\0f��[��OI{�^��q�\\�s���n?O�v1�3�xX@��=~�j_�/:y�G��{EYr��~1_�xOmRG_B�.���=�*�bi����_���\0\0\0\0\0\0�c	w�&�6�P]Ҩ��ŝ!U���m\\XWt�X�a�Յ�0,樵[,B�j��7�����ʰ�=�VsTZ�1�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\05\0\0\0\0\0! \"12#3A$04@%5B`CDPp����\0\0\0�\0�u#�o�̼6d4���ׄμt4��\Z=A^\rP�tt���ׄT/�^P�\"�xEB��������T/�^R�\Z�\r\Z���^R��x=B�j����-����x=B��ׄT/���N��9^:\Z=A^\rP�\Z�7C�r�\Z��5K�j���/�^T��x\rR�\Z��UK�j���/�^T���/�^	R��x=B�z�����W�ԯ�^	R�ҧ�=����$qtc��~\r(�ǻl����j$^�؎�\"��x�Z�+��K}��W�/����ܫ+&���}G��h���@�rqF4�d�\n�����Z�Y�ଜ@+\r���,V*�\0_��x6د�>ð��h�?�����m�;�w�?����ib%���L�Np	�1�b�yk�Y��\n�Uuo�Z	��X�_u�\"/�8�E�t�i�j.$=Hl\\{B8��hH�$|i�\"�����\n�j�#Bx�*�OY�dpW�������l�q�Z����C]�D5\'HkK��|�`�\\Ĕ��1��qz��W%G/3�e��o;��ԅIWԙb�g3�6FM\"��4��\\�c|�u�K칈T�sܟQ6L�l������!S��Il[T2�cJ��)�]$K��!t@(a��+E��sL�����Zy�t��r��j�A��OW��p�E���w���w��V��x]��$�u)�AR�e$��#���OZe��UK��P��\Z��%\n8�E,Lt_P�je�(����R����_$�Sӻ�`L��`cz��Lˍ�S���!sѶ\r�ϐF�h��E]0�/�m�}�@YIi�C\"��tCe�\rUZ<�@�x]T������=�R����\r\"F�r���M��ը<\Z/-?܌�-��L�4{��{��X�%�V�����Q�ר�lޞ\0�c!|�7���[J*bl=S�YN��UP��K3LPN׷+�@��� /K���%b���dl뫕RLe@W+�SH��D�O1�`��`~I�Y�L3�p�f��1E�L�J�g�����\Z� Ьm�%�RU�ͩ��6���7.7&�]����9d+n��t��=9�&���My:f!I\n��#hV��+4(,g1�_2l35C����*��:Ƒ�m>������Zoz��W�M�c�.\\���r���o嗷�TF�A&8o��s���˨aln��,�����gvU��⦕��J	nN��L����w�ұ�W\\1�_��\ry֫��T6ꔰ�3��:��H�\\�)D��,a�3D\"l��$$��й��q��-=-�1�ӶI\Zy\Zɋ�yO���1[+S+T�r*\'e,�����s��c�dpE�2�F�2Z�ѷe�Ơ�UK�nBcă�nz��ވٙ,����Q���kĔb����E$��Fd�k$Ny�+��2�+��B �L�I5�\\\r�t��dq0=��FZ|)\\�=��\ZQ@�>x�DRFt�c\Z��-�\"��{����H��ru<|o V��cå��S����;�Ǉ��YF��VZ�Y<�2w�\n�9WSҺ�j/�m�U�;�=�ͫ�8��i�\n�8EE9{\"�f��f�Y+�S?��\'&|�bg�(ߘ�/Xs㛒��̭\"~MY�r�T)\\�>�j�n�7JM��b�:�� ��}�����x����;�<���9�M������C~)*�����;;�ĬJ��j?�� F`�Q�8��gj��9���9$j���TɄM�w9��䬲��XNheS�j�\0��+��2��n�sr�ɰ�]���Y,���@r��L��5����K[�}0��fMN�,�H�9}E��G!`t�`s��<@d��)0X\"Ƨ\0�-õ\'�S�;�c��<W\Z����-�i��`��U4q@�+B���+�$���~���b�z��#-G2�B��d�4/�ڠ��}�\'��Fך�o�̧@�>:H\n���&���]%��DceL���d�d�=�b��Aݻ&�ȼ>k�J�ډ�PI���^��<�����(�rs���nڏzo��N7q<�L6M������Ӻ�?�`vk��x��N��X*�����6B��(�Z�$��6EWPꊉ/H�K������b���A%�;��ZWR�풡�.��\Z%\n9}B��v�LYF�.�@�U��ӊ��mA�Ѳ�E��({*�O�\n=�4��5��� �*?}���=�VP�*��f���ڛ�6�޺�Q*3ʟ#�uJʫGN�y&��a���m6	����)���A.1{��1�O���j\"�w��Vj�+8�Y�&&;�:ʳ�*Z�&�=�L�[Q�A}�*�\\�uS͓�O<�oeč�b����h�R6·�6��X���E;Y*\Z�\\�����﵊,��(e������Ll����xa	��h�|2��YM5K���0���b\n�؇X#(	�ٳ_]=�\rMaq�d��T\'�J�k���P�����YX\"��g�݃��v���Ұݒ+��=�>S��ϡ:F�T���<�}�b�h�{�`�B.&,Z�\n@����k�KZ��*���ݓFG	Dt��2V��ѱN��r\0�/yb�\'CI\"u.u;�C������H��&B	�a�RRJq�Nc��\Z���j?���	�9���??��Ɂ�!+Z}\n���/d�;,��؜�Z�R	2����Rν.ce�P�(o(|y4\\��)O��EN���]U�f��8�eɲ<�d��iL�2k�9����\\ep�Aq��]�́\Z�Buu3P��*]���!f�\'H�W���;<|7��;�6�r�۸d�6�+N0�9\\��#�}@����c�<�\Z2��V9�ˊ�٠Ȥ�XȚ�9�\06E��ȋ�Kf��T���౮�x�H�MGS(�R\'jR\'jR\'jF�\Z�j9FBS$,/�{�ړ�\"ĬJ,E��#g�_g�T/n�;^�76x�#|:$�D�a�d熢d+���FW1!+��E,\0�&��<>eMD؞Z�\"��ԟ*2�e�.C\"ԗ\\׎*��f�).�����=u.YOC��9\n{�ܥ��Ey��7z+��rˁ�fE�g⾡���T5��jB*��q�&�;[b\Z�K$���8c�v���ɂ�FWdr$��I}3����V���L̟/ۉ�r� ���wU?ۥ�+++\"�X�e��f��b���\"�^甮b���a��4����m��y�b�:�yޓ*$<b(����Az%w��Us�F�^�bxM��Q�1O��ښ7L�B�40�������eee��q�5Ā�>F�n�Wa�ɔ]9o���%8\\�.�����u���U�w���Uoz����V�J�2��Dn$���.�H]Ŀ]ut\0D���S�\"d@T����)�.�ʧ���ګ������+y�}g�`���D� 97�h����U�>��Z[\0��E�O����|�8���VVE�9+�q���3��w�o ���A����������ߍ�>��e�Y�r�v�W���>F��\0��4�\\���Y��F]���75p��¯u\'���ϭ�rA\"tL]@bd���.E�N)ܥ5�\\��I3�s,л��b���mK�]\n�(�G�u}O8� #z��\0ue�X�e�����7n�7y>gٙ̒\'8��W:�!��O\"lM�d������̇�tB,%q=8=��D������̮@��pB�F��H�Ir�b#�.��R\0צ{T�6�EՆ�Z�d\r�g�}U��?l�uutQ)�8���v�7�8�J\\�}1�\Z���]�\0��2������*�H���&�2����\r�w+�>5?(|�뺓��t_�U��D�S�)��Oa����𮮮���V+J�F�y.�	��>��Z��������}����ҾF\Zf5L�5�ۣ�y	WNE.�6�{�O%�b�\"l(Q1t�j�Ѷ�����rF`��,�}�(Y8�Z���eT/���[��F��*��)�uÐ���C�w(��y/��K񺺺�%�N�\'X���N�;��ɾ�xM6h+W��J�+mu�T�<�����7�1Ŏ3��rv>�R}Ƚ����)~;�����Mޣ�S8p:[ȳ)�7��Po������.����Q��N�r5rj�RO�a��W�i�*[���y�J��S{_b��b��97�ഹ�$��t���	�S�~�\'V]\Z��Ⱥ�+�.��9���7+��o��O��d5.�h���w�e��Q��i�>B;l|�8&����z2�����+��{B3e(���|�|b 1���1�.�`���[���������;~6����Q��!��j��m�j�\\����w���\r�ڱ	�{/��|V!=������{�HD�)ܚ���7s׺�ҿ�b�A��X�.�~\Z�������\r��o�ڗ��ȹW!E�]3\r�Jn���[��ll����\0�<�WM\n��b����\n��5Z�6�5b��ݬ���{S1��\0�&�c�ݭt؉M�t�t�\"��?z�f++ ������-VX��X�,U��݂�ޢ�;S|]���݇w|��lЌ�j�\\�U��ݲ��*������`�V*�Xv���5Y�n�����;��~o�O�ڛ��ս�j�b����7�VMR[6���Qц��\0��翞�[k,J�� 桊�V	���zP,�����zlœBɷ.j͊�Y�fвjk�/j�,�%�0�-1N�K����\0f��]]]]]]]]]]]]]]]]]]]_�\0�����6t�2���\0���4����?�M��%��z�~�b�b�J��b�َ����>���X��V;X�J�\n�bV%bU�Ĭ]�%X�⸤F7��%bV%bv���,\\�vĬ\\�vĬJ��\0WB-�\n��:-��Ŷ��D5�긶�N��-�d@#U��:`�X59�r���h���j�QGjA�Uq��@,6��\\�W�Ԍ}&�NYf���\Z\\6�=�����U�ncNn5ᠬZ�j�m�����V,Z���F\\MN�Y�͕����Y�P���͕{ȭd�\0�H�+K�������\"�J��7Ka�}a�d#�iגv��ۤ��aj����ڋ-KC����kIR�gh?,�!+�#Cu��A䌜��xt_�^�-A�Q�:6�,l��pJ����GZ�Uz���4ʪ;�vZѱ\0�	Td����w���Z��W����Դ�Y�}֠�5�\"o���b����&U��+U������\0j������j��t��S�m��6�}D�>W�hM�삨C(�x~��\ZO�\0���\0KJv��=�̍�g!OKp��~��WT_��U�cO�Z��(�Zow�N̥i�Ԧ�&��E�:�����S�b�S$���\0������\Zح\'y4#c�B:J�Hdr����*�pt�����mqT��2.���Y�M�\0r��?�R;\Z��U�A��(D�����ڋ����kz]5�4x=#e��T���Gqr˽�쵳h4ob�;���\0j��r�j-�%=8u�E+j��\"t��b��\0�`:->0iJ����h+��Yhkt���--�@M���ȥ��0�%�P{�_�G��P6A�_�MU��R�ԟ����\r,V��C`�W�k\0�m�̭[���D5v�Q�%�M����f�{D$�K��{�IuQ�T\r�v��4��H�E7��9k�SN�@��G��=�9@}�B�Ώ�6���b��*���ث:m:�&J���=� �Mސ�(���ܩtK\'�_��}9Ic������ƺ��ǩzb���%�Z婴���\n���uV�@��+��c�3�t�����sB`�\00�t���z2�v,��!���n��ZAR�8ڪ�\Z�rU��;�i�2�Y%�S�=�S{�V�OO��0P�>��S\0Q��\0W�47��~KT����;5Tc�5V���; Ð�\0%�e���B�ŘC�� Z��G�=%ߣ�V?��D��%��F\Z~�sK.��b�[�it�zOB�l+K��T_&�j&�9Ź���l�VZ���JvZ\r�Ƶ\'~��a�򣃝{)%\rd��h��D��������j�����Zٶ6�S�s��{���\"qB.�-T��OF����\"�3��dkb�%Z�tꎵ�4��E춣T׊:OB��U�P�V��0�x��ƣ�jn��\"��0iO��W���mS\"��6_��P��I�bb21�}I��޽�� *P%���)����}T�ђ.F�(�_WԻ�m��\\�K#�dsW<���Щ����\Z����F��Te{�Q*�%BW�sʝ#ܹ��U� \\�K#�4��[5ŧ�Tf���O(]D��JU�l�b�%]D��)WAŧ�U�*�sʺ�����-=D˞R��]D˨�������\0#\0\0\0\0\0\0\0\0\0\0 0!@1P`p���\0?���.��)v���$!	�B�!Cĝ���!�LBiv�O)���s�н3�-?\"�P�!1�qY�e/t�&VP����`�X}����\'/C�}��11=_,R�_#ɏ�ྟ\"��j�碋�t���٪%\n#� ��0��ܕ�.�� �E��G�t�~H6]�A��Kܙ�u��Z�V�k;�	�z��o�{1i?�/ҿ�3��\0&\0\0\0\0\0\0\0\0\0\0 0!1@APp`��\0?�����!5:M������)ut�ˤR��.ȣ)K�r(�����<��WTL�r^�We�]BB��j�B��ꈥ)�PL���Z5D�TBi�v�\Z�\"���Fϓ#�aLp�����{Zz{E�(�Jq8��<D�\'b�g���\0d����c�����6��|h�&*���y\rS��#�G�B�����$f}������S\"k���?K��=]R��2�f(fNő��ȷt�}!4�����1�c���� ��\"��!�t�&�v�� �\ZЋ��(���	:R��{h�B�q!�D�8�SKT����ln�����Ok�b�NG\"�C��n������$�Cg#���L��_����� ����DOE���-?i�}��/����C�\0]�����龯�t}������!�my=�=��b/���{Zz^+��ד&�E�?���\0;\0\0\0\0\0!12 \"Qq�Aa03@�#B��Rbr�P`�4C�����\0\0\0?�\0��\\&�?&�y7Y�7��7Y�gԲ������^Y���7�yf�?,�g��g�켳u��o����~Y���7�yf�/,�g�켳}��o����e��7�yf�/,�g�켳}��o�������^Y���7�yf�?,�e���ݛ�����/su��o����^Y���7����,|���c��\0�/�7�������\r�>_�o���\0�}����|���c��\0�/�7�������\r�>_�o���\0�}���켿��e��\0�//�7��f�/,�e��|���e��\0�//�7�y��)Y�tn���5�q��?���\0@��|��������En]�%���t����_��.�T�sMV�N�l�)fW�f��ߩ���(�9I%Ff�W�զ���n2�m�55522�TjU���܍����{&z�̥YLF�k�6����(�VJ����I���Ԫ��D���Ӆ_��e�{Y��f�}\n`}ƕ��Q��U��s��]���F��1c����,���M�d���%�Q~��e*��ۭˣ\ZZ�f��ε�#d:��}=��ej��e[l�BN/3{&�Z��3i��fjk�m�Z������1RxL����T�}�!𥅙۔���ufq\"�\\C�\'W�b��\0��-	Fs�~���:�R��<z��/!�*�BJ5�M\r��E��+ТLJ)���*uO+��΅e�šEiB��h(��7w��R���-,#*IQ�*�7\Zݏ�44�+AFiQ��)c}u�s��/c�3�3C=8u����x�f$㈧��3�JQP��[}O�Ά�8#�����3��v7\n����	��0�٩�q����0�51ʵF�E���U�0�pM*Q����<��\Z�z\Z]K����\".fjdJ�+��T8{Z��ES)��aI�fh�\Zgv���!�$N4��	��G_^�NYPX����=M�P2�j6#D[*]4���G8����\Z3c\'�iSSQv�iW��MMMH�oؖh�ƴd�V6�B�-��a˩_��ȭj�MO�)�����3��/^-���II.�L��+r�U���o���I�<�ia^���>��b��,L��%9��f)�a�I;8�}����Mx>,b��̳&ߧ��M��z�e�).��-!�s�����|��1I�]W%����ɘm5��������;�4�]��Ф�c���}�v�/a;77tRS��������\"롩����\\9�k������#;c�;�a�\0Q�\0S�c�d\"�W�,rJ���i�R6,�,L��Uݚ�F9���0�:.�zq����b�3��3��+88�t*�F�R+���a�`���Z��Q;H�I+��p�.��-�iФЧe�B�\\*��SV,�U\nT�5dBpmbF�n7��\"�Ȍ�ԅ%L&sg%���k��\\�4L�%��\"��2��%v��p�,�-ʡ6mn�}nφ}�|\Z�{��+I#�%�3΄^e#6رS�s)}���e��\0�Up@��h(.���,2��K�1~�eS̫�23��y�k2�_��_��?Qt6�OA�,���E>\"2�(:�3��F����5g�����5rkQBP���Q�!��Bι��oV�M��\Z��\Z�#�c��3i�7D����5�����_q<\Z���.�f�綗�)7�-�Iǵ�Gė���Y�vm���A�U4���Fz���]8���Ư�1ǡ�1F]M��j�o�$Y����͚��,�Z\Z!����6�y�)����bR�R���~ؔZ!Y\'�͊%\r�hp�Z\Z�L����#;H�\"2�_�u����A�pacy����h��.	.���,�]!dhiv�dތXf�ւ�����4B��)u?�\'����9K^�+K�O3V��fi�Q��%#Ǖ1;���v��R}�w�hiz\\�|�B7����b�>�H��MMoV���R�BT�$E�AE=n�1�ds�$����m�T�j����L�|vx�pљd̥e�CČM���2��r��T{������%t��q����(��d��U�v�������C�Vj���0�Q�H����f)m�C�aʅ.ℓ��%�Uf}a�1�T3�>�IZ\'�t����:���[��\\9�bZ��Ŝ���L�}J�Z�*�2��Ӓ�c�ݜ���$�h�.�m�����G6e,��H���Uٚ�bȴ\'��hiv�;���>�K<�D��{�^�\'�����N\n_��pc�R�1�eh/DR����Q��FI\Z]���ݜ��d�O3�����l��\r�歙FFVl��y6����}i�l��6�]���\\i���[��s�������Ç6rG��i:��_s��x2E%f��ş��3�S�����nM��ʆ��E�J��/����N�疄����=\rMY�?q�3�X�W��4ES2��Ң�����662�+ki�t�E�WB�K�����#�\n�[���\rO^Rn�����}���m4�}�0�|xYTs�n7�tl������%��3(H���Yf�֯خ���(�-T�m%���S=~C�3eR���.���sS�?�.O���*�\n5��j~��\Z��|O����QMT�y_�fa����l�#ؕ����f�s(�b�#�.���B�����J7�\'�V�?������J�n�wV3�TR�\\��+L�L��A�(z�[A.,�JD��~�S�B���3O��C��*T�s2y�r����N����~�i���uF45σ�\'5N�ȧ��^�{ÅS���LWb�����WJ�/�ر�M]�ʮ��D�إ�KKs�QY�K���!�Y����2�ɚ�F*�}Nkh/���P�g��~Rh�;�վ�x��o���\'�R�8Otx���[983%�{����ɳN�����?����r�Z�8�3��1A�}�,P�9���rM���˧��f�rg�٣B�\Z/hu9&�21�u�SṾ��\"�J]�6�?���1�2������Ե����>�]wㆩ��lӃT8Ό��e��Fgk#9;����ث�׏$b���n�~��,��M�_����G��b��\'}Q�6�{*5���n�֞�c%C�?���?b����>��o�e�?j���G���ښ��u�I?�2f�t�SK������QߔODg/�\'O���Dh���f;�ͧ�����_�K�����_����\0Kˆ]�p�(a�O�����*����a_�ˊ��σ?�.ũ����;�>�W&�\0%yP��cNo�u5W�ԥMMQ���+TW5F�nF�n7#y�5F����i�\0���a�Uԧ/��<8R��\0d�W8�_�?I�?�&}�L��������ݣ4�qa?���v��њ_�444f���\r�3K��6K��]�#Fh��3Fh�.њ3K�4f��m^��N�\n�fͨJ�ʉd��ڥ��WRQ�����\"�U#�ڊ8����:��ȳ�B�����O܈�4D_�4D�Ls\\�J��|H,�n�婡�)����R})z3Dh�������ڇH�t2Z\Z+�(��o��;H�WZ�b˵�����%[��H_��T��dH*S#R������hX�u�l�F��m\Z��iu[+t\Z���E{�说�t;]����:uWZ/���{]d�����ӱ���YݥK|�u�HԔ�\"���\"ϵʟ���Y����	�-.�L���Z5���Ф�KG�|��I{��v\Z�K�{}�.�4!*iu����t����������Y�>��iw��ƅ\Z�г�u�����k��?r��u,�l�Zv%���\'�u}�Z/r��]k���߿�G��_�֝�V�Z���J�\"��wV亲wȇb�nd�!���Y\ZȒ^���Yo��\Z��4 T���#��]iu�z}�{������ϸ����u��HV���7\nhZpV�2���\"��3Re�k��˵\'ܴ��2XV�K:2̓]	w�>�k��->����o�G�ӺҝVys\Z���WY�r�\'S#?��7]Ӻd;\Z���TwϹiK�R����6t3�͐�BkشV���e\"=���֝��˵�dng�����\'؍��Է�\0u�L�IS*��D)Нz�wL��u����Z,ꮰ�]����,W�E�d{]�җZv�H�]>�}J��\'�.k�z���؅]��}�{�*\Z��ȭq���Gt�:t�Y��$��C6{\Z].��,�MƦ)J��gWs#��ѐ��}��~��N�DԺ��ѫ�g=L��3�>4�B�3z,3L�r-��JbB� �2h�yfn��>b�By�:�-ҧԉ<���4�U4n5T><�:�r7/&��)fBr�fRF��|�Sr�j�5��\'�Џ4t7�܊�h�j��9dѽ�sm���Q��EhϨ���St>��ܛh��>�2�>�9��E7C{+���G&���ʧF}Ism]�ٽ�����}IRFs��N��f�of�}I��+C�H�����>�����g��\0.\0\0\0\0\0!1AQaq���� ���0@��P`p����\0\0\0?!�\0�t�pk\'�O�?�H���L�_�~e�\0\'���a��z��?Ӊ�H�D\Z�稟�>ҋ��j�\0w���?������?�������S�g�?����2�\0��C���?�����b��v��?�����5��Po�}�?��Lɣ�j��P� �\0C�C�i�S��C�?���O���G��?�>�k�����>��\0�}���\Z4hѣF�\n)��УM�觍?������jQ��aD������Rn\"�ኈ�O3;�M�ŉg��A�����A�*�/�[�\Z�/��O��Ǵ��&\n��;Ly	_F\rϠA����\0�~��M���,�F�NO1�9��\0��#ȴF-NTjPfR���ﱄT�i�Q����vD�f�*����we�A��a���̥Ĝ���JU�.�s)!dn`9�@u�ᆿ�qחFlJ*Q	�ؘ��j��2���rE��p�n�E��h/G$����D[���,�|E�W��|��m��\n\n�� ����-L�gQ\ZYz�v�݁Ĵ%�1\Z<��\"(�_���A�2�p\\u�m�d?�QY���O�P8�\"��r�%�r�^#\'��٭��f+����,��/��/����S\\E�HT15�b�V��3���\r�2��8�����#�����\'����\\�\Z��w���\Z-���0\0�;�Qnc-�&«9쇊���ŅY\0Mk��3�cTe��Vߊ*k�aU��p��9��c�7F��ԼTp���͸�{u��Z�����_�+}�(1�u��[�7�ċU�,�_h�$��g/�D\0$�`j�fb�G2�{�>��\0Z\Z�r����ъ�*�Wi/5���>:R���w�4��w\rL�պ������꽍G�P!�la�S4-�/�/u��JF�#8|�hY�5�F���\"/;�LU�3ߑ�g�V�MY!20�PS�.�=�!\'B�XJ����n���p�:��<�A=���p�i����EQ���YR�������3�AX:�?0]`B;J�<�Ҕ�H�YdD��E��I��IiH!c����^EE�D�\0�F�BǙ���3�\'���1�F:���F%�2����2���x�l�rWo�tkPv�g2�o�z\\Y�;A�ō��L�כ!s	^���j.s4���aŲ����J�T�+2�K�-x��B�rT߁�-���,B�\Z��F��(\"��A�v�����B�]�1`v�Y�Kw�L��wXLP6�9�����1}�%�҂V���QU*/((A���\'dP�w�{�#ٸ��ģd)����,�W5j&��G�ǩ���Lq�\"�YDy��n���%`\'*f���Ln�>��o̪\\�f �)\n��:�6TAh�\0K<L\n�N�e�Y��O�t{D\\L5�<yM��)�9��L^`\0\"ǒ<+�E�}���U\\3�� I��{�|�(�WG9cy���f1| \Z56J���5!�\0�����̹ފi�d��y�\nn\'8&WȨ�sG3�x�b�&���˰5-�}%]I}�p-�����j�X�4�ĸ��#����0��vM�1�8Y����\Z\n=�A�JͰ�քb��L��tM6�Lf/v��^�X}�M�0�AJ_8���|ަ&��!V/�wS3\0@�����U��5�[�0�5�[��C�+���1+���*|�b��i8���d(�8��=^a���$�y�	/X�bA��*�bS\r9͗�;��\0L��������/p见<Ŀr^�-����W�2h4�cߔ�5�5��T�.�qU@h��P7�s5\n�&.R�4�1in^61p�&�V�� �w��ܹt����\n�O�Y*�!����~qy�W\0�X&�Aa�[ku��D@�p����R�^6�ҕ��1�MJ���\0�1�<��v`���+�*=)���;[G�Gg����e\"X\\�Х���p0�n`�+�y�`oT�;�$܊$ʹ\\�W�0�dB�%�9M�}}b����yc�g��}�*#��%c4��g\Z�axG�DoC&q�K���x�I�.��Cv�C⻰Q���e��L�W���26�\'��_�a�et\"_��r*%s[j�5y�:�4c\n��X�8&��1��L3(������j�P�p�%�Z�yA�h����M�15`�2�*�X�\r5	�>`?Q�w��t�r�SW�c�<���.��փٸ�ܪm9JTj�7y~���.��@֥����xS\nɼ��$H��+̒�7X��b�����i��$a�J���Ol��|�\"�BQA��2�A|3G�F���0^e@���Xc��S�����������r����$w)�2G�����Fˎ]j�%���ާaG���6�ZsNGJ���r�9\'SP�&&Lp�ZA�-��YK�e��Z�Cmޠ�(w��a�]�5)���2��R�U7��\0���M4°x�%Y�==E��0B�S�=��\\��W�2�o�*���Ϧd�2�_��\\#��\0;�s�ǈ���b�.��?R��dD)�\0�q�3m��ҬA�.ñY�����tf�A��0�L(�amǉ�������X��G���K��Q.�+������\ng9ʙ���r��;1}Jb�2�a�O�\"v�^���7�ƪ�e�~�W�K�%��1��+�*<�.:�1�rԱ����=i�Lt~�8��GF\ne6�2�el�\n�uf�ĕ��d/��-\'��k�=f����DgDx�\'�\"/�/�11E��Uv<K�I_�#<�M��e����eq\0�s�;]>�b��\Z�Ǝ�2��ʚf��I�-7��\"��D�	f2Jy;��k��JCgl@��vF�����+N���OX�)��`R����ڬ�--�0��1Վ�^���V�K�W�a�f=��<��PqnT�O�f��<��\0�Ot|��;5�3Ŋq,{[2��D�s�!����{<E�Os4���}�0W��4&RWs-�ǍLT�/�=��C�O���0jr0u�2�9�8KYM�\Z�bV��A3 ��1�?q�1jj	h�B,�3��BZ9����<�E�cB�� �	e;2�\0V���w��?�4�fs�����J~a��l�rQ�U�xPB�i����a�1*���5� !����ʌm�\Z�� D��0��<�����!���#f�ުp��=��֍L�/�bp��\\�;K�qLws{�A�˔{L4S�~�a��i�^HϜ�����\Z�#��Je�,���Fkg1��|G���W�f^����Z�0Gr���4�l[;���͑��F�x=�q�iuhz�&��w>\"�Y����1���p\n��=��Q��*d�����!�}b�	r51�G��������q�%�@���w��ѿ�K�/�;��+��}�#�F��9߉.\r�EQ�kS����|J�H�8�\"�q0Ǹ���Z��:���G7|I\\3��9Y(�L=�\0�y�.\'�+QE����\'�(���<�L��f����`;�3H�2�F5/����Ԫ�&�D�8H��U�)�����(����L�H�_�迂�Dm=Ft��!xX��2੘R\'WO�ȏd���_dB\nӪ�\r��l��r�(�\'k��L���%[�\0��Ӧg�?��$��B:\0���P�Ѷ׹.B���!�����>�|��1�>P�bW	��/y��F�e��D\Z��Tw��Rn�!]GK���\\%�Gꅷ�EB��F*�;~\"ҿ�����_]���N��İ}̾Q~�j#$���d��.SpR6Vd���B��ϟ���=�LK�ق2yr��B�Y��GĦ��e����y��]@��i̭x<ť�:��8��k�˂$��u!�rT˻B�10�L�cr���1}��	�g���c�a/����=+�n���k�Q;!��7%q�?@��\\ʜ�\"�p�<{�@{���h8������q\\���|6���:\Z7,�N	S��ɜ�c\ZF5�#iJ��Lw�\n#�;t7���E\Z�Ll6AM�����KZ���/0��kA.@b=\"�/������g�9�߹���ˈ]����W��SsH�+q1������x�/$�\nW\n$��g��ĭ���\04W��Y��\'p���S8�W,��zsP+̬�̯�����led�\0f���q����w��Go,g�8~����bp�7��,�_lD�/�ff0�h����0�R�Jƥ�]�7��-��zn��UY������Ma��c���f��/�cG*<LQ�m�r)J�¥G�VK�H�\r��.�F�3��Sr�#k����H��%F�� \n�^���<^f������|��&��y�	L���8U�;��M{D�^n�t�U�*�KL��~��C�\"����	Tܤ�}B��6�����(A�\Zv9!}�wU,�����x\n�#�X���8I�4;Z�b(<ˎ�}��e��\\/���v#����fMdP.bW�;*|&G�x|̓�����۠\Z3?����I���Q�ܼ~��T$8Lۍ�c�4�1O��..���F���S�-R�_Y�?�O��B^�M�B�2 @�,�����3�<�Գ�6���b�f�(C<���3j�_�١�e`�XŅ��R� ����\r����߭o��02��\0u�w]b8���\0\\[��rE ��#�)��-��4����mFa��ah@3��-�-=*^%wI��D4��%u�M{�[����E���ӈ�tt)OQ~�=\0UTg��/Y���\\	���+�_�y���C�KEE�>%��1^%b\\��=����������^��~�n�J��\0M;ļ��	������u»�+p�an\"4�b#�`�� �}�#�)�y��^��]x�	��R6K�\n5�J#�2ΐ�Ǧ�fz�0÷�����܏�J�8�����#�p׊��f�Uzg�*d]z$?r��~�-�;�w�Ҕ����O�<7K�0,�y�,�s`�r�,XfJT����a��g�mt8�8,�9�<���\"�E��qb\\�*E�˨%X���T\0hS��>��h>��+�|D��ޯ�Ž���֣��Z�a3��/d��u`Gs�o��nc�C=�N�U�Y���\r�Yr����f*e+/?�al��APf5k��\\f��=�,R6�`����\rK�\\��F�~��4�s�&���b~4^�A+�c򿈖��鯥������}�R�G��eJ�g��<��j~�5uЖ�(2��]2��k��t<��`F=������t_7�ľ-����5�����^!⧤Q��,ݾe�1�����b�QW���W��-��	D��[뎹@e8��S��n�V��O��&\\�\"f�\nɎ]���Ҽ��Ee��K�0➦�e���/�2�♊w�\'y���B�������/���8B��5pC3���A#�_�Ƃ)pE��q.��X�����E��6Ｊ�T]8��9�����0T��z,������&I��Jcގ��b\'l)W�?ü%��=��)�D4)���5\n|%��Q��jp1��v�eg&���<f�U>���JM���,%^�1�fm���}r[�c��OMz娺Z��М����%���+��\0v�/�_�m��8�6/�s\Z058̮n`�OR�2C����%7�������s����9�]3������Tרz�Ƌy��]�LTS��,�^\'/��8�\nb�̧f\0%���9�î����0\"eb�ϕ��نV|��q�z_ ���=k��Y�1c�k���1X��(��4���N	m�j��S�7]+PH���9.�_2���u��Ғ>%8T@��g%�^���.��kX��P��`j�J$� p�G M�&��\n�c���f��_G�(��\\u7��YG�\0��_�N��a1+?�@��\\�Խ\\.%8����<K�{��lގ�\Z�b�-�h_W3�1�2�TʹfeZ�/\0�N�08R�EJq\Z��qG���e��������K2�B�1\n2%�V%�w�h��X�G�\0j,!�K\0Е{�$[3��҃��o�bP�裿EKT�U;�*j9�K�!���<70e!�*\r��l������s�Z�w����Z2���T���5L�d�8h�yh�^��]��W�L�����������N���3��._K�˗/���[ݖ�˗.[�-ݖ��we��.\\��r��\\���yin�v[�-ݖ��we���廲��n�v[�-ݖ��we����n�\0�(�R��i�	����?�@�Y�v%�F���j���\0�Fh�����?���O��T�h���}O�JL8g�;_IR��ms*��D�-�g��{_N�hgᣰ�v��~\ZyS��\r�<���I���4�h�!�ȕ�`3������Zg���[Dh\'��YQӖ�\0I�i�h��W�lյ8�BY0�P��6Eh}0X(qL|��+Ȧ��?�J��P�A�a��f�ψ꿸jjKDA�]g�@PN��p���}��S��!��x���BU����=GU0�G�F��)Ic-���9%�p\'1��1\Z��F��S\\�I�^�r	��J�8}A���2[jg�O�(���h��h�)��,�i(fZ?��j%8�y\nUwNJ��2�\0(5��K5A�\\S�y�d����x%�����-�A]K��S��\0�8/p����1�B�&O�ܰ�`�+\'����$�F�������|~�xf~�V�B��@�����­x�J�U1Oq����*�~lt����!n�	�%��l}G�/`%�a3��v�=�?�J\0\\�P�b��r�v�3�p��+�s\0��2�d3���L��HdbZ��6�@nL�f�Xu�T��`�bq���	V���e3��Y��OH� �:�L�nf�\0{�Dx%��2����D�2�\0i�7�������Y��0�\0�i����1IAS�����E{|��1fago���/x�������Q�I^�g��y%�C�U�s�A+;�+�fi)���z���≈��}Q�>�tZ\\�U�)�Gb�MM�&0�� �f乚�Lkm%�Ծ}��>h϶K9�=?h��o��)�&�%���TRՃ�@ѹU⒅G:�a\r4Aa����3�J���W�;G,�!l����v�V����F�xE�m Z&]�H.�E\Z������|�������H_�+j_As+.2�Vta�e����U��!�n6$���v�\0�cW�!;��3X?igaH��\0OR2�q���_�w_��.^x	5����Ōcy�A��Xi�~������M��9@���.��m�4,���UgX��h|n6���&���.�~��+�;���4v�[�Y\0�*]�Xh��!�;���6�s�E.3�a��u���B����4]9�����.F(��?�:�ɦO�	��)�3�&vI��pT:s{0.�\nn,��*�pC��7�ځ*p4�8�R��#8�Y}j(�-�\"�.��}0rK\r��q	x�0^��LXI����ĭ����#US���xf-��=��qр�̀WR���4�qi>�(�@S��k��\0�b%��,)�<�ҧ�,X`���ǲ ])��5��R��30������K�KD!x��\0��%�PB��e�0i���T�+�F-Y�FB��a� ��tN�}@.�}�����T.��@T�nf�1����pQ��1}��y ��U����K�1��2m#��[\\�i?�_�d��m�K�(R�QBͱ(�Q@\"�\rˠ)�+��.q �b���\Z�.q,��T-j*W��I�V�?(&ʕ�@YRl�3�m�C�����\n<�zS��)�~ t\Z�}J��� ���V���c*�F�z�E�4j- P�%�%�|��\n���1HɁ�&��+��]��Ɗ��~�(ƫr�0#2E^�J�d�7���4\'�{~��{p��������%��\0�G��p�!��lF�^fFX��]2�a4�6��;�`J����	�1�=��\Z[?&`˛b�(h��䜘�n�1�ǩh�����w�&�ܚC-��FX�Q�}�6��yP�p�0����\0�߯>4clq|��K�ô����`��~N6Hx^�5�PS�Ws2�{��࣋�����?)?+\ZS^��f�@@G\0�\0����r��,���2ػ���h���C�d�r.�{�v�K�m�~R~JlW̽��)hrO����?�3_ߟ����Yn�?5R�UV?3������\0�7��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���K<����l���i�C0�\00��8���\"@o$_$��\Z�	�C\0\0R	 �\"m -ఔ��,H�2��\'U�J��6XwC+�_�dm&��j㠥��ހ$CGh�8�,�h��1�hA��V��bI�<h�K>k�ЊKc�pyz�P�D<\"3`�1%&�`cƋm��Q({\rG�� PB`a�d�D\Z�}� �P\n����,RITiٕ?$�����d�l�Jl=\ZAץ�`�\ZF 0���!PT��b\"�+_��Hӱ����4���\Z=zK}`�t JA��q�`�ȱ�\",�8��ϋ̫�3�0�\0em�\r�|\n�eh\0�a��D�,QM\Z��U`d�:�\\K0-��.~&�2MĂ0T\"��2�/�ꝡ�;e�E��\n�� X`2Ȳ��	?lr	\'���~�%~o�6Ac��΀�(iA�c*���6�r������A�QMj�\0��S�fEnS_`i�q�Nd���$JҺR�ubGP��cks��I<���YYq���@����4W3��{Ϯ��5�C����l2��i�ц$�X�إ��i���u��E ����*�(*,\0CB\0�0�0@0�\0\0A10\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"�㰄8h\0���\nc�\0\0\0\0\0\01	���59eX�ƕ��U\0\0\0\0\0\0e�]�S?0�A�9$�#��f�;�\0\0\0\0\0F��T����P8 �^Q)9�p�@�X\0\0\0\0\0\0��)LW[�������4���6���\0\0\0\0\0A	܁¹._��M�\r�r�$��=�\0\0\0\0\0\0�0C0�0@� �C\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0 \0\0\0\0\0\0\0\0\0\0!1 0A@Qpq��\0?�\0?�**)QAi�C**/��j��X���t�`�*��,\'�c��h�M�5��\r�cT�\n���VE\n���\0D�-\n����B��)H:p�.xB�؂��1	������Cp>B����l���A��X�\"h�д*�Lh�eŽl[\Z�\r��\Zt��3�8�3�\r��ȭ��4��1�7�0�V)sgX���Hml�yWD�u��z����$��t�R��v.A:��:8bX2|7D�M��&�e\"Щ�1=���΢bTR���	 �| �ĩ\"�HB)(���a1�<h�Pn�	�&DH&�����j~�È�\0�lJ�IL�\n&\"\\&&-�BD\'���lCBqFh���ȚX2���\r�.$s�XE���bpI��Y��bQ�{�d9��R�0���M�)QP�#�ش>�-;����\'�J\'�,cBL�˫BP{(BI�6HA����$O+\n,\'���) ��|)�%���a\"\"�2���7xy�\'���)DY�h�$а�Jz�\'��~�2�A�Ē��<����(�p�K�/�^�\'��\r\n#E����\n,�-�HyAk3⋚6,R������>����?�����?hU�^V��,^W�\Z����/������\0\"\0\0\0\0\0\0\0\0!1A 0@PaQ`p��\0?�\0���Z�j��V�Yjǌ�V66�Zm��Y�6q�K�!�I���#!\'�0��K���Yl�q�A侖Hߒ�n��o���\0��K>��D��~�H2k&^[�-�D��𰷟L���>[8�v&\0�F���2e�������	����%�\'x16Ƥ��l�&a��9�˨��<��z���I�;.��lS�g}[���_x�f�ibpL;b�P�׻B�ΠA�;KSw�̃[o�? uµ�d�m>_2�OV���r�{e�-�{�c	6��͙�Qu���ںX:�c����oY������ n�Y�K��W�����ka6˴$�ë���rݳdH�����[ŵ���+;��Xs�g:l	<��+IL�ɉ�Cu�C8�p��z����S>��N\rK�nZ�[.�m;���p��,��1��5le�\r�� ��KP?b����� �tF����s���t��\n�fu��94��.�k����aܶ����8!ry<0��m��V�3^�PAe�p�&z�f:�\"kǍ�f�Ze�o���<�Cl�S��z�#��w��������lXmYŖ��;o\r���aoS���x-��٭�IB[�� q��^ɖl3�f�߲�;gQ�rFGH�?O�=�	�E�~3y	�����l2���_8ddLp�x/pYy;�K����/�c����Η\\�/+��2�\Z�~v�/o�{�[���g�W���/}G����Ux�=�XX{��p6��|�rWp�m�t�!��<��}����=�>]��#��o�^�u��w��-ٽpy��.���=��\'��ټ1����}��#���>ϑ3x�=p�7��6\"BI6��w2pw&�85>Yd�ydG���s�\0z��\0-\0\0\0\0!1AQaq���� ���@��0P`����\0\0\0?�\0�9I��J[ڌ��.1`����@�i���0�@��>Ij���e�I$\n`s��[�d�!>���X��P��#q\\�|��驹Q�U����N�cF��LS.;�-��w�R�ċl*X���v�t��n0��\r%G�B�5㖂ǟ�-�իV�Z����N�w�z�x����Q!�̈���djT���\0AŗM�f%Ncqč�`xe\n�Qn�ba��`<-�g����/�׼���e����TĻ���S�t��(�\\S �5�mơQ����QD�c��Nr����Z��]s:Ϊ[�LqG\rȀ�#���8G��r{������1h��q����d��ƞQB�b��H��t�^-��M\n�\\Q�/7!b �� }3k�;\"�tU	D,���m$�r�G������ih7k\\�;F|ԻG�t<ʥ\0x\n��<��18�5D4g&> �P�署*�c�#���Ļ\"�\n��-4F��T�\"�p�Y�%#\nю�R�W_3��,����\\���a��~F�q��I`6j%B����rҍ��ʻF;�F�3\r&��O��sU���#�+�)���;\0���LB8��܃ޥ lL�I��\r�5y�S�u9�Z\n���~\rj�o���\'��E<���1�&9�2ف�W�@[�1���U�D�CQ����\"��2ˋ^�O0@���u����\'ʴ�	����L,fƠy��2�b��6��6��}�H���׹f��).\\*��U(�\\Xc��EcwԪԤǪ��+K5~&�\0�R��R�pjmr�	t;�(�p��b\\��\0,�xFr�d��6�(\\.�S!��m*@��6Y3���ʷ\0\n0�鈍\\2*��n	8�j��?�;@�����a}]J���#`h�~jy�R�$���Q�*nO��C-���QF+U�~���\"�aT���;�*򬬓$���0��,�\r�\Z�\'R����1���þ�\r<X��t2|R��4]�̢6�5Fڻ��S\"+�q�\n���\r���,u����lrb�%m���]:�R�W����d��Hj�����Y�N	����jR���-3ܸ퉑�r��8�fb���mV�0�B��dYg�Ѧbth��{Al4�0�b1і%H�Q:� �ʪ/��=KF�N1+J�\n����ĭR�l�FGRV��3�B���@<3X#�\'Y�@�~�\Z�4�`Aѥ�@#|��`<�3�r��}G|���ąJԽ\0\0��E��f�-����w�\'�����P6B�x�^b:<�>..�ks�%\"��(�c�1,a+���uX��2�\n��:q�F�\Z���5}�ì ��	@s\0��B����� C�b���(�O3(��\r(�������&�3¢!�.��%%�,���֠zܣ��ss��,J����	�ن�f�\r�`�\0�ܴ.e�����*�\0��֪�`���F��1`dn*�5\r�\Z��l%�JXa��H��NR΄�lґn��Eӭ�X�ӷ��6B/H�\0�+}K�vK��0�\0\'��6T4��p�2�d��9�h�\\�2B�`�0��Y�%q�,j�@�լ�b�\0pH�laX2g��Q\Z�8�\"\00�=���R�\n�\Z�p\njس� h!.;1�K�47�� =�]���!��l�� �s6�Q6��c{P\n�Ddq�����Լ!r�\r\"o1G;�ʑE��٦8,c��@\0^�@V�3ipg3@ψԃ�����\ZM�����(s��E��7pm�\"��^5>7*l:�K䍈A�f-D��eV�.|�\"��̥��Q�(��eN��(�wIh䂂P0�X���=cs���.���*qU%(r�]SQ��fۇm�9%�&�B�5�Q����S�{�ߙ��Nn9�1���t\ry��9r8UP\r�8�2�)���L�t��f�}�x�Eb�����1KW-L�\0E�%�S��=$�!\nx��`P��V�ƎS|K*ṱ��mC��뗸�.��e��� -\ZU�P�\0�����I\\?���h����K���m�2�>D@��%�����qlN��A`\0Ӑ�TY�,R�e�$�W���b=�\"Ȯ���O�2���Ľ�~�풦b�ϛbs��	fтl�\'��j �Y����\rJ�(���-ޮi�,\ZXHb�|�f��q+Ws6�L�R��_�yAt�C�Y/KR�<LԚ��o��p�17�Ⅷ/�\r����-¶^	o�6�D ���Ca6�#�쮴*]����B�������@u|�*�e\r�7̸1\Za�#�rS�o���M2�\nX��i�(@n��L�GPf;���\\�V�+*���O���R��`��eL�1zl��SWA�v	~�BBQ�Z��p��N��LGZ���������c$���$��R�9�p#��ѲCscGp�h\Z��_��-�ŎS��;2��hT���m)V�5@��%�C�{$x\00��F�\Zf�<Y��f�-N$��<h�&\"����@lW$nPY�م�pZ�����0�b�Q�6(ī�\"��G�a�	T\\\0]��n�D���,��Q����P�G�;�1��ly!Q�g�Y��q\'��0;�)��UDˡ��}ALw��aX���\'XKͥ�3Q��(�������*�u)�o`D��N��vF�������t	J���e!f��ik�\nU�	����A�p���U�e�-��p�w��xE��d�\nl���\"NG�����\0e-:͖��C���8�v��F�[8��&\\�G\\3��w��]�./p��s�2�c��wQ�{T��\n�>�p�9��\0����͹i��4�Ӂ���\0�h�U`�Q���\r@P_��X�sس���їt��s���* �dJvN��\\��;��b��>Iz�^�mM�%q�� �\r�䔭�X�TMC�`�h<��}J��˷Y���R��Qj�ԵKa��b\r0Z�Ǩ�������dp�x�b��(�h\\8H��!��2���c��=!(����=�ĩƑ�D\'�*����Բ�g�#�V�ar��2�FO�԰L�ƏJ#����@V���(���c\"$[�Ho��3}A��X&BI(�l_���e�j�.�ʜ/�Gr*\"��RZ҈vTZ�\0\"�G1R@W�e����%���	�W�3�oq�B��g���o2{r�\n~Sx�z���P�Q���+��R��� \\aQY5��)�tWR�	Gj\\�V�˙ރf!W�F���f��&��G�`噃\0�u-����\\��B\\���ߛ���A�3Z��� w#h��,rP��`)��e�o����R5�L�G]K��	YW	x\0�xN*�ͼ@��\r���\0V�\\!gd��]hbV�X\nz*1j�8��9��0��]\'�۸�����/f2�\r��N�*3�R�����*�Kn�)��T�B\0\n��l�.� +�3Ϗ�q[K72�!�_#�,����k�3\r�\\[���U�1�Q+��j���\0F�0Dh���I�B��\0}O��q\r�����K|�啖f���\0���lh�\'<����Co��d�[�C�*C�腊�9���\n�9�J��|�f���8�+����^���(U�\0Bb�u,&C|=J^��;�X�7�x��q��\0�8���zJA~�\r��KU�)�K]ҧ�gan�.f�81�͚�l�k���HV *d�M��(����^�-�.b.�s�Ps�c���dͶ%��wŕ:|AMD�ܧu�\n�x~b��F�U��^��*Tl�a, �>\'���Hʊ�♌�[�b:�!>G2��*\n�=��\0��8a���ʗ9]�W�� ��}G�j\n	}1Ȯa���ic��	�ˎ�Usn���3���2���XÂXt���{u+2˹����=1�[�����^�2�1N��qXyd@r.���b#k$R�P��%`��WN�h��QʂY5/$i��&18{`�\0px3i(���`0v��S\'�*\"�ʘP���.�o3�\r~�f�1�ĤJ<�E)S���2�H>�\0Cq19υb���L!��1|�\'�MJ�GLH����\0�%�Ƣ�����2�nv}�=B�،�ט�Ms���%\rL�3\\n�V��K\0�cR�����ZB%���pZ��	RS��6;v�.|�_3)vI���2�����ٙ��J��Fiτv^V�D�DZ�kh)��A#;,�\0�b�F	⠼W�t#�˒j���\n��*�#���;�!�M��ՑɜJ4�%`UJ5P��(&[�X�3��\n�U��\\���y�?0@�q�.~&��j|Bq�jZ�˗Y���Tp���H&U^$	f,�ptgܺ�h����K>�\0���[���Y[�eՄ��P�G�cF:#a�N=MP�,R���`&j����}ۢ1�@�^��e�]zV�9�P�~b�No̳�K*�\n͐IQ�@��z�B�%�m��3fS0�f�Aa�b9��E�;C�;��y)�7_�8���VK)�H�(-�\0�X�]��Q��ٗKI(ƍ̌�k7-{&�L���z`3+�*=���D:K+�� a�0a������uR�32J,�S&�S%���3�X������ہ�_��+Ԥ�c��%lD�*K4�G�rTv�^?P�\r,Ә6�cvowV\Z)jr��bQ�#W=!�X�VP��*��;�f�]���P�\rl��cpV�$o�l�<E���9�YxK�Z��WűQ�-Z)�4U%�4�L0���MN���|���9|D*�p���L��It�(P�p&3���J�ۮ�r;��R&�\r�ʍ��\\�����{ge%�lJ�[-�a�J0��c�w̮��0�_�f,��r����(��W�Q�\'�v�\n\n�%̫�5��Wl�)ϙrU��K|Oq��Ե�K��r��Mj�l$���\nT�+��/	8 =���d���\"h �RV�hM�F�����#�Hɛ�K���	��Mx;p�n�\'��J�0��Ȁ�a�\0��XO*�Kl��\0��[5�����fr�ݥ\'��y\'���.ӆ^7�TK��m�+�T���\r�X�c�n8��Q�:ќ<J�rɿ���E*ɞ�Ip�A��N��\0�>!�9w\0҆��6\n��@�����c9���̭��p�����/���l�Gl�J�NEO���݅�;�et�mQs��%���n��}�����=�W�\0b��8 wA�,�ĸ�m�_0�m���]��q\r]���K�ax�o<�\nIǉ��GP*ȽM:5k��t]F|ʌ�j�=c�*Vx�u��+*���i����\'p`�c�o��]��u0�g1זU�R��şP�[��������y���\Z����^k��	�,,,���-�����::�@Y,c�Xj�桢+��j�k�.��>���b�D{�.�l@ݣ�BP�IKe�<QǨ��1\rv*���hT_6b�Xe[\n;�K��]TK���sD|�-ɦ0Z�	�\r`�g�����4�4.��{�<���@%L��^&M���XK���\n�-�,1o(�*��p=݈txh@Ԝ��	j\Z�R�?����8D��I�i�j%�\"1#�pM�&�$�L6�pb-���*5x&�\ry�z�Z��T5e��(<A�]Rf���)�\\�!���2}0�=� ���[�\Z�n\0�����\Z�B]�J������7.(9��jc l#�l�D�:�\'�se���;b�.�!��Կ��@*�gܰبK�`���w1$5t���7\r��Xg5��M�@��0�>%�\0u��@j��N�ĹƠW�����Y�G�̭��P�g�9��Y%3��(�c�/�㩄�?���=9�L�D�k3q�G�mg*!��&/�Au�?�?ˏ���_$���J�����|�`�b�IV��Yh���� �a�V8�ӆ��Ќ�(\rZNfW%�mߐ�:M�X1v.+�\\F�`q>X3K��@o�\r,�\0���Hp�A�H>\r�\"�[k�G%f\'�H#�2�����ML���Mj<��˯ܸ�?Mʴ�Թ��|Di��Gr�/�\"���8��+�8�-UFnHg��@�w���S0q�r��s?���Q��%�̄�06�8��vOH�S��|�GQÊ�. m��9�8�GQ���[�il�����Ą���\n�7~&�,S\n�#�rg\'0���+vF� �ܺ��)C���\nmW��:��D2T�PhZx&Q�m<��T�E\n9L �`��KN��4�(��M�R)�,M�0FȦ����A�Y�@��#��d����RPTp#��[�Ky�w���eGQ�\rBm4b�s5c��[2\Z�c�����X\n��Ĭ1��6-� �r1 �Z\"7K�@\0�yw�K�0��W��&��X	�N�`Vڰ��i�X��2�r�\n��x��5\n� ���2��=���9(��ʰ���P*sRݯ�A�3?@VU����U�m�N���l��\rM�̥�H�ݟS�p���.R��>6�qP��rF;�;��8�_R�>%5(�\\�z���� wwC}�ߤ4�(��Ȩ�<C�E�V�!~�-X���d���$4T��\0�j�E��(���>y��r�z�8\0��p\n����e�a ��$��A,�1����`�0�K���/�%ʱ;l�\Z��~��GL,AJ��^+`��)k�W�ЁE��\\3+��-.:�4����k,A�S�\Z���͜ʮ�\0*�2��ᥘZ�\"W���:�a4��wR��`���bVo�9ح��Ķq�{����S���&���`*����,�V�nY�Q��>�Z;�s布��Dr��j���+٩A3�+dsE�/��R�)R�J��a\n���k%f7��S��B�N��sm���:&�\rݫĠ��a�Tβ���%��̠E>�_�+�F����!�R�A��i��2���0jo��\'�VG��,e��,���͸j�\r̡o1`�������\r�C�*trE��*q2ϘrE�z��\"�!C��Z��4c����P6^qTXV����V�R�4�Ŀő\r�q�@\nR����c/��0���������l�/�!P+R��ȯX��ۜU]�8 ����Ya�&V�1��%��t�-bSX#���D��b0�&?�Ci�3M�Y#ĥ���Z6_�d\Zq����L�)@�F#�w��\r|�;D�3q3�+�Ƈ�Ko�he�W���qv�Rˣ*�q��\0�J���UP�h}@sj�;���Ԝ�{���6��C��Ep��{��IO��\0��?�w�\\Ǖ��|��3�����^u�ǀ�D�Ȏ�yw�NA��h���G\0�ףr���3-J8�.��l2��p����*9�.)m�}�l/~b=\r�p*�YsKqj|�7*x�B�Ÿ�&��L{T�G-~𖧹j����R��iP����joi���1^Ah\"\r��13!��������`�X�C�	 ��S�A��빇��ȁ�Cy\"����#�˱���+��5[/|�=}MM@#=A�,�K+�G���&�wT\n���ʸ/�j�iQ�x�����g+��G��0Z��x�\0�����H���i�3�r�ɞ�Pc�e\0�?����)11-�YJ��+r�Tq�m��Q-�5W��@.��x�?�-O@?�\0����q4�l~E�\Z����-O��\n\r�\0��0�!�Z�s��~;�Fg��F������\"��2�Tƣ���E]G3�ChTFh��K�S�:\"�G���	=�%��\"x\Z�,+1��ى���1���=��^�nd#I�z�����\0T\n͢,��$��)Z�>%���_̱�^�s�Q���z���Ś�,2�}�\\ϧ��(�;PKv/_��P�*H�)�ʱe�rcӿƇ�x�^&��`����	��H#S��0$�%#��PZU�&��f\"��PPZ�/,O�cc�p��p�r�L���4�˼f:��f&a�%L����q~���**�M�(81�\01�r��2�\'8�\"+J`��GF���A��Ig�	�C���2���;�VvJ�rK	f��r�\0��̿����8ܢ}�)����+�y-m�b�`�h24����`P��ů0�ܵଵ��\\N��;��ʔ�\'�}�;��TPf8�!p�p ?r��:���s\Z��Ib^{�P�ԩ��j���3�^e�3,���j����V�\0 t�H���hT1�r��\Z�F�Id��s\'��I��)�S��8��4 .�\"YH:�B<�Z�f ����=\0�T���*59�x��S���S�U�$�\',�$3@��JX�R�	������oP��58�.5b���Q-,,F�J���.*�ĥEF�b�\r?�M�Bk�(�l˦2�Ws��Q)�o0/6R8q��YbصG��7�c�Mn���m:�:!m �\rͥ�e��KFe��Plp�l�ԩeD��P�ۗ�]��M0xF�S�F�|\'��]A�� ��Ly;#��l��G�w)Y�J�k9�w��=�Pbb���l�DEdz�Z�ƅd��R�*�?���;%�\0a�<�1n+�S��UdyGj�a%��=����ʄ�de�K�͜%\n߉�=�+,K�/�����l�� \"f�pF��<�T*+�WԵW��PE\ZNYA�1gg���B�ЈPou4�l{�7uD��x�R6�&;����MB����W���0���F;�Z�\n�wrƝ��1\\c��T���q%��b3�`{P|�r��>fٱP�\nx ���i^Xg�R帷��QB��y�W�8⡆\\�(�z��d�K\r�\r_gp`[�.4爁���ψ��<ˬX� ��a`��Y�BT)�w�@�\"ce�+!��,���bZi�9�5U��/M?s8�0UQ��@���9�q2��#�y=�O(Ѯ#X�r��^����jd&]�P�ʪ\0�u5zQnpV��3�K5�0�z���VH/)�<\'CҊ�S~���\0����K4�3��A���\\4_r�dB��8�ba�u[#��\\u���@�Z]�Ao11U孑.��B�*�w3iU��DuR�\Z��`��ǂJ�ɀ7^��`��^�[mMB�b��\r\'�#/@CG(-`�i�9�w*��jw`��$Q\\.Z�P���\0@�,zczK�ʘ��0�zy�����\"*BX����#}�b���XI����ȅmL��	�%�\'�q%�3gc�;$�p����W5..�)tS�Z�������H-r��yx���Hk�rn!A��`c���Cq��-%z9�h-�)�Qi�@ˆ�*z*hh�����K\'��f.��N\Z��B�������Pu�k�&�U��^�=!��s\0/h)�r�)�>L�e��)�e��Ϝ�K�.\\�r�?�J=����~�#�x����������7.\\�r�n�{�c.\\���\\�/{~��~�~��~�(�<���\0q:>��=3���3���\0y;��\0q=����)��?��������\0a?�E���_��\0r�\0�	ne���>޿�J�+�\0�8����C�1��J�X��U�\0�W.\\��V�1��J�B�A\'��pfG��l�\0�q���i�w�S�m퉢��%7���\0B���h����t�ex\\�\0`�(z1��\0���O��\0�,���ځt�\0MKP�0��,�\0h��ҟ�<blQ�c�����*�&?����R��y*jE=2��\"�#�OY�X�D�*��lA��d�����|�D���N���)4���Y�D�\0`�߸%�/DO����	Ev���i��?�\"��:�ť�A��é�BЀvF���\'�����,�n-V�i��Z�;��E�C��-\rH���TE�^h���ehx�(�p`�^RA�#���Y���n��ԨV��E��`��\r�G��oU�9����G4DT��_�)�Zo2�р����d�Sk��\0�(@;�w��jj�T���q���m�<�����>���A�C9�.9�M!���� �5ɢq������\0�L��#ѦgE��P>�B[��!\Z�W�v�$��	��� ���\nQ�7O��Ǖ/�wi�eS�\0<Jc�Œ���A�!�aR���R��q����!k�x��c3	r����Pf�Y\n��8��iy�D>a�[�Lk�[��w�e���\rPb���aC��W���[fb�K�^I�ts*آ�!���E�\0� ,����1h}Ě`L��n���Tn\n�\0a) \Z�l���+�4\\#�}�f�:����,KV;�z������\Z��5���]�G���U\\�/W�Ů�q��Q�\0j�9�� Pr�2gp �Z�O�d�X�f�����p�b�#y%G�J�q�:`��\rO��\n�D\0�a���{ȸ�2Q�J�����P�f���I�`�����݋��n�IH?�b�1s��D8`\r��p�p١J��2{�\ru��q�K홛O��g(ު*`��T�z���u�d-j�@6\0W�Ծ����m(�Z`�\'��VS�<!����PQS�3�:D9,#�Ə�+�\0���W�!4��,�=�I(PLv����a��q4�\Z�)g�\"��_���F������ࣵ�-@\n5v#0���U�K�Ѷ�y%��?�^�^�a�V��v���\r��\0j���([�u�{�P7���#i������a�_,Gb��4(s�x���f� u�=�Ր�a&��CG�0�8�KBܹ�a��b)�p���Z&;����o�[���qM��dO��]���i�A:��Y�2�S�?��m��Na M������lf���~�n?NO�if���.�x�z���o.#.�6��AŰ�	��5�qZEL��C3)~a\0��X�%4��44=B�N���GI�ռ@u^һ�R���DiBGHK�i(~�P�����\\N�႓�yb��gh7o�X�h���L �r�\0`+?390�����^A��$^xֹfkŕ�eh&�TP�u/\ZpC��3��#�+�E5ȈJ˾�[�*k���\'k���o�Xh_d�y\r�Slnڔl2�ɥ\Z���YFΆ�g�b9�{&4OL=%a��c{�^�cQ�j<��5^n����T�@y�`�Z��ꢑPo�Ĭ����:W���Qf�(ZҎ��^����D���C��u�B��bЧ�\Z\'�^R��1����R�?�3��G\r��qZc~���e.\n%��%0��:p�ۄ�ex��(��LZZ������6`ҷ�3�T�T�p�B-n$< V��[d�>��\\�J}�,ݐz��8�R��[��7���ڇ�QXJ\"�r�;;ׯ$��j��(��+�A�u��E�U�0%�0��\0�ne�M^c`a,��\ZWoˬWJjR��Ā6�ð�x��Y��\n��`���r�)�$2\Z|�I�ꗋaPfR��a�_Μ���� ��������^��Pw/�*��O��#�C�Q(h�#��;�� <��-����q�_�f�\n�IM`����#�\0h�����F,<��)��M��Xq�w�B���.��HW%�)$҄/8��e) ��y �\Z.�T5����z��ˠ\0�Pj]�ԡ��n QLG0������)�h�@R�4@*�l��!\Z���AvV�?IV��`��R�x�O�M)[.�&�y���E�u���&�A6��#��`�y��\07(�1�!W(�<���*S���5���s�98Ә\r�HS��\01�\0�J��m/p\0y�b��w��^f�u�W�ā&e-��ˌ���*��*l�iD�l\\T�*��u���*rwE�pՅ�\n8#$\"p��d�\\{���UŦ0>#\n7F��7��[��0�i���2<���@��f�^�@�ֺ��P�,F4\\�h�o���	�Ƭ����¿lF�\0=N\n��f��n�	W:�鸵ʲ1*UEeBdB����	��z��W�鏸!��Y��+4�X�)�P\05�c��$�e0���}b�jn�mYD���f+ǈ�d)1���	�⁙��ܸ��BJ�1��@/Գ(�ȡ�\ZA�*6��1)k��M`oIr�(\"P�Twԟ���s��+\r U,M��i�J�)U-�3i��30ǒ�P#Gq�x��&�7������&m�˘�Ur��H>P%&)�b[�w��\"P0cq6�����W�x���Z�#�t���`<�)��h�����(�4��]�\0�@о�v�n���j�A���!�pNH��DK�7`�!����{o.�eŅX��+�pF�b��6aUU�j*��ݔ[\0�[V�ٚ���S��UDe/d�ʁ��*v��\0��R#�J?��;��XESU���8����#��0��\'����>�\\��\"u켶�yX�4�$Sq\\@\Z���̐�[-hN���_66 *>%�\"���J�W�\0ٿ��');
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
