DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks CASCADE;
DROP TABLE IF EXISTS albums_tracks;

CREATE TABLE albums(
    album_id serial PRIMARY KEY,
    album_title text NOT NULL,
    artist text NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);
 
CREATE TABLE tracks(
    track_id serial PRIMARY KEY,
    track_title text NOT NULL,
    length integer NOT NULL,
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

CREATE TABLE albums_tracks(
    album_track_id serial PRIMARY KEY,
    album_id integer REFERENCES albums(album_id),
    track_id integer REFERENCES tracks(track_id),
    created_at timestamp(0) with time zone NOT NULL DEFAULT NOW()
);

INSERT INTO albums(album_title,artist)
VALUES
('Back in black', 'taylor swift'),
('Night fever', 'katy perry'),
('Thunder gem', 'jimmy smith'),
('Lonely', 'miles davis'),
('Experienced', 'sammy hager'),
('The wall', 'ariana grande'),
('Music club', 'diana ross'),
('Fear of music', 'james bay'),
('The bends', 'demi lovato'),
('Welcome home', 'miles davis');

INSERT INTO tracks(track_title,length)
VALUES
('Reason to live', 8),
('Blue skies', 10),
('All my life', 5),
('Back home', 10),
('After the rain', 7),
('Blueberry', 6),
('Bubbly', 10),
('Happy', 10),
('Free bird', 8),
('The candy man', 5);

INSERT INTO albums_tracks(album_id,track_id)
VALUES
(1,3),
(1,5),
(2,1),
(2,5),
(3,1),
(3,4),
(3,10),
(4,3),
(4,7),
(4,9),
(5,7),
(5,9),
(5,1),
(5,4),
(6,1),
(6,8),
(7,6),
(8,9),
(8,5),
(8,8),
(9,4),
(9,9),
(9,10),
(10,10);

---SQL query to see the albums and the tracks that belong to that album
SELECT A.album_title AS "Albums", T.track_title AS "Tracks"
FROM albums_tracks AS AT
INNER JOIN albums AS A
ON AT.album_id = A.album_id
INNER JOIN tracks AS T
ON AT.track_id = T.track_id

---SQL query to see the album or albums that each track belongs to
SELECT T.track_title AS "Tracks", A.album_title AS "Albums"
FROM albums_tracks AS AT
INNER JOIN tracks AS T
ON AT.track_id = T.track_id
INNER JOIN albums AS A
ON AT.album_id = A.album_id

--Query to see the number of songs an album has
SELECT A.album_title AS "Name of Albums", COUNT(AT.track_id) AS "Number of tracks"
FROM albums AS A
INNER JOIN albums_tracks AS AT
ON A.album_id = AT.album_id
GROUP BY A.album_title;

---Query to see how many albums a particular track is included on
SELECT T.track_title AS "Track titles", COUNT(AT.album_id) AS "NUmber of Albums"
FROM tracks AS T 
INNER JOIN albums_tracks AS AT 
ON T.track_id = AT.track_id
GROUP BY t.track_title;
