SELECT 
    nome_musica,
    CASE
        WHEN nome_musica LIKE '%bard%' THEN REPLACE(nome_musica, 'Bard', 'QA')
        WHEN nome_musica LIKE '%pais%' THEN REPLACE(nome_musica, 'Pais', 'Pull Requests')
        WHEN nome_musica LIKE '%amar%' THEN REPLACE(nome_musica, 'Amar', 'Code Review')
        WHEN nome_musica LIKE '%superstar%' THEN REPLACE(nome_musica, 'SUPERSTAR', 'SUPERDEV')
        WHEN nome_musica LIKE '%soul%' THEN REPLACE(nome_musica, 'SOUL', 'CODE')        
    END AS novo_nome
FROM
    SpotifyClone.musica
WHERE 
	nome_musica LIKE '%Bard%'
    OR nome_musica LIKE '%Pais%'
    OR nome_musica LIKE '%Amar%'
    OR nome_musica LIKE '%SUPERSTAR%'
    OR nome_musica LIKE '%SOUL%'
ORDER BY nome_musica DESC