CREATE TABLE Eventos (
    cod_evento INT(15),
    fecha DATE,
    lugar VARCHAR(100),
    num_entradas_disponibles INT(4),
    CONSTRAINT PK_Eventos PRIMARY KEY (cod_evento)
);

CREATE TABLE Combates (
    cod_combate INT(15),
    fecha DATE,
    tiempo_duracion INT(3),
    num_KOs INT(1),
    cod_evento INT(15),
    CONSTRAINT PK_Combates PRIMARY KEY (cod_combate),
    CONSTRAINT FK_Combates_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento)
);

CREATE TABLE Bares (
    cod_bar INT(15),
    nombre VARCHAR(20),
    comida VARCHAR(20),
    bebidas VARCHAR(20),
    cod_evento INT(15),
    CONSTRAINT PK_Bares PRIMARY KEY (cod_bar),
    CONSTRAINT FK_Bares_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento)
);

CREATE TABLE Animadoras (
    NIF VARCHAR(9),
    grupo VARCHAR(20),
    nombre VARCHAR(20),
    CONSTRAINT PK_Animadoras PRIMARY KEY (NIF)
);

CREATE TABLE Asisten (
    cod_evento INT(15),
    NIF VARCHAR(9),
    CONSTRAINT PK_Asisten PRIMARY KEY (cod_evento, NIF),
    CONSTRAINT FK_Asisten_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento),
    CONSTRAINT FK_Asisten_Animadoras FOREIGN KEY (NIF) REFERENCES Animadoras(NIF)
);

CREATE TABLE Arbitros (
    id_arbitro INT(15),
    num_partidos_arbitrados INT(3),
    num_detenciones INT(3),
    CONSTRAINT PK_Arbitros PRIMARY KEY (id_arbitro)
);

CREATE TABLE Arbitran (
    cod_combate INT(15),
    id_arbitro INT(15),
    CONSTRAINT PK_Arbitran PRIMARY KEY (cod_combate, id_arbitro),
    CONSTRAINT FK_Arbitran_Combates FOREIGN KEY (cod_combate) REFERENCES Combates(cod_combate),
    CONSTRAINT FK_Arbitran_Arbitros FOREIGN KEY (id_arbitro) REFERENCES Arbitros(id_arbitro)
);

CREATE TABLE Entrenadores (
    DNI VARCHAR(9),
    num_entrenamientos INT(4),
    CONSTRAINT PK_Entrenadores PRIMARY KEY (DNI)
);

CREATE TABLE Luchadores (
    cod_luchador INT(15),
    anos_entrenando INT(2),
    DNI_entrenador VARCHAR(9),
    CONSTRAINT PK_Luchadores PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Luchadores_Entrenadores FOREIGN KEY (DNI_entrenador) REFERENCES Entrenadores(DNI)
);

CREATE TABLE Participan (
    cod_combate INT(15),
    cod_luchador INT(15),
    golpes_dados INT(4),
    golpes_recibidos INT(4),
    CONSTRAINT PK_Participan PRIMARY KEY (cod_combate, cod_luchador),
    CONSTRAINT FK_Participan_Combates FOREIGN KEY (cod_combate) REFERENCES Combates(cod_combate),
    CONSTRAINT FK_Participan_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE Boxeo (
    cod_luchador INT(15),
    onzas INT(2),
    CONSTRAINT PK_Boxeo PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Boxeo_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE JiuJitsu (
    cod_luchador INT(15),
    cinturon VARCHAR(20),
    CONSTRAINT PK_JiuJitsu PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_JiuJitsu_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE Judo (
    cod_luchador INT(15),
    cinturon VARCHAR(20),
    CONSTRAINT PK_Judo PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Judo_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE MuayThai (
    cod_luchador INT(15),
    CONSTRAINT PK_MuayThai PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_MuayThai_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);







