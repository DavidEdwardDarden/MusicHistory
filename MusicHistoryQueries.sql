--#1
--Query all of the entries in the Genre table
--SELECT * FROM Genre;

--#2
--Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
--SELECT * FROM Artist ORDER BY ArtistName;

--#3
--Write a SELECT query that lists all the songs in the Song table and include the Artist name
--SELECT 
--s.Title,
--a.ArtistName
--FROM Song s
--LEFT JOIN Artist a on s.ArtistId = a.id;

--#4
--Write a SELECT query that lists all the Artists that have a Pop Album
--SELECT
--ArtistName
--FROM Artist 
--JOIN Album on Album.ArtistId = Artist.Id
--JOIN GENRE on Genre.Id = Album.GenreId
--WHERE Genre.Id = 7; 

--#5
--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
--SELECT
--ArtistName
--FROM Artist 
--JOIN Album on Album.ArtistId = Artist.Id
--JOIN GENRE on Genre.Id = Album.GenreId
--WHERE Genre.Id = 4 OR Genre.Id = 2; 

--#6
--Write a SELECT statement that lists the Albums with no songs
--SELECT
--Album.Title
--FROM Album
--Left JOIN Song  on Song.AlbumId = Album.Id
--WHERE Song.Id IS NULL;

--#7
--Using the INSERT statement, add one of your favorite artists to the Artist table.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Chris Stapleton', 2015);
--SELECT * FROM Artist ORDER BY ArtistName;

--#8
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Traveller', DATE'05/05/2015', 6329,'Universal Music Group Nashville' , 29, 11);
--SELECT * FROM Album;


--#9
--Using the INSERT statement, add some songs that are on that album to the Song table.
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Trveller', 343, DATE'05/05/2015', 11, 29, 24);
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Tennessee Whiskey', 453, DATE'05/05/2015', 11, 29, 24);
--SELECT * FROM Song;


--#10
--Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--NOTE: Direction of join matters. Try the following statements and see the difference in results.
--EXAMPLE: SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--EXAMPLE: SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;
--SELECT
--s.Title,
--al.Title as AlbumTitle,
--ar.ArtistName
--From
--Song s
--JOIN Album al on al.Id = s.AlbumId
--Join Artist ar on ar.Id = al.ArtistId
--WHERE
--ar.Id = 29;


--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--select
--	Count(Song.Title), 
--	album.Title
--from Album
--	left join Song
--	on Song.AlbumId = Album.Id
--group by Album.Title
--order by 1 desc;

----12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--select
--	Count(Song.Title), 
--	Artist.ArtistName
--from Artist
--	left join Song
--	on Song.ArtistId = Artist.Id
--group by Artist.ArtistName
--order by 1 desc;

----13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
--select
--	COUNT(Song.Title), 
--	Genre.Name
--from Genre
--	left join Song
--	on Song.GenreId = Genre.Id
--group by Genre.Name
--order by 1 desc;

----14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
--select
--	COUNT(Album.Label), 
--	Artist.ArtistName
--	from Album
--	left join Artist
--	on album.ArtistId = Artist.Id
--	group by Artist.ArtistName
--	having count (album.label) > 1;

----15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
--select album.Title,
--		album.AlbumLength
--from Album
--where album.AlbumLength in
--	(select max(albumlength)
--	from Album);

----16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
--select 
--	song.Title,
--	song.SongLength
--from Song
--where song.SongLength in
--	(select MAX(songlength)
--	from Song);

----17. Modify the previous query to also display the title of the album.
--select
--	song.Title,
--	song.SongLength,
--	Album.Title
--from Song
--	left join Album
--	on song.AlbumId = Album.Id
--where song.SongLength in 
--	(select MAX(songlength)
--	from Song);