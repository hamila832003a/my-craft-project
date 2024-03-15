-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asvjzppqjwyxwenzubpmrmsbjcfturovotdq` (`ownerId`),
  CONSTRAINT `fk_asvjzppqjwyxwenzubpmrmsbjcfturovotdq` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bbeagkbxdthnzzmegaytmmqytqokwusiptzn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bvanqctqiegluxjiwaainvzqdsmhfkbufmoq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_lmrvqkrjqkvcovnpomdzxqlabtavjhuoqpks` (`dateRead`),
  KEY `fk_ybcurftkvjoiugokqfwxmuaxkueyswgiolll` (`pluginId`),
  CONSTRAINT `fk_gyoqwvpvfkrpndiljrvbsywvzkicqkuhdgey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ybcurftkvjoiugokqfwxmuaxkueyswgiolll` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wwjnbmwrmdhuqwjgeetopogsekdtzzfkhpcg` (`sessionId`,`volumeId`),
  KEY `idx_roiapsozevangiwggobwrxsverjnljlbalut` (`volumeId`),
  CONSTRAINT `fk_ctnlkhxlssgcvohnzjszxbutmyzemjysioxr` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tgjfaqurzukyldudmcyliyqncekojpskflti` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cyafiiyraymjknozmmltpvaupkynfvlsximl` (`filename`,`folderId`),
  KEY `idx_mdxujgbnuvjsptrvanrdzysozwzkymdknyuu` (`folderId`),
  KEY `idx_hgamvnmpmnazsscvulcyfawymimvwksaokfc` (`volumeId`),
  KEY `fk_bgmhhlkglsazvuvwqedwrhzkcjqcceehtuoj` (`uploaderId`),
  CONSTRAINT `fk_bgmhhlkglsazvuvwqedwrhzkcjqcceehtuoj` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gwfalslkhgcwjuzriltgzoazgknhcmdzcxww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jxuyyjpulrrbzhkscztfndsutkgggzpsnwwt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_otrillrqitllszdxbfqrwodaeqnzyvxhnpra` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cxnkylwftfqgngcdaoewsfxtbcpvyzxvfkhk` (`groupId`),
  KEY `fk_zauzmgleohopjfuzsunhekzgtmfvkkiasbyv` (`parentId`),
  CONSTRAINT `fk_nprbobgkjmcqftoreqjtihjyihfzramevnvi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umbgvvpwolufkrkmimsyivjbarpctuzuymlp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zauzmgleohopjfuzsunhekzgtmfvkkiasbyv` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vopkdschewznpfrfrqbavaumtpdoknulkshs` (`name`),
  KEY `idx_eaoexnvfqdrpvdxqysvskwgfrpzrgqvzkwdz` (`handle`),
  KEY `idx_zgqttwmwvbolycacaafyqxmvkybjayqvxohw` (`structureId`),
  KEY `idx_vwrcbvmhxsqrccgqdskekjswpydioohjyvch` (`fieldLayoutId`),
  KEY `idx_fsylfodqxshtwpvpkfohnynvmnfhqinnjnpx` (`dateDeleted`),
  CONSTRAINT `fk_rqiyzhglyxfiaunvgrdptrobiwvhsloxlfcb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tmydtajfzvkwvtbwzvzsneztgvjsbataupyt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mwiyfvllckxlkkbkysgcycdhahyudyueqmme` (`groupId`,`siteId`),
  KEY `idx_umioryiwvarijijosjkmmpggoizmnqfyqxoy` (`siteId`),
  CONSTRAINT `fk_ggtgphxjusolblozegpznvqxddxgbjtsxrju` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lhhgarxgjujcwfwwstbcdutrayjjicgaxwvm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_sjsoprhbnaplqivzotrjnagnoxgcrjrlrxhr` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_vwizzaeqtxylwbbjhymfonhqqkyxtzpvqkef` (`siteId`),
  KEY `fk_hwwueoudmbfmzvvypzbfghihpmgingndemyd` (`userId`),
  CONSTRAINT `fk_hwwueoudmbfmzvvypzbfghihpmgingndemyd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_svciyguzdjgdudnuhlflavsxumpzcyaqztbz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vwizzaeqtxylwbbjhymfonhqqkyxtzpvqkef` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_adpfyccfqnamkbbstzkqphujeijogdryzvvk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qykwlabfcwxjbarywwjbaswumkiefxgkhoef` (`siteId`),
  KEY `fk_nkubglcxwpsxdcvgjqyuljbzbwpeqharfomf` (`fieldId`),
  KEY `fk_ldtufgzgtfbdpglbjlqcwtiaunkhgurmmndl` (`userId`),
  CONSTRAINT `fk_ldtufgzgtfbdpglbjlqcwtiaunkhgurmmndl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_nkubglcxwpsxdcvgjqyuljbzbwpeqharfomf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qykwlabfcwxjbarywwjbaswumkiefxgkhoef` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rceecjkgiorfxdothzwvsbjmmsugoxjoyhji` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_backgroundColor_ozjsnfcs` char(7) DEFAULT NULL,
  `field_color_rzxodpzb` char(7) DEFAULT NULL,
  `field_heroTitle_vurasdzu` text,
  `field_richText_cxxkbghi` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qxvliylqwodesfthgpgwolobwjuulhepbish` (`elementId`,`siteId`),
  KEY `idx_ziowcnlepjcxmfupdszejzinsjzwssjzvtnw` (`siteId`),
  KEY `idx_frufbiklugtsrpbdkskxzmbwaioyacoeisfs` (`title`),
  CONSTRAINT `fk_binytkcljdwroyoonbchwbqsnrdtwlmbwwnu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jdrmbgkmsiejzxvxrmddzharogryulkingqi` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_dnkdxsuuahfedpdecguiwhoxnpqvbzgobeeg` (`userId`),
  CONSTRAINT `fk_dnkdxsuuahfedpdecguiwhoxnpqvbzgobeeg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_osyxggtethiuzonlcmkmfvodynyfjukdytrb` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_fncljzvpbzxpofrkuxtcjcnuyhknjdthstqu` (`creatorId`,`provisional`),
  KEY `idx_nrihkskmumnzcrzeukqtvmxjsszvgmldpfub` (`saved`),
  KEY `fk_lcjbuobuttxwgawzbdvgggcelacjznbquqta` (`canonicalId`),
  CONSTRAINT `fk_lcjbuobuttxwgawzbdvgggcelacjznbquqta` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjdmgkfyeldojzufjhuaffeclroxsbbcvozo` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_luwhfdzjlvtanhwgcbklxzvduhecukcnlxdw` (`elementId`,`timestamp`,`userId`),
  KEY `fk_mvccocxfqssrkqueuvfjufcjrdlctgwenlup` (`userId`),
  KEY `fk_nrfreqenxqouehguaagpmnnlxcjbxrpnjulb` (`siteId`),
  KEY `fk_mnnygnvugzyirlxjpsbezgnbudzpnyvbfrqu` (`draftId`),
  CONSTRAINT `fk_cdetlxrmveepxjfgygxbkfmrewohdkggfjgx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mnnygnvugzyirlxjpsbezgnbudzpnyvbfrqu` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mvccocxfqssrkqueuvfjufcjrdlctgwenlup` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nrfreqenxqouehguaagpmnnlxcjbxrpnjulb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wrtzyqaoocleelhcpmcchihmxwxhhuqbbecp` (`dateDeleted`),
  KEY `idx_dobbyvdfnpcvibadepwfmdhfqjmiiellamlw` (`fieldLayoutId`),
  KEY `idx_xokcafwuxizuxtkuxqtntddjludomngcxhae` (`type`),
  KEY `idx_ibqleivdhnvbwbjszoqhavpdadqbxycytjnr` (`enabled`),
  KEY `idx_iuhcjbwdexqmnsyaecrcchrymputqdpioahv` (`canonicalId`),
  KEY `idx_zphgdxhfhjmypvckymbrmfulagshjqirwxbp` (`archived`,`dateCreated`),
  KEY `idx_gqtxxunjmwadkyekgavciqlskpwpkrqiyxda` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_kpoozfopqjrilkhwvataihkmvcdvxejpsoef` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_yyeyzayjdqugtmptaddxuyifemvqbgraadeu` (`draftId`),
  KEY `fk_walqxkyhpdyxnnvsgfoymaptdhxxcgtsnrao` (`revisionId`),
  CONSTRAINT `fk_qbuwnojyexecqktxdehkomplbyhmlrlrokeu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qosphpnbzycvcpjnzstipjqhlvlfbspvoccy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_walqxkyhpdyxnnvsgfoymaptdhxxcgtsnrao` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyeyzayjdqugtmptaddxuyifemvqbgraadeu` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bdcbnolrrabvqfxzudvlmibvwaangubkpiel` (`elementId`,`siteId`),
  KEY `idx_lbsfglevvnsdochxmdkvjahdojmzxjduqrph` (`siteId`),
  KEY `idx_qbyqxznncfvaeqyildstzflzcidclsctkilg` (`slug`,`siteId`),
  KEY `idx_smkfzywmosduzbxjfqxfnvrvapbdjjcexxsi` (`enabled`),
  KEY `idx_kzyatnzxxahumhqrcbntbrpvngyxcyxlaoyx` (`uri`,`siteId`),
  CONSTRAINT `fk_emdckapcatfhqpajxijsvutybnhmuvvpbbab` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qpsvoicmebfaftkvnmrpipgbqtilqpzyubjh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wfexgyjqgycyasskgfdmdcabkgkgoonudast` (`postDate`),
  KEY `idx_jyflzkrukxmdkypkaszjfejkpmajqpwepqhs` (`expiryDate`),
  KEY `idx_ibaztuhyinemsjewqvahvsknyvnyxirjbrbh` (`authorId`),
  KEY `idx_lqcrwyefldfhsvnwnyuaxdoruvtdwnybrtqq` (`sectionId`),
  KEY `idx_orlnbxtyvnmgqudkcvkvhqrukotcctmdcork` (`typeId`),
  KEY `fk_lscalehfynxkwcozjjyxbaylbmdqexcyyqct` (`parentId`),
  CONSTRAINT `fk_eltwcwfowikmzvgaplholwbhjqycuockgiry` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ihazpuqtjdlhkejpmfudiyidjvfvdasnxpwq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lscalehfynxkwcozjjyxbaylbmdqexcyyqct` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rdievisylkdubpxhxwnvcqiipsuajfwxamwo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uuvnmmdqzqwbhfgbnpkpmvmrqpkskjuhvgpg` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yycltqtqtgrttfudjjjjjptwbzttnboxqdap` (`name`,`sectionId`),
  KEY `idx_tkklfskjjqwslgxmcxlvgyyjzozgohihfbcy` (`handle`,`sectionId`),
  KEY `idx_fqbkxdnnswrtpewdzjggtmxfuutuysxiyhnm` (`sectionId`),
  KEY `idx_tnvfloiifelrvnjzcfzcmsymwufbtjrencly` (`fieldLayoutId`),
  KEY `idx_pfjeazaqcvmdoolobxngbbzipclclxexjyce` (`dateDeleted`),
  CONSTRAINT `fk_hedgphzozcrlhhdhurwkpaxodckvshnjkmcz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rumnakyeebasglkgnifdajdvxparnwchypol` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jmcepxoxxohfqjfuxcpegrbqpjjjxxekylfi` (`name`),
  KEY `idx_jhihrntmdrlvphrmfhsqlawnrofhpnbomwxy` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jbzhgqzrdookhpcimkwlqkfqwqbxowribeuc` (`layoutId`,`fieldId`),
  KEY `idx_zjllfniryilllpfpbskzgrnfvmanokqfgrxg` (`sortOrder`),
  KEY `idx_xliuyiqvqxowxhbvixispmhdejhzxzqmuewc` (`tabId`),
  KEY `idx_ofxfhnrjtflxtfckjnmgcoqutuposznuuppu` (`fieldId`),
  CONSTRAINT `fk_cikppttoenklcfxyltbgeqocenzqbrhczsxo` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prltktgwutzwypyjosfcsjbccuexlsnjtuex` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwwwdeglmxhoqakeplfuaomcvdbvdjmlnprm` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pytgrbskglhegqakstbpqqrcxfhqbdxevjme` (`dateDeleted`),
  KEY `idx_cnkrovsvmtinnfqfwxaafvyfwpqhowrxnogk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mrspcoajdufsnpuhusmqzqcpzjemhsurprhq` (`sortOrder`),
  KEY `idx_uxqurvrqqpyrraincqbbhostdpisbsnsindc` (`layoutId`),
  CONSTRAINT `fk_scrcjlitgulticxtmajyomnfymqzxaxeanvm` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gygutpojrimdlawhrqaivyhtqtgsgigkajku` (`handle`,`context`),
  KEY `idx_qmczgglsoweufpzmnqoxsjfaqtmeqfxddzbw` (`groupId`),
  KEY `idx_exgonlapghobgcydlevrryokrjmvimixxjbf` (`context`),
  CONSTRAINT `fk_onolqqwgxzgflqvulmhjaqvzunjccaszvzjd` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ehqszklwizocezsjljoqgjddeukfwibtvoub` (`name`),
  KEY `idx_umswsljqufyrizbzgoficmywtiwsbihwgcox` (`handle`),
  KEY `idx_jelvcreluatwrosipdbmgdeqwsembpjldvsr` (`fieldLayoutId`),
  KEY `idx_stjaaklytnvlkcyrkwryoyjrueqmyjimyvou` (`sortOrder`),
  CONSTRAINT `fk_rlsenagupzekkkuokqmbvpxipcbgbdftyvaq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vqrzspcnysbdvhucbfocbngpqfdgvwuiifij` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jzkiaswbxnmmdqaiwltpoejqrkqgkovwuagx` (`accessToken`),
  UNIQUE KEY `idx_fdcyztptgdgawvdgweeuqxisseemiruxhhkr` (`name`),
  KEY `fk_atoulbohhllbiitkiefsvhqtdbuyambretyq` (`schemaId`),
  CONSTRAINT `fk_atoulbohhllbiitkiefsvhqtdbuyambretyq` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wgwqifqajbftjrwtmxmilxwjytmigsmbldjr` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wnsprnhfixkdxqhwxwejaaeentjwhdmtsano` (`name`),
  KEY `idx_qwqrzlcxspkcbuxdrkxsudhfuwcygiqvmzyu` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rvsiqxsmsjcidtmzngobqzkqizhfniymmvmi` (`primaryOwnerId`),
  KEY `idx_avnywmrvrduskykfpracakhwifmwctmunhht` (`fieldId`),
  KEY `idx_gxgxpszsrojxupysqlzrgfhoxberhupmgicm` (`typeId`),
  CONSTRAINT `fk_hfmkjtfxoxdxsxbdkzswsidbmbmuoulfifiq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lpbzprvdcezdagpaogtdtvxfutswtianukwr` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdpgxhdyjvrslublzebhydoioappotbolbja` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ynufmnseoqfcoaftnssdddhgnrsujclnwppc` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_azfjpcukmwukchsdljphjftutumrgoxmbwuk` (`ownerId`),
  CONSTRAINT `fk_azfjpcukmwukchsdljphjftutumrgoxmbwuk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mlegitmhldribqrhjslqbcersfgxdmghfoxs` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wxbtjrlnmiowfvoqiqjzkkmazpsdjrgztgue` (`name`,`fieldId`),
  KEY `idx_starmnbaihirxuvjygisrenhtjzplcjrmfzj` (`handle`,`fieldId`),
  KEY `idx_pgtxauxkznwdaoviwuwycuwheixbpmawqoqo` (`fieldId`),
  KEY `idx_plqgdmssllbbnxaudxkucvvgonsjtfekixdh` (`fieldLayoutId`),
  CONSTRAINT `fk_nwtefzamnpgplwcwgtofubvxqlqfdtzeousr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uwoprjxbcvftkelrqsjuejwyhmvofhkveyii` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_flexiblecontenthomepage`
--

DROP TABLE IF EXISTS `matrixcontent_flexiblecontenthomepage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_flexiblecontenthomepage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_leftRightModule_copy_nklrfppd` text,
  `field_leftRightModule_headline_ycnrgkxq` text,
  `field_leftRightModule_ctaText_bibxkkpq` text,
  `field_leftRightModule_align_wnoitahb` varchar(10) DEFAULT NULL,
  `field_leftRightModule_ctaUrl_dyrusuxk` varchar(255) DEFAULT NULL,
  `field_animatedContent_headline_qquihnjd` text,
  `field_animatedContent_copy_pcssnztx` text,
  `field_animatedContent_ctaUrl_vmygejpy` varchar(255) DEFAULT NULL,
  `field_animatedContent_ctaText_izqpfkpk` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pojnjcuvuawjtuqinvigcgcmrbqdyowpiygh` (`elementId`,`siteId`),
  KEY `fk_vdnrrxtvevzxhuqfluxjhaoskupomaoogzjj` (`siteId`),
  CONSTRAINT `fk_gdrzxlmuzcwajxmzandyeyejlipmpdluzxwx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vdnrrxtvevzxhuqfluxjhaoskupomaoogzjj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_flexiblecontenttest`
--

DROP TABLE IF EXISTS `matrixcontent_flexiblecontenttest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_flexiblecontenttest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_block1_headline_tmlvsryk` text,
  `field_block1_copy_zdunwetq` text,
  `field_block2_copy_xjzmrlcs` text,
  `field_block2_headline_mwdauzdb` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rcuqsgrbvlsuslaaciylrghjzxzapzzqwceo` (`elementId`,`siteId`),
  KEY `fk_rcxlqnujygcdrbgenywsjhhftusdrudhpugc` (`siteId`),
  CONSTRAINT `fk_rcxlqnujygcdrbgenywsjhhftusdrudhpugc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ycxaypqcvhcyeauiecislzmimesycotriuie` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_navlinks`
--

DROP TABLE IF EXISTS `matrixcontent_navlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_navlinks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_link_linkText_dmlwsaio` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jwaqqleljwwslaarbgfkibcuwenraydjtsvh` (`elementId`,`siteId`),
  KEY `fk_ppepjytycabdxlugigskxzhoqfbykxlzogsh` (`siteId`),
  CONSTRAINT `fk_exkvwiisifsozeipnpsejjubmnncxioygozh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ppepjytycabdxlugigskxzhoqfbykxlzogsh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sjlwbypkqlftxouaahebljvyhikjgiykqnmn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xfunyduqxdgbdcgavwzygwfiosevthmcfcbc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_mlodbkaazeentrvnwxutsyletxeynovisobp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_khhcmsxoasdtwmbdfrfmsgcvemfldqfapjnb` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rqlmweqymzkdhrmghuzarrdddytgycskhpgf` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_crybhwjhvdndwjsleuzdoszpxixzeojjhnpe` (`sourceId`),
  KEY `idx_fvvendiubckorgwoqpiyjwpzxwtyzbfwrdsp` (`targetId`),
  KEY `idx_becqdfmeebgmncrpifvswwivdckfztohsldz` (`sourceSiteId`),
  CONSTRAINT `fk_jygwubtetezmomjibkmjpqybuuhaizutcltq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_urkjlhehydsekoucxdxiufygrmzloqhbdcic` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_whwcjcjzseueocwftqnnhkaylmzpxqbxnvee` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fswyrhqzrcmjbcxndjnlnzquzgfbkgifnufl` (`canonicalId`,`num`),
  KEY `fk_oimolljmftjhrrhvalprnxaqqabqeljgknkr` (`creatorId`),
  CONSTRAINT `fk_ixbreqbureeluzkvoynwvbqbmgmxjqjteadj` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oimolljmftjhrrhvalprnxaqqabqeljgknkr` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_fwntwygifzwmkjmybkebkylwmfzbctlrgjxr` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wmjhgkdldhyetmroyntfzgadtqtkfbftmunr` (`handle`),
  KEY `idx_pnueozreqazhobhlivpwhybjyrpiyvxsgjyg` (`name`),
  KEY `idx_vvauhijujvxuhuxcnhfeiyedpbasuuveoyit` (`structureId`),
  KEY `idx_fsquepfvfhphiiexbnppmqjqwjdvbvgjdvvq` (`dateDeleted`),
  CONSTRAINT `fk_jfgliyvrvejdfemhqifyfkoygrcnudphkjwb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qwlprupjqluaceogzsurqxzvelsmohdjvixp` (`sectionId`,`siteId`),
  KEY `idx_ulqcjgupfyzptkzfzhmdjxsopynuiytuagbf` (`siteId`),
  CONSTRAINT `fk_menvstronkdeeagrzsegxuokazqblnwfoeto` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkbgsuloedfdzhwsucqwxuvurkbeerfedlpm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vzumbesjewzzkallgptazhpbvyxfovaazzcn` (`uid`),
  KEY `idx_vkhyzyebvaujdafummrttcjpaoyndbbyzyai` (`token`),
  KEY `idx_dqgzdhkaaegzzvmzateityyqqarfjwzzkurq` (`dateUpdated`),
  KEY `idx_aeihsahvkujuzpzteuqcyxudrvijcwrgiahm` (`userId`),
  CONSTRAINT `fk_myzogqzlgogiohkwfxpxdveuuaknuhcivbub` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_arlbyifebxwtrlphnnjmoeigceugjpjfhwva` (`userId`,`message`),
  CONSTRAINT `fk_saavchbdkwkhcyclewbfmtyzsmiwjtctgihc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xygvnylyblcgplsymtnvsmtdytobzzoudcer` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hfardrdgaylbjnmwkmmpmnvcobryxadfupar` (`dateDeleted`),
  KEY `idx_kzugiivveftijodlqfgtghajwlbgilscaaxe` (`handle`),
  KEY `idx_kmjycglycgkhgplstegjnyqdextxsqpgxqkj` (`sortOrder`),
  KEY `fk_heyivfcurtdrdhykrigjujpqmoilaxeiwerf` (`groupId`),
  CONSTRAINT `fk_heyivfcurtdrdhykrigjujpqmoilaxeiwerf` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_enukyqnpttqjbavyiuousycwcxyqvzxtsajm` (`structureId`,`elementId`),
  KEY `idx_jnnzjckdyksjhurzmqyryqjntvurfjnlavmv` (`root`),
  KEY `idx_uwdxqjskqtiqaylxfrxreqsdfuiwdksxhphr` (`lft`),
  KEY `idx_xtefmkvqcefnqzuwcfylsrvnepdgxlvjssnj` (`rgt`),
  KEY `idx_xgwfalcpnmlctsxaytcfsaxxhdsqdbjmpxsi` (`level`),
  KEY `idx_nhtwnvhmufkzvwwetbtmwxunetlcdfiwhakg` (`elementId`),
  CONSTRAINT `fk_rttqsttecpucviemlkmvsattzpchtyjfhmcq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bjyptklsfrgeeidmdlhgqxjbetqtjqerorbh` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ymifeuqprbyuqajkfialgabjdbgqpzzmtasq` (`primaryOwnerId`),
  KEY `idx_ylwtryjooysdtdeijqhujdskjlemrzrfemoh` (`fieldId`),
  KEY `idx_xqtryhsxxjpmhkjkujjmnszrjinhabjmwepd` (`typeId`),
  CONSTRAINT `fk_edhgojunshrlabhjjnqhnfmlxnbdmhzcztkw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gordxlnrkrvasagfcxqqpvreavpkfxwpxkhj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hpaglawrnqafejpuidkucnjmmrnqcpnptkxz` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tcepgnnbkrdclgbdopembdqndvpiyxhfwtuz` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks_owners`
--

DROP TABLE IF EXISTS `supertableblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_msupdvmkmhrpmlmwvtbevvsganbbqfomumjl` (`ownerId`),
  CONSTRAINT `fk_htegqflrejeoeqsrwlludduinlxveguchgyj` FOREIGN KEY (`blockId`) REFERENCES `supertableblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msupdvmkmhrpmlmwvtbevvsganbbqfomumjl` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_moovfowafdzoqotzdgslnpqnziwnrobypsro` (`fieldId`),
  KEY `idx_yzcwspxrupnptnkirkzvfsecnidsxdiwsyec` (`fieldLayoutId`),
  CONSTRAINT `fk_bnpyjkttpbdvsmxrixzkxobseqzohquqvygl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jtmwzdlkzblwigsesicmpzpaahzwsohbdozj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ltdpbnhiwgnqprunjjaiqqqxgidvzrgqivpx` (`key`,`language`),
  KEY `idx_auceyayznrochwczrquiuftobhntrmhmxsbj` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_azymkrlrhdscfstgfglpprqmpankmlvpifuw` (`name`),
  KEY `idx_vvtzgztvywavcjskeovouivipzsasjnfduzm` (`handle`),
  KEY `idx_gcdxunjeykbhxwxiugclznwigmjxhdjtrpdp` (`dateDeleted`),
  KEY `fk_rxfmmcmkkogrrnicpynonmfokijwqclfahbc` (`fieldLayoutId`),
  CONSTRAINT `fk_rxfmmcmkkogrrnicpynonmfokijwqclfahbc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lwomquuakspmswdwlgeadwlgfscngnfxyyqj` (`groupId`),
  CONSTRAINT `fk_ehlcxcdhbusfljiuesaoqxslaeqjejotwpdx` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_esliybywidxpqjkjuyhcvlwefubezvjolddm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_shhvoyjrhyhonaarmhzlpkyempnoonrapsrq` (`token`),
  KEY `idx_dojpaawnjcmbrwbhrqtgqyuevvizgyiqjyuw` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jzdfkqebawigttvttgyvhgvvsogbotmqvyfe` (`handle`),
  KEY `idx_ytsclanqzupabfcxumcwpuwnoiilieefhiyh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_frjkcdzcduvfzcrhuwvgkqkdphigxetofzvr` (`groupId`,`userId`),
  KEY `idx_nudbqobofmxmnwmbvdmltcdxsxtuwnzakmzo` (`userId`),
  CONSTRAINT `fk_emycwkbawjfvgwzyqgvcjmnyiwmrohzbukfm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qayhzedupclxfbbprjsdemfmvxmexnqhsbfn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_safpsqxfxwapgjbbgxkcvovrmcfydhziimgh` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_roxunueutlokauenotpicpmvmquqpfkqenfg` (`permissionId`,`groupId`),
  KEY `idx_zlotrzymtqbimbsrfxqxzjyegyffhnbbbvtg` (`groupId`),
  CONSTRAINT `fk_raejudgvcmokxxmybhajbjxanmiglgebljlv` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rbqsvxlsuzuqctfuhrfgsvbpolecipdcitya` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mnqvwxioomrkxayulbrpzkqinfmfkckmklnm` (`permissionId`,`userId`),
  KEY `idx_euxfsjyojbiwplbmjskvfndukimziskppcok` (`userId`),
  CONSTRAINT `fk_gktmexrribcfysufbodpzczlpgybpmphlpxq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umdomychscvqzeveabfslplnndmpmqhpaeli` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_pmmtbjkzbljhwfnfjfvorqsfqzxsbeanokrs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dliuoclttmcuzbypnysfrnkcvbhyfzztporq` (`active`),
  KEY `idx_szmwkerwitasmbzccodyyybxtphynkbammyw` (`locked`),
  KEY `idx_apqkfmffemnpskvwvorwwzbqvbjzkljpazzo` (`pending`),
  KEY `idx_biufsfdrwoqmphrmjldlrrcbdffoeoelpeen` (`suspended`),
  KEY `idx_tpfwnaogfgqdolakxlgjjbdmnzouxjwuitax` (`verificationCode`),
  KEY `idx_lvuinsbmtddfuwnagkaiaklduqfgilpcgqsb` (`email`),
  KEY `idx_fnythjawdziqeemkqbsetprxznuospbibokq` (`username`),
  KEY `fk_taqwulnniqnbsfazqqrxsxbhydjsxttqlfsj` (`photoId`),
  CONSTRAINT `fk_qiinialtuvskoqcfnymiiwojcnyyyvtnasei` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_taqwulnniqnbsfazqqrxsxbhydjsxttqlfsj` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xxhjsbtaprzqfqqogvwmzqmezapjbnyeuqlt` (`name`,`parentId`,`volumeId`),
  KEY `idx_vbxpmbmxfmsdfelkaeromsqmtgquutrelqsp` (`parentId`),
  KEY `idx_trpmqebeowxecdloqxtuwvfgowvlzpgztjzp` (`volumeId`),
  CONSTRAINT `fk_hqcdhazzibrjozbwsxmvawjewhnmzwhgwrzu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwehzkqcwuljqvimstrmiyngekitnpbitolq` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iagtefbbxjhiziseicphtsjebommnebnycex` (`name`),
  KEY `idx_jzqosnpxcczicvtfxtxaokeojvsphgzwgyla` (`handle`),
  KEY `idx_ovuonyftkcuokzwgnuagtfjnydqlmkcpxmoo` (`fieldLayoutId`),
  KEY `idx_azqkefltscvddheapbrhtpduhguressycjhb` (`dateDeleted`),
  CONSTRAINT `fk_ijbymayzeytpgqeolfdxlcfnssaelvmywysl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vjmedfcvmjyggpbaokgnsnyvszetxmdqjafn` (`userId`),
  CONSTRAINT `fk_ggzqeggpxlptxamsizscbvmsbzkxfxjpmknh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 20:25:28
-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (3,1,1,1,'icon-onboarding-300x300.png','image',NULL,300,300,5626,NULL,1,1,'2024-03-12 08:18:29','2024-03-12 08:18:29','2024-03-12 08:18:29'),(15,1,1,1,'android-chrome-512x512.png','image',NULL,512,512,4316,NULL,1,1,'2024-03-12 18:23:28','2024-03-12 18:23:28','2024-03-12 18:23:28'),(29,1,1,1,'1516804011833.jpeg','image',NULL,172,172,7782,'0.4593;0.4942',1,1,'2024-03-12 18:30:33','2024-03-12 18:30:33','2024-03-12 19:05:24'),(34,1,1,1,'google-building.jpeg','image',NULL,263,192,11233,NULL,1,1,'2024-03-12 18:39:05','2024-03-12 18:39:05','2024-03-12 18:39:05'),(38,1,1,1,'forest.jpeg','image',NULL,273,185,15054,NULL,1,1,'2024-03-12 18:39:38','2024-03-12 18:39:38','2024-03-12 18:39:38'),(59,1,1,1,'forest2.webp','image',NULL,800,533,85240,NULL,1,1,'2024-03-12 19:15:24','2024-03-12 19:15:24','2024-03-12 19:15:24'),(64,1,1,1,'forest_2024-03-12-191551_qakn.jpeg','image',NULL,273,185,15054,NULL,1,1,'2024-03-12 19:15:51','2024-03-12 19:15:51','2024-03-12 19:15:51'),(90,2,4,1,'blob-bottom.svg','image',NULL,1440,594,2318,NULL,NULL,NULL,'2024-03-13 18:30:30','2024-03-13 18:30:30','2024-03-13 18:30:34'),(93,2,4,1,'homepage-animation-dashboard_2024-03-13-184310_pedk.png','image',NULL,653,360,121182,NULL,NULL,NULL,'2024-03-13 18:43:10','2024-03-13 18:43:10','2024-03-13 18:43:10'),(196,2,4,1,'family.png','image',NULL,364,343,151353,NULL,NULL,NULL,'2024-03-15 18:01:27','2024-03-15 18:01:27','2024-03-15 18:01:27'),(305,2,4,1,'blob-top-solid-midnight-2.svg','image',NULL,1440,296,1174,NULL,NULL,NULL,'2024-03-15 19:32:15','2024-03-15 19:32:15','2024-03-15 19:32:15');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES (6,1,NULL,NULL,'2024-03-12 08:19:16','2024-03-12 08:19:16');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups` VALUES (1,1,2,'Topics','topics','end','2024-03-12 08:01:05','2024-03-12 08:01:05',NULL,'17de000b-d1c9-4b18-89bc-05856ab472b9');
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorygroups_sites` VALUES (1,1,1,1,'blog/topics/{slug}','blog/_topic','2024-03-12 08:01:05','2024-03-12 08:01:05','3a8554a0-0b00-41d5-8a20-ab02f8350e25');
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2024-03-12 08:19:46',0,1),(2,1,'slug','2024-03-12 18:05:34',0,1),(2,1,'title','2024-03-12 18:05:27',0,1),(2,1,'uri','2024-03-12 18:05:34',0,1),(6,1,'slug','2024-03-12 08:19:22',0,1),(6,1,'title','2024-03-12 08:19:22',0,1),(6,1,'uri','2024-03-12 08:19:22',0,1),(14,1,'postDate','2024-03-12 18:24:18',0,1),(14,1,'slug','2024-03-12 18:22:38',0,1),(14,1,'title','2024-03-12 18:22:38',0,1),(14,1,'uri','2024-03-12 18:22:38',0,1),(58,1,'postDate','2024-03-12 19:16:14',0,1),(58,1,'slug','2024-03-12 19:14:55',0,1),(58,1,'title','2024-03-12 19:14:55',0,1),(58,1,'uri','2024-03-12 19:14:55',0,1),(101,1,'postDate','2024-03-13 19:09:20',0,1),(101,1,'slug','2024-03-13 19:09:20',0,1),(101,1,'title','2024-03-13 19:09:20',0,1),(101,1,'uri','2024-03-13 19:09:20',0,1),(104,1,'postDate','2024-03-13 19:15:03',0,1),(104,1,'slug','2024-03-13 19:14:11',0,1),(104,1,'title','2024-03-13 19:14:11',0,1),(104,1,'uri','2024-03-13 19:14:25',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (85,1,19,'2024-03-13 18:30:37',0,1),(85,1,20,'2024-03-15 18:38:11',0,1),(85,1,36,'2024-03-15 19:32:20',0,1),(85,1,50,'2024-03-15 19:21:09',0,1),(101,1,26,'2024-03-13 19:11:24',0,1),(101,1,36,'2024-03-15 16:27:00',0,1),(101,1,50,'2024-03-15 19:08:32',0,1),(104,1,26,'2024-03-13 19:14:19',0,1),(150,1,36,'2024-03-14 03:16:26',0,1),(199,1,43,'2024-03-15 19:00:05',0,1),(252,1,53,'2024-03-15 19:12:58',0,1),(252,1,54,'2024-03-15 19:12:58',0,1),(273,1,55,'2024-03-15 19:24:38',0,1),(273,1,56,'2024-03-15 19:24:38',0,1),(273,1,57,'2024-03-15 19:32:20',0,1),(273,1,58,'2024-03-15 19:24:38',0,1),(273,1,59,'2024-03-15 19:24:38',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2024-03-12 07:53:30','2024-03-12 07:53:30','5fd4707d-84fc-422c-a85c-a4735ccb3dd1',NULL,NULL,NULL,NULL),(2,2,1,'Test Title 1','2024-03-12 08:16:35','2024-03-12 18:55:38','6e635bf3-582a-4731-be7a-4d673481c85d',NULL,NULL,NULL,NULL),(3,3,1,'Icon onboarding 300x300','2024-03-12 08:18:29','2024-03-12 08:18:29','d919bac6-190c-4033-9bf9-ff7c8be56231',NULL,NULL,NULL,NULL),(4,6,1,'Sports','2024-03-12 08:19:16','2024-03-12 08:19:23','295b53d9-bb73-46df-974d-9ad4087f420d',NULL,NULL,NULL,NULL),(5,7,1,'Test 1 Ttle','2024-03-12 08:19:47','2024-03-12 08:19:47','121b6f74-6740-4774-a32b-f219c7d662f7',NULL,NULL,NULL,NULL),(7,10,1,'Test Title 1','2024-03-12 18:05:27','2024-03-12 18:05:27','dc38c506-0e92-47e8-a4d1-60a537956036',NULL,NULL,NULL,NULL),(8,12,1,'Test Title 1','2024-03-12 18:05:34','2024-03-12 18:05:34','236725c7-dd39-4fa6-9ca5-4595d874b738',NULL,NULL,NULL,NULL),(9,14,1,'Test Title 2','2024-03-12 18:22:32','2024-03-12 18:55:56','52f3461d-8427-4b0c-99e7-ae6fe7da6aab',NULL,NULL,NULL,NULL),(10,15,1,'Android chrome 512x512','2024-03-12 18:23:28','2024-03-12 18:23:28','d1c5d683-dbd0-41dd-a2c5-4ed11f0f0737',NULL,NULL,NULL,NULL),(11,22,1,'Test Title 2','2024-03-12 18:24:18','2024-03-12 18:24:18','f14bdf04-53dc-4b42-8c01-8240ac3a60e5',NULL,NULL,NULL,NULL),(12,25,1,'About','2024-03-12 18:29:15','2024-03-12 19:05:35','7a8b38c0-a69a-42de-a059-fb80307964cc',NULL,NULL,NULL,NULL),(13,26,1,'About','2024-03-12 18:29:15','2024-03-12 18:29:15','00c67940-9172-4f36-ba85-8dff4501cbc4',NULL,NULL,NULL,NULL),(14,27,1,'About','2024-03-12 18:29:15','2024-03-12 18:29:15','347443ae-3842-480e-a265-d9f87b008eab',NULL,NULL,NULL,NULL),(15,28,1,'About','2024-03-12 18:29:43','2024-03-12 18:29:43','607274fe-ca9f-4221-a843-40f6450f404a',NULL,NULL,NULL,NULL),(16,29,1,'1516804011833','2024-03-12 18:30:33','2024-03-12 19:05:25','63abb337-a768-46a4-bc7b-6c684f393ba7',NULL,NULL,NULL,NULL),(18,31,1,'About','2024-03-12 18:30:49','2024-03-12 18:30:49','5e11c0a5-2cfc-4208-8640-db44c393dd82',NULL,NULL,NULL,NULL),(19,32,1,NULL,'2024-03-12 18:35:26','2024-03-12 18:36:24','ed68d1cc-9f4f-4fdc-a1f8-06f47d420b38',NULL,NULL,NULL,NULL),(21,34,1,'Google building','2024-03-12 18:39:05','2024-03-12 18:39:05','ff56373a-ff1c-49c7-967f-4d069e0e51f1',NULL,NULL,NULL,NULL),(22,35,1,'Test Title 1','2024-03-12 18:39:06','2024-03-12 18:39:06','1582bcbf-3bcc-4dc8-811c-2faf312fd4f3',NULL,NULL,NULL,NULL),(24,38,1,'Forest','2024-03-12 18:39:38','2024-03-12 18:39:38','34397461-311c-412b-a6af-246d5bc6e056',NULL,NULL,NULL,NULL),(25,39,1,'Test Title 2','2024-03-12 18:39:39','2024-03-12 18:39:39','4bbc2856-e432-4caa-8924-14d5d922502e',NULL,NULL,NULL,NULL),(26,42,1,NULL,'2024-03-12 18:48:54','2024-03-13 16:20:39','7d9b884f-c8ab-46ee-8e97-b34b4e5384b2','#ffffff','#000000',NULL,NULL),(28,48,1,'Test Title 1','2024-03-12 18:55:38','2024-03-12 18:55:38','f0c6323e-14fa-44d0-b283-baafb7c7c476',NULL,NULL,NULL,NULL),(30,54,1,'Test Title 2','2024-03-12 18:55:56','2024-03-12 18:55:56','be275a58-be2d-4ab7-829a-53e9009f346e',NULL,NULL,NULL,NULL),(31,57,1,'About','2024-03-12 19:05:35','2024-03-12 19:05:35','6c7a23d7-1d00-424a-8887-a7f79164c8cc',NULL,NULL,NULL,NULL),(32,58,1,'Test Title 3','2024-03-12 19:14:50','2024-03-12 19:16:14','d31f50c7-f6bf-4f5e-85e3-e385d41637c4',NULL,NULL,NULL,NULL),(33,59,1,'Forest2','2024-03-12 19:15:24','2024-03-12 19:15:24','eb6b5009-ff9b-4be9-92a1-625470a38b01',NULL,NULL,NULL,NULL),(34,64,1,'Forest','2024-03-12 19:15:51','2024-03-12 19:15:51','52da4f7f-d9e1-4d9e-b6cf-2f66a4d42f38',NULL,NULL,NULL,NULL),(35,76,1,'Test Title 3','2024-03-12 19:16:14','2024-03-12 19:16:14','28a4081d-7122-4d0c-a7ea-55b86d7d4d40',NULL,NULL,NULL,NULL),(36,80,1,'Homepage','2024-03-13 17:32:11','2024-03-13 17:44:35','49a9d6e2-4366-476d-b9c6-901713ea726b',NULL,NULL,NULL,NULL),(37,81,1,'Homepage','2024-03-13 17:32:11','2024-03-13 17:44:35','b60c4c6c-1a73-40a6-b675-731e47232ee1',NULL,NULL,NULL,NULL),(38,82,1,'Homepage','2024-03-13 17:32:11','2024-03-13 17:44:35','13e3e823-056e-41cc-9f42-cc8fffae66b0',NULL,NULL,NULL,NULL),(39,83,1,'Homepage','2024-03-13 17:40:05','2024-03-13 17:44:35','0c497681-aa02-437a-a6dc-f399a3420e5b',NULL,NULL,NULL,NULL),(40,84,1,'Homepage','2024-03-13 17:40:05','2024-03-13 17:44:35','b6e17de2-d761-4bd0-b830-09d55691ec93',NULL,NULL,NULL,NULL),(41,85,1,'Home','2024-03-13 18:19:49','2024-03-15 19:33:51','2bbce6a0-4f46-45bb-837b-d0e4eda6aa34',NULL,NULL,'Site Title',NULL),(42,86,1,'Home','2024-03-13 18:19:49','2024-03-13 18:19:49','0c489102-899c-498c-a15b-6fae69a81388',NULL,NULL,NULL,NULL),(43,87,1,'Home','2024-03-13 18:19:49','2024-03-13 18:19:49','bba0de63-2cf6-467c-83e2-01fc12351548',NULL,NULL,NULL,NULL),(44,88,1,'Home','2024-03-13 18:28:43','2024-03-13 18:28:43','765c879a-d401-4862-bec4-b3a7ac6326ff',NULL,NULL,NULL,NULL),(46,90,1,'Blob bottom','2024-03-13 18:30:30','2024-03-13 18:30:34','f112bb6c-d1ea-4b06-a2dd-fbc3a79cb565',NULL,NULL,NULL,NULL),(47,91,1,'Home','2024-03-13 18:30:38','2024-03-13 18:30:38','e438cde2-e335-4c24-a3cf-8c5025a01c66',NULL,NULL,'Site Title',NULL),(48,92,1,'Home','2024-03-13 18:42:07','2024-03-13 18:42:07','183a6070-2950-4290-82f6-5330397fe681',NULL,NULL,'Site Title',NULL),(49,93,1,'Homepage animation dashboard','2024-03-13 18:43:10','2024-03-13 18:43:10','3b009d04-93f9-475a-a9c8-ac2cda78196b',NULL,NULL,NULL,NULL),(51,95,1,'Home','2024-03-13 18:43:40','2024-03-13 18:43:40','97b6ff89-e131-45f6-ade1-290969bc3086',NULL,NULL,'Site Title',NULL),(52,96,1,'Home','2024-03-13 18:59:39','2024-03-13 18:59:39','f1dfe0be-ac03-4b52-a87a-b64d49d472a2',NULL,NULL,'Site Title',NULL),(54,98,1,'Home','2024-03-13 18:59:56','2024-03-13 18:59:56','6dd69e86-3714-4a41-8582-8fe21c793214',NULL,NULL,'Site Title',NULL),(55,99,1,'Home','2024-03-13 19:01:06','2024-03-13 19:01:06','6ca72ab5-ce1b-4f3d-8915-173234ac204a',NULL,NULL,'Site Title',NULL),(56,100,1,'Home','2024-03-13 19:01:34','2024-03-13 19:01:34','b0b12ebc-3ddd-422b-9da3-cc3aff7a8012',NULL,NULL,'Site Title',NULL),(57,101,1,'About Us','2024-03-13 19:09:06','2024-03-15 19:08:32','7f73999a-feea-41ba-8948-5e2f4b9d2419',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(58,102,1,'About Us','2024-03-13 19:09:20','2024-03-13 19:09:20','d0f3d75d-fc43-47b3-996f-70c7f2a15ad4',NULL,NULL,NULL,NULL),(59,103,1,'About Us','2024-03-13 19:11:24','2024-03-13 19:11:24','dcc2673d-719b-4fc7-b03e-298683a0c7d2',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(60,104,1,'Leadership','2024-03-13 19:14:07','2024-03-13 19:15:03','00eefbda-1a1a-44a3-9482-e43679131833',NULL,NULL,NULL,'<p>Sed a ex quam. Aliquam erat volutpat. Proin interdum ac lacus quis vestibulum. Duis posuere neque ut euismod efficitur. In hac habitasse platea dictumst. Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(61,105,1,'Leadership','2024-03-13 19:15:03','2024-03-13 19:15:03','e5c93665-b50b-484b-add9-0e52a59bf136',NULL,NULL,NULL,'<p>Sed a ex quam. Aliquam erat volutpat. Proin interdum ac lacus quis vestibulum. Duis posuere neque ut euismod efficitur. In hac habitasse platea dictumst. Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(62,106,1,NULL,'2024-03-13 19:19:52','2024-03-13 19:20:56','4bfe4001-44be-43f4-b582-02acd07eeb7f',NULL,NULL,NULL,NULL),(63,108,1,NULL,'2024-03-13 19:25:58','2024-03-13 19:27:09','acc5662f-9ca5-4447-9cb6-1a295d73cb1c',NULL,NULL,NULL,'<p>Copyright Paymentus 2024</p>'),(65,113,1,'About Us','2024-03-14 00:20:27','2024-03-14 00:20:27','f3aad53d-edd6-4f11-93a8-d49a9bbc8b8f',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(67,119,1,'About Us','2024-03-14 00:26:46','2024-03-14 00:26:46','6e7ff908-e886-48e5-ab5b-c9b19865b0c5',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(69,126,1,'About Us','2024-03-14 01:30:36','2024-03-14 01:30:36','24fb3b12-415a-4431-b452-d526be4be262',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(70,128,1,'About Us','2024-03-14 01:33:33','2024-03-14 01:33:33','9abb9f4f-2e3d-4bd0-9551-762a2a781874',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(71,130,1,'About Us','2024-03-14 01:35:37','2024-03-14 01:35:37','7bd109fc-707f-461d-8bf0-20e1259d8f17',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(73,135,1,'About Us','2024-03-14 01:39:31','2024-03-14 01:39:31','55cb52a1-e1e6-44f8-8acc-e6ef8dfbb96e',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(75,145,1,'About Us','2024-03-14 03:00:50','2024-03-14 03:00:50','07dece79-84b5-4247-a670-33e3952870f2',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(77,149,1,'Home','2024-03-14 03:01:51','2024-03-14 03:01:51','e715edb9-f275-4411-8208-a76a85f5a86c',NULL,NULL,'Site Title',NULL),(78,150,1,'Leadership','2024-03-14 03:16:26','2024-03-14 03:16:26','05cabfd2-97f6-4e81-a0cf-d5a7cb07b3d6',NULL,NULL,NULL,'<p>Sed a ex quam. Aliquam erat volutpat. Proin interdum ac lacus quis vestibulum. Duis posuere neque ut euismod efficitur. In hac habitasse platea dictumst. Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(79,152,1,'About Us','2024-03-14 14:06:45','2024-03-14 14:06:45','dece839d-ae3a-49a9-811c-c3e54a4c37ba',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(82,158,1,'About Us','2024-03-15 16:11:59','2024-03-15 16:11:59','302702c3-91bf-4c80-ac0e-b3093be9f676',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(84,160,1,'About Us','2024-03-15 16:13:12','2024-03-15 16:13:12','700c35af-1342-4498-8d4b-fa6363dba2a8',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(86,169,1,'About Us','2024-03-15 16:27:00','2024-03-15 16:27:00','e00d59e8-ee9d-46f8-9326-6069878fea3a',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(87,172,1,'Home','2024-03-15 17:58:21','2024-03-15 17:58:21','3170c4f0-eb71-48e7-8aec-7fd2d4ddfc43',NULL,NULL,'Site Title',NULL),(88,196,1,'Family','2024-03-15 18:01:27','2024-03-15 18:01:27','8cf379dd-4532-42ea-80ac-686b46fa0c72',NULL,NULL,NULL,NULL),(89,201,1,'Home','2024-03-15 18:01:34','2024-03-15 18:01:34','fc765651-199d-4b14-b0e4-9104995a8830',NULL,NULL,'Site Title',NULL),(90,204,1,'Home','2024-03-15 18:29:15','2024-03-15 18:29:15','45044843-d8b9-4b0f-94dd-0dc10df0d365',NULL,NULL,'Site Title',NULL),(92,208,1,'Home','2024-03-15 18:36:24','2024-03-15 18:36:24','1447dfc3-2716-46f5-836d-0c897ee84188',NULL,NULL,'Site Title',NULL),(94,212,1,'Home','2024-03-15 18:38:11','2024-03-15 18:38:11','580c2e1d-e61f-4fc8-b22d-393484a29a00',NULL,NULL,'Site Title',NULL),(96,218,1,'Home','2024-03-15 19:00:05','2024-03-15 19:00:05','4b077166-4626-4d30-99cd-97b3f328d8f2',NULL,NULL,'Site Title',NULL),(97,221,1,'Home','2024-03-15 19:02:19','2024-03-15 19:02:19','8328eba3-ec01-4b25-a434-ac5c68546108',NULL,NULL,'Site Title',NULL),(99,233,1,'About Us','2024-03-15 19:08:32','2024-03-15 19:08:32','6ed538f5-50bf-4002-ab7a-06f805f3823b',NULL,NULL,NULL,'<p>Nulla eu nunc gravida, bibendum nisi ac, pharetra justo. Curabitur consectetur ultrices leo eu ultricies. Quisque cursus metus non est sollicitudin, eget ultricies dolor dignissim. Morbi volutpat malesuada velit, tincidunt tincidunt quam condimentum efficitur. Sed et elit ac leo dapibus malesuada quis ut ex. Etiam venenatis venenatis elit sit amet consectetur. Proin vel tortor aliquam, imperdiet felis quis, ullamcorper quam.</p>'),(100,236,1,'Home','2024-03-15 19:09:07','2024-03-15 19:09:07','fd2e7363-80e1-4be5-8278-541c5de7217f',NULL,NULL,'Site Title',NULL),(101,239,1,'Home','2024-03-15 19:12:09','2024-03-15 19:12:09','e3c5a633-977d-417e-a3fe-7797c23d45f6',NULL,NULL,'Site Title',NULL),(103,253,1,'Home','2024-03-15 19:12:43','2024-03-15 19:12:43','69e1d1ed-7751-4e98-82c7-f1a3fcb4c57a',NULL,NULL,'Site Title',NULL),(105,260,1,'Home','2024-03-15 19:12:58','2024-03-15 19:12:58','7ae11d44-6165-4e09-8eee-42b41b079171',NULL,NULL,'Site Title',NULL),(106,265,1,'Home','2024-03-15 19:15:37','2024-03-15 19:15:37','3f0694cc-d6c9-4f68-8a3e-346bc88ad442',NULL,NULL,'Site Title',NULL),(108,274,1,'Home','2024-03-15 19:16:52','2024-03-15 19:16:52','b8612b42-e484-4bfb-a9b0-23293a6eac38',NULL,NULL,'Site Title',NULL),(110,284,1,'Home','2024-03-15 19:21:09','2024-03-15 19:21:09','d7b355f3-adcd-4626-9086-4d1ec74099e6',NULL,NULL,'Site Title',NULL),(112,290,1,'Home','2024-03-15 19:23:55','2024-03-15 19:23:55','d2e3340f-5af4-449f-9114-92f588933c5c',NULL,NULL,'Site Title',NULL),(114,295,1,'Home','2024-03-15 19:24:38','2024-03-15 19:24:38','179f5334-1ca0-4c5e-9870-5212eb6df6e5',NULL,NULL,'Site Title',NULL),(116,300,1,'Home','2024-03-15 19:27:02','2024-03-15 19:27:02','85a75786-9cbc-4b4c-b77c-5d1fe9c26b6c',NULL,NULL,'Site Title',NULL),(118,305,1,'Blob top solid midnight 2','2024-03-15 19:32:15','2024-03-15 19:32:15','ea8b4c37-9c3f-4b13-bf91-3830fa115632',NULL,NULL,NULL,NULL),(119,306,1,'Home','2024-03-15 19:32:20','2024-03-15 19:32:20','ace8af81-de05-4554-908e-ed1c8558d38e',NULL,NULL,'Site Title',NULL),(120,309,1,'Home','2024-03-15 19:33:51','2024-03-15 19:33:51','5d74a0b7-4f69-4bb8-8aa2-e3ca7d3965be',NULL,NULL,'Site Title',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (25,104,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-03-12 18:55:36'),(2,1,1,NULL,'save','2024-03-12 18:55:38'),(6,1,1,NULL,'save','2024-03-12 08:19:23'),(14,1,1,NULL,'edit','2024-03-12 18:55:48'),(14,1,1,NULL,'save','2024-03-12 18:55:56'),(25,1,1,NULL,'edit','2024-03-12 18:30:42'),(25,1,1,NULL,'save','2024-03-12 19:05:35'),(29,1,1,NULL,'save','2024-03-12 19:05:25'),(58,1,1,NULL,'save','2024-03-12 19:16:14'),(85,1,1,NULL,'edit','2024-03-15 19:32:19'),(85,1,1,NULL,'save','2024-03-15 19:32:20'),(101,1,1,NULL,'edit','2024-03-15 19:08:28'),(101,1,1,NULL,'save','2024-03-15 19:08:32'),(104,1,1,NULL,'edit','2024-03-14 03:16:26'),(104,1,1,NULL,'save','2024-03-13 19:15:03');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-03-12 07:53:30','2024-03-12 07:53:30',NULL,NULL,'b4c25aca-4b0c-4da7-a31a-f7392d3784ea'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-03-12 08:16:35','2024-03-12 18:55:38',NULL,'2024-03-13 18:18:50','04e8e07a-01ed-40ba-930c-f18bd69aab5f'),(3,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 08:18:28','2024-03-12 08:18:28',NULL,'2024-03-13 18:24:16','a37d693d-9aac-4afb-aa01-d78bc6699db7'),(4,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:48','2024-03-12 08:18:48',NULL,'2024-03-12 08:18:53','3e2f84a5-6f8b-462c-a71d-31c3dddef2f2'),(5,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:53','2024-03-12 18:55:38',NULL,'2024-03-13 18:26:29','b5ea4754-bdae-4da7-886a-3c86b2d6cd45'),(6,NULL,NULL,NULL,2,'craft\\elements\\Category',1,0,'2024-03-12 08:19:16','2024-03-12 08:19:23',NULL,NULL,'38b4963a-d1bb-4374-ae00-db7823dc062e'),(7,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-03-12 08:19:46','2024-03-12 08:19:47',NULL,NULL,'a046400b-ff9a-4030-acab-53a359fcc194'),(8,5,NULL,2,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:53','2024-03-12 08:19:47',NULL,'2024-03-13 18:26:29','e1017665-5df5-4400-a0a6-ba3d0d0c82c3'),(10,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:05:27','2024-03-12 18:05:27',NULL,NULL,'b789c902-3775-43d0-a36a-dacc87a5dd8b'),(11,5,NULL,4,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:53','2024-03-12 18:05:27',NULL,'2024-03-13 18:26:29','bef283f4-d147-4bf7-9e20-4c2115f13726'),(12,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:05:34','2024-03-12 18:05:34',NULL,NULL,'74a6489c-75f8-4f1e-afe3-a5b7d5bc2981'),(13,5,NULL,6,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:53','2024-03-12 18:05:34',NULL,'2024-03-13 18:26:29','6257b827-1792-4b0b-8349-bb300ccfcf39'),(14,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:22:32','2024-03-12 18:55:56',NULL,'2024-03-13 18:18:50','913a6cfd-6062-4806-973c-11fb38dbb2eb'),(15,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 18:23:28','2024-03-12 18:23:28',NULL,'2024-03-13 18:24:16','a7271a2e-1b90-4c0d-a6a6-91b3c4d90cf3'),(16,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:23:51','2024-03-12 18:23:51',NULL,'2024-03-12 18:23:58','d77fb655-cf61-4672-b63d-30b8107c578e'),(17,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:23:58','2024-03-12 18:23:58',NULL,'2024-03-12 18:24:11','3f094340-799d-463f-9230-f80eaf2b9dfe'),(18,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:11','2024-03-12 18:24:11',NULL,'2024-03-12 18:24:16','2991ec7e-a361-4668-85f5-8583b689b0f3'),(19,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:11','2024-03-12 18:24:11',NULL,'2024-03-12 18:24:16','1488cd1c-382d-4899-9634-a67f982d55b5'),(20,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:55:56',NULL,'2024-03-13 18:26:29','892b2176-3073-489f-8357-b1eaea3d18d0'),(21,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:55:56',NULL,'2024-03-13 18:26:29','be051d7c-08d7-4c4e-aace-b2c58ac53f5b'),(22,14,NULL,7,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:24:18','2024-03-12 18:24:18',NULL,NULL,'886e30c5-6dd1-494e-8360-ea13d8cfab31'),(23,20,NULL,8,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:24:18',NULL,'2024-03-13 18:26:29','51a2ca05-ff5a-4c2e-a678-b98890a7023d'),(24,21,NULL,9,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:24:18',NULL,'2024-03-13 18:26:29','8abdc2b3-ca7d-4702-ac01-d2465a6a4757'),(25,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-03-12 18:29:15','2024-03-12 19:05:35',NULL,'2024-03-13 18:18:52','c5d0a7be-2993-4de0-a4c8-afd28b5a99a7'),(26,25,NULL,10,6,'craft\\elements\\Entry',1,0,'2024-03-12 18:29:15','2024-03-12 18:29:15',NULL,NULL,'b1e25bfc-82e2-42bb-a395-91321ad1bf3e'),(27,25,NULL,11,6,'craft\\elements\\Entry',1,0,'2024-03-12 18:29:15','2024-03-12 18:29:15',NULL,NULL,'76233ed7-1908-43d7-97eb-688509196176'),(28,25,NULL,12,6,'craft\\elements\\Entry',1,0,'2024-03-12 18:29:43','2024-03-12 18:29:43',NULL,NULL,'423b1c5d-563b-4656-81c2-eb719f937c35'),(29,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 18:30:33','2024-03-12 19:05:25',NULL,'2024-03-13 18:24:16','05f8a1c4-ba18-44d8-8aa7-16230c3754f7'),(31,25,NULL,13,6,'craft\\elements\\Entry',1,0,'2024-03-12 18:30:49','2024-03-12 18:30:49',NULL,NULL,'dab9ae6d-f6d3-411d-bcef-fc5d2710072e'),(32,NULL,NULL,NULL,7,'craft\\elements\\GlobalSet',1,0,'2024-03-12 18:35:26','2024-03-12 18:36:24',NULL,NULL,'f9c060b6-2943-474e-beca-5c6f7b27c42a'),(34,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 18:39:05','2024-03-12 18:39:05',NULL,'2024-03-13 18:24:16','c57814f1-55fe-4e1b-9ddf-14ea65550432'),(35,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:39:06','2024-03-12 18:39:06',NULL,NULL,'a16c7080-07a7-416f-ad0a-e5c7246ff43c'),(36,5,NULL,15,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 08:18:53','2024-03-12 18:39:06',NULL,'2024-03-13 18:26:29','4b9ee454-e6c9-4698-a3ac-7afa6e4f4309'),(38,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 18:39:38','2024-03-12 18:39:38',NULL,'2024-03-13 18:24:16','75ad548a-e349-4ec9-a96e-b7612a10d607'),(39,14,NULL,16,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:39:39','2024-03-12 18:39:39',NULL,NULL,'3d86df1b-1fc6-4ea3-803a-9c0be1251e6d'),(40,20,NULL,17,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:39:39',NULL,'2024-03-13 18:26:29','fd88e71c-c1e3-4293-9254-370b738d2470'),(41,21,NULL,18,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:24:16','2024-03-12 18:39:39',NULL,'2024-03-13 18:26:29','ace2f470-d780-4a82-b48c-22f1fad30da4'),(42,NULL,NULL,NULL,8,'craft\\elements\\GlobalSet',1,0,'2024-03-12 18:48:54','2024-03-13 16:20:39',NULL,NULL,'2e1c1af8-9c30-43e4-b217-d7a1b95e92fc'),(45,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:29','2024-03-12 18:55:29',NULL,'2024-03-12 18:55:36','9c8f1da9-19e2-4b4b-a68c-b21f8a2648d1'),(47,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:38','2024-03-12 18:55:38',NULL,'2024-03-13 18:26:29','a8f9f5f2-c679-45d8-b47b-b6c149d09c29'),(48,2,NULL,19,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:55:38','2024-03-12 18:55:38',NULL,NULL,'9ac99394-89f9-47bf-91b4-392044608f80'),(49,5,NULL,20,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:38','2024-03-12 18:55:38',NULL,'2024-03-13 18:26:29','6e2ef423-869b-475a-8ce9-e7984fa3933f'),(50,47,NULL,21,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:38','2024-03-12 18:55:38',NULL,'2024-03-13 18:26:29','3b07a870-fb11-4c62-a401-eea405d56233'),(54,14,NULL,22,1,'craft\\elements\\Entry',1,0,'2024-03-12 18:55:56','2024-03-12 18:55:56',NULL,NULL,'6b0e2683-bf06-41e2-8d46-25d2eb37ab66'),(55,20,NULL,23,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:56','2024-03-12 18:55:56',NULL,'2024-03-13 18:26:29','b9556f3e-2869-469f-9cf5-e1803f8abb03'),(56,21,NULL,24,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 18:55:56','2024-03-12 18:55:56',NULL,'2024-03-13 18:26:29','e077db00-401f-47bd-bc7e-4c7aed2dbb89'),(57,25,NULL,25,6,'craft\\elements\\Entry',1,0,'2024-03-12 19:05:35','2024-03-12 19:05:35',NULL,NULL,'51d19502-d5a9-42b8-a115-63e825d94dae'),(58,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-03-12 19:14:50','2024-03-12 19:16:14',NULL,'2024-03-13 18:18:50','a6a5416f-859e-4408-b95a-a322aed02a17'),(59,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 19:15:24','2024-03-12 19:15:24',NULL,'2024-03-13 18:24:16','96820ff4-fd16-4355-80a4-ef018c5b74f1'),(60,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:35','2024-03-12 19:15:35',NULL,'2024-03-12 19:15:39','9d803aa1-de13-4817-8f92-a58bfc4b535f'),(61,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:39','2024-03-12 19:15:39',NULL,'2024-03-12 19:15:41','aee46c62-81c1-4f66-92f3-de93d40bcb96'),(62,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:41','2024-03-12 19:15:41',NULL,'2024-03-12 19:15:52','8844ca95-bd38-43b8-bf05-eb6e55b62a1d'),(63,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:41','2024-03-12 19:15:41',NULL,'2024-03-12 19:15:52','be2a8c3d-8736-403a-8560-aac2f041fa2e'),(64,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2024-03-12 19:15:51','2024-03-12 19:15:51',NULL,'2024-03-13 18:24:16','8445ae85-3a02-41e0-8c77-15e0fd3431e7'),(65,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:51','2024-03-12 19:15:51',NULL,'2024-03-12 19:15:55','056bcc90-9391-411b-a9c8-8ecdf06d1bc3'),(66,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:51','2024-03-12 19:15:51',NULL,'2024-03-12 19:15:55','a2ced9a8-1159-498b-99aa-80328b674395'),(67,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:55','2024-03-12 19:15:55',NULL,'2024-03-12 19:16:04','1645e85e-5599-4735-b776-6316cfb78fa7'),(68,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:55','2024-03-12 19:15:55',NULL,'2024-03-12 19:16:04','a8d752db-dabc-45ca-812e-3184d0d9372f'),(69,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:15:55','2024-03-12 19:15:55',NULL,'2024-03-12 19:16:04','0f9e8d34-54fd-44f7-9336-4b279db0e8f8'),(70,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-12 19:16:04','862e49b6-5e67-4f67-8b52-9e8c461b3d93'),(71,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-12 19:16:04','c23dcdc0-6655-4026-bc16-2350902d8336'),(72,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-12 19:16:04','bb2923e3-d0ca-45c9-9fa4-024f896cc2af'),(73,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-13 18:26:29','2beb314f-4946-4481-bfb1-95ed116f0e01'),(74,NULL,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-13 18:26:29','f2d5dde7-d011-4b2c-b456-ca7aee9aee3f'),(75,NULL,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:04',NULL,'2024-03-13 18:26:29','a8523e76-286a-453e-8217-9d84494c7a1d'),(76,58,NULL,26,1,'craft\\elements\\Entry',1,0,'2024-03-12 19:16:14','2024-03-12 19:16:14',NULL,NULL,'bdc98890-7316-4b58-a9db-7fae50a3a263'),(77,73,NULL,27,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:14',NULL,'2024-03-13 18:26:29','5def65bf-16d3-4984-b64f-5b530ad8c5fc'),(78,74,NULL,28,5,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:14',NULL,'2024-03-13 18:26:29','b71d5f89-1652-4f80-b133-852972a377a1'),(79,75,NULL,29,4,'craft\\elements\\MatrixBlock',1,0,'2024-03-12 19:16:04','2024-03-12 19:16:14',NULL,'2024-03-13 18:26:29','37dd78dd-6a6d-4668-bfba-70c18cf0c6c2'),(80,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2024-03-13 17:32:11','2024-03-13 17:40:05',NULL,'2024-03-13 18:18:47','dfbc47ec-2e79-4474-9a9a-a31fe89ad8f2'),(81,80,NULL,30,9,'craft\\elements\\Entry',1,0,'2024-03-13 17:32:11','2024-03-13 17:32:11',NULL,NULL,'56d10c40-495e-45c3-b09e-b072462b3772'),(82,80,NULL,31,9,'craft\\elements\\Entry',1,0,'2024-03-13 17:32:11','2024-03-13 17:32:11',NULL,NULL,'6c2a2516-366e-44fb-8eba-c931deba32c9'),(83,80,NULL,32,9,'craft\\elements\\Entry',1,0,'2024-03-13 17:40:05','2024-03-13 17:40:05',NULL,NULL,'29f9ef52-178a-4c73-bdb9-c774f073a999'),(84,80,NULL,33,9,'craft\\elements\\Entry',1,0,'2024-03-13 17:40:05','2024-03-13 17:40:05',NULL,NULL,'da8f0c62-f096-48cf-a128-f72e3ff57fff'),(85,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:19:49','2024-03-15 19:33:51',NULL,NULL,'28242348-5d24-46d2-9cdf-8ca7b57c2e78'),(86,85,NULL,34,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:19:49','2024-03-13 18:19:49',NULL,NULL,'fa1e0856-17f0-4fcd-a967-2e74f75457b1'),(87,85,NULL,35,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:19:49','2024-03-13 18:19:49',NULL,NULL,'33d5f90c-a5b0-424f-bfff-8b3618635a2f'),(88,85,NULL,36,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:28:43','2024-03-13 18:28:43',NULL,NULL,'e4927f15-5019-4211-875a-32391af63e32'),(90,NULL,NULL,NULL,11,'craft\\elements\\Asset',1,0,'2024-03-13 18:30:30','2024-03-13 18:30:34',NULL,NULL,'45df4580-5fb9-422d-a037-e78e0b598ebd'),(91,85,NULL,37,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:30:37','2024-03-13 18:30:38',NULL,NULL,'7b145515-6fac-45e1-937f-cd0d3ae2ec48'),(92,85,NULL,38,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:42:07','2024-03-13 18:42:07',NULL,NULL,'a0529568-49bd-40c3-95fc-112cfeb4d43d'),(93,NULL,NULL,NULL,11,'craft\\elements\\Asset',1,0,'2024-03-13 18:43:10','2024-03-13 18:43:10',NULL,NULL,'d90bfce7-be53-462c-a30d-b1599dc6685c'),(95,85,NULL,39,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:43:40','2024-03-13 18:43:40',NULL,NULL,'40ffe1a8-3027-435f-b356-7fb287c7b6c6'),(96,85,NULL,40,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:59:39','2024-03-13 18:59:39',NULL,NULL,'8e3a28c3-2e78-4f7f-a0f8-0464acd305b0'),(98,85,NULL,41,10,'craft\\elements\\Entry',1,0,'2024-03-13 18:59:56','2024-03-13 18:59:56',NULL,NULL,'d496d208-1f34-4408-ae34-9f625a7661b2'),(99,85,NULL,42,10,'craft\\elements\\Entry',1,0,'2024-03-13 19:01:06','2024-03-13 19:01:06',NULL,NULL,'c2be51f3-9fe2-4866-b044-f66bed2cba0c'),(100,85,NULL,43,10,'craft\\elements\\Entry',1,0,'2024-03-13 19:01:34','2024-03-13 19:01:34',NULL,NULL,'2fd10794-30aa-4096-99f0-92d4f893ef64'),(101,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2024-03-13 19:09:06','2024-03-15 19:08:32',NULL,NULL,'03290cd0-caa3-4b30-98dd-ce4c34281199'),(102,101,NULL,44,12,'craft\\elements\\Entry',1,0,'2024-03-13 19:09:20','2024-03-13 19:09:20',NULL,NULL,'fc922489-e1ef-4ed1-87e5-150759d11e19'),(103,101,NULL,45,12,'craft\\elements\\Entry',1,0,'2024-03-13 19:11:24','2024-03-13 19:11:24',NULL,NULL,'aa7cd313-a430-4ee8-a1b7-553676d4fcc1'),(104,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2024-03-13 19:14:07','2024-03-13 19:15:03',NULL,NULL,'99821bd4-8653-4640-ad02-a2c530ba3890'),(105,104,NULL,46,12,'craft\\elements\\Entry',1,0,'2024-03-13 19:15:03','2024-03-13 19:15:03',NULL,NULL,'ddd00f05-6b8b-4228-937c-45a2c82b8948'),(106,NULL,NULL,NULL,14,'craft\\elements\\GlobalSet',1,0,'2024-03-13 19:19:52','2024-03-13 19:20:56',NULL,NULL,'4fa9a481-7a66-4022-8477-1d13c675acd5'),(107,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2024-03-13 19:20:56','2024-03-13 19:20:56',NULL,NULL,'673b1431-aff4-455d-bc10-39e66dbfa3d7'),(108,NULL,NULL,NULL,15,'craft\\elements\\GlobalSet',1,0,'2024-03-13 19:25:58','2024-03-13 19:27:09',NULL,NULL,'51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5'),(110,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:20:16','2024-03-14 00:20:16',NULL,'2024-03-14 00:20:24','2ae7d209-addf-4448-9a7d-f561455fa653'),(112,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:20:27','2024-03-14 00:20:27',NULL,'2024-03-14 01:30:36','80c1fffe-f7b2-4797-aa23-ff4f4fd124ce'),(113,101,NULL,47,12,'craft\\elements\\Entry',1,0,'2024-03-14 00:20:27','2024-03-14 00:20:27',NULL,NULL,'f9a76cb0-d609-426c-ad50-7664433ed724'),(114,112,NULL,48,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:20:27','2024-03-14 00:20:27',NULL,'2024-03-14 01:30:36','500b6dc7-cfbd-4eff-af3f-9b698d5efac4'),(116,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:26:38','2024-03-14 00:26:38',NULL,'2024-03-14 00:26:44','10df538f-9de5-43b4-9b63-04aaf3fd1b5c'),(118,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:26:46','2024-03-14 00:26:46',NULL,'2024-03-14 01:30:36','897111e6-a048-4c04-a5a7-4b9ce0829ab9'),(119,101,NULL,49,12,'craft\\elements\\Entry',1,0,'2024-03-14 00:26:46','2024-03-14 00:26:46',NULL,NULL,'34cf2c78-6f2b-419b-aa15-212893b48aa9'),(120,112,NULL,50,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:20:27','2024-03-14 00:26:46',NULL,'2024-03-14 01:30:36','4c383b2e-aaf9-4e2c-b990-b09b7dcfd0ed'),(121,118,NULL,51,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 00:26:46','2024-03-14 00:26:46',NULL,'2024-03-14 01:30:36','d1f118e8-0444-4cf1-8482-78b66ba401b9'),(123,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:30:29','2024-03-14 01:30:29',NULL,'2024-03-14 01:30:36','90602ee4-1937-4ba0-aeeb-6f9a67ed22f1'),(125,NULL,NULL,NULL,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:30:36','2024-03-14 01:30:36',NULL,'2024-03-14 01:35:10','33379068-7cef-4279-97ff-4bd35ae6a1af'),(126,101,NULL,52,12,'craft\\elements\\Entry',1,0,'2024-03-14 01:30:36','2024-03-14 01:30:36',NULL,NULL,'9349e665-645d-494d-98b6-32231246f4a0'),(127,125,NULL,53,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:30:36','2024-03-14 01:30:36',NULL,'2024-03-14 01:35:10','f97e7a97-f913-4d05-aaac-19d172dd1210'),(128,101,NULL,54,12,'craft\\elements\\Entry',1,0,'2024-03-14 01:33:33','2024-03-14 01:33:33',NULL,NULL,'303f030f-e911-404a-9628-8329827dc75a'),(129,125,NULL,55,16,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:30:36','2024-03-14 01:33:33',NULL,'2024-03-14 01:35:10','47bd298d-ab2d-46da-aab6-fed700754c79'),(130,101,NULL,56,12,'craft\\elements\\Entry',1,0,'2024-03-14 01:35:37','2024-03-14 01:35:37',NULL,NULL,'edebc75d-6701-403f-962f-8ac0921be278'),(132,NULL,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:39:25','2024-03-14 01:39:25',NULL,'2024-03-14 01:39:31','77499c83-7710-402d-87c3-87a3d82b384e'),(134,NULL,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:39:31','2024-03-14 01:39:31',NULL,'2024-03-14 01:41:55','f9b58f94-341c-433f-a592-36e064060139'),(135,101,NULL,57,12,'craft\\elements\\Entry',1,0,'2024-03-14 01:39:31','2024-03-14 01:39:31',NULL,NULL,'705aa991-fec1-41cf-97a9-9ee8b79795bf'),(136,134,NULL,58,17,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 01:39:31','2024-03-14 01:39:31',NULL,'2024-03-14 01:41:55','10f74c6b-794c-45fc-aa01-876e9a4c059b'),(138,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:26','2024-03-14 03:00:26',NULL,'2024-03-14 03:00:37','46affe5b-d47c-4337-8970-13ce030c1ef4'),(139,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:37','2024-03-14 03:00:37',NULL,'2024-03-14 03:00:42','78b69eae-bfc6-4735-84ab-ed50565f774b'),(140,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:37','2024-03-14 03:00:37',NULL,'2024-03-14 03:00:42','4f655313-d08e-4423-a17f-cc49be7d4185'),(143,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 03:00:50',NULL,'2024-03-15 16:11:59','1e49e2fc-49d3-48bd-b9e4-f69c950914d1'),(144,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 03:00:50',NULL,'2024-03-15 16:11:59','22cd69db-b011-47ed-ba89-e74947b38631'),(145,101,NULL,59,12,'craft\\elements\\Entry',1,0,'2024-03-14 03:00:50','2024-03-14 03:00:50',NULL,NULL,'94649d77-2775-4b1d-a3ec-1905c9adbefd'),(146,143,NULL,60,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 03:00:50',NULL,'2024-03-15 16:11:59','4cb53ab4-f674-4642-b306-72b9ee8ad496'),(147,144,NULL,61,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 03:00:50',NULL,'2024-03-15 16:11:59','4ab871a0-4f89-438e-8dd4-cda7853f6738'),(149,85,NULL,62,10,'craft\\elements\\Entry',1,0,'2024-03-14 03:01:51','2024-03-14 03:01:51',NULL,NULL,'eaafaea6-e550-4117-b771-a03332103ae1'),(150,104,25,NULL,12,'craft\\elements\\Entry',1,0,'2024-03-14 03:16:26','2024-03-14 03:16:26',NULL,NULL,'52d98ee8-e489-4f45-9559-b510108d932d'),(151,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:16:26','2024-03-14 03:16:26',NULL,NULL,'73c51dea-29c9-47e4-9812-47477edc04d9'),(152,101,NULL,63,12,'craft\\elements\\Entry',1,0,'2024-03-14 14:06:45','2024-03-14 14:06:45',NULL,NULL,'de14b0ed-bf4e-4d70-9126-d41d85927baa'),(153,144,NULL,64,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 14:06:45',NULL,'2024-03-15 16:11:59','21db77c8-90bb-48c8-95c9-c7db707fef3f'),(154,143,NULL,65,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-14 03:00:50','2024-03-14 14:06:45',NULL,'2024-03-15 16:11:59','6eb1da9f-2737-4ac9-8ffe-7924dafa66de'),(156,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 15:38:15','2024-03-15 15:38:15',NULL,'2024-03-15 15:38:32','24e49374-f0ba-4d59-b143-5db4e87a4179'),(158,101,NULL,66,12,'craft\\elements\\Entry',1,0,'2024-03-15 16:11:59','2024-03-15 16:11:59',NULL,NULL,'cbe417a2-0863-4be3-9d9e-6012822b7d2f'),(160,101,NULL,67,12,'craft\\elements\\Entry',1,0,'2024-03-15 16:13:12','2024-03-15 16:13:12',NULL,NULL,'7e592d96-5c76-4554-87ec-e5bd5f837e8d'),(162,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:26:50','2024-03-15 16:26:50',NULL,'2024-03-15 16:26:55','089446bc-6e01-40db-96e2-6781365cbeae'),(163,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:26:55','2024-03-15 16:26:55',NULL,'2024-03-15 16:26:59','542dceaa-5810-4bc2-a5b8-caef38772ae7'),(164,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:26:55','2024-03-15 16:26:55',NULL,'2024-03-15 16:26:59','a08357d1-be73-48d9-bfcb-3eabe9f51a7e'),(167,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:27:00','2024-03-15 16:27:00',NULL,NULL,'7796b8aa-5406-4aac-88bb-c85f33f7f42f'),(168,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:27:00','2024-03-15 16:27:00',NULL,'2024-03-15 17:57:18','395f1a24-3cb9-481f-a3f4-ee8595984883'),(169,101,NULL,68,12,'craft\\elements\\Entry',1,0,'2024-03-15 16:27:00','2024-03-15 16:27:00',NULL,NULL,'a8bac949-10b8-4619-930a-42c26959d2c4'),(170,167,NULL,69,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:27:00','2024-03-15 16:27:00',NULL,NULL,'52d84570-b1e0-4118-a5e6-950e587c9842'),(171,168,NULL,70,19,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 16:27:00','2024-03-15 16:27:00',NULL,'2024-03-15 17:57:18','7cff994e-c61b-481c-a862-1e8def87b404'),(172,85,NULL,71,10,'craft\\elements\\Entry',1,0,'2024-03-15 17:58:21','2024-03-15 17:58:21',NULL,NULL,'a88cd3f7-492f-4b64-8bf7-d83e261db9bc'),(173,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:30','2024-03-15 17:58:30',NULL,'2024-03-15 17:58:33','d82dda4d-9e5d-4afe-bae6-70c50f1bab0e'),(174,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:33','2024-03-15 17:58:33',NULL,'2024-03-15 17:58:50','7bf8891e-2f8d-4033-8abe-937ae2bba424'),(175,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:33','2024-03-15 17:58:33',NULL,'2024-03-15 17:58:50','f85c20d2-4724-4865-ac25-16691c7e32fe'),(176,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:50','2024-03-15 17:58:50',NULL,'2024-03-15 17:58:51','37fda7f2-81f9-49cb-8d82-c6d690c1472d'),(177,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:50','2024-03-15 17:58:50',NULL,'2024-03-15 17:58:51','d8d41225-1857-4534-80b5-0eddda8b3b4a'),(178,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:51','2024-03-15 17:58:51',NULL,'2024-03-15 17:58:52','41920ee3-3550-4786-aa10-af5628be5fb7'),(179,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:51','2024-03-15 17:58:51',NULL,'2024-03-15 17:58:52','db67a8ab-6601-4bd6-a701-4d6e339d6c2a'),(180,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:52','2024-03-15 17:58:52',NULL,'2024-03-15 17:58:58','b0bc87fa-79b2-406f-83e0-27c8fad45e5a'),(181,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:52','2024-03-15 17:58:52',NULL,'2024-03-15 17:58:58','d5af2d07-6f74-4da6-a8f4-e4fb811d96ac'),(182,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:58','2024-03-15 17:58:58',NULL,'2024-03-15 17:59:03','cb9ce209-5d4b-418d-91cc-7bffe422ad37'),(183,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:58:58','2024-03-15 17:58:58',NULL,'2024-03-15 17:59:03','8678b448-3ad5-4e9b-ab45-e88bb60473f0'),(184,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:03','2024-03-15 17:59:03',NULL,'2024-03-15 17:59:12','b54c0e8d-679e-4f26-9a7b-67072aabe85c'),(185,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:03','2024-03-15 17:59:03',NULL,'2024-03-15 17:59:12','e8af9203-947d-43e5-a6e4-e8f32d0914c1'),(186,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:12','2024-03-15 17:59:12',NULL,'2024-03-15 17:59:13','125f7137-4bd5-4d0f-b8cb-8abe0f02e529'),(187,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:12','2024-03-15 17:59:12',NULL,'2024-03-15 17:59:13','d9be4e47-d678-439b-bdce-b2534781aa5f'),(188,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:13','2024-03-15 17:59:13',NULL,'2024-03-15 17:59:49','e9d972cf-cb16-45b4-bca6-0370afbd8026'),(189,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:13','2024-03-15 17:59:13',NULL,'2024-03-15 17:59:49','813a9e8d-9bca-4fca-b57f-f1a088ce19a6'),(190,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:49','2024-03-15 17:59:49',NULL,'2024-03-15 17:59:56','31a69f06-8c29-4f07-b618-b174322414b3'),(191,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:49','2024-03-15 17:59:49',NULL,'2024-03-15 17:59:56','c3ae7605-43e6-42c6-8680-a494a892d36d'),(192,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:56','2024-03-15 17:59:56',NULL,'2024-03-15 18:00:13','297e7aa0-c400-47b2-82a4-97f21c9a43bc'),(193,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 17:59:56','2024-03-15 17:59:56',NULL,'2024-03-15 18:00:13','1be3aeed-ed42-4235-9dc9-ab3d76303e19'),(194,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:00:13','2024-03-15 18:00:13',NULL,'2024-03-15 18:01:29','9fc47c7f-8851-4ea8-a6f4-7df45add3324'),(195,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:00:13','2024-03-15 18:00:13',NULL,'2024-03-15 18:01:29','8282e3b1-982e-4e26-9609-d08217693f76'),(196,NULL,NULL,NULL,11,'craft\\elements\\Asset',1,0,'2024-03-15 18:01:27','2024-03-15 18:01:27',NULL,NULL,'e61ce4b2-ef65-4361-a02f-19746ce4a809'),(199,NULL,NULL,NULL,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 19:00:05',NULL,NULL,'2114ef5a-2ffb-4aa5-83ab-bfb30697aafd'),(200,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 19:00:05',NULL,'2024-03-15 19:23:55','bdb6365e-fc61-431a-881b-37e6073e7641'),(201,85,NULL,72,10,'craft\\elements\\Entry',1,0,'2024-03-15 18:01:34','2024-03-15 18:01:34',NULL,NULL,'52f967c6-6ace-4f40-9dae-f7dc7ed6c081'),(202,199,NULL,73,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:01:34',NULL,NULL,'ee932a3c-2248-4aa6-8094-2c4ed2b6592c'),(203,200,NULL,74,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:01:34',NULL,'2024-03-15 19:23:55','0b8dd51f-f863-4f81-ab37-9e5cc49aafae'),(204,85,NULL,75,10,'craft\\elements\\Entry',1,0,'2024-03-15 18:29:15','2024-03-15 18:29:15',NULL,NULL,'f0f74bd4-f691-4ce3-9348-8623af38581c'),(205,199,NULL,76,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:29:15',NULL,NULL,'c8b551ea-9bb1-4e01-a3b5-12b60c7fb7f3'),(206,200,NULL,77,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:29:15',NULL,'2024-03-15 19:23:55','a377f651-ed3d-4814-9d7a-6622c0b8971d'),(208,85,NULL,78,10,'craft\\elements\\Entry',1,0,'2024-03-15 18:36:24','2024-03-15 18:36:24',NULL,NULL,'d838c9ee-8009-4d49-8fac-bb9c916c8399'),(209,199,NULL,79,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:36:24',NULL,NULL,'de4810dd-6927-4bd0-921a-448b24923d93'),(210,200,NULL,80,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:36:24',NULL,'2024-03-15 19:23:55','d6fc275b-f880-4e86-bc44-df8cb17e3e88'),(212,85,NULL,81,10,'craft\\elements\\Entry',1,0,'2024-03-15 18:38:11','2024-03-15 18:38:11',NULL,NULL,'b2f8626b-56f9-4e9b-973b-c16e451b948a'),(213,199,NULL,82,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:38:11',NULL,NULL,'0b46ffc7-60a7-4861-85fc-b244a143b3eb'),(214,200,NULL,83,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 18:01:34','2024-03-15 18:38:11',NULL,'2024-03-15 19:23:55','68773a25-b233-4f0c-9491-c4dd5e980c14'),(218,85,NULL,84,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:00:05','2024-03-15 19:00:05',NULL,NULL,'c3623606-ccfa-48c4-96e0-56f823b7fb43'),(219,199,NULL,85,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:00:05',NULL,NULL,'86b7fe0f-239e-42e8-be89-eb4210490b0a'),(220,200,NULL,86,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:00:05',NULL,'2024-03-15 19:23:55','f1baf76c-8942-4829-ba27-c0401be9ad34'),(221,85,NULL,87,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:02:19','2024-03-15 19:02:19',NULL,NULL,'bdb69607-04da-4870-bc39-c9ea2652c258'),(222,199,NULL,88,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:02:19',NULL,NULL,'58d607ce-437f-46be-a0d7-84401062f637'),(223,200,NULL,89,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:02:19',NULL,'2024-03-15 19:23:55','6575b0b4-ae78-475a-ae5e-90de9b3e7cc5'),(225,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:24','2024-03-15 19:08:24',NULL,'2024-03-15 19:08:28','2e2ec547-726f-4d2b-8314-794f8b70665c'),(226,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:28','2024-03-15 19:08:28',NULL,'2024-03-15 19:08:28','e1ec24dc-dc9f-4c97-b34d-bbe28fb9af98'),(227,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:28','2024-03-15 19:08:28',NULL,'2024-03-15 19:08:32','062a69a8-e472-40a9-a9dd-7d3bd0546acd'),(228,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:28','2024-03-15 19:08:28',NULL,'2024-03-15 19:08:32','03996b18-0505-45e3-8e2d-466e7d566edd'),(231,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:32','2024-03-15 19:08:32',NULL,NULL,'ce9567e6-e196-45e6-a5e6-7c703441e2f3'),(232,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:32','2024-03-15 19:08:32',NULL,NULL,'59b2f50d-ed79-4568-98ae-980e13ef3bec'),(233,101,NULL,90,12,'craft\\elements\\Entry',1,0,'2024-03-15 19:08:32','2024-03-15 19:08:32',NULL,NULL,'703cd9ba-d478-4f85-893f-baf5beb4ef10'),(234,231,NULL,91,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:32','2024-03-15 19:08:32',NULL,NULL,'9b6f3539-de94-44e5-a64a-074dacfdbb01'),(235,232,NULL,92,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:08:32','2024-03-15 19:08:32',NULL,NULL,'3cb0e570-7288-4082-9488-97788a2b002d'),(236,85,NULL,93,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:09:07','2024-03-15 19:09:07',NULL,NULL,'f25e20a5-d216-4221-960b-6b62202bc639'),(237,199,NULL,94,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:09:07',NULL,NULL,'513f0dfa-8b25-4eac-8500-3a95c61dcea5'),(238,200,NULL,95,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:09:07',NULL,'2024-03-15 19:23:55','016b8f7a-d07c-408e-b096-9ece47ffcf79'),(239,85,NULL,96,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:12:09','2024-03-15 19:12:09',NULL,NULL,'89ca1083-dcb7-4be5-8984-fcead45b8e2d'),(240,199,NULL,97,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:09',NULL,NULL,'3c2a0424-7296-4d6c-bae8-47a564285863'),(241,200,NULL,98,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:09',NULL,'2024-03-15 19:23:55','1d1233d7-6eaf-4610-a275-00d908680651'),(243,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:34','2024-03-15 19:12:34',NULL,'2024-03-15 19:12:38','df85689a-9997-4f56-ad1e-a0ff4440174f'),(244,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:38','2024-03-15 19:12:38',NULL,'2024-03-15 19:12:38','1837167e-0753-4703-9cbb-b169931e264e'),(245,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:38','2024-03-15 19:12:38',NULL,'2024-03-15 19:12:41','a06afede-9799-4cca-a2b7-9ac62cb1f15e'),(246,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:38','2024-03-15 19:12:38',NULL,'2024-03-15 19:12:41','1e081f04-6b2d-446c-b2e6-35ddf3cfefd1'),(247,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:41','2024-03-15 19:12:41',NULL,'2024-03-15 19:12:43','d01e2817-be73-4f9c-9d6f-87e0bf5be334'),(248,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:41','2024-03-15 19:12:41',NULL,'2024-03-15 19:12:43','4e825d8b-8442-4e4d-a2c7-e9c1e37e2deb'),(251,NULL,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:43',NULL,'2024-03-15 19:21:09','0d47e2e0-066b-4757-bf5e-6876d943ffc8'),(252,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:58',NULL,'2024-03-15 19:21:09','056f6ea1-1b28-4481-a3f2-18c3dd4f97d0'),(253,85,NULL,99,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:43',NULL,NULL,'729fd8f0-3eab-40bf-bbb4-2d7ea323a303'),(254,199,NULL,100,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:43',NULL,NULL,'a1533df4-72ae-4e0f-9838-588eddf54a33'),(255,200,NULL,101,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:43',NULL,'2024-03-15 19:23:55','3cbefa51-7472-405f-8e1e-1a6d6e042e63'),(256,251,NULL,102,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:43',NULL,'2024-03-15 19:21:09','d46f25d4-dbcd-423b-8d46-16a7e43b0e83'),(257,252,NULL,103,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:43',NULL,'2024-03-15 19:21:09','729811c3-6e52-4da6-b7de-d6fe593b0c9c'),(260,85,NULL,104,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:12:58','2024-03-15 19:12:58',NULL,NULL,'b6234c46-c4ce-41d0-bed2-2fd26ffd3051'),(261,199,NULL,105,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:58',NULL,NULL,'0102eb23-b06c-4524-960a-a539969a275c'),(262,200,NULL,106,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:12:58',NULL,'2024-03-15 19:23:55','051814c1-b135-40b6-86b1-5da9c1b4bf40'),(263,251,NULL,107,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:12:58',NULL,'2024-03-15 19:21:09','1d200fe4-cdb4-4af4-a51d-5a1328d7842b'),(264,252,NULL,108,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:58','2024-03-15 19:12:58',NULL,'2024-03-15 19:21:09','1106e9c8-7e65-4e3f-a0f6-2dadb1f4d2ff'),(265,85,NULL,109,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:15:37','2024-03-15 19:15:37',NULL,NULL,'8c3bc2f2-b9c0-45ac-85a4-deadd0696ac4'),(266,199,NULL,110,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:15:37',NULL,NULL,'c2c5768c-862c-4cda-991e-286da4a9f900'),(267,200,NULL,111,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:15:37',NULL,'2024-03-15 19:23:55','4a82b3f6-b414-433b-9983-84fe95f0ad1c'),(268,251,NULL,112,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:15:37',NULL,'2024-03-15 19:21:09','f7a444e5-ac76-454f-bcfe-2d8a91b7fa84'),(269,252,NULL,113,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:58','2024-03-15 19:15:37',NULL,'2024-03-15 19:21:09','306511fd-1e68-41c1-a1a1-e1def52ea0e5'),(271,NULL,NULL,NULL,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:16:49','2024-03-15 19:16:49',NULL,'2024-03-15 19:16:52','8aaf2a8f-ca7f-4523-862b-0bd998154bad'),(273,NULL,NULL,NULL,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:16:52','2024-03-15 19:32:20',NULL,NULL,'c6a246d4-1c46-43d2-8996-34cf35147201'),(274,85,NULL,114,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:16:52','2024-03-15 19:16:52',NULL,NULL,'503837e5-83f6-47e6-961f-2b168a667f68'),(275,199,NULL,115,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:16:52',NULL,NULL,'2c84cad1-52a0-419d-8b86-d328e9301196'),(276,200,NULL,116,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:16:52',NULL,'2024-03-15 19:23:55','cee5ab3d-fc42-4a4d-85cf-54ce852a0dd3'),(277,273,NULL,117,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:16:52','2024-03-15 19:16:52',NULL,NULL,'adf37390-c6a0-43e9-8489-d9e18cc2d9a7'),(278,251,NULL,118,21,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:43','2024-03-15 19:16:52',NULL,'2024-03-15 19:21:09','75342ef4-4965-4d49-9d64-f89f2ac013ab'),(279,252,NULL,119,22,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:12:58','2024-03-15 19:16:52',NULL,'2024-03-15 19:21:09','99a135de-38d6-475f-9556-93125fff5695'),(281,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:21:05','2024-03-15 19:21:05',NULL,'2024-03-15 19:21:09','9be73ad8-b561-491d-9652-8269f45240b8'),(283,NULL,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:21:09','2024-03-15 19:21:09',NULL,'2024-03-15 19:23:55','a8f01598-45d9-4feb-900b-c48f00b3cf4b'),(284,85,NULL,120,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:21:09','2024-03-15 19:21:09',NULL,NULL,'b4742ac5-2925-44bf-bafc-dcc623856e37'),(285,199,NULL,121,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:21:09',NULL,NULL,'c41b499d-07de-44d6-bc45-e2b31860a37a'),(286,200,NULL,122,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:21:09',NULL,'2024-03-15 19:23:55','9c1f3366-fc32-4a23-a5f2-75b068af5827'),(287,273,NULL,123,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:16:52','2024-03-15 19:21:09',NULL,NULL,'f8cd4f31-44e6-4a31-bb21-ef3bb4e77d52'),(288,283,NULL,124,20,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:21:09','2024-03-15 19:21:09',NULL,'2024-03-15 19:23:55','53d2837e-3121-4386-b2b3-04be847e1683'),(290,85,NULL,125,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:23:55','2024-03-15 19:23:55',NULL,NULL,'90c700f8-44f3-44f3-a8e9-b982934dafb7'),(291,199,NULL,126,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:23:55',NULL,NULL,'8d1d8e38-5a6e-49a1-bde0-9a631c0d2c3b'),(292,273,NULL,127,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:16:52','2024-03-15 19:23:55',NULL,NULL,'b5879cbc-cfb1-4af4-aab7-d860d653b6e1'),(295,85,NULL,128,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:24:38','2024-03-15 19:24:38',NULL,NULL,'961530fd-4121-454e-a14d-ec32ff8a64e0'),(296,199,NULL,129,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:24:38',NULL,NULL,'7b9cb0c9-1aa6-4fff-9054-9133d639e7cd'),(297,273,NULL,130,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:24:38','2024-03-15 19:24:38',NULL,NULL,'277c82bc-a091-4f05-8d53-e411ac398ff1'),(300,85,NULL,131,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:27:02','2024-03-15 19:27:02',NULL,NULL,'25cf273a-b526-4c55-b9bd-853162ed22b9'),(301,199,NULL,132,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:27:02',NULL,NULL,'1bc23eea-7ee2-4f93-bb0c-fbb420da76f0'),(302,273,NULL,133,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:27:02','2024-03-15 19:27:02',NULL,NULL,'a616d68f-b535-4fa5-a9c6-e23cd24acc5c'),(305,NULL,NULL,NULL,11,'craft\\elements\\Asset',1,0,'2024-03-15 19:32:15','2024-03-15 19:32:15',NULL,NULL,'324b0719-0c81-45d9-8e6a-c290b5f2ff9d'),(306,85,NULL,134,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:32:20','2024-03-15 19:32:20',NULL,NULL,'ba913046-dccc-4efe-af7d-eb1c46a6ff4a'),(307,199,NULL,135,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:32:20',NULL,NULL,'ec3d8d29-39a1-4a56-bfc8-c0b387e89b13'),(308,273,NULL,136,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:32:20','2024-03-15 19:32:20',NULL,NULL,'e22018ac-91b2-44ea-a478-37ed244cf318'),(309,85,NULL,137,10,'craft\\elements\\Entry',1,0,'2024-03-15 19:33:51','2024-03-15 19:33:51',NULL,NULL,'f2d86359-fe4f-453a-b05e-f0a06186bd64'),(310,199,NULL,138,18,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:00:05','2024-03-15 19:33:51',NULL,NULL,'d0684e5b-0ecf-430f-9b9d-142372763fb9'),(311,273,NULL,139,23,'craft\\elements\\MatrixBlock',1,0,'2024-03-15 19:32:20','2024-03-15 19:33:51',NULL,NULL,'caf16645-846f-4a42-993a-cd7ddadf0490');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2024-03-12 07:53:30','2024-03-12 07:53:30','5fb4aee9-3b05-4988-b127-5bf97e41526a'),(2,2,1,'test-title-1','blog/test-title-1',1,'2024-03-12 08:16:35','2024-03-12 18:05:34','7d811c93-e12f-4c99-b15f-3de8fd5bfad3'),(3,3,1,NULL,NULL,1,'2024-03-12 08:18:28','2024-03-12 08:18:28','8faa9f51-7d8d-48b6-b6f9-49618deb5e89'),(4,4,1,NULL,NULL,1,'2024-03-12 08:18:48','2024-03-12 08:18:48','216f2603-801e-4832-aabd-30348f9ffeba'),(5,5,1,NULL,NULL,1,'2024-03-12 08:18:53','2024-03-12 08:18:53','b6699319-7f97-4400-ab75-8fa52fb9e643'),(6,6,1,'sports','blog/topics/sports',1,'2024-03-12 08:19:16','2024-03-12 08:19:47','b4d787b1-1d18-4634-97b7-63a7f1180d72'),(7,7,1,'test-1-ttle','blog/test-1-ttle',1,'2024-03-12 08:19:47','2024-03-12 08:19:47','a494314c-ce82-46e5-be69-1eee1c9174c1'),(8,8,1,NULL,NULL,1,'2024-03-12 08:19:47','2024-03-12 08:19:47','9722dcfb-cb83-4a84-b62a-a87dc2fda9fb'),(10,10,1,'test-1-ttle','blog/test-1-ttle',1,'2024-03-12 18:05:27','2024-03-12 18:05:27','af873026-ad10-460c-bb03-73c073b78210'),(11,11,1,NULL,NULL,1,'2024-03-12 18:05:27','2024-03-12 18:05:27','97a83ed5-8429-4398-a6a8-4b875358c855'),(12,12,1,'test-title-1','blog/test-title-1',1,'2024-03-12 18:05:34','2024-03-12 18:05:34','9fa8051b-5a18-4234-b462-2cf6d2ab1759'),(13,13,1,NULL,NULL,1,'2024-03-12 18:05:34','2024-03-12 18:05:34','8f3c5f8b-128f-4a78-acd7-cd7e1ac3e5d1'),(14,14,1,'test-title-2','blog/test-title-2',1,'2024-03-12 18:22:32','2024-03-12 18:22:38','2c387148-35a6-49ca-83db-5656de646729'),(15,15,1,NULL,NULL,1,'2024-03-12 18:23:28','2024-03-12 18:23:28','579f8322-6f85-4076-83f2-2ba94dade5c1'),(16,16,1,NULL,NULL,1,'2024-03-12 18:23:51','2024-03-12 18:23:51','f6bef1d7-ed0f-4e99-9941-71fab8d23ad7'),(17,17,1,NULL,NULL,1,'2024-03-12 18:23:58','2024-03-12 18:23:58','1447a3f5-eabd-43fe-8fd3-99d8794e7aec'),(18,18,1,NULL,NULL,1,'2024-03-12 18:24:11','2024-03-12 18:24:11','cba1ff12-d2f5-4b9f-accf-c902bef6793a'),(19,19,1,NULL,NULL,1,'2024-03-12 18:24:11','2024-03-12 18:24:11','27016826-75c4-417a-b7da-10c173cbe27e'),(20,20,1,NULL,NULL,1,'2024-03-12 18:24:16','2024-03-12 18:24:16','f205a79a-cd8a-4891-afea-3bcb7dc5eeff'),(21,21,1,NULL,NULL,1,'2024-03-12 18:24:16','2024-03-12 18:24:16','8b6ef7ee-3524-4dfb-82ab-9950014c24c8'),(22,22,1,'test-title-2','blog/test-title-2',1,'2024-03-12 18:24:18','2024-03-12 18:24:18','aa83ccb8-7b3d-4d54-81c5-ef6a8e662e6e'),(23,23,1,NULL,NULL,1,'2024-03-12 18:24:18','2024-03-12 18:24:18','e0d6d09d-4d1c-4c28-80b5-a626f610f064'),(24,24,1,NULL,NULL,1,'2024-03-12 18:24:18','2024-03-12 18:24:18','49e5096c-ade9-4ae6-82ae-b19e31fb563b'),(25,25,1,'about','about',1,'2024-03-12 18:29:15','2024-03-12 18:29:15','43250eea-c152-479c-ae46-13b1b29a061d'),(26,26,1,'about','about',1,'2024-03-12 18:29:15','2024-03-12 18:29:15','6bb6d1de-bfa3-409e-970b-224f7cacd872'),(27,27,1,'about','about',1,'2024-03-12 18:29:15','2024-03-12 18:29:15','e0871276-c2f2-4c68-ad4c-df2326638907'),(28,28,1,'about','about',1,'2024-03-12 18:29:43','2024-03-12 18:29:43','604510dd-22b7-4470-967d-edd20af852e0'),(29,29,1,NULL,NULL,1,'2024-03-12 18:30:33','2024-03-12 18:30:33','ad0a27d6-3ef7-4670-8f4a-248bb9d7a0a8'),(31,31,1,'about','about',1,'2024-03-12 18:30:49','2024-03-12 18:30:49','987198fa-0dbb-44fa-b3d2-a92e3c24d8d3'),(32,32,1,NULL,NULL,1,'2024-03-12 18:35:26','2024-03-12 18:35:26','ff1cfbfc-ddc9-4146-b010-aabdeb5e7647'),(34,34,1,NULL,NULL,1,'2024-03-12 18:39:05','2024-03-12 18:39:05','07b69235-b3d4-4ad2-88ee-08febd64c363'),(35,35,1,'test-title-1','blog/test-title-1',1,'2024-03-12 18:39:06','2024-03-12 18:39:06','85da0407-2705-496a-b5ac-ffd01f12985e'),(36,36,1,NULL,NULL,1,'2024-03-12 18:39:06','2024-03-12 18:39:06','77f9c953-f046-4b4b-b7b0-1d6b6ca0ae81'),(38,38,1,NULL,NULL,1,'2024-03-12 18:39:38','2024-03-12 18:39:38','e79640f8-04e0-43f6-9bd4-4bfa3323b6ff'),(39,39,1,'test-title-2','blog/test-title-2',1,'2024-03-12 18:39:39','2024-03-12 18:39:39','d4163362-4df9-4e4d-a989-243c38096095'),(40,40,1,NULL,NULL,1,'2024-03-12 18:39:39','2024-03-12 18:39:39','89ea7ab1-cab8-45cc-8c5a-ddb9a2dc6c75'),(41,41,1,NULL,NULL,1,'2024-03-12 18:39:39','2024-03-12 18:39:39','655c65fb-d21e-42b3-90fd-af5cb54f7fb5'),(42,42,1,NULL,NULL,1,'2024-03-12 18:48:54','2024-03-12 18:48:54','26767177-8b7a-430e-8f07-4d1b4d7230b3'),(45,45,1,NULL,NULL,1,'2024-03-12 18:55:29','2024-03-12 18:55:29','268e4040-bb0f-486a-b9df-65c3f1f5c066'),(47,47,1,NULL,NULL,1,'2024-03-12 18:55:38','2024-03-12 18:55:38','65b93464-bca5-40eb-997f-a0a8a8ebcb6d'),(48,48,1,'test-title-1','blog/test-title-1',1,'2024-03-12 18:55:38','2024-03-12 18:55:38','677e2294-f462-43ba-ab02-62bee8658e5c'),(49,49,1,NULL,NULL,1,'2024-03-12 18:55:38','2024-03-12 18:55:38','2b3d4168-3cc3-4219-add2-0d586d0b9f31'),(50,50,1,NULL,NULL,1,'2024-03-12 18:55:38','2024-03-12 18:55:38','3f3a07e8-bfe8-494c-a729-de5fffb9490b'),(54,54,1,'test-title-2','blog/test-title-2',1,'2024-03-12 18:55:56','2024-03-12 18:55:56','30318bc9-7a2f-417e-9abe-218af4cd2532'),(55,55,1,NULL,NULL,1,'2024-03-12 18:55:56','2024-03-12 18:55:56','b513a8d6-1a0c-473e-bf5f-17b693865d48'),(56,56,1,NULL,NULL,1,'2024-03-12 18:55:56','2024-03-12 18:55:56','a138d27f-d3db-4688-b39c-11bcbe1ac79f'),(57,57,1,'about','about',1,'2024-03-12 19:05:35','2024-03-12 19:05:35','1fa5c149-d5f5-4867-8909-067c0590f7ef'),(58,58,1,'test-title-3','blog/test-title-3',1,'2024-03-12 19:14:50','2024-03-12 19:14:55','7e4f03c1-2f5d-4f89-9603-b26d326fc106'),(59,59,1,NULL,NULL,1,'2024-03-12 19:15:24','2024-03-12 19:15:24','135a272b-1ace-4e14-bc7f-c9d84b219312'),(60,60,1,NULL,NULL,1,'2024-03-12 19:15:35','2024-03-12 19:15:35','ff9381e9-ecca-48be-92c8-3a86ec3dea6f'),(61,61,1,NULL,NULL,1,'2024-03-12 19:15:39','2024-03-12 19:15:39','520ce5da-175b-4e6a-8664-636eaf51e03d'),(62,62,1,NULL,NULL,1,'2024-03-12 19:15:41','2024-03-12 19:15:41','c1ed13d1-8c5f-4daf-bcb0-af58b75b8462'),(63,63,1,NULL,NULL,1,'2024-03-12 19:15:41','2024-03-12 19:15:41','bb014718-21ba-4dc9-8155-e9651789af3d'),(64,64,1,NULL,NULL,1,'2024-03-12 19:15:51','2024-03-12 19:15:51','b810eeb5-d0d1-4d82-aeb4-10e0c3ab8a02'),(65,65,1,NULL,NULL,1,'2024-03-12 19:15:51','2024-03-12 19:15:51','a2697113-c0d3-40ea-af9f-644ba1a0f7f6'),(66,66,1,NULL,NULL,1,'2024-03-12 19:15:51','2024-03-12 19:15:51','b2aff403-616b-45eb-988c-3a43c02ff4da'),(67,67,1,NULL,NULL,1,'2024-03-12 19:15:55','2024-03-12 19:15:55','eab6bcb4-3683-4f50-8e2f-677bb17a3bc0'),(68,68,1,NULL,NULL,1,'2024-03-12 19:15:55','2024-03-12 19:15:55','bc3d4405-7418-4303-aa82-f5469b3f280d'),(69,69,1,NULL,NULL,1,'2024-03-12 19:15:55','2024-03-12 19:15:55','4adff4e7-8f4f-4508-a812-3a860a804e86'),(70,70,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','30415777-ffbc-48e9-84ea-1e572af350ca'),(71,71,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','9c84d27e-5646-4d30-b03e-b87496096461'),(72,72,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','36a28438-f9d3-4ade-8825-9b296671e542'),(73,73,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','bfa490a9-97c6-4d67-97ec-628c360b1df8'),(74,74,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','accefaa6-5a46-4c1e-9ddf-9160b30310b9'),(75,75,1,NULL,NULL,1,'2024-03-12 19:16:04','2024-03-12 19:16:04','c433ac81-c636-4e37-b3cb-04b1980f4b5f'),(76,76,1,'test-title-3','blog/test-title-3',1,'2024-03-12 19:16:14','2024-03-12 19:16:14','6d07fea1-51e3-43ea-aecf-e50423f46718'),(77,77,1,NULL,NULL,1,'2024-03-12 19:16:14','2024-03-12 19:16:14','74551faa-fcea-472b-a105-06684be305df'),(78,78,1,NULL,NULL,1,'2024-03-12 19:16:14','2024-03-12 19:16:14','3df5cfc7-d08d-412c-9af5-20f30d5c5f31'),(79,79,1,NULL,NULL,1,'2024-03-12 19:16:14','2024-03-12 19:16:14','1a22a439-0eb8-4a84-8bbe-9af151a5cd0b'),(80,80,1,'homepage','homepage',1,'2024-03-13 17:32:11','2024-03-13 17:32:11','ecac942a-fb35-4c1c-958d-4b7cffef42a4'),(81,81,1,'homepage','homepage',1,'2024-03-13 17:32:11','2024-03-13 17:32:11','4e906c12-6517-495d-a9ee-ae6080c23063'),(82,82,1,'homepage','homepage',1,'2024-03-13 17:32:11','2024-03-13 17:32:11','ac6d140d-7742-4b9f-9a6a-0ebfd9951729'),(83,83,1,'homepage','homepage',1,'2024-03-13 17:40:05','2024-03-13 17:40:05','762760b9-9933-4b42-a136-17134afc5f44'),(84,84,1,'homepage','homepage',1,'2024-03-13 17:40:05','2024-03-13 17:40:05','af140b50-931e-49b2-8bda-5a2975b41379'),(85,85,1,'home','__home__',1,'2024-03-13 18:19:49','2024-03-13 18:19:49','57b4bdba-0b96-4bb4-a30a-053a5133f9a3'),(86,86,1,'home','__home__',1,'2024-03-13 18:19:49','2024-03-13 18:19:49','7e64657a-9ec1-40a3-bbe1-0bc653f3087f'),(87,87,1,'home','__home__',1,'2024-03-13 18:19:49','2024-03-13 18:19:49','e496fbfe-f325-400a-9f9f-efbc4bcb1d07'),(88,88,1,'home','__home__',1,'2024-03-13 18:28:43','2024-03-13 18:28:43','ccc0836e-0ce9-4e13-b159-b9686b25480f'),(90,90,1,NULL,NULL,1,'2024-03-13 18:30:30','2024-03-13 18:30:30','902c6004-06d6-4770-a682-91eb1ffa289a'),(91,91,1,'home','__home__',1,'2024-03-13 18:30:38','2024-03-13 18:30:38','84850066-dec4-4a8a-82c4-ff8e8e9b8d36'),(92,92,1,'home','__home__',1,'2024-03-13 18:42:07','2024-03-13 18:42:07','f376cb41-a9d6-477f-a25e-789ee0baab2c'),(93,93,1,NULL,NULL,1,'2024-03-13 18:43:10','2024-03-13 18:43:10','56b645ea-738c-425b-a853-8112a921a06e'),(95,95,1,'home','__home__',1,'2024-03-13 18:43:40','2024-03-13 18:43:40','2528ec50-dab9-4cb3-9486-a544af14fe3b'),(96,96,1,'home','__home__',1,'2024-03-13 18:59:39','2024-03-13 18:59:39','9be37317-0733-4259-8006-4bad3114635b'),(98,98,1,'home','__home__',1,'2024-03-13 18:59:56','2024-03-13 18:59:56','646f946a-5607-4d53-8527-bd5a81264a94'),(99,99,1,'home','__home__',1,'2024-03-13 19:01:06','2024-03-13 19:01:06','340e4a52-ccbb-4b20-a4e2-6c79b946418c'),(100,100,1,'home','__home__',1,'2024-03-13 19:01:34','2024-03-13 19:01:34','83ad9ee8-0185-4513-b5b1-318ddd66373e'),(101,101,1,'about-us','about-us',1,'2024-03-13 19:09:06','2024-03-13 19:09:20','6a4845f7-db3b-4bd5-9478-fda4526bb6f4'),(102,102,1,'about-us','about-us',1,'2024-03-13 19:09:20','2024-03-13 19:09:20','c7415418-28b2-4296-bd13-f921f1025471'),(103,103,1,'about-us','about-us',1,'2024-03-13 19:11:24','2024-03-13 19:11:24','fc4d9b33-af69-458a-b170-e070930c5b14'),(104,104,1,'leadership','about-us/leadership',1,'2024-03-13 19:14:07','2024-03-15 19:08:32','0b1ad79f-5d5b-4429-a65e-729c8c44795d'),(105,105,1,'leadership','about-us/leadership',1,'2024-03-13 19:15:03','2024-03-13 19:15:03','4b438a14-cdc5-4ab8-8ae5-e71e9a8b9fed'),(106,106,1,NULL,NULL,1,'2024-03-13 19:19:52','2024-03-13 19:19:52','7d6f30ca-cb13-4535-929e-e86b1a88086a'),(107,107,1,NULL,NULL,1,'2024-03-13 19:20:56','2024-03-13 19:20:56','29c7f8fe-5e3b-48fa-8646-c18e891c7c20'),(108,108,1,NULL,NULL,1,'2024-03-13 19:25:58','2024-03-13 19:25:58','7c099714-a130-4159-b69f-fe38ec0f36fc'),(110,110,1,NULL,NULL,1,'2024-03-14 00:20:16','2024-03-14 00:20:16','ab97aa67-1a6c-4aab-b77d-3d00e5fb1940'),(112,112,1,NULL,NULL,1,'2024-03-14 00:20:27','2024-03-14 00:20:27','d5169aa0-1db8-4c67-a738-f6c70515a9cf'),(113,113,1,'about-us','about-us',1,'2024-03-14 00:20:27','2024-03-14 00:20:27','5465ea7b-ea46-4de9-a731-167e79a333b0'),(114,114,1,NULL,NULL,1,'2024-03-14 00:20:27','2024-03-14 00:20:27','249305e6-a406-446f-aa85-3507bedca043'),(116,116,1,NULL,NULL,1,'2024-03-14 00:26:38','2024-03-14 00:26:38','af6702f7-2aa8-40bd-8569-a6c9aa934306'),(118,118,1,NULL,NULL,1,'2024-03-14 00:26:46','2024-03-14 00:26:46','ed84b1c6-ca0c-49a3-9284-cffab143f228'),(119,119,1,'about-us','about-us',1,'2024-03-14 00:26:46','2024-03-14 00:26:46','2ef0ad5c-4522-455f-8887-f176ca6cebcd'),(120,120,1,NULL,NULL,1,'2024-03-14 00:26:46','2024-03-14 00:26:46','a8f59435-9f04-49e2-a7ee-6f83b22b01d7'),(121,121,1,NULL,NULL,1,'2024-03-14 00:26:46','2024-03-14 00:26:46','9e6f1ec2-5beb-4737-8b33-c90a90aa2bbe'),(123,123,1,NULL,NULL,1,'2024-03-14 01:30:29','2024-03-14 01:30:29','3f5e55b5-4ea5-44ab-83ff-120e293b788f'),(125,125,1,NULL,NULL,1,'2024-03-14 01:30:36','2024-03-14 01:30:36','facd7a97-5c22-41c1-9005-cc91f8a6e3bf'),(126,126,1,'about-us','about-us',1,'2024-03-14 01:30:36','2024-03-14 01:30:36','ff67b9f3-518e-4cef-b867-e9c0ecfa6783'),(127,127,1,NULL,NULL,1,'2024-03-14 01:30:36','2024-03-14 01:30:36','fb781951-7953-4248-899c-beb629db297a'),(128,128,1,'about-us','about-us',1,'2024-03-14 01:33:33','2024-03-14 01:33:33','cdff72a9-7e27-49a3-8589-6615d189c674'),(129,129,1,NULL,NULL,1,'2024-03-14 01:33:33','2024-03-14 01:33:33','457f9946-d168-4681-8d6f-1468add29660'),(130,130,1,'about-us','about-us',1,'2024-03-14 01:35:37','2024-03-14 01:35:37','fd463604-ae0d-4f37-8751-58df5edda0fb'),(132,132,1,NULL,NULL,1,'2024-03-14 01:39:25','2024-03-14 01:39:25','ef7b1fe5-f15d-432f-bc82-6eb53a0c96ed'),(134,134,1,NULL,NULL,1,'2024-03-14 01:39:31','2024-03-14 01:39:31','86152c2d-c7c7-4d58-a21f-e8516da967f7'),(135,135,1,'about-us','about-us',1,'2024-03-14 01:39:31','2024-03-14 01:39:31','583e4743-6825-429d-82c4-ab745b01878e'),(136,136,1,NULL,NULL,1,'2024-03-14 01:39:31','2024-03-14 01:39:31','f212e4b2-1c2e-4156-bee5-077e46699fdd'),(138,138,1,NULL,NULL,1,'2024-03-14 03:00:26','2024-03-14 03:00:26','417c17ef-129a-44fc-a94b-3cf5b7c90a86'),(139,139,1,NULL,NULL,1,'2024-03-14 03:00:37','2024-03-14 03:00:37','16521090-469d-4db6-9913-4035c34bda2a'),(140,140,1,NULL,NULL,1,'2024-03-14 03:00:37','2024-03-14 03:00:37','63283b24-80ae-4b44-a39c-732afb4c7b73'),(143,143,1,NULL,NULL,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','41c9b78d-ba18-4bee-9876-3e9d72b06d5c'),(144,144,1,NULL,NULL,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','a9240b1f-c7de-4adb-9a91-615647c529f1'),(145,145,1,'about-us','about-us',1,'2024-03-14 03:00:50','2024-03-14 03:00:50','1e2886df-1f12-4057-b21f-d5c5e050d907'),(146,146,1,NULL,NULL,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','b96118af-6b9b-4535-be24-4000339b4c4e'),(147,147,1,NULL,NULL,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','6063781e-645d-4d82-be32-f276b43f9b0b'),(149,149,1,'home','__home__',1,'2024-03-14 03:01:51','2024-03-14 03:01:51','7cdfd4de-b780-44e4-987f-0cb80edb75d1'),(150,150,1,'leadership','about-us/leadership',1,'2024-03-14 03:16:26','2024-03-14 03:16:26','7c0cfe79-ecdb-4aa8-8a0f-0496a8c8d8cf'),(151,151,1,NULL,NULL,1,'2024-03-14 03:16:26','2024-03-14 03:16:26','050a3525-bb88-490d-9352-cb0971566ca3'),(152,152,1,'about-us','about-us',1,'2024-03-14 14:06:45','2024-03-14 14:06:45','0c25b268-0042-43ff-a85a-af8c53140382'),(153,153,1,NULL,NULL,1,'2024-03-14 14:06:45','2024-03-14 14:06:45','535b6c59-594c-44b9-9206-64ba02650e88'),(154,154,1,NULL,NULL,1,'2024-03-14 14:06:45','2024-03-14 14:06:45','808711aa-be41-423b-a136-62da463211d5'),(156,156,1,NULL,NULL,1,'2024-03-15 15:38:15','2024-03-15 15:38:15','a445fc5f-9aa5-49fd-801e-9e713b58398b'),(158,158,1,'about-us','about-us',1,'2024-03-15 16:11:59','2024-03-15 16:11:59','2b29bcea-4b16-4140-9fb9-839549576fe2'),(160,160,1,'about-us','about-us',1,'2024-03-15 16:13:12','2024-03-15 16:13:12','b27e2e27-35cd-44fe-bc12-7b7f20aee658'),(162,162,1,NULL,NULL,1,'2024-03-15 16:26:50','2024-03-15 16:26:50','aa7f932c-c668-4680-8e30-2ed17cae03b5'),(163,163,1,NULL,NULL,1,'2024-03-15 16:26:55','2024-03-15 16:26:55','4f389862-e274-4bd7-b1e3-3391f96b51d7'),(164,164,1,NULL,NULL,1,'2024-03-15 16:26:55','2024-03-15 16:26:55','f407313f-43da-44a6-a68f-52263158011b'),(167,167,1,NULL,NULL,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','3ac75166-02c4-436f-b20d-5a1389a0af7e'),(168,168,1,NULL,NULL,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','c881f7d9-cab0-49f6-8ad8-822666c115a5'),(169,169,1,'about-us','about-us',1,'2024-03-15 16:27:00','2024-03-15 16:27:00','96cbead1-ed01-414c-a265-56b13919e754'),(170,170,1,NULL,NULL,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','6e6a0240-546d-4796-8e2e-b0a20e7d8380'),(171,171,1,NULL,NULL,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','c462c574-cba6-4b9c-9b2f-29d105fa3ac7'),(172,172,1,'home','__home__',1,'2024-03-15 17:58:21','2024-03-15 17:58:21','b608fa85-2924-48ff-bd61-4acf910cd142'),(173,173,1,NULL,NULL,1,'2024-03-15 17:58:30','2024-03-15 17:58:30','cdf26a6d-3c17-4ef3-abda-ae5e2e5083b9'),(174,174,1,NULL,NULL,1,'2024-03-15 17:58:33','2024-03-15 17:58:33','b992192e-40c5-4dae-a655-dd1995e9a00a'),(175,175,1,NULL,NULL,1,'2024-03-15 17:58:33','2024-03-15 17:58:33','0ea4aa55-be38-46c3-8b18-9820433df804'),(176,176,1,NULL,NULL,1,'2024-03-15 17:58:50','2024-03-15 17:58:50','2e5e98f3-53b1-4adc-9a4e-842541efa23c'),(177,177,1,NULL,NULL,1,'2024-03-15 17:58:50','2024-03-15 17:58:50','f8f4dcf3-ef54-42e6-b65c-126f84833a27'),(178,178,1,NULL,NULL,1,'2024-03-15 17:58:51','2024-03-15 17:58:51','1a0d7133-1bfb-4a6e-9e43-5aa94148d428'),(179,179,1,NULL,NULL,1,'2024-03-15 17:58:51','2024-03-15 17:58:51','35942ba9-0707-4952-b875-55d3f9165a85'),(180,180,1,NULL,NULL,1,'2024-03-15 17:58:52','2024-03-15 17:58:52','1e023d72-170b-4721-8150-8f8a3bf6a5d5'),(181,181,1,NULL,NULL,1,'2024-03-15 17:58:52','2024-03-15 17:58:52','9a0ad7fa-6772-486a-81de-0548fa43008d'),(182,182,1,NULL,NULL,1,'2024-03-15 17:58:58','2024-03-15 17:58:58','d3d4648f-6227-40ad-bd06-ec27195e2d96'),(183,183,1,NULL,NULL,1,'2024-03-15 17:58:58','2024-03-15 17:58:58','0edf1ec8-8995-4586-8699-25223fb22444'),(184,184,1,NULL,NULL,1,'2024-03-15 17:59:03','2024-03-15 17:59:03','28cfc36b-fc1a-4818-acc4-180a525d5980'),(185,185,1,NULL,NULL,1,'2024-03-15 17:59:03','2024-03-15 17:59:03','2f9f5332-3e3c-408c-b538-57f949825e7f'),(186,186,1,NULL,NULL,1,'2024-03-15 17:59:12','2024-03-15 17:59:12','7c057331-df39-4167-862b-c6ba2d99b486'),(187,187,1,NULL,NULL,1,'2024-03-15 17:59:12','2024-03-15 17:59:12','6214d4f8-16a1-4539-86e2-64698b45706d'),(188,188,1,NULL,NULL,1,'2024-03-15 17:59:13','2024-03-15 17:59:13','804b54e8-d66c-46a5-aae6-c479bbc22802'),(189,189,1,NULL,NULL,1,'2024-03-15 17:59:13','2024-03-15 17:59:13','79d4ed07-d0c3-41b3-a9c8-669b0adf3892'),(190,190,1,NULL,NULL,1,'2024-03-15 17:59:49','2024-03-15 17:59:49','b154e3bf-2664-4616-83d7-6135a907cb98'),(191,191,1,NULL,NULL,1,'2024-03-15 17:59:49','2024-03-15 17:59:49','3d64e152-64ff-4e3b-b29d-c137398c4a6f'),(192,192,1,NULL,NULL,1,'2024-03-15 17:59:56','2024-03-15 17:59:56','1239f319-85f9-4748-a7f9-e38771e42ca3'),(193,193,1,NULL,NULL,1,'2024-03-15 17:59:56','2024-03-15 17:59:56','1789b3be-53be-42ec-84da-766dac1184b6'),(194,194,1,NULL,NULL,1,'2024-03-15 18:00:13','2024-03-15 18:00:13','621d0d8d-6b7c-446c-a2a3-154715b8fd2e'),(195,195,1,NULL,NULL,1,'2024-03-15 18:00:13','2024-03-15 18:00:13','d1575140-8c4c-4b71-bd81-2f7b63a83d01'),(196,196,1,NULL,NULL,1,'2024-03-15 18:01:27','2024-03-15 18:01:27','791ea781-eea6-48ee-9215-4339c402dfff'),(199,199,1,NULL,NULL,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','0d761f5f-b2aa-4610-8f83-aab59d8ee411'),(200,200,1,NULL,NULL,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','75fd60f3-c78f-4156-9209-41ea464a71fd'),(201,201,1,'home','__home__',1,'2024-03-15 18:01:34','2024-03-15 18:01:34','8e57ca07-a970-4457-aed2-c0bd2535ba9e'),(202,202,1,NULL,NULL,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','0b3c0447-79c0-4a42-be28-53246c13dd52'),(203,203,1,NULL,NULL,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','595890a4-781f-44d9-abe1-5052fca7863f'),(204,204,1,'home','__home__',1,'2024-03-15 18:29:15','2024-03-15 18:29:15','5b33865c-ef23-4768-a53b-4c6b7ce7d136'),(205,205,1,NULL,NULL,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','5e2ce3f5-546e-4b8d-ab2b-6930a3e529c1'),(206,206,1,NULL,NULL,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','1572a766-cb2e-4402-a180-80b4669caf0c'),(208,208,1,'home','__home__',1,'2024-03-15 18:36:24','2024-03-15 18:36:24','c90b1972-6250-45a5-a4e9-1af0125575c1'),(209,209,1,NULL,NULL,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','c02a24c7-3537-489f-8187-dd664900ad72'),(210,210,1,NULL,NULL,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','55a815a7-21fc-4e25-9300-6b9097f44f97'),(212,212,1,'home','__home__',1,'2024-03-15 18:38:11','2024-03-15 18:38:11','6a6ae3a6-59d5-4616-9c2d-1aa39fd429af'),(213,213,1,NULL,NULL,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','01995a01-f196-4cbb-9e17-2f4f25009c15'),(214,214,1,NULL,NULL,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','b079bf7e-52f2-44d6-95a8-4a24ee511ca0'),(218,218,1,'home','__home__',1,'2024-03-15 19:00:05','2024-03-15 19:00:05','58c917bb-f2f2-442c-9dd1-1029752bc1fb'),(219,219,1,NULL,NULL,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','5d04bdbc-62f7-4e9a-b558-7140dbd6ecfe'),(220,220,1,NULL,NULL,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','3aee57c3-60f9-464f-93e1-aad9f0d1c0ed'),(221,221,1,'home','__home__',1,'2024-03-15 19:02:19','2024-03-15 19:02:19','548c4d65-a692-49b8-82d0-775d03e41281'),(222,222,1,NULL,NULL,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','1152b712-f162-4aa2-9547-241a64d9b015'),(223,223,1,NULL,NULL,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','054bfc29-371d-4a25-a7ca-27de1e30a7d8'),(225,225,1,NULL,NULL,1,'2024-03-15 19:08:24','2024-03-15 19:08:24','a6673de1-aab5-4f35-bd6f-0dae052b0af1'),(226,226,1,NULL,NULL,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','c4bd2849-350b-4c12-9529-93679616f51d'),(227,227,1,NULL,NULL,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','b5e9a74c-71ee-40df-803f-99c6726c944b'),(228,228,1,NULL,NULL,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','8aeecd54-c0eb-49cc-8ad0-93c59cddc874'),(231,231,1,NULL,NULL,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','5dca5f0d-cabd-41dd-9e80-099815d2c52e'),(232,232,1,NULL,NULL,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','ac66bc04-73e9-4088-a90d-8dc7cc0c9ced'),(233,233,1,'about-us','about-us',1,'2024-03-15 19:08:32','2024-03-15 19:08:32','78030209-2b65-477e-85e8-3ecb74bb0ef3'),(234,234,1,NULL,NULL,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','a932cac3-b16d-442e-b7b7-949522dc45a2'),(235,235,1,NULL,NULL,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','4680adc7-7329-4bbf-8275-9328dd3a1a4c'),(236,236,1,'home','__home__',1,'2024-03-15 19:09:07','2024-03-15 19:09:07','dfecfdfd-1aba-4d58-9d91-ce826389e9ad'),(237,237,1,NULL,NULL,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','11f44ea5-04f8-433f-992b-40c49986b4c5'),(238,238,1,NULL,NULL,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','adb893bb-5c70-4a43-b8d8-8a0636d48e6e'),(239,239,1,'home','__home__',1,'2024-03-15 19:12:09','2024-03-15 19:12:09','e28d8ea8-77cf-4b0b-88f3-5fd88c9cf668'),(240,240,1,NULL,NULL,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','53e60b98-803b-4de9-80b7-6d9890d0d32b'),(241,241,1,NULL,NULL,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','4826ae29-dad3-4fb2-97b3-077734c5f257'),(243,243,1,NULL,NULL,1,'2024-03-15 19:12:34','2024-03-15 19:12:34','2de5525b-1cc3-4f00-a3c8-c650bba7863c'),(244,244,1,NULL,NULL,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','3b18eb64-41b9-4521-9699-19ffec73598b'),(245,245,1,NULL,NULL,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','2cbed03b-7e85-40e2-8056-0735541e99d2'),(246,246,1,NULL,NULL,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','3a4883a6-4fb7-423a-9243-cbcb31f6dfd8'),(247,247,1,NULL,NULL,1,'2024-03-15 19:12:41','2024-03-15 19:12:41','3115430f-5aa0-4234-b1a7-38a5fbe76857'),(248,248,1,NULL,NULL,1,'2024-03-15 19:12:41','2024-03-15 19:12:41','941a627e-d0e5-49ef-b659-dd051c2a3018'),(251,251,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','fde7a30a-c2d0-45df-a754-c3f56cdbe99d'),(252,252,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','0ff68cf6-443a-4439-9f1a-ef888d352634'),(253,253,1,'home','__home__',1,'2024-03-15 19:12:43','2024-03-15 19:12:43','2ff75de5-85b0-4e09-9998-73cfee1390ae'),(254,254,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','db56a099-b384-4b01-aa85-76ba03a9829e'),(255,255,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','570449d6-05c7-41a5-8acd-dd1b552ac207'),(256,256,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','504184bf-9a50-48fc-8bd9-827080fb945b'),(257,257,1,NULL,NULL,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','b114ff1d-2ce3-4e8b-b967-ae4d920cfb19'),(260,260,1,'home','__home__',1,'2024-03-15 19:12:58','2024-03-15 19:12:58','4afa06b9-882a-4179-959c-4a83e85c16f9'),(261,261,1,NULL,NULL,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','50fd7ce1-9015-4998-89c3-f8c9294eea68'),(262,262,1,NULL,NULL,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','446a1f33-6c45-4145-b404-d83f410505c1'),(263,263,1,NULL,NULL,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','9d1e9173-6784-46dc-ba25-d43d03afd017'),(264,264,1,NULL,NULL,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','79028751-f880-4b3c-9bfa-714689029d14'),(265,265,1,'home','__home__',1,'2024-03-15 19:15:37','2024-03-15 19:15:37','9734414c-483a-4c96-800a-c2f4bc5ffec4'),(266,266,1,NULL,NULL,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','b7d3b9cb-5c03-461a-a8ac-9d9be7f6a9a8'),(267,267,1,NULL,NULL,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','12c66f3a-ea8d-4366-88fc-f910d72d2f8d'),(268,268,1,NULL,NULL,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','fecd9153-ef1b-48c1-b3b2-09f3a586c4d1'),(269,269,1,NULL,NULL,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','49013cb3-efe2-48ce-a561-6cddf6d816b8'),(271,271,1,NULL,NULL,1,'2024-03-15 19:16:49','2024-03-15 19:16:49','e81615a0-b03b-4651-b9b5-ffbd68a45745'),(273,273,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','ff93824f-f519-458d-9762-f30323be42dd'),(274,274,1,'home','__home__',1,'2024-03-15 19:16:52','2024-03-15 19:16:52','0ffa4f30-36ba-4c98-8208-500bee24ad7e'),(275,275,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','91f8ede1-f9e2-473d-8371-3e8a9335eabb'),(276,276,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','4a60060a-683b-4938-8cc0-b5ea269c462b'),(277,277,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','1265a220-359d-48f7-9dc1-d558bb4ee06b'),(278,278,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','6e743da2-272b-4aa8-b943-7e0446b624e2'),(279,279,1,NULL,NULL,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','a3c69593-bf2d-49f4-be2c-c97af3bb1b5f'),(281,281,1,NULL,NULL,1,'2024-03-15 19:21:05','2024-03-15 19:21:05','b8215ee5-2aab-4627-96fb-6c3697b73210'),(283,283,1,NULL,NULL,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','2840fde9-6ee3-49ca-a852-154d87c8f4bc'),(284,284,1,'home','__home__',1,'2024-03-15 19:21:09','2024-03-15 19:21:09','e1c16f77-cf21-4ecc-9e4a-bc64b6972f76'),(285,285,1,NULL,NULL,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','27c011ef-1efb-45a8-92d5-d659eebae7f1'),(286,286,1,NULL,NULL,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','82c947cd-1e69-4824-9501-41175cf6ec51'),(287,287,1,NULL,NULL,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','e09e27e0-d7fb-43a5-94fb-1ccaea9bd3f2'),(288,288,1,NULL,NULL,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','26ef16ee-e500-4163-b24f-8e0d5fc5ce93'),(290,290,1,'home','__home__',1,'2024-03-15 19:23:55','2024-03-15 19:23:55','a9679159-88a0-437d-b089-81b79fc5c28a'),(291,291,1,NULL,NULL,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','1fdede7f-b59e-49b2-9380-a381f2342c24'),(292,292,1,NULL,NULL,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','3914d7ee-985a-4cce-9ed3-07b0c120ee2b'),(295,295,1,'home','__home__',1,'2024-03-15 19:24:38','2024-03-15 19:24:38','b9e933c7-e4ff-4569-890e-ed3fa26a1ae8'),(296,296,1,NULL,NULL,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','0fe80b97-84b1-4664-9b3e-252aead6fd2c'),(297,297,1,NULL,NULL,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','6acdb056-4959-46b7-a72b-31908f6a0c17'),(300,300,1,'home','__home__',1,'2024-03-15 19:27:02','2024-03-15 19:27:02','87e74367-b709-4758-9409-450fcf4461de'),(301,301,1,NULL,NULL,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','7a74afa4-768a-4a5b-b3fe-86fc785b14a6'),(302,302,1,NULL,NULL,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','97eb297a-da74-4ced-a2d6-b1da534be2c8'),(305,305,1,NULL,NULL,1,'2024-03-15 19:32:15','2024-03-15 19:32:15','01ae8653-5a1a-4d3b-858d-bf606fa0005e'),(306,306,1,'home','__home__',1,'2024-03-15 19:32:20','2024-03-15 19:32:20','2f0314fb-b787-476a-8baf-296c0dd339f2'),(307,307,1,NULL,NULL,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','988969e5-b4a4-4ba0-8cd7-667878f15ee7'),(308,308,1,NULL,NULL,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','a6316756-e89d-42f8-a137-6e9a3c0e0e49'),(309,309,1,'home','__home__',1,'2024-03-15 19:33:51','2024-03-15 19:33:51','c0ebd1f5-c3c0-4718-92d9-2d199039f96d'),(310,310,1,NULL,NULL,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','b1a35648-9a54-4595-a727-4a08a315a079'),(311,311,1,NULL,NULL,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','2ab580bf-1793-4e08-b34a-31674ada25af');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,1,'2024-03-12 08:19:00',NULL,1,'2024-03-12 08:16:35','2024-03-12 08:19:46'),(7,1,NULL,1,1,'2024-03-12 08:19:00',NULL,NULL,'2024-03-12 08:19:47','2024-03-12 08:19:47'),(10,1,NULL,1,1,'2024-03-12 08:19:00',NULL,NULL,'2024-03-12 18:05:27','2024-03-12 18:05:27'),(12,1,NULL,1,1,'2024-03-12 08:19:00',NULL,NULL,'2024-03-12 18:05:34','2024-03-12 18:05:34'),(14,1,NULL,1,1,'2024-03-12 18:24:00',NULL,1,'2024-03-12 18:22:32','2024-03-12 18:24:18'),(22,1,NULL,1,1,'2024-03-12 18:24:00',NULL,NULL,'2024-03-12 18:24:18','2024-03-12 18:24:18'),(25,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,1,'2024-03-12 18:29:15','2024-03-12 18:29:15'),(26,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,NULL,'2024-03-12 18:29:15','2024-03-12 18:29:15'),(27,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,NULL,'2024-03-12 18:29:15','2024-03-12 18:29:15'),(28,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,NULL,'2024-03-12 18:29:43','2024-03-12 18:29:43'),(31,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,NULL,'2024-03-12 18:30:49','2024-03-12 18:30:49'),(35,1,NULL,1,1,'2024-03-12 08:19:00',NULL,NULL,'2024-03-12 18:39:06','2024-03-12 18:39:06'),(39,1,NULL,1,1,'2024-03-12 18:24:00',NULL,NULL,'2024-03-12 18:39:39','2024-03-12 18:39:39'),(48,1,NULL,1,1,'2024-03-12 08:19:00',NULL,NULL,'2024-03-12 18:55:38','2024-03-12 18:55:38'),(54,1,NULL,1,1,'2024-03-12 18:24:00',NULL,NULL,'2024-03-12 18:55:56','2024-03-12 18:55:56'),(57,2,NULL,2,NULL,'2024-03-12 18:29:00',NULL,NULL,'2024-03-12 19:05:35','2024-03-12 19:05:35'),(58,1,NULL,1,1,'2024-03-12 19:16:00',NULL,1,'2024-03-12 19:14:50','2024-03-12 19:16:14'),(76,1,NULL,1,1,'2024-03-12 19:16:00',NULL,NULL,'2024-03-12 19:16:14','2024-03-12 19:16:14'),(80,3,NULL,3,1,'2024-03-13 17:32:00',NULL,1,'2024-03-13 17:32:11','2024-03-13 17:43:06'),(81,3,NULL,3,1,'2024-03-13 17:32:00',NULL,NULL,'2024-03-13 17:32:11','2024-03-13 17:43:06'),(82,3,NULL,3,1,'2024-03-13 17:32:00',NULL,NULL,'2024-03-13 17:32:11','2024-03-13 17:43:06'),(83,3,NULL,3,1,'2024-03-13 17:32:00',NULL,NULL,'2024-03-13 17:40:05','2024-03-13 17:43:06'),(84,3,NULL,3,1,'2024-03-13 17:32:00',NULL,NULL,'2024-03-13 17:40:05','2024-03-13 17:43:06'),(85,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:19:49','2024-03-13 18:19:49'),(86,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:19:49','2024-03-13 18:19:49'),(87,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:19:49','2024-03-13 18:19:49'),(88,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:28:43','2024-03-13 18:28:43'),(91,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:30:38','2024-03-13 18:30:38'),(92,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:42:07','2024-03-13 18:42:07'),(95,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:43:40','2024-03-13 18:43:40'),(96,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:59:39','2024-03-13 18:59:39'),(98,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 18:59:56','2024-03-13 18:59:56'),(99,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 19:01:06','2024-03-13 19:01:06'),(100,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-13 19:01:34','2024-03-13 19:01:34'),(101,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-13 19:09:06','2024-03-13 19:09:20'),(102,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-13 19:09:20','2024-03-13 19:09:20'),(103,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-13 19:11:24','2024-03-13 19:11:24'),(104,5,NULL,5,1,'2024-03-13 19:15:00',NULL,NULL,'2024-03-13 19:14:07','2024-03-13 19:15:03'),(105,5,NULL,5,1,'2024-03-13 19:15:00',NULL,NULL,'2024-03-13 19:15:03','2024-03-13 19:15:03'),(113,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 00:20:27','2024-03-14 00:20:27'),(119,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 00:26:46','2024-03-14 00:26:46'),(126,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 01:30:36','2024-03-14 01:30:36'),(128,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 01:33:33','2024-03-14 01:33:33'),(130,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 01:35:37','2024-03-14 01:35:37'),(135,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 01:39:31','2024-03-14 01:39:31'),(145,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 03:00:50','2024-03-14 03:00:50'),(149,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-14 03:01:51','2024-03-14 03:01:51'),(150,5,NULL,5,1,'2024-03-13 19:15:00',NULL,NULL,'2024-03-14 03:16:26','2024-03-14 03:16:26'),(152,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-14 14:06:45','2024-03-14 14:06:45'),(158,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-15 16:11:59','2024-03-15 16:11:59'),(160,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-15 16:13:12','2024-03-15 16:13:12'),(169,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-15 16:27:00','2024-03-15 16:27:00'),(172,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 17:58:21','2024-03-15 17:58:21'),(201,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 18:01:34','2024-03-15 18:01:34'),(204,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 18:29:15','2024-03-15 18:29:15'),(208,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 18:36:24','2024-03-15 18:36:24'),(212,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 18:38:11','2024-03-15 18:38:11'),(218,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:00:05','2024-03-15 19:00:05'),(221,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:02:19','2024-03-15 19:02:19'),(233,5,NULL,5,1,'2024-03-13 19:09:00',NULL,NULL,'2024-03-15 19:08:32','2024-03-15 19:08:32'),(236,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:09:07','2024-03-15 19:09:07'),(239,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:12:09','2024-03-15 19:12:09'),(253,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(260,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:12:58','2024-03-15 19:12:58'),(265,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:15:37','2024-03-15 19:15:37'),(274,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(284,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:21:09','2024-03-15 19:21:09'),(290,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:23:55','2024-03-15 19:23:55'),(295,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:24:38','2024-03-15 19:24:38'),(300,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:27:02','2024-03-15 19:27:02'),(306,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:32:20','2024-03-15 19:32:20'),(309,4,NULL,4,NULL,'2024-03-13 18:19:00',NULL,NULL,'2024-03-15 19:33:51','2024-03-15 19:33:51');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Post','post',1,'site',NULL,NULL,'site',NULL,1,1,'2024-03-12 07:57:32','2024-03-12 08:16:10','2024-03-13 18:18:50','2ff537e2-e2e1-484b-bece-843affc8fc20'),(2,2,6,'About','about',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-03-12 18:29:15','2024-03-12 18:29:15','2024-03-13 18:18:52','473aa05a-4b87-4d61-8ae6-c4b3d5d07cec'),(3,3,9,'Homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-03-13 17:32:11','2024-03-13 17:32:11','2024-03-13 18:18:47','84f58fb2-0124-435d-8d9e-cef783501e91'),(4,4,10,'Home','home',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-03-13 18:19:49','2024-03-13 18:19:49',NULL,'19ce8711-4f29-45cf-90d1-e03e6ffcc8ce'),(5,5,12,'General Pages','generalPages',1,'site',NULL,NULL,'site',NULL,1,1,'2024-03-13 19:07:28','2024-03-13 19:10:27',NULL,'4d996d55-003b-4075-9787-2ebfb1eb4358');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-03-12 07:53:30','2024-03-12 07:53:30',NULL,'cb7c5995-bc64-48d8-82df-be48dfe24f54'),(2,'Blog','2024-03-12 08:03:25','2024-03-12 08:03:25','2024-03-13 18:26:29','6a54aff2-fad4-4a21-9c00-8d3ecd5b3107'),(3,'About','2024-03-12 18:26:32','2024-03-12 18:26:32','2024-03-13 18:26:25','8f18c9e7-8556-4821-9d88-f0dfe36c650e'),(4,'Global','2024-03-12 18:34:15','2024-03-12 18:34:15','2024-03-13 18:26:38','fdb5d398-3348-4b97-87ab-d8c3f3486c44'),(5,'Theme','2024-03-12 18:49:10','2024-03-12 18:49:10',NULL,'0e994035-575e-4e1c-8bb3-653d29289588'),(6,'Hero','2024-03-13 17:22:00','2024-03-13 17:22:00','2024-03-13 18:26:43','6191d563-4328-436a-a8ef-e7cff84ac768'),(7,'Homepage','2024-03-13 18:26:09','2024-03-13 18:26:09','2024-03-13 18:26:20','4e24b7d9-7965-4fa9-bc1b-cda6c467022f'),(8,'Home Page','2024-03-13 18:26:48','2024-03-13 18:26:48',NULL,'7df69a92-4f52-4458-a156-40f95c71286c'),(9,'Reusables','2024-03-13 19:29:21','2024-03-13 19:29:21','2024-03-14 01:41:44','651e6c2e-df2c-43a3-a1a1-182f58b30fc4'),(10,'Flexible Content','2024-03-14 00:30:09','2024-03-14 00:30:09','2024-03-14 01:41:48','ed364f0b-7079-4ed6-8a84-1039f85359aa');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (10,8,11,11,0,0,'2024-03-12 18:50:40','2024-03-12 18:50:40','4547fbae-5150-4392-8487-ac2aefeadef6'),(11,8,11,12,0,1,'2024-03-12 18:50:40','2024-03-12 18:50:40','0c5140dd-246f-4185-9e3b-44287369c39a'),(31,13,25,28,0,0,'2024-03-13 19:19:19','2024-03-13 19:19:19','55529a7b-378b-4bc9-87d8-0b3c30fc036c'),(32,13,25,29,1,1,'2024-03-13 19:19:19','2024-03-13 19:19:19','c6eb4be8-4a2c-45ba-b143-6451d441a17c'),(33,14,26,27,0,0,'2024-03-13 19:19:52','2024-03-13 19:19:52','b72b8aa7-7501-40ea-87a6-03aaabe3a12d'),(34,15,27,26,0,0,'2024-03-13 19:25:58','2024-03-13 19:25:58','6a411bab-8ae8-4e1a-a91a-285099328980'),(80,21,44,51,0,0,'2024-03-15 19:03:46','2024-03-15 19:03:46','1098d0a9-476e-41e2-a191-275307cf06a4'),(81,21,44,52,0,1,'2024-03-15 19:03:46','2024-03-15 19:03:46','25f800d9-3f8e-4a10-9084-5e412fc8a2f8'),(82,22,45,54,0,0,'2024-03-15 19:03:46','2024-03-15 19:03:46','65264469-0511-40ae-87c0-4f231b76b34a'),(83,22,45,53,0,1,'2024-03-15 19:03:46','2024-03-15 19:03:46','93fed054-7ee3-448e-a613-2cf171acfaf6'),(90,12,48,26,0,1,'2024-03-15 19:05:40','2024-03-15 19:05:40','9880b370-f35d-492f-9ada-2a511b742abd'),(91,12,48,50,0,2,'2024-03-15 19:05:40','2024-03-15 19:05:40','8db0f5f0-8ca3-4ad9-b5aa-a38e46781712'),(113,18,54,38,0,0,'2024-03-15 19:18:32','2024-03-15 19:18:32','35247116-b008-4b6b-afcf-8f7fa8ebcd5c'),(114,18,54,37,0,1,'2024-03-15 19:18:32','2024-03-15 19:18:32','375d5e26-7a1a-4c30-be29-85ea58d02dc9'),(115,18,54,43,0,2,'2024-03-15 19:18:32','2024-03-15 19:18:32','d70d0d1c-74a4-42d9-954d-e5b1e87ae07c'),(116,18,54,44,0,3,'2024-03-15 19:18:32','2024-03-15 19:18:32','00199f6a-1b41-4232-8e6e-b19be48d4ce7'),(117,18,54,42,0,4,'2024-03-15 19:18:32','2024-03-15 19:18:32','4017b91d-889b-4aac-990e-dc874d8a86be'),(118,18,54,41,0,5,'2024-03-15 19:18:32','2024-03-15 19:18:32','88942035-c319-4168-bd1e-0d2e19be2825'),(132,10,58,19,0,0,'2024-03-15 19:33:51','2024-03-15 19:33:51','33bfb865-ebb2-4a84-928f-460f0e0217ff'),(133,10,58,20,0,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','501f5afd-1500-4e3a-ad80-c5959e1291f8'),(134,10,58,36,0,3,'2024-03-15 19:33:51','2024-03-15 19:33:51','f308347d-bf90-48ba-a0f8-96f1eac2e3e3'),(140,23,60,55,0,0,'2024-03-15 19:34:28','2024-03-15 19:34:28','c76c9861-6d5a-4d56-b5c4-6f97bb6cc9cb'),(141,23,60,56,0,1,'2024-03-15 19:34:28','2024-03-15 19:34:28','25dd5cb3-cb78-4c62-9e67-bf7b0bd4c279'),(142,23,60,57,0,2,'2024-03-15 19:34:28','2024-03-15 19:34:28','f5e228b2-a617-4443-8316-3b3af11d5c66'),(143,23,60,58,0,3,'2024-03-15 19:34:28','2024-03-15 19:34:28','eac496ef-a100-45da-820b-c1aef36e9f52'),(144,23,60,59,0,4,'2024-03-15 19:34:28','2024-03-15 19:34:28','6cd74075-97a6-4a50-93a7-2071d8d563fe');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-03-12 07:57:32','2024-03-12 07:57:32','2024-03-13 18:18:50','88581bcc-0de6-463f-8007-53b4074dd90b'),(2,'craft\\elements\\Category','2024-03-12 08:01:05','2024-03-12 08:01:05',NULL,'585599e4-ccdc-4d2b-8e20-4147b39648b7'),(3,'craft\\elements\\Asset','2024-03-12 08:07:19','2024-03-12 08:07:19','2024-03-13 18:24:16','ce01990c-3a36-458a-90ea-38e29562762e'),(4,'craft\\elements\\MatrixBlock','2024-03-12 08:11:35','2024-03-12 08:11:35','2024-03-13 18:26:29','78fff8f2-5e84-48ca-b8e8-e1c9e1d5c7cc'),(5,'craft\\elements\\MatrixBlock','2024-03-12 08:14:05','2024-03-12 08:14:05','2024-03-13 18:26:29','74a56d52-c4f4-49c8-88e8-3101c3563ca3'),(6,'craft\\elements\\Entry','2024-03-12 18:29:15','2024-03-12 18:29:15','2024-03-13 18:18:52','98fd74ce-ed05-4217-94ad-f12c8694053a'),(7,'craft\\elements\\GlobalSet','2024-03-12 18:35:26','2024-03-12 18:35:26',NULL,'bd871683-582d-449c-9c2d-044a91c0c3ee'),(8,'craft\\elements\\GlobalSet','2024-03-12 18:50:40','2024-03-12 18:50:40',NULL,'81f5816b-a65f-42a1-9c77-97fbbb525f37'),(9,'craft\\elements\\Entry','2024-03-13 17:32:11','2024-03-13 17:32:11','2024-03-13 18:18:47','1ef0a87a-73bb-461b-977f-4013ef7e7dd8'),(10,'craft\\elements\\Entry','2024-03-13 18:19:49','2024-03-13 18:19:49',NULL,'bede0e2a-eb4a-4b92-b927-f4d65d2a43e2'),(11,'craft\\elements\\Asset','2024-03-13 18:25:43','2024-03-13 18:25:43',NULL,'f4a19b36-6ca0-477d-8d43-f2664f89d3cc'),(12,'craft\\elements\\Entry','2024-03-13 19:07:28','2024-03-13 19:07:28',NULL,'cb2bc273-c6a3-488d-8912-64315810e37b'),(13,'craft\\elements\\MatrixBlock','2024-03-13 19:19:19','2024-03-13 19:19:19',NULL,'81dcc0f1-85a5-4d1b-9e37-5dc413f21535'),(14,'craft\\elements\\GlobalSet','2024-03-13 19:19:52','2024-03-13 19:19:52',NULL,'4a42f1cc-020e-49af-9420-1376884d8569'),(15,'craft\\elements\\GlobalSet','2024-03-13 19:25:58','2024-03-13 19:25:58',NULL,'717f854c-f9f4-4178-98ed-057ea260fcfc'),(16,'craft\\elements\\MatrixBlock','2024-03-14 00:17:45','2024-03-14 00:17:45','2024-03-14 01:35:10','e1f8d081-6e9d-41bd-81c3-664fa75b44a8'),(17,'craft\\elements\\MatrixBlock','2024-03-14 01:38:47','2024-03-14 01:38:47','2024-03-14 01:41:55','545253fd-399e-4e76-9323-557a3c55e683'),(18,'craft\\elements\\MatrixBlock','2024-03-14 02:59:25','2024-03-14 02:59:25',NULL,'276c2b51-908f-4fd6-bfd4-d8f1febf2326'),(19,'craft\\elements\\MatrixBlock','2024-03-14 02:59:51','2024-03-14 02:59:51','2024-03-15 17:57:18','dcc21363-9a6e-454f-a476-0d0d0ca70557'),(20,'craft\\elements\\MatrixBlock','2024-03-15 17:57:19','2024-03-15 17:57:19','2024-03-15 19:34:07','c652d5cc-d86c-4697-b409-cac809110ce3'),(21,'craft\\elements\\MatrixBlock','2024-03-15 19:03:46','2024-03-15 19:03:46',NULL,'20b016d3-a119-48cb-97eb-20d21b58471c'),(22,'craft\\elements\\MatrixBlock','2024-03-15 19:03:46','2024-03-15 19:03:46',NULL,'74046e26-83b1-4c05-b5b7-a0401f688af5'),(23,'craft\\elements\\MatrixBlock','2024-03-15 19:16:42','2024-03-15 19:16:42',NULL,'df3b0483-e9fa-4d8a-9638-27a9757774bc');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (2,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"48bba664-09ff-488a-b4e4-f2dd16e4f441\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-03-12 08:01:05','2024-03-12 08:01:05','a8e5a4f2-b65a-429a-8aa4-62bf74c3f65c'),(3,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"06d71ff0-2a4e-4a4c-b74f-c234c83fe09d\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-03-12 08:07:19','2024-03-12 08:07:19','8ba222cc-bda8-45e6-ab8b-31342a95af11'),(4,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"e5910516-af4b-448b-87fb-0dcd2db8fdf2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a8f8c442-abc8-422f-b618-9e84d80abafe\"}]',1,'2024-03-12 08:11:35','2024-03-12 08:11:35','bbed370b-e201-4766-80e6-c89f0e1abf31'),(5,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"70991407-0abb-4ccf-8663-20a0edd43bed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"724ff883-cf9e-40a2-8aa5-a4d0984872dc\"}]',1,'2024-03-12 08:14:05','2024-03-12 08:14:05','c7359852-de88-441c-ada2-d01d18625cf4'),(6,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"1d8b2397-6317-4619-a4e6-d31aeb24dc3e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"05630565-8385-4364-8793-1cdbd7695a9a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"fce14b0b-f07d-44ec-9984-c86ce5fecf8b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1af0c0e9-fdea-474e-96f8-250b50d1d16a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d6349acb-cda8-4046-8c9b-54bc2138617a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"38e171ee-5150-4724-a5ad-8c6ebd1945cc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e6bf019b-b7e9-49ec-b33d-3b8ed4869e20\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6e7cb940-3476-41ce-979d-c8f128896bba\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"66c586bf-2544-4ddc-894d-e85979f0f449\"}]',1,'2024-03-12 08:16:10','2024-03-12 08:16:10','1fec3997-71b2-4037-8232-58b013ba1839'),(8,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"d2e8a9c6-c957-46e7-9bd9-c9accbd6ce2d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"28884a3e-335b-4612-b319-e36c5bf0ed0c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"87db5935-3731-4024-b91c-22be0a8b8d51\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"afc8a391-5385-474e-9e98-e4fc6a57be24\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2495ee16-b2e0-44ec-8c28-0c78ecd86201\"}]',1,'2024-03-12 18:29:43','2024-03-12 18:29:43','fea335ae-0996-44a6-94fa-474cc4c383b4'),(10,7,'Settings, Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2877957a-b901-4a57-8696-251c4eb07864\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0607773e-9c59-4125-bcb9-92a9e9b4d051\"}]',1,'2024-03-12 18:36:16','2024-03-12 18:36:16','ab47cc22-ceca-4b79-9893-cafcae5a2d17'),(11,8,'Theme Attributes','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"38618dd4-0031-4132-9a45-e0904ee2b874\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"892343d4-fa88-44a7-a3dc-b1f85ed09d14\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a41d82bc-b0db-471c-906a-e0e3128b7c1d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0f97f974-e467-4b69-8517-a0926b0e9e13\"}]',1,'2024-03-12 18:50:40','2024-03-12 18:50:40','2fd2b93f-f908-4e67-8fde-13d07695857d'),(12,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"b267d905-9579-4a16-80f1-0a19fbfa3672\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-03-13 17:32:11','2024-03-13 17:32:11','cbb8fb3f-f791-42cb-9bf6-de47be6995c0'),(14,11,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"a5ca40c0-ec50-4c16-ba53-115dc9674d27\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-03-13 18:25:43','2024-03-13 18:25:43','ab5692d0-f40e-4b52-b6d0-0e5b1af367cf'),(25,13,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5525f891-2e5e-4ba7-9580-54e0ebe98b7f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"15aecb61-314d-4c70-adcd-074b17d648ce\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"b6901738-77eb-4bab-9a8d-de65198ecc7a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"021d4b47-bc7f-4d3f-857a-637e21ee42f4\"}]',1,'2024-03-13 19:19:19','2024-03-13 19:19:19','e97c6f6c-ab3e-459c-9300-076eb62cbe7f'),(26,14,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"92f78132-fbd7-4ee6-a7be-ea49e1474329\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"bb17fd16-c37c-4754-bb83-b9f6f6de89fc\"}]',1,'2024-03-13 19:19:52','2024-03-13 19:19:52','d86c3e7a-3883-433f-b546-9c2a7a7f6bcf'),(27,15,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"19983e50-427f-4416-9948-842aa6ec2e50\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ea633514-acd9-4e88-a61a-cd5981e869f2\"}]',1,'2024-03-13 19:25:58','2024-03-13 19:25:58','294dc4d4-2803-4f73-b84b-8499bdcedeca'),(28,16,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f09393c0-7350-4cbb-9aa0-885d7c81f878\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a0cb6bd4-c56c-429f-96cf-e6a8afbb439f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f9656404-76f0-4b55-ba0d-f87a84ab0c58\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e83c3749-1707-48d3-a9e4-582af4b45760\"}]',1,'2024-03-14 00:17:45','2024-03-14 00:17:45','8619dade-e554-41ab-a660-074cf3e83a81'),(31,17,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4d554547-3dd1-48c5-833b-bea969685137\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ddf6949f-e578-44c9-9e32-ebe59c0c329c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"815a184a-a73a-495b-8c70-862d34483519\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1414ae1c-d44b-4a4c-b14f-a63285ae7585\"}]',1,'2024-03-14 01:38:47','2024-03-14 01:38:47','74d96f25-0ffa-41ef-9ecb-82347b35d849'),(36,19,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"782bb1f2-c028-4c1e-b5d8-ff8c1e8fcf67\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"42caa027-4021-4d69-9c12-60df8e7b73c9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"67f973aa-85db-4aad-8d83-d0711aba9d10\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"628b25c7-5a2a-4b1d-bc74-50f61c6c802e\"}]',1,'2024-03-14 02:59:51','2024-03-14 02:59:51','9b8dce3a-a14f-483f-bd1d-35d12f0d2690'),(44,21,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0a8e9fa1-4feb-454a-8073-ccd38ef8b783\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a96d7157-2fee-40f5-be22-4393da46eed5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4e665919-4aae-4fa9-bf2c-f1b3c590c156\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"bfdab4cd-2c3b-47cd-90e0-030896b4ccbb\"}]',1,'2024-03-15 19:03:46','2024-03-15 19:03:46','f2fb05b3-b5d2-4e5f-994d-7e593ffcf527'),(45,22,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"bd7b40ba-dd22-460d-868b-3e7ba4a6c1bb\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d91ee4fe-03e7-4894-b1bd-5748a2757cea\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"38fbefe8-e3e6-4062-a716-98763ef8a8f3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715\"}]',1,'2024-03-15 19:03:46','2024-03-15 19:03:46','ba2732b7-3708-462e-9794-110caebda7c4'),(48,12,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"ea9dcff4-9303-4f1c-b397-8f9e54547091\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"245066b2-2dfb-4da6-bc98-de95e950f3d9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ea633514-acd9-4e88-a61a-cd5981e869f2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0d476f51-b952-4f9f-a979-ec63af66503a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cbc7d1f8-d1e1-4e73-900f-4446c434467a\"}]',1,'2024-03-15 19:05:40','2024-03-15 19:05:40','74bae685-e077-4384-862b-d3d1ae6eaf0c'),(54,18,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4a623508-d032-4564-b446-ff336a936ef1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"17a714e7-b782-446d-8fd0-88194674d861\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"41ed2941-0ddb-43a6-a8d3-41e4f6728a26\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3b89b01b-6466-472c-96b6-9e004255796b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"11610684-ff2e-42ab-8968-2b9c1d9d8131\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"57c2b1c2-3ced-44b2-837b-054fd01924eb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e4bad610-2ed7-41ae-8b04-4bc7587f232e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f31e57df-2d52-4bf2-b83f-eb67f2336e5c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8a1d8d8b-4043-453a-bd12-320e6cd3fa69\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6b7cc2b3-a7b1-4804-8cd1-a8834704815e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"7b897645-a6a5-4a60-97a0-64893b37c978\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"3b46d0fc-aa81-4dc1-80eb-f7d0a1965692\"}]',1,'2024-03-15 19:18:32','2024-03-15 19:18:32','bfca6d6f-4cb7-4ebc-8454-14c7016b614c'),(55,20,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"88271c41-87e8-4f01-8833-b3014151b94e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4f35bc35-19b3-4b7e-9561-e264bf15ba90\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3fb06015-4306-40e2-8301-0c1278f905a9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2677d71e-8b9f-44fb-b6dd-191944e5a29c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"31d368ef-e325-4270-a1cc-aba629f02b6d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e03203bc-b468-45ee-ba50-72c50c6041e6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"a334168b-cedb-41e2-bb57-857052cb4551\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2d5d9a21-6eb2-413d-bba5-48187822b6af\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"c3d10e69-6488-4107-986b-581ab9439217\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d003f17e-7ab0-4249-894e-78af31c8a363\"}]',1,'2024-03-15 19:18:32','2024-03-15 19:18:32','e952c979-108b-46a8-a7f9-1a8d96873a19'),(58,10,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b98a8938-1da7-4514-9727-9dfe3ff79f0f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"581665f5-b39a-4e5c-bdbc-ed16d26cf7d7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"88673388-449e-4a63-8fd4-d7f26ede48ce\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"01e3bca3-1c13-45b2-b071-7542eca83665\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"41e95b13-e94d-4042-9cdd-f8ba4568397c\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fa5f176d-23c8-4007-b594-f4edc6f39242\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2\"}]',1,'2024-03-15 19:33:51','2024-03-15 19:33:51','81b15e17-b6ce-4808-8973-e84babe62107'),(60,23,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6bc57aa4-3d28-4e39-812b-de8631eff65d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b0857505-9e9f-45b2-9506-a672d60e26ae\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"558c44e5-ca57-4762-88ef-8d090ed5314e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9de04f40-e324-45be-b679-e03d810134ba\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2800146c-a5f5-4850-b19c-06a4b159ec6c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e9ec9064-d697-4b51-b19f-c2fe238860e7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1415ff71-7bde-4e0f-a607-1102a7bce0cf\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"889afe97-58bc-4196-94ae-4bfaa6dee91c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"aebeae3a-7468-4b3f-a49a-e3827eede47f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e531bff2-086e-4075-b96d-87f72f393075\"}]',1,'2024-03-15 19:34:28','2024-03-15 19:34:28','15126328-3490-4d75-9c98-587b227eb632');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (11,5,'Background Color','backgroundColor','global','ozjsnfcs',NULL,0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":\"#ffffff\"}','2024-03-12 18:49:36','2024-03-12 18:49:36','892343d4-fa88-44a7-a3dc-b1f85ed09d14'),(12,5,'Color','color','global','rzxodpzb',NULL,0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2024-03-12 18:49:46','2024-03-12 18:49:46','0f97f974-e467-4b69-8517-a0926b0e9e13'),(19,8,'Hero Title','heroTitle','global','vurasdzu',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-13 18:27:02','2024-03-13 18:27:02','581665f5-b39a-4e5c-bdbc-ed16d26cf7d7'),(20,8,'Hero Image','heroImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":false,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Add a background image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2024-03-13 18:28:00','2024-03-13 18:28:00','01e3bca3-1c13-45b2-b071-7542eca83665'),(26,1,'Rich Text','richText','global','cxxkbghi',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2024-03-13 19:10:48','2024-03-13 19:10:48','ea633514-acd9-4e88-a61a-cd5981e869f2'),(27,1,'Nav Links','navLinks','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_navlinks}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2024-03-13 19:19:19','2024-03-13 19:19:19','bb17fd16-c37c-4754-bb83-b9f6f6de89fc'),(28,NULL,'Link Text','linkText','matrixBlockType:997c3c06-c3a0-405a-8124-81f9be8bd6aa','dmlwsaio',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-13 19:19:19','2024-03-13 19:19:19','15aecb61-314d-4c70-adcd-074b17d648ce'),(29,NULL,'Link Destination','linkDestination','matrixBlockType:997c3c06-c3a0-405a-8124-81f9be8bd6aa',NULL,NULL,0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":\"Select an Entry\",\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2024-03-13 19:19:19','2024-03-13 19:19:19','021d4b47-bc7f-4d3f-857a-637e21ee42f4'),(36,1,'Flexible Content Home Page','flexibleContentHomePage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":1,\"maxBlocks\":null,\"contentTable\":\"{{%matrixcontent_flexiblecontenthomepage}}\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null}','2024-03-14 02:59:25','2024-03-15 19:15:22','8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2'),(37,NULL,'Copy','copy','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5','nklrfppd',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-14 02:59:25','2024-03-14 02:59:25','3b89b01b-6466-472c-96b6-9e004255796b'),(38,NULL,'Headline','headline','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5','ycnrgkxq',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-14 02:59:25','2024-03-15 17:57:18','17a714e7-b782-446d-8fd0-88194674d861'),(41,NULL,'CTA Text','ctaText','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5','bibxkkpq',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 17:57:18','2024-03-15 17:57:18','3b46d0fc-aa81-4dc1-80eb-f7d0a1965692'),(42,NULL,'Align','align','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5','wnoitahb',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"columnType\":null,\"options\":[{\"label\":\"Image Left\",\"value\":\"imageLeft\",\"default\":\"\"},{\"label\":\"Image Right\",\"value\":\"imageRight\",\"default\":\"\"}]}','2024-03-15 17:57:18','2024-03-15 17:57:18','6b7cc2b3-a7b1-4804-8cd1-a8834704815e'),(43,NULL,'Image','image','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-03-15 17:57:18','2024-03-15 19:11:16','57c2b1c2-3ced-44b2-837b-054fd01924eb'),(44,NULL,'CTA URL','ctaUrl','matrixBlockType:71232de7-51a6-445b-b0c2-1d96f10a4ed5','dyrusuxk',NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\"]}','2024-03-15 17:57:18','2024-03-15 17:57:18','f31e57df-2d52-4bf2-b83f-eb67f2336e5c'),(50,1,'Flexible Content Test','flexibleContentTest','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_flexiblecontenttest}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2024-03-15 19:03:46','2024-03-15 19:07:14','cbc7d1f8-d1e1-4e73-900f-4446c434467a'),(51,NULL,'Headline','headline','matrixBlockType:b5af04ab-ce33-4660-9f86-ae9c13414487','tmlvsryk',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:03:46','2024-03-15 19:03:46','a96d7157-2fee-40f5-be22-4393da46eed5'),(52,NULL,'Copy','copy','matrixBlockType:b5af04ab-ce33-4660-9f86-ae9c13414487','zdunwetq',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:03:46','2024-03-15 19:03:46','bfdab4cd-2c3b-47cd-90e0-030896b4ccbb'),(53,NULL,'Copy','copy','matrixBlockType:02a261f5-9476-40b2-8618-c82c2dbb9426','xjzmrlcs',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:03:46','2024-03-15 19:03:46','5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715'),(54,NULL,'Headline','headline','matrixBlockType:02a261f5-9476-40b2-8618-c82c2dbb9426','mwdauzdb',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:03:46','2024-03-15 19:03:46','d91ee4fe-03e7-4894-b1bd-5748a2757cea'),(55,NULL,'Headline','headline','matrixBlockType:f979c110-44b0-43ac-818d-ddf7195384af','qquihnjd',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:16:42','2024-03-15 19:16:42','b0857505-9e9f-45b2-9506-a672d60e26ae'),(56,NULL,'Copy','copy','matrixBlockType:f979c110-44b0-43ac-818d-ddf7195384af','pcssnztx',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":null,\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2024-03-15 19:22:43','2024-03-15 19:22:43','9de04f40-e324-45be-b679-e03d810134ba'),(57,NULL,'Background Image','backgroundImage','matrixBlockType:f979c110-44b0-43ac-818d-ddf7195384af',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-03-15 19:22:44','2024-03-15 19:23:34','e9ec9064-d697-4b51-b19f-c2fe238860e7'),(58,NULL,'CTA URL','ctaUrl','matrixBlockType:f979c110-44b0-43ac-818d-ddf7195384af','vmygejpy',NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\"]}','2024-03-15 19:23:34','2024-03-15 19:23:34','889afe97-58bc-4196-94ae-4bfaa6dee91c'),(59,NULL,'CTA Text','ctaText','matrixBlockType:f979c110-44b0-43ac-818d-ddf7195384af','izqpfkpk',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-03-15 19:23:34','2024-03-15 19:23:34','e531bff2-086e-4075-b96d-87f72f393075');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (32,'Site Info','siteInfo',7,1,'2024-03-12 18:35:26','2024-03-12 18:35:26','f9c060b6-2943-474e-beca-5c6f7b27c42a'),(42,'Theme','theme',8,2,'2024-03-12 18:48:54','2024-03-12 18:50:40','2e1c1af8-9c30-43e4-b217-d7a1b95e92fc'),(106,'Header','header',14,3,'2024-03-13 19:19:52','2024-03-13 19:19:52','4fa9a481-7a66-4022-8477-1d13c675acd5'),(108,'Footer','footer',15,4,'2024-03-13 19:25:58','2024-03-13 19:25:58','51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2024-03-12 07:54:45','2024-03-12 07:54:45','775f1c8e-4135-4d59-b362-a425abb5dca3');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'Thumbnail','thumbnail','fit','center-center',1200,NULL,NULL,NULL,'none',NULL,0,'2024-03-12 19:02:31','2024-03-12 19:02:31','2024-03-12 19:02:31','f2b65d79-5eed-4159-b174-6f4d268e81d8');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.8.2','4.5.3.0',0,'kkocjdnlayfj','3@oknjsjuaea','2024-03-12 07:53:30','2024-03-15 19:34:28','41834653-ac9d-419b-b7e4-7777ecdb47a9');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (107,106,27,3,NULL,'2024-03-13 19:20:56','2024-03-13 19:20:56'),(144,101,36,6,0,'2024-03-14 03:00:50','2024-03-14 03:00:50'),(147,145,36,6,NULL,'2024-03-14 03:00:50','2024-03-14 03:00:50'),(151,150,36,6,NULL,'2024-03-14 03:16:26','2024-03-14 03:16:26'),(153,152,36,6,NULL,'2024-03-14 14:06:45','2024-03-14 14:06:45'),(167,101,36,6,NULL,'2024-03-15 16:27:00','2024-03-15 16:27:00'),(170,169,36,6,NULL,'2024-03-15 16:27:00','2024-03-15 16:27:00'),(199,85,36,6,NULL,'2024-03-15 18:01:34','2024-03-15 18:01:34'),(202,201,36,6,NULL,'2024-03-15 18:01:34','2024-03-15 18:01:34'),(205,204,36,6,NULL,'2024-03-15 18:29:15','2024-03-15 18:29:15'),(209,208,36,6,NULL,'2024-03-15 18:36:24','2024-03-15 18:36:24'),(213,212,36,6,NULL,'2024-03-15 18:38:11','2024-03-15 18:38:11'),(219,218,36,6,NULL,'2024-03-15 19:00:05','2024-03-15 19:00:05'),(222,221,36,6,NULL,'2024-03-15 19:02:19','2024-03-15 19:02:19'),(231,101,50,9,NULL,'2024-03-15 19:08:32','2024-03-15 19:08:32'),(232,101,50,10,NULL,'2024-03-15 19:08:32','2024-03-15 19:08:32'),(234,233,50,9,NULL,'2024-03-15 19:08:32','2024-03-15 19:08:32'),(235,233,50,10,NULL,'2024-03-15 19:08:32','2024-03-15 19:08:32'),(237,236,36,6,NULL,'2024-03-15 19:09:07','2024-03-15 19:09:07'),(240,239,36,6,NULL,'2024-03-15 19:12:09','2024-03-15 19:12:09'),(251,85,50,9,0,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(252,85,50,10,0,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(254,253,36,6,NULL,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(256,253,50,9,NULL,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(257,253,50,10,NULL,'2024-03-15 19:12:43','2024-03-15 19:12:43'),(261,260,36,6,NULL,'2024-03-15 19:12:58','2024-03-15 19:12:58'),(263,260,50,9,NULL,'2024-03-15 19:12:58','2024-03-15 19:12:58'),(264,260,50,10,NULL,'2024-03-15 19:12:58','2024-03-15 19:12:58'),(266,265,36,6,NULL,'2024-03-15 19:15:37','2024-03-15 19:15:37'),(268,265,50,9,NULL,'2024-03-15 19:15:37','2024-03-15 19:15:37'),(269,265,50,10,NULL,'2024-03-15 19:15:37','2024-03-15 19:15:37'),(273,85,36,11,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(275,274,36,6,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(277,274,36,11,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(278,274,50,9,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(279,274,50,10,NULL,'2024-03-15 19:16:52','2024-03-15 19:16:52'),(285,284,36,6,NULL,'2024-03-15 19:21:09','2024-03-15 19:21:09'),(287,284,36,11,NULL,'2024-03-15 19:21:09','2024-03-15 19:21:09'),(291,290,36,6,NULL,'2024-03-15 19:23:55','2024-03-15 19:23:55'),(292,290,36,11,NULL,'2024-03-15 19:23:55','2024-03-15 19:23:55'),(296,295,36,6,NULL,'2024-03-15 19:24:38','2024-03-15 19:24:38'),(297,295,36,11,NULL,'2024-03-15 19:24:38','2024-03-15 19:24:38'),(301,300,36,6,NULL,'2024-03-15 19:27:02','2024-03-15 19:27:02'),(302,300,36,11,NULL,'2024-03-15 19:27:02','2024-03-15 19:27:02'),(307,306,36,6,NULL,'2024-03-15 19:32:20','2024-03-15 19:32:20'),(308,306,36,11,NULL,'2024-03-15 19:32:20','2024-03-15 19:32:20'),(310,309,36,6,NULL,'2024-03-15 19:33:51','2024-03-15 19:33:51'),(311,309,36,11,NULL,'2024-03-15 19:33:51','2024-03-15 19:33:51');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (107,106,1),(144,101,1),(147,145,2),(151,150,1),(153,152,1),(167,101,1),(170,169,1),(199,85,1),(202,201,1),(205,204,1),(209,208,1),(213,212,1),(219,218,1),(222,221,1),(231,101,1),(232,101,2),(234,233,1),(235,233,2),(237,236,1),(240,239,1),(251,85,1),(252,85,2),(254,253,1),(256,253,1),(257,253,2),(261,260,1),(263,260,1),(264,260,2),(266,265,1),(268,265,1),(269,265,2),(273,85,2),(275,274,1),(277,274,3),(278,274,1),(279,274,2),(285,284,1),(287,284,3),(291,290,1),(292,290,2),(296,295,1),(297,295,2),(301,300,1),(302,300,2),(307,306,1),(308,306,2),(310,309,1),(311,309,2);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (3,27,13,'Link','link',1,'2024-03-13 19:19:19','2024-03-13 19:19:19','997c3c06-c3a0-405a-8124-81f9be8bd6aa'),(6,36,18,'Left Right Module','leftRightModule',1,'2024-03-14 02:59:25','2024-03-15 19:18:32','71232de7-51a6-445b-b0c2-1d96f10a4ed5'),(9,50,21,'Block1','block1',1,'2024-03-15 19:03:46','2024-03-15 19:03:46','b5af04ab-ce33-4660-9f86-ae9c13414487'),(10,50,22,'Block2','block2',2,'2024-03-15 19:03:46','2024-03-15 19:03:46','02a261f5-9476-40b2-8618-c82c2dbb9426'),(11,36,23,'Animated Content','animatedContent',2,'2024-03-15 19:16:42','2024-03-15 19:34:28','f979c110-44b0-43ac-818d-ddf7195384af');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_flexiblecontenthomepage`
--

LOCK TABLES `matrixcontent_flexiblecontenthomepage` WRITE;
/*!40000 ALTER TABLE `matrixcontent_flexiblecontenthomepage` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_flexiblecontenthomepage` VALUES (1,138,1,'2024-03-14 03:00:26','2024-03-14 03:00:26','4750f607-4797-42db-9ea1-d8259b429a3c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,139,1,'2024-03-14 03:00:37','2024-03-14 03:00:37','c9fbe4a0-aa60-4384-a401-5170fcb501b7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,140,1,'2024-03-14 03:00:37','2024-03-14 03:00:37','f53267e8-1372-4cf2-bf2c-3841796044d0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,143,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','343f5886-6fb4-4bdc-a179-f1b7432226e6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,144,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','6066de97-8ec4-4904-895e-b707934e7610','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,146,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','3ae149bd-93e7-4592-bd4a-62273ff5b161',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,147,1,'2024-03-14 03:00:50','2024-03-14 03:00:50','920bbf36-0b02-4d27-bb69-e1f0c24868d9','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,151,1,'2024-03-14 03:16:26','2024-03-14 03:16:26','6cf82711-008c-408e-8ffc-6bf90dde1fa2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,153,1,'2024-03-14 14:06:45','2024-03-14 14:06:45','b379dcf1-da5f-455f-9a9e-0ebce8df98f2','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,154,1,'2024-03-14 14:06:45','2024-03-14 14:06:45','88a08d42-cf90-428e-9d1f-56205384ab75',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,156,1,'2024-03-15 15:38:15','2024-03-15 15:38:15','fb4550b4-ce40-495b-bac6-c9e44d18f907',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,162,1,'2024-03-15 16:26:50','2024-03-15 16:26:50','9a514bd7-9961-412a-8ac2-e44c406ccec8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,163,1,'2024-03-15 16:26:55','2024-03-15 16:26:55','8984478f-d4ec-482c-93cc-0acd1dcce6f9','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,164,1,'2024-03-15 16:26:55','2024-03-15 16:26:55','49089e44-3e6e-4ae6-a893-9d2db7ba6367',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,167,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','ff1b4564-4e1a-41b4-8c00-c08f322ae62b','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,168,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','7d4683fc-4448-45c5-beea-851002f15483',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,170,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','41b5bf1b-bdcd-4c72-bcfc-31182fe456fc','Test 1','Test 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,171,1,'2024-03-15 16:27:00','2024-03-15 16:27:00','e2c7d03d-5666-4ff3-ae7f-068bdb5cc034',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,173,1,'2024-03-15 17:58:30','2024-03-15 17:58:30','017c1d0d-c84f-4dbb-a786-4925e323fdf7',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(24,174,1,'2024-03-15 17:58:33','2024-03-15 17:58:33','b3aa3681-063a-4778-ad9c-1c6e2a737052',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(25,175,1,'2024-03-15 17:58:33','2024-03-15 17:58:33','c32424fa-1493-4bdc-bb8a-27a4d026f65c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,176,1,'2024-03-15 17:58:50','2024-03-15 17:58:50','9ab70b65-c25a-4f04-81da-70970f0162cc',NULL,'THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT',NULL,'',NULL,NULL,NULL,NULL,NULL),(27,177,1,'2024-03-15 17:58:50','2024-03-15 17:58:50','d45812c6-505b-44aa-bf28-7b2358c3b055',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,178,1,'2024-03-15 17:58:51','2024-03-15 17:58:51','83de3505-6f19-48bf-a824-be32e1d21b2b',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL),(29,179,1,'2024-03-15 17:58:51','2024-03-15 17:58:51','c9305eec-e698-4e8e-82ad-1342b2785c34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,180,1,'2024-03-15 17:58:52','2024-03-15 17:58:52','6e1af67c-a873-4f19-88e7-d5d338fb83e5',NULL,'THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT',NULL,'',NULL,NULL,NULL,NULL,NULL),(31,181,1,'2024-03-15 17:58:52','2024-03-15 17:58:52','dd2ab64e-53ea-42ef-8d65-85bb8e01d0f0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,182,1,'2024-03-15 17:58:58','2024-03-15 17:58:58','6e245e34-b881-4e43-9f2e-0e4422e3ace7','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT',NULL,'',NULL,NULL,NULL,NULL,NULL),(33,183,1,'2024-03-15 17:58:58','2024-03-15 17:58:58','8687537f-c6dc-4d54-8661-f07a2705ff96',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,184,1,'2024-03-15 17:59:03','2024-03-15 17:59:03','8edcbd02-633c-44ae-8c76-776e69a06d60','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT',NULL,'',NULL,NULL,NULL,NULL,NULL),(35,185,1,'2024-03-15 17:59:03','2024-03-15 17:59:03','71933247-ae90-45fe-a1a9-1a44430eb787',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,186,1,'2024-03-15 17:59:12','2024-03-15 17:59:12','cb48a6a2-f08d-4ce9-850d-72ba7ce67ba4','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','','/',NULL,NULL,NULL,NULL),(37,187,1,'2024-03-15 17:59:12','2024-03-15 17:59:12','a8a2d586-45c0-4bc7-99b2-1d7c8d5abd54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,188,1,'2024-03-15 17:59:13','2024-03-15 17:59:13','10b474b6-cc41-4756-8ea5-eee6d3fd5f96','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(39,189,1,'2024-03-15 17:59:13','2024-03-15 17:59:13','731ca687-f16c-4f83-b167-5549f7bbf7d7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,190,1,'2024-03-15 17:59:49','2024-03-15 17:59:49','d7e76e91-c979-4cd5-bccc-a20d947cdeb0','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(41,191,1,'2024-03-15 17:59:49','2024-03-15 17:59:49','6d980b29-fd1f-4e1d-a5da-77e56d1bf4f8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,192,1,'2024-03-15 17:59:56','2024-03-15 17:59:56','b7c879d1-8fc1-4335-ba48-3909bc60bda0','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(43,193,1,'2024-03-15 17:59:56','2024-03-15 17:59:56','fb2077fa-4612-432f-893e-5d9d77acf7ad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,194,1,'2024-03-15 18:00:13','2024-03-15 18:00:13','363e0ed6-1fd3-4c6c-bc34-5554dd191422','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(45,195,1,'2024-03-15 18:00:13','2024-03-15 18:00:13','8d6c29ce-b213-4a0c-8b9b-39b98498d0f9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,199,1,'2024-03-15 18:01:34','2024-03-15 19:00:05','ef6deb12-c437-4904-a324-3c812f6b86a2','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(49,200,1,'2024-03-15 18:01:34','2024-03-15 19:00:05','7b16d41a-262d-4dcc-907e-93861b1f283c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,202,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','016bf1ae-6b8c-454c-91b4-a1fe8bc91dd6','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(51,203,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','7b06886a-e88f-4935-8313-4d440743602a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,205,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','38e47afb-b1f9-4e18-a14e-2ab08cef6a9b','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(53,206,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','f514f377-7910-4cfa-ab3f-2d493edb2903',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,209,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','3e9004f6-399e-4237-b67a-423558da2fda','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(55,210,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','4682fac4-1b4a-487c-9a5d-f011f9d95ac1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,213,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','7e661e26-2265-460b-94a5-f4cb342a1fd1','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(57,214,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','89ae605c-f616-4e8d-97e6-68cd0043f6cd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,219,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','a4396eeb-b313-440d-b3df-06317bd9420a','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(61,220,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','e37086ea-3568-40fb-a9f5-2f3365b3a23c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,222,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','08a9f1c1-111a-483d-a38e-31b6efc58f07','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(63,223,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','41098434-1295-45c7-bf4b-8243dbcb29f1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,237,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','4a65af00-ead3-4fb7-8c84-a2cfd928f768','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(65,238,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','58e597a1-ccee-4ff3-9532-c4816deafc2f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,240,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','c0c9e05d-b5ef-415d-981d-35d6b085669b','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(67,241,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','779cd296-320d-47a4-9570-e1054338ee21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,254,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','f3e0890f-76bb-4222-befd-c30cc9ba93c5','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(69,255,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','910c2ea8-414c-4c6b-80c2-8ca16c0669be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,261,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','96751215-47c1-4045-aa33-9c6f50c08a8f','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(71,262,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','797352bb-49c3-448d-977f-faae8f975b12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,266,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','1b303ca0-4e67-4be4-aac5-b673a08f1dd7','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(73,267,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','4202506b-e0a7-4b4a-9d00-0600166596d0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,271,1,'2024-03-15 19:16:49','2024-03-15 19:16:49','0f9ecf19-1a26-498b-9780-f8777af1b6db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,273,1,'2024-03-15 19:16:52','2024-03-15 19:32:20','98304eef-42f4-485e-bebf-2704907ff1d5',NULL,NULL,NULL,NULL,NULL,'INCLUSIVE BILL PRESENTMENT, COMMUNICATION AND PAYMENTS','<p>Accelerate revenue realization, drive more on-time payments and improve your customer satisfaction and experience with the widest range of payment channels, communication tools and payment methods available today.</p>','/','Explore More'),(77,275,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','1eae8f86-3405-4506-8f99-479e365f0448','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(78,276,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','913b59c7-1e60-4d2e-8ab7-014c7e208767',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,277,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','f440eba2-8a62-4597-9c13-c97c1d19eb2c',NULL,NULL,NULL,NULL,NULL,'Test 22',NULL,NULL,NULL),(80,281,1,'2024-03-15 19:21:05','2024-03-15 19:21:05','fbf93a54-67de-4559-9040-707eb8565712',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,283,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','5938df29-874e-40f2-b1ef-42af5258d917',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,285,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','ee406714-55e2-4c56-abc4-bf09f73dac54','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(84,286,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','49151816-327c-4ca5-a807-5003759f3c7f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,287,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','25f5c7c8-4b53-4fa4-8989-a34a7f0a2557',NULL,NULL,NULL,NULL,NULL,'Test 22',NULL,NULL,NULL),(86,288,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','e856c5c3-0c8f-418b-8d43-fbe8e731c2f2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,291,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','fa2fc6c3-dae1-432b-b816-d33bc2b22801','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(88,292,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','64472ac2-5c08-48c8-81e1-cbaa4ba246ff',NULL,NULL,NULL,NULL,NULL,'Test 22',NULL,NULL,NULL),(90,296,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','0d4ee4f6-af16-45a5-8fc6-32f1443a78e1','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(91,297,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','9dcd50ac-0f7c-445f-958b-b3f153625209',NULL,NULL,NULL,NULL,NULL,'INCLUSIVE BILL PRESENTMENT, COMMUNICATION AND PAYMENTS','<p>Accelerate revenue realization, drive more on-time payments and improve your customer satisfaction and experience with the widest range of payment channels, communication tools and payment methods available today.</p>','/','Explore More'),(93,301,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','7fa07396-ab26-4de3-9f9e-1fa2169735a6','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(94,302,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','7c1fe7b7-59a6-4ac0-adbe-a7deaa0d9a70',NULL,NULL,NULL,NULL,NULL,'INCLUSIVE BILL PRESENTMENT, COMMUNICATION AND PAYMENTS','<p>Accelerate revenue realization, drive more on-time payments and improve your customer satisfaction and experience with the widest range of payment channels, communication tools and payment methods available today.</p>','/','Explore More'),(96,307,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','46767d64-1f91-4059-abd6-ff10caff4441','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(97,308,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','a43f5a04-894a-45c2-a97d-941cd1095943',NULL,NULL,NULL,NULL,NULL,'INCLUSIVE BILL PRESENTMENT, COMMUNICATION AND PAYMENTS','<p>Accelerate revenue realization, drive more on-time payments and improve your customer satisfaction and experience with the widest range of payment channels, communication tools and payment methods available today.</p>','/','Explore More'),(98,310,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','3bcd8f82-1c9f-4595-b425-d410616c1088','Real-time speed. Engaging payment channels. Total revenue control. All powered by the innovative platform that transforms performance and efficiency. Paymentus and the Instant Payment Network® are everything billers, financial institutions and fintechs need to exceed consumer expectations and meet your business needs.','THE NEXT GENERATION OF BILL PRESENTMENT, PAYMENT AND MONEY MOVEMENT','Read More','imageLeft','/',NULL,NULL,NULL,NULL),(99,311,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','7ed7f918-8718-4d6f-953c-989a9cbc7963',NULL,NULL,NULL,NULL,NULL,'INCLUSIVE BILL PRESENTMENT, COMMUNICATION AND PAYMENTS','<p>Accelerate revenue realization, drive more on-time payments and improve your customer satisfaction and experience with the widest range of payment channels, communication tools and payment methods available today.</p>','/','Explore More');
/*!40000 ALTER TABLE `matrixcontent_flexiblecontenthomepage` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_flexiblecontenttest`
--

LOCK TABLES `matrixcontent_flexiblecontenttest` WRITE;
/*!40000 ALTER TABLE `matrixcontent_flexiblecontenttest` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_flexiblecontenttest` VALUES (1,225,1,'2024-03-15 19:08:24','2024-03-15 19:08:24','5e064ac4-97ce-4f02-b718-94dfde7dee71',NULL,NULL,NULL,NULL),(2,226,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','9c8d1bf3-cfa9-49ee-b91f-91944fb5f615','test','test',NULL,NULL),(3,227,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','15de449d-3929-4a6c-b3cb-b44fb0f5b30a','test','test',NULL,NULL),(4,228,1,'2024-03-15 19:08:28','2024-03-15 19:08:28','92d85e71-e14d-4286-aa24-9c54ca365ad9',NULL,NULL,NULL,NULL),(7,231,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','a42c7a4c-dc0b-4e55-aec3-2c86e224eb1c','test','test',NULL,NULL),(8,232,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','e5ca2d00-7a45-4a26-a227-5164447ad179',NULL,NULL,'test 2','test 2'),(9,234,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','a1d809ef-152b-4166-9bde-966a3669d462','test','test',NULL,NULL),(10,235,1,'2024-03-15 19:08:32','2024-03-15 19:08:32','659951b0-2ac6-4dff-89a2-ea11eaca754f',NULL,NULL,'test 2','test 2'),(11,243,1,'2024-03-15 19:12:34','2024-03-15 19:12:34','c3cdee6a-ff70-419d-8791-63d8a33714ec',NULL,NULL,NULL,NULL),(12,244,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','e11e7baa-9bd9-4f8e-b33f-4d60bfcba0d2','test 3','test 3',NULL,NULL),(13,245,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','99ab465a-f805-4e13-b19d-6548938a44d5','test 3','test 3',NULL,NULL),(14,246,1,'2024-03-15 19:12:38','2024-03-15 19:12:38','2543933c-9194-4b62-81f8-0c671206b345',NULL,NULL,NULL,NULL),(15,247,1,'2024-03-15 19:12:41','2024-03-15 19:12:41','f22a3955-bee1-4f51-b021-c88836d7d2b1','test 3','test 3',NULL,NULL),(16,248,1,'2024-03-15 19:12:41','2024-03-15 19:12:41','544b9a8d-34f2-4f74-b6ba-4d2999152564',NULL,NULL,NULL,'test 3'),(19,251,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','d1dd5c90-e2a8-4459-8b88-9eadec15aa89','test 3','test 3',NULL,NULL),(20,252,1,'2024-03-15 19:12:43','2024-03-15 19:12:58','8893202b-d578-44b7-8d77-d1ef52a869c1',NULL,NULL,'test 4','test 4'),(21,256,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','c939e892-e461-440e-b273-5107818c8f40','test 3','test 3',NULL,NULL),(22,257,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','876ca3d8-93e0-49cb-ba1b-3cc4e6912299',NULL,NULL,'test 3','test 3'),(24,263,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','8176b126-a5b9-47f1-bf63-03c71179986e','test 3','test 3',NULL,NULL),(25,264,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','aaee800d-d01a-49f8-ba43-f715729a769f',NULL,NULL,'test 4','test 4'),(26,268,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','67f01deb-10ba-48f6-b231-ca6737900746','test 3','test 3',NULL,NULL),(27,269,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','e73af56e-679b-435a-b8e2-a611269431a4',NULL,NULL,'test 4','test 4'),(28,278,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','5678a34c-841a-43d5-b644-4d4ea71e3a40','test 3','test 3',NULL,NULL),(29,279,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','7a16a38b-9f17-446d-af11-ea06220f4bc0',NULL,NULL,'test 4','test 4');
/*!40000 ALTER TABLE `matrixcontent_flexiblecontenttest` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_navlinks`
--

LOCK TABLES `matrixcontent_navlinks` WRITE;
/*!40000 ALTER TABLE `matrixcontent_navlinks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_navlinks` VALUES (1,107,1,'2024-03-13 19:20:56','2024-03-13 19:20:56','08aaece2-ff78-407d-8e42-08e7753ee795','About Us');
/*!40000 ALTER TABLE `matrixcontent_navlinks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','9b4c4de1-2421-4040-86df-77450be73fd9'),(2,'craft','m210121_145800_asset_indexing_changes','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','a676add8-331a-4cfa-a7d8-172b6359a5c2'),(3,'craft','m210624_222934_drop_deprecated_tables','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','207c3b58-b208-4773-aa0d-55e1d3d46dcc'),(4,'craft','m210724_180756_rename_source_cols','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','cbdc6d62-7025-4e3a-bdbf-41eb57ad0cff'),(5,'craft','m210809_124211_remove_superfluous_uids','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','95791276-66df-440a-ba25-1da55badf7fc'),(6,'craft','m210817_014201_universal_users','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','502fc197-0a8f-4b51-b5c1-6f98e746dd7f'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','e90fb3df-c8d8-4357-9e12-6d16a700c9c3'),(8,'craft','m211115_135500_image_transformers','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','c47f5eca-ba90-49b5-844d-5def0fff9c24'),(9,'craft','m211201_131000_filesystems','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','e1c7e18f-267d-4cf8-8e84-8426ad0928f9'),(10,'craft','m220103_043103_tab_conditions','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','0bb323f8-1c32-46df-845f-b0b8ddc3e6df'),(11,'craft','m220104_003433_asset_alt_text','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','1d5e465d-12c3-493e-80ae-f649009d2669'),(12,'craft','m220123_213619_update_permissions','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','56003036-4932-42ce-a85e-cb8ab3a09825'),(13,'craft','m220126_003432_addresses','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','be81ce6e-b4a0-4044-9471-3ea5052edbc7'),(14,'craft','m220209_095604_add_indexes','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','659a18a1-8112-4e88-b348-e9811d97555e'),(15,'craft','m220213_015220_matrixblocks_owners_table','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','2367f060-8dd4-4861-81e2-59034384913f'),(16,'craft','m220214_000000_truncate_sessions','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','548e573d-2372-4701-b401-a1bd791d95c8'),(17,'craft','m220222_122159_full_names','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','f6814d5e-4332-4b37-8e51-d898f0e3d2e9'),(18,'craft','m220223_180559_nullable_address_owner','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','1018ed4a-b555-412a-9102-0fa50bb942cd'),(19,'craft','m220225_165000_transform_filesystems','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','5b77a0d1-3e3f-4cd6-8c8f-f424e41ff374'),(20,'craft','m220309_152006_rename_field_layout_elements','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','9efbf075-fc6c-4a38-a517-83a5f8bb4963'),(21,'craft','m220314_211928_field_layout_element_uids','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','6b14b121-b8ac-4b75-9686-3e8fa4527973'),(22,'craft','m220316_123800_transform_fs_subpath','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','52f6614d-1fe6-49be-9f35-8ee8940ac823'),(23,'craft','m220317_174250_release_all_jobs','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','40aba08f-772c-4e79-b241-f34bc282ec78'),(24,'craft','m220330_150000_add_site_gql_schema_components','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','75ade7f1-eed7-43bd-b08e-992e772c6223'),(25,'craft','m220413_024536_site_enabled_string','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','fcc2c34c-b3af-4a4a-9b10-ca9194759240'),(26,'craft','m221027_160703_add_image_transform_fill','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','9f32f6dc-70c8-418a-8f2a-357716c31757'),(27,'craft','m221028_130548_add_canonical_id_index','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','660e3314-0fb6-40c9-adb0-f2fe275a409e'),(28,'craft','m221118_003031_drop_element_fks','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','e8880372-c212-4eee-8720-4478396a3a9d'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','d72cb216-9afd-4559-a726-cca60a9e7280'),(30,'craft','m230226_013114_drop_plugin_license_columns','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','74ee18a6-393f-458e-a02c-e9c213c9dbc3'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','1fb01215-0de8-4c08-a8ca-9632dca480ec'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','450142d4-b8f8-4cdd-aeb4-245fd87aa5e6'),(33,'craft','m230710_162700_element_activity','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','f6ad53c7-00f7-44cf-a693-926648816ac9'),(34,'craft','m230820_162023_fix_cache_id_type','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','bed9da46-b7c4-4c99-ac31-f41e6af8929a'),(35,'craft','m230826_094050_fix_session_id_type','2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-12 07:53:30','2c0c2180-ec9d-4c03-ab7d-410281312ec4'),(36,'plugin:redactor','m180430_204710_remove_old_plugins','2024-03-13 18:38:19','2024-03-13 18:38:19','2024-03-13 18:38:19','6a8f83de-bd76-4296-80e0-19122886e4d7'),(37,'plugin:redactor','Install','2024-03-13 18:38:19','2024-03-13 18:38:19','2024-03-13 18:38:19','7ae728bd-97aa-4d57-be3e-b3ca2c665d2a'),(38,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2024-03-13 18:38:19','2024-03-13 18:38:19','2024-03-13 18:38:19','4d659a25-8758-494a-ab3a-f808732c3fbb'),(39,'plugin:super-table','Install','2024-03-14 01:01:20','2024-03-14 01:01:20','2024-03-14 01:01:20','bf809b7b-880e-4c3b-aa1b-a49ab6362b90'),(40,'plugin:super-table','m220308_000000_remove_superfluous_uids','2024-03-14 01:01:20','2024-03-14 01:01:20','2024-03-14 01:01:20','748b586f-53f7-48ea-9cea-20f8e14fbedb'),(41,'plugin:super-table','m220308_100000_owners_table','2024-03-14 01:01:20','2024-03-14 01:01:20','2024-03-14 01:01:20','298b5cd7-c107-4703-aabf-2e36c1397a2f');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'redactor','3.0.4','2.3.0','2024-03-13 18:38:19','2024-03-13 18:38:19','2024-03-13 18:38:19','0691c76d-dcba-4962-b6b4-82f062ce1b2d'),(2,'super-table','3.0.12','3.0.0','2024-03-14 01:01:20','2024-03-14 01:01:20','2024-03-14 01:01:20','a7a98e45-7ed4-4b1e-936d-178c10877eda');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.defaultPlacement','\"end\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elementCondition','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.autocapitalize','true'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.autocomplete','false'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.autocorrect','true'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.class','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.disabled','false'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.elementCondition','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.id','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.inputType','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.instructions','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.label','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.max','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.min','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.name','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.orientation','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.placeholder','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.readonly','false'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.requirable','false'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.size','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.step','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.tip','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.title','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.uid','\"48bba664-09ff-488a-b4e4-f2dd16e4f441\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.userCondition','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.warning','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.elements.0.width','100'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.name','\"Content\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.uid','\"a8e5a4f2-b65a-429a-8aa4-62bf74c3f65c\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.fieldLayouts.585599e4-ccdc-4d2b-8e20-4147b39648b7.tabs.0.userCondition','null'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.handle','\"topics\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.name','\"Topics\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.hasUrls','true'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.template','\"blog/_topic\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.uriFormat','\"blog/topics/{slug}\"'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.structure.maxLevels','1'),('categoryGroups.17de000b-d1c9-4b18-89bc-05856ab472b9.structure.uid','\"9203db44-d757-4336-90d8-f198e26af1cf\"'),('dateModified','1710531268'),('email.fromEmail','\"hamila832003@gmail.com\"'),('email.fromName','\"Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elementCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.elementCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.fieldUid','\"581665f5-b39a-4e5c-bdbc-ed16d26cf7d7\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.instructions','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.label','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.required','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.tip','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.uid','\"b98a8938-1da7-4514-9727-9dfe3ff79f0f\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.userCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.warning','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.0.width','100'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.elementCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.fieldUid','\"01e3bca3-1c13-45b2-b071-7542eca83665\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.instructions','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.label','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.required','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.tip','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.uid','\"88673388-449e-4a63-8fd4-d7f26ede48ce\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.userCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.warning','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.1.width','100'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.autocapitalize','true'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.autocomplete','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.autocorrect','true'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.class','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.disabled','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.elementCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.id','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.inputType','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.instructions','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.label','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.max','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.min','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.name','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.orientation','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.placeholder','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.readonly','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.requirable','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.size','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.step','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.tip','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.title','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.uid','\"41e95b13-e94d-4042-9cdd-f8ba4568397c\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.userCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.warning','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.2.width','100'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.elementCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.fieldUid','\"8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.instructions','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.label','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.required','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.tip','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.uid','\"fa5f176d-23c8-4007-b594-f4edc6f39242\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.userCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.warning','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.elements.3.width','100'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.name','\"Content\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.uid','\"81b15e17-b6ce-4808-8973-e84babe62107\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.fieldLayouts.bede0e2a-eb4a-4b92-b927-f4d65d2a43e2.tabs.0.userCondition','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.handle','\"home\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.hasTitleField','false'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.name','\"Home\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.section','\"d2bd35fe-f728-44f0-8dc6-f489c7d0dfac\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.showStatusField','true'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.slugTranslationKeyFormat','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.slugTranslationMethod','\"site\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.sortOrder','1'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.titleFormat','\"{section.name|raw}\"'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.titleTranslationKeyFormat','null'),('entryTypes.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce.titleTranslationMethod','\"site\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elementCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.autocapitalize','true'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.autocomplete','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.autocorrect','true'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.class','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.disabled','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.elementCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.id','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.inputType','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.instructions','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.label','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.max','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.min','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.name','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.orientation','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.placeholder','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.readonly','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.requirable','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.size','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.step','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.tip','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.title','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.uid','\"ea9dcff4-9303-4f1c-b397-8f9e54547091\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.userCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.warning','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.0.width','100'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.elementCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.fieldUid','\"ea633514-acd9-4e88-a61a-cd5981e869f2\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.instructions','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.label','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.required','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.tip','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.uid','\"245066b2-2dfb-4da6-bc98-de95e950f3d9\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.userCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.warning','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.1.width','100'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.elementCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.fieldUid','\"cbc7d1f8-d1e1-4e73-900f-4446c434467a\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.instructions','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.label','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.required','false'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.tip','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.uid','\"0d476f51-b952-4f9f-a979-ec63af66503a\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.userCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.warning','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.elements.2.width','100'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.name','\"Content\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.uid','\"74bae685-e077-4384-862b-d3d1ae6eaf0c\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.fieldLayouts.cb2bc273-c6a3-488d-8912-64315810e37b.tabs.0.userCondition','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.handle','\"generalPages\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.hasTitleField','true'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.name','\"General Pages\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.section','\"20d491f0-75e2-4083-a3a9-c2365c34958a\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.showStatusField','true'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.slugTranslationKeyFormat','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.slugTranslationMethod','\"site\"'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.sortOrder','1'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.titleFormat','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.titleTranslationKeyFormat','null'),('entryTypes.4d996d55-003b-4075-9787-2ebfb1eb4358.titleTranslationMethod','\"site\"'),('fieldGroups.0e994035-575e-4e1c-8bb3-653d29289588.name','\"Theme\"'),('fieldGroups.7df69a92-4f52-4458-a156-40f95c71286c.name','\"Home Page\"'),('fieldGroups.cb7c5995-bc64-48d8-82df-be48dfe24f54.name','\"Common\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.columnSuffix','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.contentColumnType','\"string\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.fieldGroup','\"7df69a92-4f52-4458-a156-40f95c71286c\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.handle','\"heroImage\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.instructions','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.name','\"Hero Image\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.searchable','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.allowedKinds.0','\"image\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.allowSelfRelations','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.allowSubfolders','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.allowUploads','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.branchLimit','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.defaultUploadLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.defaultUploadLocationSubpath','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.localizeRelations','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.maintainHierarchy','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.maxRelations','1'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.minRelations','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.previewMode','\"full\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.restrictedDefaultUploadSubpath','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.restrictedLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.restrictedLocationSubpath','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.restrictFiles','true'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.restrictLocation','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.selectionLabel','\"Add a background image\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.showSiteMenu','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.showUnpermittedFiles','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.showUnpermittedVolumes','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.sources.0','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.targetSiteId','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.validateRelatedElements','false'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.settings.viewMode','\"large\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.translationKeyFormat','null'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.translationMethod','\"site\"'),('fields.01e3bca3-1c13-45b2-b071-7542eca83665.type','\"craft\\\\fields\\\\Assets\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.columnSuffix','\"rzxodpzb\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.contentColumnType','\"char(7)\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.fieldGroup','\"0e994035-575e-4e1c-8bb3-653d29289588\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.handle','\"color\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.instructions','null'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.name','\"Color\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.searchable','false'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.settings.defaultColor','null'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.translationKeyFormat','null'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.translationMethod','\"none\"'),('fields.0f97f974-e467-4b69-8517-a0926b0e9e13.type','\"craft\\\\fields\\\\Color\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.columnSuffix','\"vurasdzu\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.contentColumnType','\"text\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.fieldGroup','\"7df69a92-4f52-4458-a156-40f95c71286c\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.handle','\"heroTitle\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.instructions','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.name','\"Hero Title\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.searchable','false'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.byteLimit','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.charLimit','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.code','false'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.columnType','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.initialRows','4'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.multiline','false'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.placeholder','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.settings.uiMode','\"normal\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.translationKeyFormat','null'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.translationMethod','\"none\"'),('fields.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7.type','\"craft\\\\fields\\\\PlainText\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.columnSuffix','\"ozjsnfcs\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.contentColumnType','\"char(7)\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.fieldGroup','\"0e994035-575e-4e1c-8bb3-653d29289588\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.handle','\"backgroundColor\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.instructions','null'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.name','\"Background Color\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.searchable','false'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.settings.defaultColor','\"#ffffff\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.translationKeyFormat','null'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.translationMethod','\"none\"'),('fields.892343d4-fa88-44a7-a3dc-b1f85ed09d14.type','\"craft\\\\fields\\\\Color\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.columnSuffix','null'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.contentColumnType','\"string\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.fieldGroup','\"cb7c5995-bc64-48d8-82df-be48dfe24f54\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.handle','\"flexibleContentHomePage\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.instructions','null'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.name','\"Flexible Content Home Page\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.searchable','false'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.settings.contentTable','\"{{%matrixcontent_flexiblecontenthomepage}}\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.settings.maxBlocks','null'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.settings.minBlocks','1'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.settings.propagationKeyFormat','null'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.settings.propagationMethod','\"all\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.translationKeyFormat','null'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.translationMethod','\"site\"'),('fields.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2.type','\"craft\\\\fields\\\\Matrix\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.columnSuffix','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.contentColumnType','\"string\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.fieldGroup','\"cb7c5995-bc64-48d8-82df-be48dfe24f54\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.handle','\"navLinks\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.instructions','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.name','\"Nav Links\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.searchable','false'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.settings.contentTable','\"{{%matrixcontent_navlinks}}\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.settings.maxBlocks','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.settings.minBlocks','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.settings.propagationKeyFormat','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.settings.propagationMethod','\"all\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.translationKeyFormat','null'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.translationMethod','\"site\"'),('fields.bb17fd16-c37c-4754-bb83-b9f6f6de89fc.type','\"craft\\\\fields\\\\Matrix\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.columnSuffix','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.contentColumnType','\"string\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.fieldGroup','\"cb7c5995-bc64-48d8-82df-be48dfe24f54\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.handle','\"flexibleContentTest\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.instructions','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.name','\"Flexible Content Test\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.searchable','false'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.settings.contentTable','\"{{%matrixcontent_flexiblecontenttest}}\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.settings.maxBlocks','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.settings.minBlocks','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.settings.propagationKeyFormat','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.settings.propagationMethod','\"all\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.translationKeyFormat','null'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.translationMethod','\"site\"'),('fields.cbc7d1f8-d1e1-4e73-900f-4446c434467a.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.columnSuffix','\"cxxkbghi\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.contentColumnType','\"text\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.fieldGroup','\"cb7c5995-bc64-48d8-82df-be48dfe24f54\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.handle','\"richText\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.instructions','null'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.name','\"Rich Text\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.searchable','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.availableTransforms','\"*\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.availableVolumes','\"*\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.columnType','\"text\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.configSelectionMode','\"choose\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.defaultTransform','\"\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.manualConfig','\"\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.purifierConfig','null'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.purifyHtml','true'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.redactorConfig','null'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.removeEmptyTags','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.removeInlineStyles','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.removeNbsp','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.showHtmlButtonForNonAdmins','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.showUnpermittedFiles','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.showUnpermittedVolumes','false'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.settings.uiMode','\"enlarged\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.translationKeyFormat','null'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.translationMethod','\"none\"'),('fields.ea633514-acd9-4e88-a61a-cd5981e869f2.type','\"craft\\\\redactor\\\\Field\"'),('fs.hardDisk.hasUrls','true'),('fs.hardDisk.name','\"Hard Disk\"'),('fs.hardDisk.settings.path','\"@webroot/uploads/images\"'),('fs.hardDisk.type','\"craft\\\\fs\\\\Local\"'),('fs.hardDisk.url','\"@web/uploads/images\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elementCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.elementCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.fieldUid','\"892343d4-fa88-44a7-a3dc-b1f85ed09d14\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.instructions','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.label','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.required','false'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.tip','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.uid','\"38618dd4-0031-4132-9a45-e0904ee2b874\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.userCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.warning','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.0.width','100'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.elementCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.fieldUid','\"0f97f974-e467-4b69-8517-a0926b0e9e13\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.instructions','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.label','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.required','false'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.tip','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.uid','\"a41d82bc-b0db-471c-906a-e0e3128b7c1d\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.userCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.warning','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.elements.1.width','100'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.name','\"Theme Attributes\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.uid','\"2fd2b93f-f908-4e67-8fde-13d07695857d\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.fieldLayouts.81f5816b-a65f-42a1-9c77-97fbbb525f37.tabs.0.userCondition','null'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.handle','\"theme\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.name','\"Theme\"'),('globalSets.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc.sortOrder','2'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elementCondition','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.elementCondition','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.fieldUid','\"bb17fd16-c37c-4754-bb83-b9f6f6de89fc\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.instructions','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.label','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.required','false'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.tip','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.uid','\"92f78132-fbd7-4ee6-a7be-ea49e1474329\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.userCondition','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.warning','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.elements.0.width','100'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.name','\"Content\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.uid','\"d86c3e7a-3883-433f-b546-9c2a7a7f6bcf\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.fieldLayouts.4a42f1cc-020e-49af-9420-1376884d8569.tabs.0.userCondition','null'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.handle','\"header\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.name','\"Header\"'),('globalSets.4fa9a481-7a66-4022-8477-1d13c675acd5.sortOrder','3'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elementCondition','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.elementCondition','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.fieldUid','\"ea633514-acd9-4e88-a61a-cd5981e869f2\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.instructions','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.label','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.required','false'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.tip','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.uid','\"19983e50-427f-4416-9948-842aa6ec2e50\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.userCondition','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.warning','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.elements.0.width','100'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.name','\"Content\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.uid','\"294dc4d4-2803-4f73-b84b-8499bdcedeca\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.fieldLayouts.717f854c-f9f4-4178-98ed-057ea260fcfc.tabs.0.userCondition','null'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.handle','\"footer\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.name','\"Footer\"'),('globalSets.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5.sortOrder','4'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elementCondition','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.elementCondition','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.fieldUid','\"0607773e-9c59-4125-bcb9-92a9e9b4d051\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.instructions','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.label','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.required','false'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.tip','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.uid','\"2877957a-b901-4a57-8696-251c4eb07864\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.userCondition','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.warning','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.elements.0.width','100'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.name','\"Settings, Content\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.uid','\"ab47cc22-ceca-4b79-9893-cafcae5a2d17\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.fieldLayouts.bd871683-582d-449c-9c2d-044a91c0c3ee.tabs.0.userCondition','null'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.handle','\"siteInfo\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.name','\"Site Info\"'),('globalSets.f9c060b6-2943-474e-beca-5c6f7b27c42a.sortOrder','1'),('graphql.schemas.775f1c8e-4135-4d59-b362-a425abb5dca3.isPublic','true'),('graphql.schemas.775f1c8e-4135-4d59-b362-a425abb5dca3.name','\"Public Schema\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.fill','null'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.format','null'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.handle','\"thumbnail\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.height','null'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.interlace','\"none\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.mode','\"fit\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.name','\"Thumbnail\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.position','\"center-center\"'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.quality','null'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.upscale','false'),('imageTransforms.f2b65d79-5eed-4159-b174-6f4d268e81d8.width','1200'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.field','\"cbc7d1f8-d1e1-4e73-900f-4446c434467a\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elementCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.fieldUid','\"d91ee4fe-03e7-4894-b1bd-5748a2757cea\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.label','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.required','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.tip','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.uid','\"bd7b40ba-dd22-460d-868b-3e7ba4a6c1bb\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.warning','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.0.width','100'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.fieldUid','\"5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.label','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.required','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.tip','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.uid','\"38fbefe8-e3e6-4062-a716-98763ef8a8f3\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.warning','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.elements.1.width','100'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.name','\"Content\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.uid','\"ba2732b7-3708-462e-9794-110caebda7c4\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fieldLayouts.74046e26-83b1-4c05-b5b7-a0401f688af5.tabs.0.userCondition','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.columnSuffix','\"xjzmrlcs\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.contentColumnType','\"text\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.fieldGroup','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.handle','\"copy\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.instructions','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.name','\"Copy\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.searchable','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.byteLimit','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.charLimit','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.code','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.columnType','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.initialRows','4'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.multiline','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.placeholder','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.settings.uiMode','\"normal\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.translationKeyFormat','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.translationMethod','\"none\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.columnSuffix','\"mwdauzdb\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.contentColumnType','\"text\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.fieldGroup','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.handle','\"headline\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.instructions','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.name','\"Headline\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.searchable','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.byteLimit','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.charLimit','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.code','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.columnType','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.initialRows','4'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.multiline','false'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.placeholder','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.settings.uiMode','\"normal\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.translationKeyFormat','null'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.translationMethod','\"none\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.fields.d91ee4fe-03e7-4894-b1bd-5748a2757cea.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.handle','\"block2\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.name','\"Block2\"'),('matrixBlockTypes.02a261f5-9476-40b2-8618-c82c2dbb9426.sortOrder','2'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.field','\"8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.fieldUid','\"17a714e7-b782-446d-8fd0-88194674d861\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.uid','\"4a623508-d032-4564-b446-ff336a936ef1\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.0.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.fieldUid','\"3b89b01b-6466-472c-96b6-9e004255796b\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.uid','\"41ed2941-0ddb-43a6-a8d3-41e4f6728a26\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.1.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.fieldUid','\"57c2b1c2-3ced-44b2-837b-054fd01924eb\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.uid','\"11610684-ff2e-42ab-8968-2b9c1d9d8131\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.2.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.fieldUid','\"f31e57df-2d52-4bf2-b83f-eb67f2336e5c\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.uid','\"e4bad610-2ed7-41ae-8b04-4bc7587f232e\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.3.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.fieldUid','\"6b7cc2b3-a7b1-4804-8cd1-a8834704815e\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.uid','\"8a1d8d8b-4043-453a-bd12-320e6cd3fa69\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.4.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.elementCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.fieldUid','\"3b46d0fc-aa81-4dc1-80eb-f7d0a1965692\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.label','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.required','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.tip','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.uid','\"7b897645-a6a5-4a60-97a0-64893b37c978\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.warning','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.elements.5.width','100'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.name','\"Content\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.uid','\"bfca6d6f-4cb7-4ebc-8454-14c7016b614c\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fieldLayouts.276c2b51-908f-4fd6-bfd4-d8f1febf2326.tabs.0.userCondition','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.columnSuffix','\"ycnrgkxq\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.contentColumnType','\"text\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.handle','\"headline\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.name','\"Headline\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.byteLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.charLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.code','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.columnType','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.initialRows','4'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.multiline','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.placeholder','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.settings.uiMode','\"normal\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.translationMethod','\"none\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.17a714e7-b782-446d-8fd0-88194674d861.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.columnSuffix','\"bibxkkpq\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.contentColumnType','\"text\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.handle','\"ctaText\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.name','\"CTA Text\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.byteLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.charLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.code','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.columnType','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.initialRows','4'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.multiline','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.placeholder','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.settings.uiMode','\"normal\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.translationMethod','\"none\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.columnSuffix','\"nklrfppd\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.contentColumnType','\"text\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.handle','\"copy\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.name','\"Copy\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.byteLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.charLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.code','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.columnType','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.initialRows','4'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.multiline','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.placeholder','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.settings.uiMode','\"normal\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.translationMethod','\"none\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.3b89b01b-6466-472c-96b6-9e004255796b.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.columnSuffix','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.contentColumnType','\"string\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.handle','\"image\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.name','\"Image\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.allowSelfRelations','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.allowSubfolders','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.allowUploads','true'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.branchLimit','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.defaultUploadLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.defaultUploadLocationSubpath','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.localizeRelations','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.maintainHierarchy','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.maxRelations','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.minRelations','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.previewMode','\"full\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.restrictedDefaultUploadSubpath','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.restrictedLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.restrictedLocationSubpath','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.restrictFiles','true'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.restrictLocation','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.selectionLabel','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.showSiteMenu','true'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.showUnpermittedFiles','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.sources.0','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.targetSiteId','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.validateRelatedElements','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.settings.viewMode','\"list\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.translationMethod','\"site\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.57c2b1c2-3ced-44b2-837b-054fd01924eb.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.columnSuffix','\"wnoitahb\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.contentColumnType','\"string(10)\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.handle','\"align\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.name','\"Align\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.columnType','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.0.1','\"Image Left\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.1.1','\"imageLeft\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.0.__assoc__.2.1','\"\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.0.1','\"Image Right\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.1.1','\"imageRight\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.translationMethod','\"none\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.6b7cc2b3-a7b1-4804-8cd1-a8834704815e.type','\"craft\\\\fields\\\\Dropdown\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.columnSuffix','\"dyrusuxk\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.contentColumnType','\"string(255)\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.fieldGroup','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.handle','\"ctaUrl\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.instructions','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.name','\"CTA URL\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.searchable','false'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.settings.maxLength','255'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.settings.types.0','\"url\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.translationKeyFormat','null'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.translationMethod','\"none\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.fields.f31e57df-2d52-4bf2-b83f-eb67f2336e5c.type','\"craft\\\\fields\\\\Url\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.handle','\"leftRightModule\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.name','\"Left Right Module\"'),('matrixBlockTypes.71232de7-51a6-445b-b0c2-1d96f10a4ed5.sortOrder','1'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.field','\"bb17fd16-c37c-4754-bb83-b9f6f6de89fc\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elementCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.fieldUid','\"15aecb61-314d-4c70-adcd-074b17d648ce\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.label','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.required','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.tip','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.uid','\"5525f891-2e5e-4ba7-9580-54e0ebe98b7f\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.warning','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.0.width','100'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.fieldUid','\"021d4b47-bc7f-4d3f-857a-637e21ee42f4\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.label','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.required','true'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.tip','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.uid','\"b6901738-77eb-4bab-9a8d-de65198ecc7a\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.warning','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.elements.1.width','100'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.name','\"Content\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.uid','\"e97c6f6c-ab3e-459c-9300-076eb62cbe7f\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fieldLayouts.81dcc0f1-85a5-4d1b-9e37-5dc413f21535.tabs.0.userCondition','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.columnSuffix','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.contentColumnType','\"string\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.fieldGroup','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.handle','\"linkDestination\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.instructions','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.name','\"Link Destination\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.searchable','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.allowSelfRelations','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.branchLimit','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.localizeRelations','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.maintainHierarchy','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.maxRelations','1'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.minRelations','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.selectionLabel','\"Select an Entry\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.showSiteMenu','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.sources','\"*\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.targetSiteId','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.validateRelatedElements','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.settings.viewMode','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.translationKeyFormat','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.translationMethod','\"site\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.021d4b47-bc7f-4d3f-857a-637e21ee42f4.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.columnSuffix','\"dmlwsaio\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.contentColumnType','\"text\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.fieldGroup','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.handle','\"linkText\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.instructions','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.name','\"Link Text\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.searchable','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.byteLimit','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.charLimit','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.code','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.columnType','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.initialRows','4'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.multiline','false'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.placeholder','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.settings.uiMode','\"normal\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.translationKeyFormat','null'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.translationMethod','\"none\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.fields.15aecb61-314d-4c70-adcd-074b17d648ce.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.handle','\"link\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.name','\"Link\"'),('matrixBlockTypes.997c3c06-c3a0-405a-8124-81f9be8bd6aa.sortOrder','1'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.field','\"cbc7d1f8-d1e1-4e73-900f-4446c434467a\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elementCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.fieldUid','\"a96d7157-2fee-40f5-be22-4393da46eed5\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.label','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.required','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.tip','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.uid','\"0a8e9fa1-4feb-454a-8073-ccd38ef8b783\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.warning','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.0.width','100'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.fieldUid','\"bfdab4cd-2c3b-47cd-90e0-030896b4ccbb\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.label','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.required','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.tip','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.uid','\"4e665919-4aae-4fa9-bf2c-f1b3c590c156\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.warning','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.elements.1.width','100'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.name','\"Content\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.uid','\"f2fb05b3-b5d2-4e5f-994d-7e593ffcf527\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fieldLayouts.20b016d3-a119-48cb-97eb-20d21b58471c.tabs.0.userCondition','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.columnSuffix','\"tmlvsryk\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.contentColumnType','\"text\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.fieldGroup','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.handle','\"headline\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.instructions','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.name','\"Headline\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.searchable','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.byteLimit','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.charLimit','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.code','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.columnType','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.initialRows','4'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.multiline','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.placeholder','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.settings.uiMode','\"normal\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.translationKeyFormat','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.translationMethod','\"none\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.a96d7157-2fee-40f5-be22-4393da46eed5.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.columnSuffix','\"zdunwetq\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.contentColumnType','\"text\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.fieldGroup','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.handle','\"copy\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.instructions','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.name','\"Copy\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.searchable','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.byteLimit','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.charLimit','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.code','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.columnType','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.initialRows','4'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.multiline','false'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.placeholder','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.settings.uiMode','\"normal\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.translationKeyFormat','null'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.translationMethod','\"none\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.fields.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.handle','\"block1\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.name','\"Block1\"'),('matrixBlockTypes.b5af04ab-ce33-4660-9f86-ae9c13414487.sortOrder','1'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.field','\"8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.fieldUid','\"b0857505-9e9f-45b2-9506-a672d60e26ae\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.label','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.required','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.tip','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.uid','\"6bc57aa4-3d28-4e39-812b-de8631eff65d\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.warning','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.0.width','100'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.fieldUid','\"9de04f40-e324-45be-b679-e03d810134ba\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.label','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.required','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.tip','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.uid','\"558c44e5-ca57-4762-88ef-8d090ed5314e\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.warning','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.1.width','100'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.fieldUid','\"e9ec9064-d697-4b51-b19f-c2fe238860e7\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.label','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.required','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.tip','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.uid','\"2800146c-a5f5-4850-b19c-06a4b159ec6c\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.warning','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.2.width','100'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.fieldUid','\"889afe97-58bc-4196-94ae-4bfaa6dee91c\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.label','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.required','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.tip','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.uid','\"1415ff71-7bde-4e0f-a607-1102a7bce0cf\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.warning','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.3.width','100'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.elementCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.fieldUid','\"e531bff2-086e-4075-b96d-87f72f393075\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.label','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.required','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.tip','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.uid','\"aebeae3a-7468-4b3f-a49a-e3827eede47f\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.warning','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.elements.4.width','100'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.name','\"Content\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.uid','\"15126328-3490-4d75-9c98-587b227eb632\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fieldLayouts.df3b0483-e9fa-4d8a-9638-27a9757774bc.tabs.0.userCondition','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.columnSuffix','\"vmygejpy\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.contentColumnType','\"string(255)\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.fieldGroup','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.handle','\"ctaUrl\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.name','\"CTA URL\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.searchable','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.settings.maxLength','255'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.settings.types.0','\"url\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.translationKeyFormat','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.translationMethod','\"none\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.889afe97-58bc-4196-94ae-4bfaa6dee91c.type','\"craft\\\\fields\\\\Url\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.columnSuffix','\"pcssnztx\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.contentColumnType','\"text\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.fieldGroup','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.handle','\"copy\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.name','\"Copy\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.searchable','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.availableTransforms','\"*\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.availableVolumes','\"*\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.columnType','\"text\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.defaultTransform','\"\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.manualConfig','\"\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.purifierConfig','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.purifyHtml','true'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.redactorConfig','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.removeEmptyTags','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.removeInlineStyles','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.removeNbsp','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.showHtmlButtonForNonAdmins','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.showUnpermittedFiles','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.translationKeyFormat','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.translationMethod','\"none\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.9de04f40-e324-45be-b679-e03d810134ba.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.columnSuffix','\"qquihnjd\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.contentColumnType','\"text\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.fieldGroup','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.handle','\"headline\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.name','\"Headline\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.searchable','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.byteLimit','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.charLimit','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.code','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.columnType','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.initialRows','4'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.multiline','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.placeholder','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.settings.uiMode','\"normal\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.translationKeyFormat','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.translationMethod','\"none\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.b0857505-9e9f-45b2-9506-a672d60e26ae.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.columnSuffix','\"izqpfkpk\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.contentColumnType','\"text\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.fieldGroup','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.handle','\"ctaText\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.name','\"CTA Text\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.searchable','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.byteLimit','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.charLimit','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.code','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.columnType','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.initialRows','4'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.multiline','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.placeholder','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.settings.uiMode','\"normal\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.translationKeyFormat','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.translationMethod','\"none\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e531bff2-086e-4075-b96d-87f72f393075.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.columnSuffix','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.contentColumnType','\"string\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.fieldGroup','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.handle','\"backgroundImage\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.instructions','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.name','\"Background Image\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.searchable','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.allowSelfRelations','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.allowSubfolders','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.allowUploads','true'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.branchLimit','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.defaultUploadLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.defaultUploadLocationSubpath','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.localizeRelations','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.maintainHierarchy','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.maxRelations','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.minRelations','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.previewMode','\"full\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.restrictedDefaultUploadSubpath','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.restrictedLocationSource','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.restrictedLocationSubpath','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.restrictFiles','true'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.restrictLocation','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.selectionLabel','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.showSiteMenu','true'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.showUnpermittedFiles','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.sources.0','\"volume:d3699ba7-b37b-472a-97b2-57de705f93ce\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.targetSiteId','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.validateRelatedElements','false'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.settings.viewMode','\"list\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.translationKeyFormat','null'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.translationMethod','\"site\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.fields.e9ec9064-d697-4b51-b19f-c2fe238860e7.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.handle','\"animatedContent\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.name','\"Animated Content\"'),('matrixBlockTypes.f979c110-44b0-43ac-818d-ddf7195384af.sortOrder','2'),('meta.__names__.01e3bca3-1c13-45b2-b071-7542eca83665','\"Hero Image\"'),('meta.__names__.021d4b47-bc7f-4d3f-857a-637e21ee42f4','\"Link Destination\"'),('meta.__names__.02a261f5-9476-40b2-8618-c82c2dbb9426','\"Block2\"'),('meta.__names__.0e994035-575e-4e1c-8bb3-653d29289588','\"Theme\"'),('meta.__names__.0f97f974-e467-4b69-8517-a0926b0e9e13','\"Color\"'),('meta.__names__.15aecb61-314d-4c70-adcd-074b17d648ce','\"Link Text\"'),('meta.__names__.17a714e7-b782-446d-8fd0-88194674d861','\"Headline\"'),('meta.__names__.17de000b-d1c9-4b18-89bc-05856ab472b9','\"Topics\"'),('meta.__names__.19ce8711-4f29-45cf-90d1-e03e6ffcc8ce','\"Home\"'),('meta.__names__.20d491f0-75e2-4083-a3a9-c2365c34958a','\"General Pages\"'),('meta.__names__.2e1c1af8-9c30-43e4-b217-d7a1b95e92fc','\"Theme\"'),('meta.__names__.3b46d0fc-aa81-4dc1-80eb-f7d0a1965692','\"CTA Text\"'),('meta.__names__.3b89b01b-6466-472c-96b6-9e004255796b','\"Copy\"'),('meta.__names__.4d996d55-003b-4075-9787-2ebfb1eb4358','\"General Pages\"'),('meta.__names__.4fa9a481-7a66-4022-8477-1d13c675acd5','\"Header\"'),('meta.__names__.51b49ed2-f5da-4379-a7c1-2c5d2d23c0c5','\"Footer\"'),('meta.__names__.57770204-9d83-4761-96da-717e25a676a4','\"Test\"'),('meta.__names__.57c2b1c2-3ced-44b2-837b-054fd01924eb','\"Image\"'),('meta.__names__.581665f5-b39a-4e5c-bdbc-ed16d26cf7d7','\"Hero Title\"'),('meta.__names__.5c3d9ee1-fa50-4a1a-b014-fe2cc2a8e715','\"Copy\"'),('meta.__names__.6b7cc2b3-a7b1-4804-8cd1-a8834704815e','\"Align\"'),('meta.__names__.71232de7-51a6-445b-b0c2-1d96f10a4ed5','\"Left Right Module\"'),('meta.__names__.775f1c8e-4135-4d59-b362-a425abb5dca3','\"Public Schema\"'),('meta.__names__.7df69a92-4f52-4458-a156-40f95c71286c','\"Home Page\"'),('meta.__names__.889afe97-58bc-4196-94ae-4bfaa6dee91c','\"CTA URL\"'),('meta.__names__.892343d4-fa88-44a7-a3dc-b1f85ed09d14','\"Background Color\"'),('meta.__names__.8ae99c4a-f34c-490d-9e3a-1ed3bb2a96b2','\"Flexible Content Home Page\"'),('meta.__names__.997c3c06-c3a0-405a-8124-81f9be8bd6aa','\"Link\"'),('meta.__names__.9de04f40-e324-45be-b679-e03d810134ba','\"Copy\"'),('meta.__names__.a96d7157-2fee-40f5-be22-4393da46eed5','\"Headline\"'),('meta.__names__.b0857505-9e9f-45b2-9506-a672d60e26ae','\"Headline\"'),('meta.__names__.b5af04ab-ce33-4660-9f86-ae9c13414487','\"Block1\"'),('meta.__names__.bb17fd16-c37c-4754-bb83-b9f6f6de89fc','\"Nav Links\"'),('meta.__names__.bfdab4cd-2c3b-47cd-90e0-030896b4ccbb','\"Copy\"'),('meta.__names__.cb7c5995-bc64-48d8-82df-be48dfe24f54','\"Common\"'),('meta.__names__.cbc7d1f8-d1e1-4e73-900f-4446c434467a','\"Flexible Content Test\"'),('meta.__names__.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac','\"Home\"'),('meta.__names__.d3699ba7-b37b-472a-97b2-57de705f93ce','\"Images\"'),('meta.__names__.d91ee4fe-03e7-4894-b1bd-5748a2757cea','\"Headline\"'),('meta.__names__.e531bff2-086e-4075-b96d-87f72f393075','\"CTA Text\"'),('meta.__names__.e9ec9064-d697-4b51-b19f-c2fe238860e7','\"Background Image\"'),('meta.__names__.ea633514-acd9-4e88-a61a-cd5981e869f2','\"Rich Text\"'),('meta.__names__.f2b65d79-5eed-4159-b174-6f4d268e81d8','\"Thumbnail\"'),('meta.__names__.f31e57df-2d52-4bf2-b83f-eb67f2336e5c','\"CTA URL\"'),('meta.__names__.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1','\"Test\"'),('meta.__names__.f979c110-44b0-43ac-818d-ddf7195384af','\"Animated Content\"'),('meta.__names__.f9c060b6-2943-474e-beca-5c6f7b27c42a','\"Site Info\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"3.0.0\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.defaultPlacement','\"end\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.enableVersioning','true'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.handle','\"generalPages\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.name','\"General Pages\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.propagationMethod','\"all\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.enabledByDefault','true'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.hasUrls','true'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.template','\"general\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.uriFormat','\"{parent.uri}/{slug}\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.structure.maxLevels','2'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.structure.uid','\"3b257b8e-dd49-4e75-bc3f-63d0250eec66\"'),('sections.20d491f0-75e2-4083-a3a9-c2365c34958a.type','\"structure\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.defaultPlacement','\"end\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.enableVersioning','true'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.handle','\"home\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.name','\"Home\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.propagationMethod','\"all\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.enabledByDefault','true'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.hasUrls','true'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.template','\"home\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.siteSettings.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.uriFormat','\"__home__\"'),('sections.d2bd35fe-f728-44f0-8dc6-f489c7d0dfac.type','\"single\"'),('siteGroups.57770204-9d83-4761-96da-717e25a676a4.name','\"Test\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.handle','\"default\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.hasUrls','true'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.language','\"en-US\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.name','\"Test\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.primary','true'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.siteGroup','\"57770204-9d83-4761-96da-717e25a676a4\"'),('sites.f58ae7aa-9b55-4ed4-8f80-5cc7196791c1.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Test\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elementCondition','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.autocapitalize','true'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.autocomplete','false'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.autocorrect','true'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.class','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.disabled','false'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.elementCondition','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.id','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.inputType','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.instructions','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.label','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.max','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.min','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.name','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.orientation','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.placeholder','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.readonly','false'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.requirable','false'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.size','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.step','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.tip','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.title','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.uid','\"a5ca40c0-ec50-4c16-ba53-115dc9674d27\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.userCondition','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.warning','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.elements.0.width','100'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.name','\"Content\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.uid','\"ab5692d0-f40e-4b52-b6d0-0e5b1af367cf\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fieldLayouts.f4a19b36-6ca0-477d-8d43-f2664f89d3cc.tabs.0.userCondition','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.fs','\"hardDisk\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.handle','\"images\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.name','\"Images\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.sortOrder','2'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.titleTranslationKeyFormat','null'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.titleTranslationMethod','\"site\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.transformFs','\"hardDisk\"'),('volumes.d3699ba7-b37b-472a-97b2-57de705f93ce.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (50,20,91,NULL,90,1,'2024-03-13 18:30:38','2024-03-13 18:30:38','26239e79-82f8-40d4-83f0-b48a070fa352'),(51,20,92,NULL,90,1,'2024-03-13 18:42:07','2024-03-13 18:42:07','fc189a89-26a6-46d3-9849-95a57c51fbb3'),(55,20,95,NULL,90,1,'2024-03-13 18:43:40','2024-03-13 18:43:40','7b139534-6b8b-440a-8194-ecc151a9e3bb'),(57,20,96,NULL,90,1,'2024-03-13 18:59:39','2024-03-13 18:59:39','a3a0341a-2b01-44e6-b20b-751efaf0adcb'),(61,20,98,NULL,90,1,'2024-03-13 18:59:56','2024-03-13 18:59:56','db8c44c2-9988-4397-a015-b4107dce90a9'),(63,20,99,NULL,90,1,'2024-03-13 19:01:06','2024-03-13 19:01:06','2800075f-24f6-43cf-8fd8-ed851d20f09d'),(65,20,100,NULL,90,1,'2024-03-13 19:01:34','2024-03-13 19:01:34','ad3263d1-0509-45ce-bddb-e6c38c071177'),(67,29,107,NULL,101,1,'2024-03-13 19:20:56','2024-03-13 19:20:56','7d089ad3-992e-4dbc-81e9-268adad4eaf6'),(68,20,149,NULL,90,1,'2024-03-14 03:01:51','2024-03-14 03:01:51','0016aa55-8eab-496a-8223-77ba55c012f9'),(79,20,172,NULL,90,1,'2024-03-15 17:58:21','2024-03-15 17:58:21','db53bd15-407d-4228-8e36-b130e1c29408'),(80,43,184,NULL,93,1,'2024-03-15 17:59:03','2024-03-15 17:59:03','4132f8cc-1b05-4b42-8337-5e8c4e24e0ad'),(81,43,186,NULL,93,1,'2024-03-15 17:59:12','2024-03-15 17:59:12','ab8f5800-84ca-475b-9aa5-5ffc14331b88'),(82,43,188,NULL,93,1,'2024-03-15 17:59:13','2024-03-15 17:59:13','29d3badf-6537-4fb7-86db-b6ddc8a054ec'),(83,43,190,NULL,93,1,'2024-03-15 17:59:49','2024-03-15 17:59:49','0a881cf0-05d6-49d2-b79e-75fa708d89d7'),(84,43,192,NULL,93,1,'2024-03-15 17:59:56','2024-03-15 17:59:56','ff9250ac-cc1b-4d5e-b26f-4e1261eee8b1'),(85,43,194,NULL,93,1,'2024-03-15 18:00:13','2024-03-15 18:00:13','330f3aeb-f773-4ea5-bb45-af1d148e7560'),(90,20,201,NULL,90,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','e1fa3709-f23b-4e79-bf7f-8c79604060ad'),(91,43,202,NULL,93,1,'2024-03-15 18:01:34','2024-03-15 18:01:34','d109cd1a-a015-4326-b46c-b6f74a159eec'),(93,20,204,NULL,90,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','dfa9ab5b-ab7d-4371-a735-ab4378ebe531'),(94,43,205,NULL,93,1,'2024-03-15 18:29:15','2024-03-15 18:29:15','f829a9d1-d731-43c7-9688-533e88e8ed3e'),(99,20,208,NULL,93,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','775ec16a-45c4-45d1-a986-465440357811'),(100,43,209,NULL,93,1,'2024-03-15 18:36:24','2024-03-15 18:36:24','59c9d346-f411-4dae-817b-5fbe7730752d'),(104,20,85,NULL,90,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','ec785bee-29c2-4e49-9f03-621905512529'),(105,20,212,NULL,90,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','059eec45-f527-4d19-9070-81e2cb02d77f'),(106,43,213,NULL,93,1,'2024-03-15 18:38:11','2024-03-15 18:38:11','50f3f7e6-f895-423f-aa0d-eef8f01982e1'),(113,43,199,NULL,196,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','5057d9b8-d384-4c55-b8bd-f0d07a03755e'),(115,20,218,NULL,90,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','e69b622a-a266-4bee-a503-cc96342d767a'),(116,43,219,NULL,196,1,'2024-03-15 19:00:05','2024-03-15 19:00:05','7c58892b-7ade-4323-8025-127573ee3171'),(118,20,221,NULL,90,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','60f3ab3d-5bcf-45a0-b6c7-56e631579802'),(119,43,222,NULL,196,1,'2024-03-15 19:02:19','2024-03-15 19:02:19','457d54f5-f930-4afc-862b-ea542e71c64e'),(121,20,236,NULL,90,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','d862d9c0-0493-46d6-a018-e97193ed2450'),(122,43,237,NULL,196,1,'2024-03-15 19:09:07','2024-03-15 19:09:07','9de1f97d-3c73-4564-8542-53ae9efb11d0'),(124,20,239,NULL,90,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','46fc7b63-5f85-45ad-947f-c9392cbcb370'),(125,43,240,NULL,196,1,'2024-03-15 19:12:09','2024-03-15 19:12:09','caa0100a-f2b9-4bfc-99f6-fbf4125df0e5'),(128,20,253,NULL,90,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','28289012-675b-4c3e-80a7-3979950c644e'),(129,43,254,NULL,196,1,'2024-03-15 19:12:43','2024-03-15 19:12:43','59f27eb3-763f-4cb5-860c-057410eea8fe'),(132,20,260,NULL,90,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','1a162cab-83ed-4717-964b-a2b50c30db1d'),(133,43,261,NULL,196,1,'2024-03-15 19:12:58','2024-03-15 19:12:58','15cde477-3ed5-412a-8df6-2b33712601dd'),(135,20,265,NULL,90,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','dfeb8426-7ade-417e-86a7-272feab1e584'),(136,43,266,NULL,196,1,'2024-03-15 19:15:37','2024-03-15 19:15:37','24565038-1216-42c2-a447-4d4cd1d05e1a'),(139,20,274,NULL,90,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','c5bba273-8a59-4815-a522-7d686a62bdb3'),(140,43,275,NULL,196,1,'2024-03-15 19:16:52','2024-03-15 19:16:52','92c2be35-2b10-401b-badc-179ebd6f8253'),(143,20,284,NULL,90,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','f9103215-6c7a-4311-924e-c15931a23864'),(144,43,285,NULL,196,1,'2024-03-15 19:21:09','2024-03-15 19:21:09','30e9f8e0-a804-462b-b41e-07bd9a516de2'),(147,20,290,NULL,90,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','5b02ecad-157a-42f0-aa95-d5edaad9829c'),(148,43,291,NULL,196,1,'2024-03-15 19:23:55','2024-03-15 19:23:55','c6b9b988-d3d1-42cf-875b-d994aed2aab4'),(152,20,295,NULL,90,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','bbcaa03e-506b-4a94-8f46-87ab5f338231'),(153,43,296,NULL,196,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','8079965c-c241-42c4-8d00-ff79eb501935'),(154,57,297,NULL,196,1,'2024-03-15 19:24:38','2024-03-15 19:24:38','0751a53a-1e7d-4ed5-9cc8-4995e54a04d2'),(159,20,300,NULL,90,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','f042a304-4b32-46db-a867-4084687a37f3'),(160,43,301,NULL,196,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','3ca1f460-09e0-442e-9dce-9cb159851a24'),(161,57,302,NULL,90,1,'2024-03-15 19:27:02','2024-03-15 19:27:02','73c0e669-ab1f-4633-a671-673331d13b5e'),(165,57,273,NULL,305,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','8b05fac1-e6c6-45e2-aaee-92ed82f3d32b'),(166,20,306,NULL,90,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','fbec4d4a-f57b-4854-9245-b3a1d8bf72b8'),(167,43,307,NULL,196,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','5e759e40-8423-4bb2-ba44-c3d65cbfcab9'),(168,57,308,NULL,305,1,'2024-03-15 19:32:20','2024-03-15 19:32:20','7e717289-49ea-461c-afe1-d887b2a9a327'),(169,20,309,NULL,90,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','8ae09b8b-314b-4b93-b11e-aad992adf5a9'),(170,43,310,NULL,196,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','1acf9f8b-7829-4516-884f-28809b5c018e'),(171,57,311,NULL,305,1,'2024-03-15 19:33:51','2024-03-15 19:33:51','c6e1128f-e34d-41d8-83cd-cb95bdb2a0a9');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,5,1,1,NULL),(3,2,1,2,'Applied “Draft 1”'),(4,5,1,2,NULL),(5,2,1,3,''),(6,5,1,3,NULL),(7,14,1,1,''),(8,20,1,1,NULL),(9,21,1,1,NULL),(10,25,1,1,NULL),(11,25,1,2,NULL),(12,25,1,3,NULL),(13,25,1,4,'Applied “Draft 1”'),(14,2,1,4,'Applied “Draft 1”'),(15,5,1,4,NULL),(16,14,1,2,'Applied “Draft 1”'),(17,20,1,2,NULL),(18,21,1,2,NULL),(19,2,1,5,'Applied “Draft 1”'),(20,5,1,5,NULL),(21,47,1,1,NULL),(22,14,1,3,'Applied “Draft 1”'),(23,20,1,3,NULL),(24,21,1,3,NULL),(25,25,1,5,''),(26,58,1,1,''),(27,73,1,1,NULL),(28,74,1,1,NULL),(29,75,1,1,NULL),(30,80,1,1,NULL),(31,80,1,2,NULL),(32,80,1,3,NULL),(33,80,1,4,NULL),(34,85,1,1,NULL),(35,85,1,2,NULL),(36,85,1,3,NULL),(37,85,1,4,'Applied “Draft 1”'),(38,85,1,5,NULL),(39,85,1,6,'Applied “Draft 1”'),(40,85,1,7,NULL),(41,85,1,8,'Applied “Draft 1”'),(42,85,1,9,NULL),(43,85,1,10,''),(44,101,1,1,''),(45,101,1,2,''),(46,104,1,1,''),(47,101,1,3,'Applied “Draft 1”'),(48,112,1,1,NULL),(49,101,1,4,'Applied “Draft 1”'),(50,112,1,2,NULL),(51,118,1,1,NULL),(52,101,1,5,'Applied “Draft 1”'),(53,125,1,1,NULL),(54,101,1,6,''),(55,125,1,2,NULL),(56,101,1,7,''),(57,101,1,8,'Applied “Draft 1”'),(58,134,1,1,NULL),(59,101,1,9,'Applied “Draft 1”'),(60,143,1,1,NULL),(61,144,1,1,NULL),(62,85,1,11,NULL),(63,101,1,10,'Applied “Draft 1”'),(64,144,1,2,NULL),(65,143,1,2,NULL),(66,101,1,11,'Applied “Draft 1”'),(67,101,1,12,'Applied “Draft 1”'),(68,101,1,13,'Applied “Draft 1”'),(69,167,1,1,NULL),(70,168,1,1,NULL),(71,85,1,12,NULL),(72,85,1,13,'Applied “Draft 1”'),(73,199,1,1,NULL),(74,200,1,1,NULL),(75,85,1,14,''),(76,199,1,2,NULL),(77,200,1,2,NULL),(78,85,1,15,'Applied “Draft 1”'),(79,199,1,3,NULL),(80,200,1,3,NULL),(81,85,1,16,'Applied “Draft 1”'),(82,199,1,4,NULL),(83,200,1,4,NULL),(84,85,1,17,'Applied “Draft 1”'),(85,199,1,5,NULL),(86,200,1,5,NULL),(87,85,1,18,''),(88,199,1,6,NULL),(89,200,1,6,NULL),(90,101,1,14,'Applied “Draft 1”'),(91,231,1,1,NULL),(92,232,1,1,NULL),(93,85,1,19,''),(94,199,1,7,NULL),(95,200,1,7,NULL),(96,85,1,20,NULL),(97,199,1,8,NULL),(98,200,1,8,NULL),(99,85,1,21,'Applied “Draft 1”'),(100,199,1,9,NULL),(101,200,1,9,NULL),(102,251,1,1,NULL),(103,252,1,1,NULL),(104,85,1,22,'Applied “Draft 1”'),(105,199,1,10,NULL),(106,200,1,10,NULL),(107,251,1,2,NULL),(108,252,1,2,NULL),(109,85,1,23,''),(110,199,1,11,NULL),(111,200,1,11,NULL),(112,251,1,3,NULL),(113,252,1,3,NULL),(114,85,1,24,'Applied “Draft 1”'),(115,199,1,12,NULL),(116,200,1,12,NULL),(117,273,1,1,NULL),(118,251,1,4,NULL),(119,252,1,4,NULL),(120,85,1,25,'Applied “Draft 1”'),(121,199,1,13,NULL),(122,200,1,13,NULL),(123,273,1,2,NULL),(124,283,1,1,NULL),(125,85,1,26,'Applied “Draft 1”'),(126,199,1,14,NULL),(127,273,1,3,NULL),(128,85,1,27,'Applied “Draft 1”'),(129,199,1,15,NULL),(130,273,1,4,NULL),(131,85,1,28,'Applied “Draft 1”'),(132,199,1,16,NULL),(133,273,1,5,NULL),(134,85,1,29,'Applied “Draft 1”'),(135,199,1,17,NULL),(136,273,1,6,NULL),(137,85,1,30,NULL),(138,199,1,18,NULL),(139,273,1,7,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' hamila832003 gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' test title 1 '),(2,'title',0,1,' test title 1 '),(3,'alt',0,1,''),(3,'extension',0,1,' png '),(3,'filename',0,1,' icon onboarding 300x300 png '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' icon onboarding 300x300 '),(5,'slug',0,1,''),(6,'slug',0,1,' sports '),(6,'title',0,1,' sports '),(14,'slug',0,1,' test title 2 '),(14,'title',0,1,' test title 2 '),(15,'alt',0,1,''),(15,'extension',0,1,' png '),(15,'filename',0,1,' android chrome 512x512 png '),(15,'kind',0,1,' image '),(15,'slug',0,1,''),(15,'title',0,1,' android chrome 512x512 '),(20,'slug',0,1,''),(21,'slug',0,1,''),(25,'slug',0,1,' about '),(25,'title',0,1,' about '),(29,'alt',0,1,''),(29,'extension',0,1,' jpeg '),(29,'filename',0,1,' 1516804011833 jpeg '),(29,'kind',0,1,' image '),(29,'slug',0,1,''),(29,'title',0,1,' 1516804011833 '),(32,'slug',0,1,''),(34,'alt',0,1,''),(34,'extension',0,1,' jpeg '),(34,'filename',0,1,' google building jpeg '),(34,'kind',0,1,' image '),(34,'slug',0,1,''),(34,'title',0,1,' google building '),(38,'alt',0,1,''),(38,'extension',0,1,' jpeg '),(38,'filename',0,1,' forest jpeg '),(38,'kind',0,1,' image '),(38,'slug',0,1,''),(38,'title',0,1,' forest '),(42,'slug',0,1,''),(47,'slug',0,1,''),(58,'slug',0,1,' test title 3 '),(58,'title',0,1,' test title 3 '),(59,'alt',0,1,''),(59,'extension',0,1,' webp '),(59,'filename',0,1,' forest2 webp '),(59,'kind',0,1,' image '),(59,'slug',0,1,''),(59,'title',0,1,' forest2 '),(62,'slug',0,1,''),(63,'slug',0,1,''),(64,'alt',0,1,''),(64,'extension',0,1,' jpeg '),(64,'filename',0,1,' forest 2024 03 12 191551 qakn jpeg '),(64,'kind',0,1,' image '),(64,'slug',0,1,''),(64,'title',0,1,' forest '),(73,'slug',0,1,''),(74,'slug',0,1,''),(75,'slug',0,1,''),(80,'slug',0,1,' homepage '),(80,'title',0,1,' homepage '),(85,'slug',0,1,' home '),(85,'title',0,1,' home '),(90,'alt',0,1,''),(90,'extension',0,1,' svg '),(90,'filename',0,1,' blob bottom svg '),(90,'kind',0,1,' image '),(90,'slug',0,1,''),(90,'title',0,1,' blob bottom '),(93,'alt',0,1,''),(93,'extension',0,1,' png '),(93,'filename',0,1,' homepage animation dashboard 2024 03 13 184310 pedk png '),(93,'kind',0,1,' image '),(93,'slug',0,1,''),(93,'title',0,1,' homepage animation dashboard '),(101,'slug',0,1,' about us '),(101,'title',0,1,' about us '),(104,'slug',0,1,' leadership '),(104,'title',0,1,' leadership '),(106,'slug',0,1,''),(107,'slug',0,1,''),(108,'slug',0,1,''),(112,'slug',0,1,''),(118,'slug',0,1,''),(125,'slug',0,1,''),(134,'slug',0,1,''),(143,'slug',0,1,''),(144,'slug',0,1,''),(150,'slug',0,1,' leadership '),(150,'title',0,1,' leadership '),(151,'slug',0,1,''),(167,'slug',0,1,''),(168,'slug',0,1,''),(194,'slug',0,1,''),(195,'slug',0,1,''),(196,'alt',0,1,''),(196,'extension',0,1,' png '),(196,'filename',0,1,' family png '),(196,'kind',0,1,' image '),(196,'slug',0,1,''),(196,'title',0,1,' family '),(199,'slug',0,1,''),(200,'slug',0,1,''),(231,'slug',0,1,''),(232,'slug',0,1,''),(251,'slug',0,1,''),(252,'slug',0,1,''),(273,'slug',0,1,''),(283,'slug',0,1,''),(305,'alt',0,1,''),(305,'extension',0,1,' svg '),(305,'filename',0,1,' blob top solid midnight 2 svg '),(305,'kind',0,1,' image '),(305,'slug',0,1,''),(305,'title',0,1,' blob top solid midnight 2 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Blog','blog','channel',1,'all','end',NULL,'2024-03-12 07:57:32','2024-03-12 07:57:32','2024-03-13 18:18:50','2daa5524-a804-49ea-a770-593217421e63'),(2,NULL,'About','about','single',1,'all','end',NULL,'2024-03-12 18:29:15','2024-03-12 18:29:15','2024-03-13 18:18:52','c5d640d8-842d-4cbf-87c7-f3dd9567646e'),(3,3,'Homepage','homepage','structure',1,'all','end',NULL,'2024-03-13 17:32:11','2024-03-13 17:44:35','2024-03-13 18:18:47','2645ea03-f4b2-4197-89a9-0c9d9ac1e75d'),(4,NULL,'Home','home','single',1,'all','end',NULL,'2024-03-13 18:19:49','2024-03-13 18:19:49',NULL,'d2bd35fe-f728-44f0-8dc6-f489c7d0dfac'),(5,4,'General Pages','generalPages','structure',1,'all','end',NULL,'2024-03-13 19:07:28','2024-03-13 19:07:28',NULL,'20d491f0-75e2-4083-a3a9-c2365c34958a');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'blog/{slug}','blog/_entry',1,'2024-03-12 07:57:32','2024-03-12 07:57:32','4de38c0a-3915-45c7-9fd2-a0c116278e85'),(2,2,1,1,'about','_singles/about',1,'2024-03-12 18:29:15','2024-03-12 18:29:15','0cb3dadb-7df5-4c36-abc2-1ea3295628bf'),(3,3,1,1,'homepage','_singles/homepage',1,'2024-03-13 17:32:11','2024-03-13 17:40:05','b634f5c5-34bb-4970-9e30-5caee2ceaad4'),(4,4,1,1,'__home__','home',1,'2024-03-13 18:19:49','2024-03-13 18:19:49','b484342a-a1c1-42b1-94ce-b12b336ae23d'),(5,5,1,1,'{parent.uri}/{slug}','general',1,'2024-03-13 19:07:28','2024-03-13 19:07:28','501ddae1-ab94-4464-b86c-9d49c00624e3');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Test','2024-03-12 07:53:30','2024-03-12 07:53:30',NULL,'57770204-9d83-4761-96da-717e25a676a4');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-03-12 07:53:30','2024-03-12 07:53:30',NULL,'f58ae7aa-9b55-4ed4-8f80-5cc7196791c1');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,4,0,'2024-03-12 08:19:16','2024-03-12 08:19:16','c707cd55-3194-4c6d-bd36-597901f8bf09'),(2,1,6,1,2,3,1,'2024-03-12 08:19:16','2024-03-12 08:19:16','919f16d4-0c3e-45cd-98ff-08abe27e56be'),(3,2,NULL,3,1,4,0,'2024-03-13 17:43:06','2024-03-13 17:43:06','13437394-a8ff-45c9-8015-cf7e46eb969b'),(4,2,80,3,2,3,1,'2024-03-13 17:43:06','2024-03-13 17:43:06','2503b53d-f1ed-4cd8-9ef7-8907a7da0b72'),(5,3,NULL,5,1,4,0,'2024-03-13 17:44:35','2024-03-13 17:44:35','3e57c40e-9877-4e06-bdbd-5fd120e317dd'),(6,3,80,5,2,3,1,'2024-03-13 17:44:35','2024-03-13 17:44:35','3aa936f5-9508-4035-a3bb-35b888683499'),(7,4,NULL,7,1,6,0,'2024-03-13 19:09:06','2024-03-13 19:14:25','3e170da4-1417-4f1a-bcc5-7b88aac8590d'),(8,4,101,7,2,5,1,'2024-03-13 19:09:06','2024-03-13 19:14:25','f85ed665-5c2d-40e4-b78b-a3c67985b743'),(9,4,104,7,3,4,2,'2024-03-13 19:14:07','2024-03-13 19:14:25','7ff6fa36-2122-48ea-9be0-2c09d19ffdb7');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,1,'2024-03-12 08:01:05','2024-03-12 08:01:05',NULL,'9203db44-d757-4336-90d8-f198e26af1cf'),(2,1,'2024-03-13 17:43:06','2024-03-13 17:43:06','2024-03-13 17:43:20','b0930793-6a1e-4108-9409-7efaaec5fc24'),(3,1,'2024-03-13 17:44:35','2024-03-13 17:44:35','2024-03-13 18:18:47','8165131d-91b1-4d27-ac7c-bff6dad0fc3a'),(4,2,'2024-03-13 19:07:28','2024-03-13 19:07:28',NULL,'3b257b8e-dd49-4e75-bc3f-63d0250eec66');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks_owners`
--

LOCK TABLES `supertableblocks_owners` WRITE;
/*!40000 ALTER TABLE `supertableblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'hamila832003@gmail.com','$2y$13$OTGd.YzO79xuMR7A5.nDXONcmAYJK./CgQ7ivL7T9yXocHNsWyWSy','2024-03-15 17:36:49',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-03-12 07:53:30','2024-03-12 07:53:30','2024-03-15 17:36:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2024-03-12 08:07:19','2024-03-12 08:07:19','170de613-491e-4b50-b63b-1a504a8f8716'),(2,NULL,NULL,'Temporary filesystem',NULL,'2024-03-12 08:16:35','2024-03-12 08:16:35','fd5ba53c-24c5-4e90-a375-10878039c8a8'),(3,2,NULL,'user_1','user_1/','2024-03-12 08:16:35','2024-03-12 08:16:35','5efae857-ce8e-4a5d-9266-c33cbac9e322'),(4,NULL,2,'Images','','2024-03-13 18:25:43','2024-03-13 18:25:43','c6dd703c-6c18-482c-85f0-f7a17f43026b');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,3,'Images','images','hardDisk','','','site',NULL,1,'2024-03-12 08:07:19','2024-03-12 08:07:19','2024-03-13 18:24:16','907b2aa3-c8cd-4d94-abd3-fd4eca188e22'),(2,11,'Images','images','hardDisk','hardDisk','','site',NULL,2,'2024-03-13 18:25:43','2024-03-13 18:25:43',NULL,'d3699ba7-b37b-472a-97b2-57de705f93ce');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-03-12 07:54:30','2024-03-12 07:54:30','a4b68494-b4e4-43dc-b362-b0864835e4b1'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-03-12 07:54:30','2024-03-12 07:54:30','a7448584-b80d-4671-8c26-861854a834ef'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-03-12 07:54:30','2024-03-12 07:54:30','b99017a1-a283-437c-8f25-e8f0d4fe67bf'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-03-12 07:54:30','2024-03-12 07:54:30','d35dcbcb-d40f-458c-baac-50f04b12f638');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 20:25:29
