const axios = require('axios');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0'; // Substitua com sua chave de API
const API_URL = 'https://v3.football.api-sports.io/fixtures?season=2022&league=71';

const obterEstadioPorId = async (estadioId) => {
  const estadio = await prisma.estadiosBrasil.findUnique({
    where: {
      id_estadio: estadioId
    },
    select: {
      id_estadio: true
    }
  });
  console.log(estadio);
  return estadio;
};

const obterPartidasDaAPI = async () => {
  try {
    const response = await axios.get(API_URL, {
      headers: {
        'x-apisports-key': API_KEY,
      },
    });
    return response.data.response;
  } catch (error) {
    console.error('Erro ao obter partidas da API:', error);
    throw error;
  }
};

const mapearPartidasParaModelo = async (partidasDaAPI) => {
  const partidasFormatadas = [];
  for (const partida of partidasDaAPI) {
    const gols_casa = partida.goals.home || 0;
    const gols_visitante = partida.goals.away || 0;
    const gols_total = gols_casa + gols_visitante;
  
    const estadio_id = partida.fixture.venue.id;
  
    // Check if estadio_id is not null or undefined
    let estadio = null;
    if (estadio_id !== null && estadio_id !== undefined) {
      estadio = await obterEstadioPorId(estadio_id);
  
      // Check if estadio is not null before accessing its properties
      if (estadio !== null) {
        partidasFormatadas.push({
          id_partida: partida.fixture.id,
          arbitro: partida.fixture.referee,
          estadio: { connect: { id_estadio: estadio.id_estadio } },
          time_casa: partida.teams.home.id,
          time_visitante: partida.teams.away.id,
          gols_casa,
          gols_visitante,
          gols_total,
          vencedor: partida.teams.home.winner ? partida.teams.home.id : partida.teams.away.winner ? partida.teams.away.id : 'empate',
        });
      } else {
        console.error('Estadio not found for id:', estadio_id);
      }
    } else {
      console.error('Estadio id is null or undefined');
    }
  }

  return partidasFormatadas;
};

const executarETLPartidas = async () => {
  try {
    const partidasDaAPI = await obterPartidasDaAPI();
    const partidasFormatadas = await mapearPartidasParaModelo(partidasDaAPI);

    for (const partidaFormatada of partidasFormatadas) {
      await prisma.partidasSerieA2022.create({
        data: partidaFormatada
      });
      console.log(partidaFormatada);
    }

    console.log('Partidas inseridas no banco de dados com sucesso!');
  } catch (error) {
    console.error('Erro ao processar os dados:', error);
  } finally {
    await prisma.$disconnect();
  }
};

executarETLPartidas();
