SELECT m.nome_musica AS cancao, COUNT(h.data_reproducao) AS reproducoes FROM SpotifyClone.musica m
INNER JOIN SpotifyClone.historico h ON m.musica_id = h.musica_id
GROUP BY m.nome_musica
ORDER BY reproducoes DESC, m.nome_musica
LIMIT 2