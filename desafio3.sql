SELECT u.nome_usuario AS usuario, COUNT(m.musica_id) AS qt_de_musicas_ouvidas, ROUND(SUM(m.duration_seconds / 60), 2) AS total_minutos FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.historico h ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.musica m ON h.musica_id = m.musica_id
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario ASC