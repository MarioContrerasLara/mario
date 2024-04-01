USE LemonMusic;
--Crear un fichero consultas.script.sql y resolver las siguientes consultas (copiar el enunciado de la consulta como comentario sobre la SELECT):

--Listar las pistas (tabla Track) con precio mayor o igual a 1€
SELECT * FROM Track
WHERE UnitPrice >= 1;
--Listar las pistas de más de 4 minutos de duración
SELECT * FROM Track
WHERE Milliseconds > 240000;
--Listar las pistas que tengan entre 2 y 3 minutos de duración
SELECT * FROM Track
WHERE Milliseconds BETWEEN 120000 AND 180000
--Listar las pistas que uno de sus compositores (columna Composer) sea Mercury
SELECT * FROM Track
WHERE Composer = 'Mercury'
--Calcular la media de duración de las pistas (Track) de la plataforma
SELECT AVG(Track.Milliseconds)
FROM Track
--Listar los clientes (tabla Customer) de USA, Canada y Brazil
SELECT * FROM Customer
WHERE Country = 'USA' OR Country = 'Canada' OR Country = 'Brazil'
--Listar todas las pistas del artista 'Queen' (Artist.Name = 'Queen')
SELECT Track.TrackId, Track.Name 
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId INNER JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE Artist.Name = 'Queen';

--Listar las pistas del artista 'Queen' en las que haya participado como compositor David Bowie
SELECT Track.TrackId, Track.Name 
FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId INNER JOIN Artist ON Artist.ArtistId = Album.ArtistId
WHERE Artist.Name = 'Queen' AND Track.Composer = 'David Bowie'

--Listar las pistas de la playlist 'Heavy Metal Classic'
SELECT Track.TrackId, Track.Name FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId INNER JOIN Track ON Track.TrackId = PlaylistTrack.TrackId
WHERE Playlist.Name = 'Heavy Metal Classic'

--Listar las playlist junto con el número de pistas que contienen
SELECT Playlist.PlaylistId, Playlist.Name, COUNT(PlaylistTrack.TrackId) AS 'Número de pistas'
FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
GROUP BY  Playlist.PlaylistId, Playlist.Name
ORDER BY PlaylistTrack.PlaylistId

--Listar las playlist (sin repetir ninguna) que tienen alguna canción de AC/DC
SELECT DISTINCT Playlist.Name
FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.AlbumId = Artist.ArtistId
WHERE Artist.Name = 'AC/DC'

--Listar las playlist que tienen alguna canción del artista Queen, junto con la cantidad que tienen
SELECT DISTINCT Playlist.Name, COUNT(Track.TrackId) AS Cantidad
FROM Playlist
INNER JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
INNER JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.AlbumId = Artist.ArtistId
WHERE Artist.Name = 'Queen'
GROUP BY Playlist.Name
--Listar las pistas que no están en ninguna playlist
SELECT * FROM Track
INNER JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId
WHERE PlaylistTrack.PlaylistId IS NULL

--Listar los artistas que no tienen album
SELECT Artist.ArtistId, Artist.Name 
FROM Artist
WHERE Artist.ArtistId NOT IN (
	SELECT Album.ArtistId FROM Album
)

--Listar los artistas con el número de albums que tienen
--Para saber si está bien, asegurate que algunos de los artistas de la query anterior (artistas sin album) aparecen en este listado con 0 albums
SELECT Artist.ArtistId, Artist.Name, COUNT(Album.AlbumId) AS 'Número de albumes' FROM Artist
LEFT JOIN Album ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.ArtistId, Artist.Name