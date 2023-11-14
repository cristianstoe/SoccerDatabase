const axios = require('axios');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const API_KEY = process.env.API_KEY;
const API_URL = 'https://v3.football.api-sports.io/teams?season=2022&league=71';

const obterTimesDaAPI = async () => {
  try {
    const response = await axios.get(API_URL, {
      headers: {
        'x-apisports-key': '4213bcc936eacead7ab736b4799218d0',
      },
    });
    return response.data;
  } catch (error) {
    console.error('Erro ao obter times da API:', error);
    throw error;
  }
};

const mapearTimesParaModelo = (timesDaAPI) => {
  return timesDaAPI.response.map((time) => {
    return {
      id_time: time.team.id,
      nome_time: time.team.name,
      id_estadio: time.venue.id,
      fundacao: time.team.founded,
      estadio: time.venue.name
    };
  });
};

const executarETL = async () => {
  try {
    const timesDaAPI = await obterTimesDaAPI();
    console.log(timesDaAPI)
    const timesFormatados = mapearTimesParaModelo(timesDaAPI);

    for (const timeFormatado of timesFormatados) {
      await prisma.timesSerieA2022.create({
        data: timeFormatado
      });
    }

    console.log('Times inseridos no banco de dados com sucesso!');
  } catch (error) {
    console.error('Erro ao processar os dados:', error);
  } finally {
    await prisma.$disconnect();
  }
};

executarETL();
