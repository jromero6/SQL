/* For this project I downloaded data from Kaagle.
I created a table on SQLite and load the data from the .csv file.
The I proceeded to run a couple of queries*/

-- Creating the table --
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL 
)

-- Which song is the longest in duration? --
SELECT track_name, artist_name, MAX(duration_ms)
FROM BIT_DB.Spotifydata;

-- Which song has the fastesta and slowest tempo? -- 
SELECT track_name, artist_name, MAX(tempo)
FROM BIT_DB.Spotifydata;

SELECT track_name, artist_name, MIN(tempo)
FROM BIT_DB.Spotifydata;

-- Which song is the loudest and has the most energy? --
SELECT track_name, artist_name, loudness, energy
FROM BIT_DB.Spotifydata
ORDER BY loudness DESC, energy DESC
LIMIT 2;

-- Which track has the most popularity? --
SELECT track_name, artist_name, popularity 
FROM BIT_DB.Spotifydata
ORDER BY popularity DESC;

-- What songs have the duration of less than 3 minutes? --
SELECT track_name, artist_name
FROM BIT_DB.Spotifydata
WHERE duration_ms < 180000;
