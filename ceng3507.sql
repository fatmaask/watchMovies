-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 Ara 2014, 16:57:13
-- Sunucu sürümü: 5.6.17
-- PHP Sürümü: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Veritabanı: `movies`
--
CREATE DATABASE IF NOT EXISTS `watchMovies` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `watchMovies`;
-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `actors`
--

CREATE TABLE IF NOT EXISTS `actors` (
  `actor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=78 ;

--
-- Tablo döküm verisi `actors`
--

INSERT INTO `actors` (`actor_id`, `name`) VALUES
(1, 'Johnny Depp'),
(2, 'Rebecca Hall'),
(3, 'Kate Mara'),
(4, 'Morgan Freeman'),
(5, 'Paul Bettany'),
(6, 'Natalie Portman'),
(7, 'Mila Kunis'),
(8, 'Vincent Cassel'),
(9, 'Winona Ryder'),
(10, 'Barbara Hershey'),
(11, 'Michelle Monaghan'),
(12, 'James Marsden'),
(13, 'Ian Nelson'),
(14, 'Liana Liberato'),
(15, 'Caroline Goodall'),
(16, 'Peter Facinelli'),
(17, 'Sophia Myles'),
(18, 'Nathalia Ramos'),
(19, 'Carolina Guerra'),
(20, 'Sebastian Martinez'),
(21, 'Kristen Stewart'),
(22, 'Robert Pattinson'),
(23, 'Ashley Greene'),
(24, 'Taylor Lautner'),
(25, 'Kellan Lutz'),
(26, 'Michelle Rodriguez'),
(27, 'Sam Worthington'),
(28, 'Zoe Saldana'),
(29, 'Sigourney Weaver'),
(30, 'Giovanni Ribisi'),
(31, 'Tom Hanks'),
(32, 'Helen Hunt'),
(33, 'Chris Noth'),
(34, 'Wilson'),
(35, 'Michael Forest'),
(36, 'Liam Neeson'),
(37, 'Amanda Seyfried'),
(38, 'Nina Dobrev'),
(39, 'Julianne Moore'),
(40, 'Max Thieriot'),
(41, 'Brad Pitt'),
(42, 'Anthony Hopkins'),
(43, 'Claire Forlani'),
(44, 'Marcia Gay Harden'),
(45, 'Jake Weber'),
(46, 'Sean Penn'),
(47, 'Deborah Kara Unger'),
(48, 'Armin Mueller-Stahl'),
(49, 'Spike Jonze'),
(50, 'Michael Douglas'),
(51, 'Robert Downey Jr.'),
(52, 'Jude Law'),
(53, 'Rachel McAdams'),
(54, 'Noomi Rapace'),
(55, 'Kelly Reilly'),
(56, 'Leonardo DiCaprio'),
(57, 'Kate Winslet'),
(58, 'Ioan Gruffudd'),
(59, 'Billy Zane'),
(60, 'Kathy Bates'),
(61, 'Nicolas Cage'),
(62, 'Jared Leto'),
(63, 'Ethan Hawke'),
(64, 'Bridget Moynahan'),
(65, 'Ian Holm'),
(66, 'Chris Hemsworth'),
(67, 'Jaimie Alexander'),
(68, 'Kat Dennings'),
(69, 'Keanu Reeves'),
(70, 'Shia LaBeouf'),
(71, 'Rachel Weisz'),
(72, 'Djimon Hounsou'),
(73, 'Leonardo Dicaprio'),
(74, 'Marion Cotillard'),
(75, 'Joseph Gordon-levitt'),
(76, 'Ellen Page'),
(77, 'Michael Caine');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Tablo döküm verisi `countries`
--

INSERT INTO `countries` (`country_id`, `country`) VALUES
(1, 'USA'),
(2, 'England'),
(3, 'Canada'),
(4, 'France'),
(5, 'Spain'),
(6, 'Egypt'),
(7, 'New Zealand'),
(8, 'Austria');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `director`
--

CREATE TABLE IF NOT EXISTS `director` (
  `director_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  `birthdate` date NOT NULL,
  `country_id` int(11) NOT NULL,
  `biography` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `img` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `video` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=16 ;

--
-- Tablo döküm verisi `director`
--

INSERT INTO `director` (`director_id`, `name`, `birthdate`, `country_id`, `biography`, `img`, `video`) VALUES
(1, 'Wally Pfister', '1961-07-08', 1, 'Wally Pfister was born on July 8, 1961 in Chicago, Illinois, USA as Walter Pfister. He is known for his work on Kara Sövalye (2008), Baslangiç (2010) and Kara Sövalye Yükseliyor (2012). He has been married to Anna Julien since 1992.', '/static/img/wally-pfister.jpg', 'wSdy_gq5cPU'),
(2, 'Darren Aronofsky', '1969-02-12', 1, 'Darren Aronofsky was born February 12, 1969, in Brooklyn, New York. Growing up, Darren was always artistic: he loved classic movies and, as a teenager, he even spent time doing graffiti art. After high school, Darren went to Harvard University to study film (both live-action and animation). He won several film awards after completing his senior thesis film, "Supermarket Sweep", starring Sean Gullette, which went on to becoming a National Student Academy Award finalist. Aronofsky didn''t make a feature film until five years later, in February 1996, where he began creating the concept for Pi (1998). After Darren''s script for Pi (1998) received great reactions from friends, he began production. The film re-teamed Aronofsky with Gullette, who played the lead. This went on to further successes, such as Bir Rüya Için Agit (2000) and, most recently, the American remake of the Japanese film series "Kozure okami" (1973) (aka "Lone Wolf & Cub").', '/static/img/darren-aronofsky.jpg', 'X6rPVPVGUTg'),
(3, 'Michael Hoffman', '1956-11-30', 1, 'Michael Hoffman was born on November 30, 1956 in Hawaii, USA. He is a director and writer, known for Güzel bir gün (1996), Bir yaz gecesi rüyasi (1999) and Askin son mevsimi (2009). He is married to Samantha Silva.', '/static/img/michael-hoffman.jpg', 'rb02Al6V0G8'),
(4, 'Victor Garcia', '1974-12-04', 5, 'Víctor García was born on December 4, 1974 in Barcelona, Spain. He is known for his work on Return to House on Haunted Hill (2007), Mirrors 2 (2010) and Hellboy (2004).', '/static/img/victor-garcia.jpg', 'N3RfUP3k3Ng'),
(5, 'Bill Condon', '1955-10-22', 1, 'Bill Condon was born on October 22, 1955 in New York City, New York, USA as William Condon. He is a director and writer, known for Rüya kizlar (2006), Kinsey (2004) and Gods and Monsters (1998).', '/static/img/bill-condon.jpg', 'ZNUe3TIGoG8'),
(6, 'James Cameron', '1954-08-16', 3, 'James Francis Cameron was born on August 16, 1954 in Kapuskasing, Ontario, Canada. He moved to the United States in 1971. The son of an engineer, he majored in physics at California State University but, after graduating, drove a truck to support his screenwriting ambition.', '/static/img/james-cameron.jpg', 'Wcm79Mts3zA'),
(7, 'Robert Zemeckis', '1952-05-14', 1, 'A whiz-kid with special effects, Robert is from the Spielberg camp of film-making (Steven Spielberg produced many of his films). Usually working with writing partner Bob Gale, Robert''s earlier films show he has a talent for zany comedy (Amazon''da firtina (1984), 1941: Çilgin Dünya (1979)) and special effect vehicles (Masum sanik Roger Rabbit (1988) and Gelecege Dönüs (1985)). His later films have become more serious, with the hugely successful Tom Hanks vehicle Forrest Gump (1994) and the Jodie Foster film Mesaj (1997), both critically acclaimed movies. Again, these films incorporate stunning effects. Robert has proved he can work a serious story around great effects.', '/static/img/robert-zemeckis.jpg', 'djKEdxrZbQ8'),
(8, 'Atom Egoyan', '1960-07-19', 6, 'Born in Egypt to Armenian parents, he was raised in Western Canada. Both his parents were painters, and he planned to be a playwright, but after making a short film, he became hooked on telling stories visually. Returned to ethnic "homeland" when he filmed Calendar (1993) in Armenia. Won attention at the Sundance Film Festival for earlier work, then broke through critically and commercially with Exotica (1994). Afterwards, Baska bir dünya (1997) led him to receive two Academy Award nominations, and then Büyük hata (2009) became his biggest moneymaker ever (after the film''s DVD/Blu-ray release).', '/static/img/atom-egoyan.jpg', 'MjGXUARsO9g'),
(9, 'Martin Brest', '1951-08-08', 1, 'Martin Brest was born on August 8, 1951 in The Bronx, New York City, New York, USA. He is a director and producer, known for Kadin Kokusu (1992), Joe Black (1998) and Sosyete polisi (1984).', '/static/img/martin-brest.jpg', 'GZXae8Aay3I'),
(10, 'David Fincher', '1962-08-28', 1, 'David Fincher was born in 1962 in Denver, Colorado, and was raised in Marin County, California. When he was 18 years old he went to work for John Korty at Korty Films in Mill Valley. He subsequently worked at ILM (Industrial Light and Magic) from 1981-1983. Fincher left ILM to direct TV commercials and music videos after signing with N. Lee Lacy in Hollywood. He went on to found Propaganda in 1987 with fellow directors Dominic Sena, Greg Gold and Nigel Dick. Fincher has directed TV commercials for clients that include Nike, Coca-Cola, Budweiser, Heineken, Pepsi, Levi''s, Converse, AT&T and Chanel. He has directed music videos for Madonna, Sting, The Rolling Stones, Michael Jackson, Aerosmith, George Michael, Iggy Pop, The Wallflowers, Billy Idol, Steve Winwood, The Motels and, most recently, A Perfect Circle.', '/static/img/david-fincher.jpg', 'tgjgAzAjtEY'),
(11, 'Guy Ritchie', '1968-09-10', 2, 'Guy Ritchie was born in Hatfield, Hertfordshire, UK on September 10, 1968. After watching Sonsuz ölüm (1969) as a child, Guy realized that what he wanted to do was make films. He never attended film school, saying that the work of film school graduates was boring and unwatchable. At 15 years old, he dropped out of school and in 1995, got a job as a runner, ultimately starting his film career. He quickly progressed and was directing music promos for bands and commercials by 1995. ', '/static/img/guy-ritchie.jpg', '3ya_jSNYH04'),
(12, 'Andrew Niccol', '1964-06-10', 7, 'New Zealand-born screenwriter-director Andrew Niccol began his career in London, successfully directing TV commercials before moving to Los Angeles in order to make films "longer than 60 seconds." He interested high-powered producer Scott Rudin in his Truman Show (1998) script, but Rudin was not willing to gamble on a rookie director, particularly when Jim Carrey came aboard, swelling the budget to about $60 million. Peter Weir helmed instead, bringing a complementary vision which lightened the material somewhat, and the clever satire, which followed a cheerful insurance man (Carrey) as he slowly realizes that all the people in his life are just actors in a TV show, opened to critical raves. Since the deal for "Truman" came together slowly, Niccol actually made his screenwriting and directing debut with Gattaca (1997) (1997), a superb, well-acted sci-fi movie that raised issues of genetic engineering in a totalitarian environment.', '/static/img/andrew-niccol.jpg ', 'K1jBbq6zRo'),
(13, 'Kenneth Branagh', '1960-12-10', 2, 'Kenneth Charles Branagh was born on December 10, 1960, in Belfast, Northern Ireland, UK, to parents William Branagh, a plumber and carpenter born in 1930, and Frances (Harper) Branagh, also born in 1930. His brother, William Branagh Jr., was born in 1955 and sister, Joyce Branagh, was born in 1970.', '/static/img/kenneth-branagh.jpg', 'RJGo3GW-RE8'),
(14, 'Francis Lawrence', '1971-03-26', 8, 'Francis Lawrence was born on March 26, 1971 in Vienna, Austria. He is a producer and director, known for Açlik Oyunlari: Atesi Yakalamak (2013), Ben efsaneyim (2007) and Constantine (2005).', '/static/img/francis-lawrence.jpg', '5Q_A11BGEvU'),
(15, 'Christopher Nolan', '1970-07-30', 2, 'Best known for his cerebral, often nonlinear story-telling, acclaimed writer-director Christopher Nolan was born on July 30, 1970 in London, England. Over the course of 15 years of film-making, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made.', '', 'g7ff4c-ZqpY');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=21 ;

--
-- Tablo döküm verisi `genre`
--

INSERT INTO `genre` (`genre_id`, `genre`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Anime'),
(4, 'Biography'),
(5, 'Comedy'),
(6, 'Documentary'),
(7, 'Drama'),
(8, 'Family'),
(9, 'Fantastic'),
(10, 'Historical'),
(11, 'Horror'),
(12, 'Military'),
(13, 'Musical'),
(14, 'Mystic'),
(15, 'Romantic'),
(16, 'Sci-Fi'),
(17, 'Sport'),
(18, 'Thriller'),
(19, 'War'),
(20, 'Western');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `director_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `year` smallint(4) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `runtime` smallint(3) DEFAULT NULL,
  `img` varchar(128) COLLATE utf8_turkish_ci DEFAULT NULL,
  `video` varchar(128) COLLATE utf8_turkish_ci DEFAULT NULL,
  `synopsis` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=17 ;

--
-- Tablo döküm verisi `movies`
--

INSERT INTO `movies` (`movie_id`, `director_id`, `title`, `year`, `release_date`, `runtime`, `img`, `video`, `synopsis`) VALUES
(1, 1, 'Transcendence', 2014, '2014-10-10', 91, '/static/img/transcendence.jpg', '280qnrHpuc8', 'Dr. Will Caster (Johnny Depp) is the foremost researcher in the field of Artificial Intelligence, working to create a sentient machine that combines the collective intelligence of everything ever known with the full range of human emotions. His highly controversial experiments have made him famous, but they have also made him the prime target of anti-technology extremists who will do whatever it takes to stop him. However, in their attempt to destroy Will, they inadvertently become the catalyst for him to succeed-to be a participant in his own transcendence. For his wife Evelyn (Rebecca Hall) and best friend Max Waters (Paul Bettany), both fellow researchers, the question is not if they can...but if they should. Their worst fears are realized as Will''s thirst for knowledge evolves into a seemingly omnipresent quest for power, to what end is unknown. The only thing that is becoming terrifyingly clear is there may be no way to stop him.\r\n'),
(2, 2, 'Black Swan', 2010, '2011-02-25', 108, '/static/img/black-swan.jpg', '5jaI1XOB-bs', 'Nina (Portman) is a ballerina in a New York City ballet company whose life, like all those in her profession, is completely consumed with dance. She lives with her obsessive former ballerina mother Erica (Hershey) who exerts a suffocating control over her. When artistic director Thomas Leroy (Cassel) decides to replace prima ballerina Beth MacIntyre (Ryder) for the opening production of their new season, Swan Lake, Nina is his first choice.But Nina has competition: a new dancer, Lily (Kunis), who impresses Leroy as well. Swan Lake requires a dancer who can play both the White Swan with innocence and grace, and the Black Swan, who represents guile and sensuality. Nina fits the White Swan role perfectly but Lily is the personification of the Black Swan. As the two young dancers expand their rivalry into a twisted friendship, Nina begins to get more in touch with her dark side - a recklessness that threatens to destroy her.'),
(3, 3, 'The Best of Me', 2014, '2014-10-17', 117, '/static/img/the-best-of-me.jpg', 'mrEvBiqoeRc', 'Amanda and Dawson are soul mates who met as teens and were from different backgrounds. But circumstances would force them to part ways. 20 years they are brought back together by the passing of a mutual friend. So they go back home to fulfill his final wishes they run into each other. While Amanda is married, albeit unhappily, she still has feelings for Dawson but she can''t forgive him for pushing her away.'),
(4, 4, 'Encerrada', 2013, '2014-10-17', 86, '/static/img/encerrada.jpg', 'n0YE-3orp1k', 'After a family is involved in an accident, they take refuge in a secluded inn where they free a girl locked in a basement without knowing she''s an ancient evil spirit.'),
(5, 5, 'Twilight Saga - Breaking Dawn 1', 2011, '2011-11-18', 117, '/static/img/twilight-breaking-dawn.jpg', 'PQNLfo-SOR4', 'Bella and Edward are to marry. Jacob becomes upset when he learns that Bella is planning to consummate the marriage on her honeymoon. The wedding over, Bella and Edward spend their honeymoon on the Cullen''s idyllic private island. But, to their dismay, they discover that Bella is pregnant. The fetus is growing at an accelerated rate and everyone fears for Bella''s safety. Will she go ahead with her pregnancy, whatever the cost? The Quileutes close in as the unborn child poses a threat to the Wolf Pack and the towns people of Forks.'),
(6, 6, 'Avatar', 2009, '2009-12-18', 162, '/static/img/avatar.jpg', 'd1_JBMrrYw8', '"When his brother is killed in a robbery, paraplegic Marine Jake Sully decides to take his place in a mission on the distant world of Pandora. There he learns of greedy corporate figurehead Parker Selfridge''s intentions of driving off the native humanoid "Na''vi" in order to mine for the precious material scattered throughout their rich woodland. In exchange for the spinal surgery that will fix his legs, Jake gathers intel for the cooperating military unit spearheaded by gung-ho Colonel Quaritch, while simultaneously attempting to infiltrate the Na''vi people with the use of an "avatar" identity. While Jake begins to bond with the native tribe and quickly falls in love with the beautiful alien Neytiri, the restless Colonel moves forward with his ruthless extermination tactics, forcing the soldier to take a stand - and fight back in an epic battle for the fate of Pandora.'),
(7, 7, 'Cast Away', 2000, '2000-12-22', 143, '/static/img/cast-away.jpg', '2TWYDogv4WQ', 'A man is marooned on an island after his plane crashes into the ocean. Far away from home, his girlfriend, and any human contact, he engages in a battle of wits with himself as he is tested mentally, physically, and emotionally in order to survive.'),
(8, 8, 'Chloe', 2009, '2010-07-09', 96, '/static/img/chloe.jpg', 'JWLEz-1VzSk', 'Catherine and David, she a doctor, he a professor, are at first glance the perfect couple. Happily married with a talented teenage son, they appear to have an idyllic life. But when David misses a flight and his surprise birthday party, Catherine''s long simmering suspicions rise to the surface. Suspecting infidelity, she decides to hire an escort to seduce her husband and test his loyalty. Catherine finds herself ''directing'' Chloe''s encounters with David, and Chloe''s end of the bargain is to report back, the descriptions becoming increasingly graphic as the meetings multiply.'),
(9, 9, 'Meet Joe Black', 1998, '1999-01-15', 178, '/static/img/meet-joe-black.jpg', 'RbhS_IQkBx4', 'Bill Parrish, media tycoon, loving father and still a human being, is about to celebrate his 65th birthday. One morning, he is contacted by the Inevitable - by hallucination, as he thinks. Later, Death itself enters his home and his life, personified in a man''s body: Joe Black has arrived. His intention was to take Bill with him, but accidentally, Joe''s former host and Bills beautiful daughter Susan have already met. Joe begins to develop certain interest in life on earth as well as in Susan, who has no clue who she''s flirting with.'),
(10, 10, 'The Game', 1997, '1998-02-06', 129, '/static/img/the-game.jpg', '9HTJh4lzAjk', 'Nicholas Van Orton is a very wealthy San Francisco banker, but he is an absolute loner, even spending his birthday alone. In the year of his 48th birthday (the age his father committed suicide) his brother Conrad, who has gone long ago and surrendered to addictions of all kinds, suddenly returns and gives Nicholas a card giving him entry to unusual entertainment provided by something called Consumer Recreation Services (CRS). Giving up to curiosity, Nicholas visits CRS and all kinds of weird and bad things start to happen to him.'),
(11, 11, 'Sherlock Holmes', 2011, '2011-12-16', 129, '/static/img/sherlock-holmes.jpg', 'eSDqyX8Ahpo', 'Sherlock Holmes (Robert Downey Jr.) and his longtime trusted associate, Doctor Watson (Jude Law), take on their arch-nemesis, Professor Moriarty (Jared Harris), with the help of Holmes'' older brother Mycroft Holmes (Stephen Fry) and a gypsy named Simza (Noomi Rapace).'),
(12, 6, 'Titanic', 1997, '1998-02-13', 194, '/static/img/titanic-2.jpg', 'ZQ6klONCq4s', '84 years later, a 101-year-old woman named Rose DeWitt Bukater tells the story to her granddaughter Lizzy Calvert, Brock Lovett, Lewis Bodine, Bobby Buell and Anatoly Mikailavich on the Keldysh about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship with the upper-class passengers and her mother, Ruth DeWitt Bukater, and her fiancé, Caledon Hockley. Meanwhile, a drifter and artist named Jack Dawson and his best friend Fabrizio De Rossi win third-class tickets to the ship in a game. And she explains the whole story from departure until the death of Titanic on its first and last voyage April 15th, 1912 at 2:20 in the morning.'),
(13, 12, 'Lord of War', 2005, '2005-10-14', 122, '/static/img/lord-of-war.jpg', 'Ej83QvHuiNI', 'This film charts the rise and fall of Yuri Orlov, from his early days in the early 1980s in Little Odessa, selling guns to mobsters in his local neighbourhood, through to his ascension through the decade of excess and indulgence into the early 90s, where he forms a business partnership with an African warlord and his psychotic son. The film also charts his relationship through the years with his younger brother, his marriage to a famous model, his relentless pursuit by a determined federal agent and his inner demons that sway between his drive for success and the immorality of what he does.'),
(14, 13, 'Thor', 2011, '2011-04-29', 115, '/static/img/thor.jpg', 'JOddp-nlNvQ', 'When Jane Foster is targeted by the denizens of the dark world of Svartalfheim, Thor sets out on a quest to protect her at all costs.'),
(15, 14, 'Constantine', 2005, '2005-03-11', 121, '/static/img/constantine.jpg', 'q3lfSQTDSVM', 'John Constantine is approached by Det. Angela Dodson who needs his help to prove that her twin sister Isabel''s death was not a suicide. The dead woman was a devout Catholic and Angela refuses to accept that she would have taken her own life. She''s asked Constantine for help because he has a reputation for dealing with the mystical. In fact, he is a demon hunter whose sole purpose on Earth is to send demons back to the nether regions. John himself has been to Hell - as a young man he too committed suicide and now knows that he is destined to return there on his death - but hopes that his good deeds may somehow find him a place in Heaven. As he looks into Isabel''s death, he realizes that demons are trying to break through to the human world and his battles lead him into a direct conflict with Satan.'),
(16, 15, 'Inception', 2010, '2010-07-30', 148, NULL, '66TuSJo4dZM', 'A thief who steals corporate secrets through use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_actor`
--

CREATE TABLE IF NOT EXISTS `movie_actor` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `movie_actor`
--

INSERT INTO `movie_actor` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 21),
(5, 22),
(5, 23),
(5, 24),
(5, 26),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(7, 31),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(8, 40),
(9, 41),
(9, 42),
(9, 43),
(9, 44),
(9, 45),
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50),
(11, 51),
(11, 52),
(11, 53),
(11, 54),
(11, 55),
(12, 56),
(12, 57),
(12, 58),
(12, 59),
(12, 60),
(13, 61),
(13, 62),
(13, 63),
(13, 64),
(13, 65),
(14, 66),
(14, 67),
(14, 68),
(14, 6),
(14, 42),
(15, 69),
(15, 70),
(15, 71),
(15, 72),
(15, 11),
(16, 76),
(16, 76),
(16, 75),
(16, 73),
(16, 74),
(16, 77);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_country`
--

CREATE TABLE IF NOT EXISTS `movie_country` (
  `movie_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `movie_country`
--

INSERT INTO `movie_country` (`movie_id`, `country_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(6, 1),
(7, 1),
(8, 3),
(8, 4),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(11, 1),
(12, 1),
(13, 1),
(14, 4),
(14, 1),
(15, 1),
(16, 2),
(16, 2),
(16, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_genre`
--

CREATE TABLE IF NOT EXISTS `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `movie_genre`
--

INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 7),
(1, 16),
(2, 7),
(2, 18),
(3, 7),
(3, 15),
(4, 11),
(4, 18),
(4, 14),
(5, 7),
(5, 9),
(6, 2),
(6, 16),
(6, 9),
(6, 1),
(7, 7),
(7, 2),
(7, 15),
(8, 7),
(8, 18),
(8, 14),
(9, 7),
(9, 9),
(9, 14),
(10, 7),
(10, 2),
(10, 14),
(11, 1),
(11, 2),
(11, 9),
(12, 7),
(12, 15),
(13, 7),
(13, 18),
(14, 1),
(14, 2),
(14, 9),
(15, 1),
(15, 9),
(15, 18),
(16, 1),
(16, 16);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_productor`
--

CREATE TABLE IF NOT EXISTS `movie_productor` (
  `movie_id` int(11) NOT NULL,
  `productor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `movie_productor`
--

INSERT INTO `movie_productor` (`movie_id`, `productor_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 27),
(7, 12),
(7, 13),
(8, 14),
(8, 15),
(9, 16),
(10, 17),
(10, 18),
(11, 19),
(11, 20),
(12, 11),
(13, 21),
(13, 22),
(14, 23),
(14, 24),
(15, 25),
(15, 26),
(16, 1),
(16, 1),
(16, 28);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_writer`
--

CREATE TABLE IF NOT EXISTS `movie_writer` (
  `movie_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `movie_writer`
--

INSERT INTO `movie_writer` (`movie_id`, `writer_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 12),
(5, 13),
(5, 14),
(6, 15),
(7, 16),
(8, 17),
(9, 18),
(9, 19),
(10, 20),
(10, 21),
(11, 22),
(11, 23),
(12, 15),
(13, 24),
(14, 25),
(14, 26),
(15, 27),
(15, 28),
(16, 29),
(16, 29);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `productors`
--

CREATE TABLE IF NOT EXISTS `productors` (
  `productor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`productor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=29 ;

--
-- Tablo döküm verisi `productors`
--

INSERT INTO `productors` (`productor_id`, `name`) VALUES
(1, 'Christopher Nolan'),
(2, 'Andrew A. Kosove'),
(3, 'Darren Aronofsky'),
(4, 'Jon Avnet'),
(5, 'Nicholas Sparks'),
(6, 'Denise Di Novi'),
(7, 'Peter Block'),
(8, 'Andrea Chung'),
(9, 'Karen Rosenfelt'),
(10, 'Wyck Godfrey'),
(11, 'James Cameron'),
(12, 'Tom Hanks'),
(13, 'Robert Zemeckis'),
(14, 'Ivan Reitman'),
(15, 'Jason Reitman'),
(16, 'Martin Brest'),
(17, 'Jonathan Mostow'),
(18, 'Michael Ferris'),
(19, 'Joel Silver'),
(20, 'Bruce Berman'),
(21, 'Nicolas Cage'),
(22, 'Andrew Niccol'),
(23, 'Stan Lee'),
(24, 'Kevin Feige'),
(25, 'Akiva Goldsman'),
(26, 'Erwin Stoff'),
(27, 'Colin Wilson'),
(28, 'Emma Thomas');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `writers`
--

CREATE TABLE IF NOT EXISTS `writers` (
  `writer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=30 ;

--
-- Tablo döküm verisi `writers`
--

INSERT INTO `writers` (`writer_id`, `name`) VALUES
(1, 'Wally Pfister'),
(2, 'Jack Paglen'),
(3, 'Jordan Goldberg'),
(4, 'Alex Paraskevas'),
(5, 'Mark Heyman'),
(6, 'John Mclaughlin'),
(7, 'Andres Heinz'),
(8, 'Nicholas Sparks'),
(9, 'Michael Hoffman'),
(10, 'Will Fetters'),
(11, 'J. Mills Goodloe'),
(12, 'Norma Bailey'),
(13, 'Stephenie Meyer'),
(14, 'Melissa Rosenberg'),
(15, 'James Cameron'),
(16, 'William Broyles Jr.'),
(17, 'Erin Cressida Wilson'),
(18, 'Ron Osborn'),
(19, 'Jeff Reno'),
(20, 'Michael Ferris'),
(21, 'John D. Brancato'),
(22, 'Michele Mulroney'),
(23, 'Kieran Mulroney'),
(24, 'Andrew Niccol'),
(25, 'Zack Stentz'),
(26, 'Ashley Miller'),
(27, 'Kevin Brodbin'),
(28, 'Frank A. Cappello'),
(29, 'Christopher Nolan');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
