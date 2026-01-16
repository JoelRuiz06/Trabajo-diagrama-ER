CREATE TABLE Eventos (
    cod_evento NUMBER(15),
    fecha DATE,
    lugar VARCHAR2(10),
    num_entradas_disponibles NUMBER(4),
    CONSTRAINT PK_Eventos PRIMARY KEY (cod_evento)
);

CREATE TABLE Combates (
    cod_combate NUMBER(15),
    fecha DATE,
    tiempo_duracion NUMBER(3),
    num_KOs NUMBER(1),
    cod_evento NUMBER(15),
    CONSTRAINT PK_Combates PRIMARY KEY (cod_combate),
    CONSTRAINT FK_Combates_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento)
);

CREATE TABLE Bares (
    cod_bar NUMBER(15),
    nombre VARCHAR2(20),
    comida VARCHAR2(20),
    bebidas VARCHAR2(20),
    cod_evento NUMBER(15),
    CONSTRAINT PK_Bares PRIMARY KEY (cod_bar),
    CONSTRAINT FK_Bares_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento)
);

CREATE TABLE Animadoras (
    NIF VARCHAR2(9),
    grupo VARCHAR2(20),
    nombre VARCHAR2(20),
    CONSTRAINT PK_Animadoras PRIMARY KEY (NIF)
);

CREATE TABLE Asisten (
    cod_evento NUMBER(15),
    NIF VARCHAR2(9),
    CONSTRAINT PK_Asisten PRIMARY KEY (cod_evento, NIF),
    CONSTRAINT FK_Asisten_Eventos FOREIGN KEY (cod_evento) REFERENCES Eventos(cod_evento),
    CONSTRAINT FK_Asisten_Animadoras FOREIGN KEY (NIF) REFERENCES Animadoras(NIF)
);

CREATE TABLE Arbitros (
    id_arbitro NUMBER(15),
    num_partidos_arbitrados NUMBER(3),
    num_detenciones NUMBER(3),
    CONSTRAINT PK_Arbitros PRIMARY KEY (id_arbitro)
);

CREATE TABLE Arbitran (
    cod_combate NUMBER(15),
    id_arbitro NUMBER(15),
    CONSTRAINT PK_Arbitran PRIMARY KEY (cod_combate, id_arbitro),
    CONSTRAINT FK_Arbitran_Combates FOREIGN KEY (cod_combate) REFERENCES Combates(cod_combate),
    CONSTRAINT FK_Arbitran_Arbitros FOREIGN KEY (id_arbitro) REFERENCES Arbitros(id_arbitro)
);

CREATE TABLE Entrenadores (
    DNI VARCHAR2(9),
    num_entrenamientos NUMBER(4),
    CONSTRAINT PK_Entrenadores PRIMARY KEY (DNI)
);

CREATE TABLE Luchadores (
    cod_luchador NUMBER(15),
    anos_entrenando NUMBER(2),
    DNI_entrenador VARCHAR2(9),
    CONSTRAINT PK_Luchadores PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Luchadores_Entrenadores FOREIGN KEY (DNI_entrenador) REFERENCES Entrenadores(DNI)
);

CREATE TABLE Participan (
    cod_combate NUMBER(15),
    cod_luchador NUMBER(15),
    golpes_dados NUMBER(4),
    golpes_recibidos NUMBER(4),
    CONSTRAINT PK_Participan PRIMARY KEY (cod_combate, cod_luchador),
    CONSTRAINT FK_Participan_Combates FOREIGN KEY (cod_combate) REFERENCES Combates(cod_combate),
    CONSTRAINT FK_Participan_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE Boxeo (
    cod_luchador NUMBER(15),
    onzas NUMBER(2),
    CONSTRAINT PK_Boxeo PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Boxeo_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE JiuJitsu (
    cod_luchador NUMBER(15),
    cinturon VARCHAR2(20),
    CONSTRAINT PK_JiuJitsu PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_JiuJitsu_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE Judo (
    cod_luchador NUMBER(15),
    cinturon VARCHAR2(20),
    CONSTRAINT PK_Judo PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_Judo_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);

CREATE TABLE MuayThai (
    cod_luchador NUMBER(15),
    CONSTRAINT PK_MuayThai PRIMARY KEY (cod_luchador),
    CONSTRAINT FK_MuayThai_Luchadores FOREIGN KEY (cod_luchador) REFERENCES Luchadores(cod_luchador)
);





