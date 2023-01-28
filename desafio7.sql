SELECT ar.nome_artista AS artista,
	   al.nome_album AS album, 
       COUNT(s.usuario_id) AS seguidores FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al ON al.artista_id = ar.artista_id
INNER JOIN SpotifyClone.seguindo s ON s.artista_id = ar.artista_id
GROUP BY al.nome_album, ar.nome_artista
ORDER BY seguidores DESC, ar.nome_artista, al.nome_album