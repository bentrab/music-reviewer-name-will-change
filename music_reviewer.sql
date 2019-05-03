-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: eecslab-9    Database: team_9
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `album`
--

-- 05032019 Note from Yunxi: To allow review_date change from int to DATE, all reviews are deleted. Please add them back.

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT,
  `album_artist` varchar(255) DEFAULT NULL,
  `album_name` varchar(255) NOT NULL,
  `album_genre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (10,'The Beach Boys','Pet Sounds','Rock'),(11,'The Beatles','Revolver','Rock'),(12,'Bob Dylan','Highway 61 Revisited','Rock'),(13,'The Beatles','Rubber Soul','Rock, Pop'),(14,'The Rolling Stones','Exile on Main St.','Rock'),(15,'The Clash','London Calling','Rock'),(16,'Bob Dylan','Blonde on Blonde','Rock, Blues'),(17,'Elvis Presley','The Sun Sessions','Rock'),(18,'Miles Davis','Kind of Blue','Jazz'),(19,'The Velvet Underground','The Velvet Underground & Nico','Rock'),(20,'The Beatles','Abbey Road','Rock'),(21,'The Jimi Hendrix Experience','Are You Experienced','Rock, Blues'),(22,'Bob Dylan','Blood on the Tracks','Rock'),(23,'Nirvana','Nevermind','Rock'),(24,'Bruce Springsteen','Born to Run','Rock'),(25,'Van Morrison','Astral Weeks','Jazz, Rock, Blues, Folk, World, & Country'),(26,'Michael Jackson','Thriller','Funk / Soul, Pop'),(27,'Chuck Berry','The Great Twenty_Eight','Rock'),(28,'Robert Johnson','The Complete Recordings','Blues'),(29,'John Lennon / Plastic Ono Band','John Lennon/Plastic Ono Band','Rock'),(30,'Stevie Wonder','Innervisions','Funk / Soul'),(31,'James Brown','Live at the Apollo, 1962','Funk / Soul'),(32,'Fleetwood Mac','Rumours','Rock'),(33,'U2','The Joshua Tree','Rock'),(34,'Led Zeppelin','Led Zeppelin','Rock'),(35,'Joni Mitchell','Blue','Pop'),(36,'Bob Dylan','Bringing It All Back Home','Rock, Folk, World, & Country'),(37,'The Rolling Stones','Let It Bleed','Rock'),(38,'Ramones','Ramones','Rock'),(39,'The Band','Music From Big Pink','Rock'),(40,'David Bowie','The Rise and Fall of Ziggy Stardust and the Spiders From Mars','Rock'),(41,'Carole King','Tapestry','Rock, Pop'),(42,'Eagles','Hotel California','Rock'),(43,'Muddy Waters','The Anthology','Folk, World, & Country'),(44,'The Beatles','Please Please Me','Rock'),(45,'Love','Forever Changes','Rock'),(46,'The Doors','The Doors','Rock'),(47,'Pink Floyd','The Dark Side of the Moon','Rock'),(48,'Patti Smith','Horses','Rock'),(49,'Bob Marley & The Wailers','Legend: The Best of Bob Marley and The Wailers','Reggae'),(50,'John Coltrane','A Love Supreme','Jazz'),(51,'Public Enemy','It Takes a Nation of Millions to Hold Us Back','Hip Hop'),(52,'The Allman Brothers Band','At Fillmore East','Rock, Blues'),(53,'Simon & Garfunkel','Bridge Over Troubled Water','Rock'),(54,'Al Green','Greatest Hits','Funk / Soul'),(55,'The Beatles','Meet The Beatles!','Rock'),(56,'Ray Charles','The Birth of Soul','Jazz, Funk / Soul'),(57,'The Jimi Hendrix Experience','Electric Ladyland','Rock, Blues'),(58,'Elvis Presley','Elvis Presley','Rock'),(59,'Stevie Wonder','Songs in the Key of Life','Funk / Soul'),(60,'The Rolling Stones','Beggars Banquet','Rock, Funk / Soul, Pop'),(61,'Creedence Clearwater Revival','Chronicle: The 20 Greatest Hits','Rock'),(62,'Captain Beefheart & His Magic Band','Trout Mask Replica','Rock, Blues'),(63,'Sly & The Family Stone','Greatest Hits','Funk / Soul'),(64,'U2','Achtung Baby','Electronic, Rock'),(65,'The Rolling Stones','Sticky Fingers','Rock'),(66,'Phil Spector','Back to Mono (1958-1969)','Rock, Funk / Soul, Pop'),(67,'Van Morrison','Moondance','Jazz, Rock, Funk / Soul, Folk, World, & Country'),(68,'Radiohead','Kid A','Electronic, Rock'),(69,'Michael Jackson','Off the Wall','Funk / Soul, Pop'),(70,'Led Zeppelin','[Led Zeppelin IV]','Rock'),(71,'Billy Joel','The Stranger','Rock'),(72,'Paul Simon','Graceland','Jazz, Rock, Funk / Soul, Pop, Folk, World, & Country'),(73,'Curtis Mayfield','Superfly','Funk / Soul, Stage & Screen'),(74,'Led Zeppelin','Physical Graffiti','Rock'),(75,'Neil Young','After the Gold Rush','Rock'),(76,'James Brown','Star Time','Funk / Soul'),(77,'Prince and the Revolution','Purple Rain','Electronic, Rock, Funk / Soul, Stage & Screen'),(78,'AC/DC','Back in Black','Rock'),(79,'Otis Redding','Otis Blue: Otis Redding Sings Soul','Funk / Soul'),(80,'Led Zeppelin','Led Zeppelin II','Rock'),(81,'John Lennon','Imagine','Rock'),(82,'The Clash','The Clash','Rock'),(83,'Neil Young','Harvest','Rock'),(84,'The Jimi Hendrix Experience','Axis: Bold as Love','Rock'),(85,'Aretha Franklin','I Never Loved a Man the Way I Love You','Funk / Soul'),(86,'Aretha Franklin','Lady Soul','Funk / Soul'),(87,'Bruce Springsteen','Born in the U.S.A.','Rock'),(88,'Pink Floyd','The Wall','Rock'),(89,'Johnny Cash','At Folsom Prison','Folk, World, & Country'),(90,'Dusty Springfield','Dusty in Memphis','Rock, Funk / Soul'),(91,'Stevie Wonder','Talking Book','Funk / Soul'),(92,'Elton John','Goodbye Yellow Brick Road','Rock'),(93,'Buddy Holly','20 Golden Greats','Rock'),(94,'Hank Williams','40 Greatest Hits','Folk, World, & Country'),(95,'Miles Davis','Bitches Brew','Jazz'),(96,'The Who','Tommy','Rock'),(97,'The Zombies','Odessey and Oracle','Rock'),(98,'Frank Sinatra','In the Wee Small Hours','Jazz, Pop'),(99,'Cream','Fresh Cream','Rock, Blues'),(100,'John Coltrane','Giant Steps','Jazz'),(101,'James Taylor','Sweet Baby James','Rock'),(102,'Ray Charles','Modern Sounds in Country and Western Music','Funk / Soul, Folk, World, & Country'),(103,'Ramones','Rocket to Russia','Rock'),(104,'Sam Cooke','Portrait of a Legend 1951-1964','Latin, Funk / Soul'),(105,'David Bowie','Hunky Dory','Rock'),(106,'The Rolling Stones','Aftermath','Rock'),(107,'The Velvet Underground','Loaded','Rock'),(108,'Radiohead','The Bends','Rock'),(109,'The Mamas and the Papas','If You Can Believe Your Eyes and Ears','Rock'),(110,'Joni Mitchell','Court and Spark','Rock'),(111,'Cream','Disraeli Gears','Rock'),(112,'The Who','The Who Sell Out','Rock'),(113,'The Rolling Stones','Out of Our Heads','Rock'),(114,'Derek and the Dominos','Layla and Other Assorted Love Songs','Rock'),(115,'Kanye West','Late Registration','Hip Hop'),(116,'Etta James','At Last!','Funk / Soul, Blues'),(117,'The Byrds','Sweetheart of the Rodeo','Rock'),(118,'Sly & The Family Stone','Stand!','Funk / Soul'),(119,'Various Artists','The Harder They Come','Reggae, Pop, Folk, World, & Country, Stage & Screen'),(120,'Run D.M.C.','Raising Hell','Hip Hop'),(121,'Moby Grape','Moby Grape','Rock'),(122,'Janis Joplin','Pearl','Rock, Blues'),(123,'The Wailers','Catch a Fire','Reggae'),(124,'The Byrds','Younger Than Yesterday','Rock'),(125,'Iggy and The Stooges','Raw Power','Rock'),(126,'Talking Heads','Remain in Light','Electronic, Rock'),(127,'Television','Marquee Moon','Rock'),(128,'Black Sabbath','Paranoid','Rock'),(129,'Various Artists','Saturday Night Fever: The Original Movie Sound Track','Electronic, Stage & Screen'),(130,'Bruce Springsteen','The Wild, the Innocent & the E Street Shuffle','Rock'),(131,'The Notorious B.I.G.','Ready to Die','Hip Hop'),(132,'Pavement','Slanted and Enchanted','Rock'),(133,'Elton John','Greatest Hits','Rock'),(134,'The Replacements','Tim','Rock'),(135,'Dr. Dre','The Chronic','Hip Hop'),(136,'The Meters','Rejuvenation','Funk / Soul'),(137,'Blondie','Parallel Lines','Electronic, Rock'),(138,'B.B. King','Live at the Regal','Blues'),(139,'Phil Spector','A Christmas Gift for You From Phil Spector','Rock, Funk / Soul, Pop'),(140,'Dr. John, the Night Tripper','Gris-Gris','Jazz, Rock, Funk / Soul, Blues'),(141,'N.W.A','Straight Outta Compton','Hip Hop'),(142,'Steely Dan','Aja','Jazz, Rock'),(143,'Jefferson Airplane','Surrealistic Pillow','Rock'),(144,'Crosby, Stills, Nash & Young','Deja vu','Rock'),(145,'Led Zeppelin','Houses of the Holy','Rock'),(146,'Santana','Santana','Rock, Latin, Funk / Soul'),(147,'Bruce Springsteen','Darkness on the Edge of Town','Rock'),(148,'Arcade Fire','Funeral','Rock'),(149,'A Tribe Called Quest','The Low End Theory','Hip Hop'),(150,'Pretenders','Pretenders','Rock'),(151,'Joy Division','Closer','Rock'),(152,'Elton John','Captain Fantastic and the Brown Dirt Cowboy','Rock'),(153,'KISS','Alive!','Rock'),(154,'T. Rex','Electric Warrior','Rock'),(155,'Otis Redding','The Dock of the Bay','Funk / Soul'),(156,'Radiohead','OK Computer','Electronic, Rock'),(157,'Prince','1999','Funk / Soul, Pop'),(158,'Linda Ronstadt','The Very Best of Linda Ronstadt','Rock, Pop'),(159,'Elvis Costello & The Attractions','Imperial Bedroom','Rock'),(160,'Metallica','Master of Puppets','Rock'),(161,'Elvis Costello','My Aim Is True','Rock'),(162,'Bob Marley & The Wailers','Exodus','Reggae'),(163,'The Who','Live at Leeds','Rock'),(164,'The Byrds','The Notorious Byrd Brothers','Rock'),(165,'Rod Stewart','Every Picture Tells a Story','Rock'),(166,'Todd Rundgren','Something/Anything?','Rock'),(167,'Bob Dylan','Desire','Rock'),(168,'Carpenters','Close to You','Rock, Pop'),(169,'Aerosmith','Rocks','Rock'),(170,'Funkadelic','One Nation Under a Groove','Funk / Soul'),(171,'Curtis Mayfield and The Impressions','The Anthology: 1961-1977','Funk / Soul'),(172,'ABBA','The Definitive Collection','Electronic, Pop'),(173,'The Rolling Stones','The Rolling Stones, Now!','Rock, Blues, Pop'),(174,'Bob Marley & The Wailers','Natty Dread','Reggae'),(175,'Fleetwood Mac','Fleetwood Mac','Rock, Pop'),(176,'Willie Nelson','Red Headed Stranger','Folk, World, & Country'),(177,'Madonna','The Immaculate Collection','Electronic, Pop'),(178,'The Stooges','The Stooges','Rock'),(179,'Sly & The Family Stone','Fresh','Funk / Soul'),(180,'Peter Gabriel','So','Electronic, Rock, Funk / Soul, Pop'),(181,'Buffalo Springfield','Buffalo Springfield Again','Rock, Pop'),(182,'Quicksilver Messenger Service','Happy Trails','Rock'),(183,'Elvis Presley','From Elvis in Memphis','Rock, Funk / Soul, Folk, World, & Country'),(184,'The Stooges','Fun House','Rock'),(185,'The Flying Burrito Brothers','The Gilded Palace of Sin','Rock, Folk, World, & Country'),(186,'Green Day','Dookie','Rock'),(187,'Lou Reed','Transformer','Rock'),(188,'Various Artists','Nuggets: Original Artyfacts From the First Psychedelic Era, 1965-1968','Rock'),(189,'R.E.M.','Murmur','Rock'),(190,'Little Walter','The Best of Little Walter','Blues'),(191,'The Strokes','Is This It','Rock'),(192,'AC/DC','Highway to Hell','Rock'),(193,'Nine Inch Nails','The Downward Spiral','Electronic, Rock'),(194,'Simon & Garfunkel','Parsley, Sage, Rosemary and Thyme','Rock, Pop, Folk, World, & Country'),(195,'Michael Jackson','Bad','Funk / Soul, Pop'),(196,'Bob Dylan','Modern Times','Rock'),(197,'Cream','Wheels of Fire','Rock, Blues'),(198,'Prince','Dirty Mind','Funk / Soul'),(199,'Santana','Abraxas','Rock, Latin'),(200,'Cat Stevens','Tea for the Tillerman','Rock, Stage & Screen'),(201,'Pearl Jam','Ten','Rock'),(202,'Neil Young & Crazy Horse','Everybody Knows This Is Nowhere','Rock'),(203,'Pink Floyd','Wish You Were Here','Rock'),(204,'Pavement','Crooked Rain Crooked Rain','Rock'),(205,'The Rolling Stones','Tattoo You','Rock'),(206,'Ike & Tina Turner','Proud Mary: The Best of Ike and Tina Turner','Funk / Soul'),(207,'New York Dolls','New York Dolls','Rock'),(208,'Bo Diddley','Bo Diddley / Go Bo Diddley','Rock, Blues'),(209,'The Smiths','The Queen Is Dead','Rock, Pop'),(210,'Beastie Boys','Licensed to Ill','Hip Hop'),(211,'The Meters','Look-Ka Py Py','Funk / Soul'),(212,'My Bloody Valentine','Loveless','Rock'),(213,'Professor Longhair','New Orleans Piano','Funk / Soul, Blues'),(214,'U2','War','Rock'),(215,'Neil Diamond','The Neil Diamond Collection','Rock, Pop'),(216,'Green Day','American Idiot','Rock'),(217,'Bruce Springsteen','Nebraska','Rock'),(218,'Pixies','Doolittle','Rock'),(219,'Eric B. & Rakim','Paid in Full','Hip Hop'),(220,'Aerosmith','Toys in the Attic','Rock'),(221,'Bonnie Raitt','Nick of Time','Rock, Pop'),(222,'Queen','A Night at the Opera','Rock'),(223,'The Kinks','The Kink Kronikles','Rock'),(224,'The Byrds','Mr. Tambourine Man','Rock'),(225,'Simon & Garfunkel','Bookends','Rock'),(226,'Patsy Cline','The Ultimate Collection','Folk, World, & Country'),(227,'Jackie Wilson','Mr. Excitement!','Funk / Soul'),(228,'The Who','My Generation','Rock'),(229,'Madonna','Like a Prayer','Electronic, Pop'),(230,'The Replacements','Let It Be','Rock'),(231,'Run D.M.C.','Run D.M.C.','Hip Hop'),(232,'Black Sabbath','Black Sabbath','Rock'),(233,'Eminem','The Marshall Mathers LP','Hip Hop'),(234,'Jerry Lee Lewis','All Killer No Filler! The Jerry Lee Lewis Anthology','Rock, Blues, Folk, World, & Country'),(235,'The Mothers of Invention','Freak Out!','Electronic, Rock'),(236,'The Grateful Dead','Live/Dead','Rock'),(237,'Ornette Coleman','The Shape of Jazz to Come','Jazz'),(238,'R.E.M.','Automatic for the People','Rock'),(239,'Jay Z','Reasonable Doubt','Hip Hop'),(240,'David Bowie','Low','Electronic, Rock'),(241,'Jay Z','The Blueprint','Hip Hop'),(242,'Bruce Springsteen','The River','Rock'),(243,'Otis Redding','Complete & Unbelievable: The Otis Redding Dictionary of Soul','Funk / Soul'),(244,'Kraftwerk','Trans Europa Express','Electronic'),(245,'Whitney Houston','Whitney Houston','Funk / Soul, Pop'),(246,'The Kinks','The Kinks Are The Village Green Preservation Society','Rock'),(247,'Janet','The Velvet Rope','Electronic, Funk / Soul, Pop'),(248,'Willie Nelson','Stardust','Pop, Folk, World, & Country'),(249,'Grateful Dead','American Beauty','Rock'),(250,'Crosby, Stills & Nash','Crosby, Stills & Nash','Rock, Folk, World, & Country'),(251,'Tracy Chapman','Tracy Chapman','Rock'),(252,'Ray Charles','The Genius of Ray Charles','Jazz, Pop'),(253,'Blood, Sweat & Tears','Child Is Father to the Man','Rock'),(254,'The Who','Quadrophenia','Rock'),(255,'Paul Simon','Paul Simon','Rock'),(256,'The Jesus and Mary Chain','Psychocandy','Rock'),(257,'The Rolling Stones','Some Girls','Rock'),(258,'The Beach Boys','The Beach Boys Today!','Rock'),(259,'Sleater Kinney','Dig Me Out','Rock'),(260,'Smokey Robinson & The Miracles','Going to a Go-Go','Funk / Soul'),(261,'LaBelle','Nightbirds','Funk / Soul'),(262,'Eminem','The Slim Shady LP','Hip Hop'),(263,'Parliament','Mothership Connection','Funk / Soul'),(264,'Janet Jackson','Rhythm Nation 1814','Electronic, Hip Hop, Pop'),(265,'Various','Anthology of American Folk Music','Blues, Folk, World, & Country'),(266,'David Bowie','Aladdin Sane','Rock'),(267,'Mary J. Blige','My Life','Hip Hop'),(268,'Muddy Waters','Folk Singer','Blues'),(269,'The Cars','The Cars','Electronic, Rock'),(270,'Stevie Wonder','Music of My Mind','Funk / Soul'),(271,'X','Los Angeles','Rock'),(272,'Grateful Dead','Anthem of the Sun','Rock'),(273,'The Kinks','Something Else by The Kinks','Rock'),(274,'Al Green','Call Me','Funk / Soul'),(275,'Talking Heads','Talking Heads: 77','Rock'),(276,'Bob Dylan and the Band','The Basement Tapes','Rock'),(277,'The Velvet Underground','White Light/White Heat','Rock'),(278,'MC5','Kick Out the Jams','Rock'),(279,'Leonard Cohen','Songs of Love and Hate','Folk, World, & Country'),(280,'The Smiths','Meat Is Murder','Rock'),(281,'Kanye West','The College Dropout','Hip Hop'),(282,'Weezer','Weezer (Blue Album)','Rock'),(283,'Black Sabbath','Master of Reality','Rock'),(284,'Dolly Parton','Coat of Many Colors','Folk, World, & Country'),(285,'Public Enemy','Fear of a Black Planet','Hip Hop'),(286,'Bob Dylan','John Wesley Harding','Rock'),(287,'Jeff Buckley','Grace','Rock'),(288,'Lucinda Williams','Car Wheels on a Gravel Road','Folk, World, & Country'),(289,'Beck','Odelay','Electronic, Hip Hop, Funk / Soul, Pop'),(290,'Creedence Clearwater Revival','Willy and the Poor Boys','Rock'),(291,'Red Hot Chili Peppers','Blood Sugar Sex Magik','Rock'),(292,'Various','The Sun Records Collection','Rock, Funk / Soul, Blues, Pop, Folk, World, & Country'),(293,'Nirvana','MTV Unplugged in New York','Rock'),(294,'Lauryn Hill','The Miseducation of Lauryn Hill','Hip Hop'),(295,'Tom Petty and the Heartbreakers','Damn the Torpedoes','Rock'),(296,'The Velvet Underground','The Velvet Underground','Rock'),(297,'Pixies','Surfer Rosa','Rock'),(298,'Radiohead','Amnesiac','Electronic, Rock'),(299,'Nick Drake','Pink Moon','Rock, Folk, World, & Country'),(300,'Randy Newman','Sail Away','Rock, Pop'),(301,'The Police','Ghost in the Machine','Rock, Pop'),(302,'David Bowie','Station to Station','Rock, Funk / Soul'),(303,'Eric Clapton','Slowhand','Rock'),(304,'The Cure','Disintegration','Electronic, Rock'),(305,'Liz Phair','Exile in Guyville','Rock'),(306,'Sonic Youth','Daydream Nation','Rock'),(307,'James Brown','In the Jungle Groove','Funk / Soul'),(308,'The Beatles','Help!','Rock, Stage & Screen'),(309,'Richard & Linda Thompson','Shoot Out the Lights','Rock, Folk, World, & Country'),(310,'X','Wild Gift','Rock'),(311,'Graham Parker & The Rumour','Squeezing Out Sparks','Rock, Blues'),(312,'Soundgarden','Superunknown','Rock'),(313,'Radiohead','In Rainbows','Electronic, Rock'),(314,'Jethro Tull','Aqualung','Rock'),(315,'Big Brother & the Holding Company','Cheap Thrills','Rock'),(316,'Tom Waits','The Heart of Saturday Night','Jazz, Pop, Folk, World, & Country'),(317,'Black Flag','Damaged','Rock'),(318,'Moby','Play','Electronic'),(319,'Depeche Mode','Violator','Electronic'),(320,'Meat Loaf','Bat Out of Hell','Rock'),(321,'Lou Reed','Berlin','Rock'),(322,'Talking Heads','Stop Making Sense','Rock, Funk / Soul'),(323,'De La Soul','3 Feet High and Rising','Hip Hop'),(324,'Pink Floyd','The Piper at the Gates of Dawn','Rock'),(325,'Muddy Waters','Muddy Waters at Newport 1960','Rock, Blues'),(326,'Jay Z','The Black Album','Hip Hop'),(327,'The Yardbirds','Roger the Engineer','Rock, Blues'),(328,'Neil Young & Crazy Horse','Rust Never Sleeps','Rock'),(329,'Dire Straits','Brothers in Arms','Rock'),(330,'Kanye West','My Beautiful Dark Twisted Fantasy','Hip Hop'),(331,'Billy Joel','52nd Street','Jazz, Rock, Pop'),(332,'The Yardbirds','Having a Rave Up','Rock'),(333,'Randy Newman','12 Songs','Rock, Pop'),(334,'The Rolling Stones','Between the Buttons','Rock'),(335,'Miles Davis','Sketches of Spain','Jazz'),(336,'Elton John','Honky Chateau','Rock'),(337,'Buzzcocks','Singles Going Steady','Rock'),(338,'OutKast','Stankonia','Hip Hop, Funk / Soul'),(339,'The Smashing Pumpkins','Siamese Dream','Rock'),(340,'New Order','Substance 1987','Electronic'),(341,'The Doors','L.A. Woman','Rock'),(342,'Rage Against the Machine','Rage Against the Machine','Hip Hop, Rock'),(343,'Johnny Cash','American Recordings','Folk, World, & Country'),(344,'Madonna','Ray of Light','Electronic, Pop'),(345,'Eagles','Eagles','Rock'),(346,'The Smiths','Louder Than Bombs','Rock'),(347,'Mott the Hoople','Mott','Rock'),(348,'The Police','Reggatta de Blanc','Rock, Pop'),(349,'Jefferson Airplane','Volunteers','Rock'),(350,'Roxy Music','Siren','Rock'),(351,'Jackson Browne','Late for the Sky','Rock'),(352,'Bjork','Post','Electronic'),(353,'John Lee Hooker','The Ultimate Collection: 1948-1990','Blues'),(354,'TLC','CrazySexyCool','Electronic, Hip Hop, Funk / Soul'),(355,'Toots & The Maytals','Funky Kingston','Reggae'),(356,'The Beach Boys','The Smile Sessions','Rock'),(357,'The Modern Lovers','The Modern Lovers','Rock'),(358,'Talking Heads','More Songs About Buildings and Food','Rock'),(359,'The Who','A Quick One','Rock'),(360,'Bob Dylan','\"Love and Theft\"','Rock'),(361,'Steely Dan','Pretzel Logic','Jazz, Rock'),(362,'Wu Tang Clan','Enter the Wu_Tang: 36 Chambers','Hip Hop'),(363,'Various Artists','The Indestructible Beat of Soweto','Funk / Soul, Folk, World, & Country'),(364,'Don Henley','The End of the Innocence','Rock'),(365,'The White Stripes','Elephant','Rock'),(366,'Jackson Browne','The Pretender','Rock'),(367,'The Beatles','Let It Be','Rock'),(368,'M.I.A.','Kala','Electronic, Hip Hop, Reggae, Pop'),(369,'Randy Newman','Good Old Boys','Rock, Pop'),(370,'LCD Soundsystem','Sound of Silver','Electronic, Rock'),(371,'Roxy Music','For Your Pleasure','Rock'),(372,'Massive Attack','Blue Lines','Electronic, Reggae'),(373,'ZZ Top','Eliminator','Rock'),(374,'Tom Waits','Rain Dogs','Rock, Blues'),(375,'The Temptations','Anthology: The Best of The Temptations','Electronic, Funk / Soul'),(376,'Red Hot Chili Peppers','Californication','Rock'),(377,'Nas','Illmatic','Hip Hop'),(378,'Big Star','Radio City','Rock'),(379,'PJ Harvey','Rid of Me','Rock'),(380,'The Clash','Sandinista!','Rock, Reggae'),(381,'The Doors','Strange Days','Rock'),(382,'Bob Dylan','Time Out of Mind','Rock, Blues'),(383,'Eric Clapton','461 Ocean Boulevard','Rock'),(384,'Wire','Pink Flag','Rock'),(385,'Minutemen','Double Nickels on the Dime','Rock'),(386,'Van Halen','Van Halen','Rock'),(387,'Tom Waits','Mule Variations','Electronic, Rock'),(388,'U2','Boy','Rock'),(389,'Paul McCartney & Wings','Band on the Run','Rock'),(390,'Portishead','Dummy','Electronic'),(391,'The Ronettes','Presenting the Fabulous Ronettes Featuring Veronica','Rock, Pop'),(392,'Diana Ross & The Supremes','Anthology','Electronic, Funk / Soul'),(393,'Bruce Springsteen','The Rising','Rock'),(394,'Gram Parsons','Grievous Angel','Rock, Folk, World, & Country'),(395,'Cheap Trick','Cheap Trick at Budokan','Rock'),(396,'Peter Wolf','Sleepless','Rock, Blues, Pop'),(397,'Brian Eno','Another Green World','Electronic'),(398,'Vampire Weekend','Vampire Weekend','Rock'),(399,'Brian Eno','Here Come the Warm Jets','Rock'),(400,'George Harrison','All Things Must Pass','Rock'),(401,'Big Star','#1 Record','Rock'),(402,'Nirvana','In Utero','Rock'),(403,'Beck','Sea Change','Rock'),(404,'Lil Wayne','Tha Carter III','Hip Hop, Funk / Soul'),(405,'Sam Cooke','Live at the Harlem Square Club, 1963','Funk / Soul'),(406,'The Pogues','Rum Sodomy & the Lash','Rock, Folk, World, & Country'),(407,'Suicide','Suicide','Electronic, Rock'),(408,'DEVO','Q: Are We Not Men? A: We Are Devo!','Rock'),(409,'Cheap Trick','In Color','Rock'),(410,'War','The World Is a Ghetto','Funk / Soul'),(411,'Steve Miller Band','Fly Like an Eagle','Rock'),(412,'MC5','Back in the USA','Rock');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review_text` varchar(255) NOT NULL,
  `review_score` int(11) NOT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_album`
--

DROP TABLE IF EXISTS `review_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_album` (
  `review_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  KEY `review_id` (`review_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `review_album_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_album_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_album`
--

LOCK TABLES `review_album` WRITE;
/*!40000 ALTER TABLE `review_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_by`
--

DROP TABLE IF EXISTS `review_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_by` (
  `user_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `review_by_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `review_by_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_by`
--

LOCK TABLES `review_by` WRITE;
/*!40000 ALTER TABLE `review_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ben','ben',NULL),(2,'ben','ben',NULL),(3,'ben','ben',NULL),(4,'ben','ben',NULL),(5,'ben','ben',NULL),(6,'ben','ben',NULL),(7,'ben','ben',NULL),(8,'ben','ben',NULL),(9,'ben','ben',NULL),(10,'ben','ben',NULL),(11,'ben','ben',NULL),(12,'ben','ben',NULL),(13,'ben','ben',NULL),(14,'ben','ben',NULL),(15,'ben','ben',NULL),(16,'a','a',NULL),(17,'remy','remy',NULL),(18,'ben','ben',NULL),(19,'w','w',NULL),(20,'ben','ben',NULL),(21,'d','d',NULL),(22,'ben','ben',NULL),(23,'b','b',NULL),(24,'y','y',NULL),(25,'d','d',NULL),(26,'b','b',NULL),(27,'b','b',NULL),(28,'e','e',NULL),(29,'b','b',NULL),(30,'b','b',NULL),(31,'f','f',NULL),(32,'e','e',NULL),(33,'b','b',NULL),(34,'nick','nick',NULL),(35,'nick','nick',NULL),(36,'admin','admin',NULL),(37,'yxk383','LLLlllll',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-03 19:46:35
