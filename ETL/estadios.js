const axios = require('axios');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const API_KEY = 'SUA_CHAVE_DE_API'; // Substitua com sua chave de API
const API_URL = 'https://v3.football.api-sports.io/venues?country=brazil';

const obterEstadiosDaAPI = async () => {
  try {
    const response = await axios.get(API_URL, {
      headers: {
        'x-apisports-key': '4213bcc936eacead7ab736b4799218d0',
      },
    });
    return response.data.response;
  } catch (error) {
    console.error('Erro ao obter estádios da API:', error);
    throw error;
  }
};

const mapearEstadiosParaModelo = (estadiosDaAPI) => {
  return estadiosDaAPI.map((estadio) => {
    const cityParts = estadio.city ? estadio.city.split(',') : [];
    const cidade = cityParts.length > 0 ? cityParts[0].trim() : '';
    const estado = cityParts.length > 1 ? cityParts[1].trim() : '';

    return {
      id_estadio: estadio.id,
      nome_estadio: estadio.name,
      cidade: cidade,
      estado: estado, 
      capacidade: estadio.capacity,
    };
  });
};

const executarETLEstadios = async () => {
  try {
    const estadiosDaAPI = await obterEstadiosDaAPI();
    const estadiosFormatados = mapearEstadiosParaModelo(estadiosDaAPI);

    for (const estadioFormatado of estadiosFormatados) {
      await prisma.estadiosBrasil.create({
        data: estadioFormatado
      });
    }

    console.log('Estádios inseridos no banco de dados com sucesso!');
  } catch (error) {
    console.error('Erro ao processar os dados:', error);
  } finally {
    await prisma.$disconnect();
  }
};

executarETLEstadios();
