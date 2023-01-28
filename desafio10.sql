SELECT m.nome_musica AS nome, COUNT(h.usuario_id) AS reproducoes FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.musica m  ON m.musica_id = h.musica_id
INNER JOIN SpotifyClone.usuario u ON u.usuario_id = h.usuario_id
INNER JOIN SpotifyClone.plano p ON u.plano_id = p.plano_id
WHERE p.tipo = 'gratuito' OR p.tipo = 'pessoal'
GROUP BY m.nome_musica
ORDER BY m.nome_musica