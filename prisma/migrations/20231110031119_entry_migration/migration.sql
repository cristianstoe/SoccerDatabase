-- CreateTable
CREATE TABLE "JogadoresSerieA2022" (
    "id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "nationality" TEXT NOT NULL,
    "height" DOUBLE PRECISION NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "id_time" INTEGER NOT NULL,

    CONSTRAINT "JogadoresSerieA2022_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EstatisticasJogadoresSerieA2022" (
    "id_jogador" INTEGER NOT NULL,
    "qtd_partidas_titular" INTEGER NOT NULL,
    "gols" INTEGER NOT NULL,
    "passes" INTEGER NOT NULL,
    "faltas" INTEGER NOT NULL,
    "penaltis_marcados" INTEGER NOT NULL,
    "penaltis_perdidos" INTEGER NOT NULL,
    "cartao_amarelo" INTEGER NOT NULL,
    "cartao_vermelho" INTEGER NOT NULL,

    CONSTRAINT "EstatisticasJogadoresSerieA2022_pkey" PRIMARY KEY ("id_jogador")
);

-- CreateTable
CREATE TABLE "PartidasSerieA2022" (
    "id_partida" INTEGER NOT NULL,
    "arbitro" TEXT NOT NULL,
    "estadio_id" INTEGER NOT NULL,
    "time_casa" INTEGER NOT NULL,
    "time_visitante" INTEGER NOT NULL,
    "gols_casa" INTEGER NOT NULL,
    "gols_visitante" INTEGER NOT NULL,
    "vencedor" TEXT NOT NULL,
    "qtd_cartoes" INTEGER NOT NULL,

    CONSTRAINT "PartidasSerieA2022_pkey" PRIMARY KEY ("id_partida")
);

-- CreateTable
CREATE TABLE "EstadiosBrasil" (
    "id_estadio" INTEGER NOT NULL,
    "nome_estadio" TEXT NOT NULL,
    "cidade" TEXT NOT NULL,
    "estado" TEXT NOT NULL,
    "capacidade" INTEGER NOT NULL,

    CONSTRAINT "EstadiosBrasil_pkey" PRIMARY KEY ("id_estadio")
);

-- CreateTable
CREATE TABLE "TimesSerieA2022" (
    "id_time" INTEGER NOT NULL,
    "nome_time" TEXT NOT NULL,
    "id_estadio" INTEGER NOT NULL,
    "fundacao" TIMESTAMP(3) NOT NULL,
    "estadio" INTEGER NOT NULL,

    CONSTRAINT "TimesSerieA2022_pkey" PRIMARY KEY ("id_time")
);

-- AddForeignKey
ALTER TABLE "JogadoresSerieA2022" ADD CONSTRAINT "JogadoresSerieA2022_id_time_fkey" FOREIGN KEY ("id_time") REFERENCES "TimesSerieA2022"("id_time") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EstatisticasJogadoresSerieA2022" ADD CONSTRAINT "EstatisticasJogadoresSerieA2022_id_jogador_fkey" FOREIGN KEY ("id_jogador") REFERENCES "JogadoresSerieA2022"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartidasSerieA2022" ADD CONSTRAINT "PartidasSerieA2022_estadio_id_fkey" FOREIGN KEY ("estadio_id") REFERENCES "EstadiosBrasil"("id_estadio") ON DELETE RESTRICT ON UPDATE CASCADE;
