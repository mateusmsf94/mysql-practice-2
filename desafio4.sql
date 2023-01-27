SELECT DISTINCT u.nome_usuario AS usuario, IF(YEAR(MAX(h.data_reproducao)) >= '2021', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario u
INNER JOIN SpotifyClone.historico h ON u.usuario_id = h.usuario_id
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario