SELECT ar.nome_artista AS artista, al.nome_album AS album FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al ON ar.artista_id = al.artista_id
WHERE ar.nome_artista = 'Elis Regina'
ORDER BY al.nome_album