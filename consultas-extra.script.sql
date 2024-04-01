USE LemonMusic;
--Listar las pistas ordenadas por el n�mero de veces que aparecen en playlists de forma descendente
SELECT TrackId, COUNT(PlaylistId) AS 'N�mero de veces'
FROM PlaylistTrack
GROUP BY TrackId
ORDER BY 'N�mero de veces' DESC;
--Listar las pistas m�s compradas (la tabla InvoiceLine tiene los registros de compras)
SELECT InvoiceLine.TrackId, Track.Name, COUNT(InvoiceLine.InvoiceId) AS 'N�mero de veces comprado'
FROM InvoiceLine
INNER JOIN Track ON Track.TrackId = InvoiceLine.TrackId
GROUP BY InvoiceLine.TrackId, Track.Name
ORDER BY 'N�mero de veces comprado' DESC;
--Listar los artistas m�s comprados
SELECT Artist.Name, COUNT(InvoiceLine.InvoiceId) AS 'N�mero de veces comprado' FROM InvoiceLine
INNER JOIN Track ON Track.TrackId = InvoiceLine.TrackId
INNER JOIN Album ON Album.AlbumId = Track.TrackId
INNER JOIN Artist ON Artist.ArtistId = Track.TrackId
GROUP BY Artist.Name
ORDER BY 'N�mero de veces comprado' DESC;
--Listar las pistas que a�n no han sido compradas por nadie
SELECT * FROM Track
WHERE TrackId NOT IN (SELECT TrackId FROM InvoiceLine);
--Listar los artistas que a�n no han vendido ninguna pista
SELECT *
FROM Artist
WHERE ArtistId NOT IN (SELECT ArtistId 
						FROM Album
						WHERE AlbumId IN (SELECT AlbumId 
											FROM Track
											WHERE TrackId IN (SELECT TrackId 
											FROM InvoiceLine)
											)
						);