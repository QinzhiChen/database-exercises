-- I am going to show all data in my databases
SHOW DATABASES;
-- use the albums_db database
USE albums_db;
-- select all from albums to examine the table
SELECT * FROM albums_db.albums;
-- there are 31 rows in the albums table
-- use distinct artist to get unique result for albums
SELECT DISTINCT artist FROM albums;
-- there are 23 unique artist names

-- use SHOW CREATE TABLE to find out the sql
SHOW CREATE TABLE albums;
DESCRIBE albums;
-- the ID is the primary key for the table
SELECT release_date FROM albums ORDER BY release_date ASC ;
-- the oldest is 1967 and the latest is 2011
-- find Pink Floyd albums
SELECT * FROM albums WHERE artist = "Pink Floyd";
-- The Dark Side of the Moon and The Wall

-- Use the WHERE syntax to find the album 
SELECT * FROM albums WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- the year is 1967

-- use the WHERE syntax to find the album
SELECT * FROM albums WHERE name = "Nevermind";
-- the genre is Grunge, Alternative Rock

-- Use the BETWEEN syntax to find release 1990s
SELECT * FROM albums Where release_date between 1990 and 1999;
/* '22','Madonna','The Immaculate Collection','1990','19.4','Pop, Dance'
'5','Whitney Houston / Various artists','The Bodyguard','1992','28.4','R&B, Soul, Pop, Soundtrack'
'30','Santana','Supernatural','1999','20.5','Rock'
'28','Nirvana','Nevermind','1991','16.7','Grunge, Alternative rock'
'27','Metallica','Metallica','1991','21.2','Thrash metal, Heavy metal'
'19','Celine Dion','Let\'s Talk About Love','1997','19.3','Pop, Soft rock'
'12','Alanis Morissette','Jagged Little Pill','1995','24.4','Alternative rock'
'14','Celine Dion','Falling into You','1996','20.2','Pop, Soft rock'
'21','Michael Jackson','Dangerous','1991','16.3','Rock, Funk, Pop'
'13','Shania Twain','Come On Over','1997','29.6','Country, Pop' */

-- use < to find out albums less than 20 million sales
SELECT * FROM albums WHERE sales<20;
/* '9','Various artists','Grease: The Original Soundtrack from the Motion Picture','1978','14.4','Soundtrack'
'11','Michael Jackson','Bad','1987','19.3','Pop, Funk, Rock'
'15','The Beatles','Sgt. Pepper\'s Lonely Hearts Club Band','1967','13.1','Rock'
'17','Various artists','Dirty Dancing','1987','17.9','Pop, Rock, R&B'
'19','Celine Dion','Let\'s Talk About Love','1997','19.3','Pop, Soft rock'
'21','Michael Jackson','Dangerous','1991','16.3','Rock, Funk, Pop'
'22','Madonna','The Immaculate Collection','1990','19.4','Pop, Dance'
'23','The Beatles','Abbey Road','1969','14.4','Rock'
'24','Bruce Springsteen','Born in the U.S.A.','1984','19.6','Rock'
'25','Dire Straits','Brothers in Arms','1985','17.7','Rock, Pop'
'26','James Horner','Titanic: Music from the Motion Picture','1997','18.1','Soundtrack'
'28','Nirvana','Nevermind','1991','16.7','Grunge, Alternative rock'
'29','Pink Floyd','The Wall','1979','17.6','Progressive rock'
*/

-- identify the genre for all albums
SELECT * FROM albums;
-- because of their naming convention so the syntax needs to be specific to identify them in the result




