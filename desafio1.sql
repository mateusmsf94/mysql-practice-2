DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT PRIMARY KEY,
        tipo VARCHAR(45) NOT NULL,
        preco DECIMAL(3, 2) NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artista(
        artista_id INT PRIMARY KEY,
        nome_artista VARCHAR(150) NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album(
        album_id INT PRIMARY KEY,
        nome_album VARCHAR(150) NOT NULL,
        ano INT NOT NULL,
        artista_id INT NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT PRIMARY KEY,
        nome_usuario VARCHAR(150) NOT NULL,
        idade INT NOT NULL,
        plano_id INT NOT NULL,
        data_assinatura DATE NOT NULL,
        FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.musica(
        musica_id INT PRIMARY KEY,
        nome_musica VARCHAR(150) NOT NULL,
        duration_seconds INT NOT NULL,
        album_id INT,
        FOREIGN KEY (album_id) REFERENCES album (album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo(
        usuario_id INT NOT NULL,
        artista_id INT NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES artista (artista_id),
        CONSTRAINT PRIMARY KEY(usuario_id, artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico(
        usuario_id INT NOT NULL,
        musica_id INT,
        data_reproducao DATETIME NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
        FOREIGN KEY (musica_id) REFERENCES musica (musica_id),
        CONSTRAINT PRIMARY KEY(usuario_id, musica_id)
    ) engine = InnoDB;

INSERT INTO
    SpotifyClone.plano (plano_id, tipo, preco)
VALUES (1, 'gratuito', 0.00), (2, 'familiar', 7.99), (3, 'universitário', 5.99), (4, 'pessoal', 6.99);

INSERT INTO
    SpotifyClone.artista (artista_id, nome_artista)
VALUES (1, 'Beyoncé'), (2, 'Queen'), (3, 'Elis Regina'), (4, 'Baco Exu do Blues'), (5, 'Blind Guardian'), (6, 'Nina Simone');

INSERT INTO
    SpotifyClone.album (
        album_id,
        nome_album,
        ano,
        artista_id
    )
VALUES (1, 'Renaissance', 2022, 1), (2, 'Jazz', 1978, 2), (3, 'Hot Space', 1982, 2), (4, 'Falso Brilhante', 1998, 3), (5, 'Vento de Maio', 2001, 3), (6, 'QVVJFA?', 2003, 4), (
        7,
        'Somewhere Far Beyond',
        2007,
        5
    ), (
        8,
        'I Put A Spell On You',
        2012,
        6
    );

INSERT INTO
    SpotifyClone.usuario (
        usuario_id,
        nome_usuario,
        idade,
        plano_id,
        data_assinatura
    )
VALUES (
        1,
        'Barbara Liskov',
        82,
        1,
        '2019-10-20'
    ), (
        2,
        'Robert Cecil Martin',
        58,
        1,
        '2017-01-06'
    ), (
        3,
        'Ada Lovelace',
        37,
        2,
        '2017-12-30'
    ), (
        4,
        'Martin Fowler',
        46,
        2,
        '2017-01-17'
    ), (
        5,
        'Sandi Metz',
        58,
        2,
        '2018-04-29'
    ), (
        6,
        'Paulo Freire',
        19,
        3,
        '2018-02-14'
    ), (
        7,
        'Bell Hooks',
        26,
        3,
        '2018-01-05'
    ), (
        8,
        'Christopher Alexander',
        85,
        4,
        '2019-06-05'
    ), (
        9,
        'Judith Butler',
        45,
        4,
        '2020-05-13'
    ), (
        10,
        'Jorge Amado',
        58,
        4,
        '2017-02-17'
    );

INSERT INTO
    SpotifyClone.musica (
        musica_id,
        nome_musica,
        duration_seconds,
        album_id
    )
VALUES (1, 'BREAK MY SOUL', 279, 1), (2, 'VIRGO’S GROOVE', 369, 1), (3, 'ALIEN SUPERSTAR', 116, 1), (4, 'Don’t Stop Me Now', 203, 2), (5, 'Under Pressure', 152, 3), (6, 'Como Nossos Pais', 105, 4), (
        7,
        'O Medo de Amar é o Medo de Ser Livre',
        207,
        5
    ), (8, 'Samba em Paris', 267, 6), (9, 'The Bard’s Song', 244, 7), (10, 'Feeling Good', 100, 8);

INSERT INTO
    SpotifyClone.historico (
        usuario_id,
        musica_id,
        data_reproducao
    )
VALUES (1, 8, '2022-02-28 10:45:55'), (1, 2, '2020-05-02 05:30:35'), (1, 10, '2020-03-06 11:22:33'), (2, 10, '2022-08-05 08:05:17'), (2, 7, '2020-01-02 07:40:33'), (3, 10, '2020-11-13 16:55:13'), (3, 2, '2020-12-05 18:38:30'), (4, 8, '2021-08-15 17:10:10'), (5, 8, '2022-01-09 01:44:33'), (5, 5, '2020-08-06 15:23:43'), (6, 7, '2017-01-24 00:31:17'), (6, 1, '2017-10-12 12:35:20'), (7, 4, '2011-12-15 22:30:49'), (8, 4, '2012-03-17 14:56:41'), (9, 9, '2022-02-24 21:14:22'), (10, 3, '2015-12-13 08:30:22');

INSERT INTO
    SpotifyClone.seguindo (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 1), (6, 6), (7, 6), (9, 3), (10, 2);