SELECT COUNT(h.musica_id) AS quantidade_musicas_no_historico FROM SpotifyClone.historico h
INNER JOIN SpotifyClone.usuario u ON h.usuario_id = u.usuario_id
WHERE u.nome_usuario = 'Barbara Liskov'