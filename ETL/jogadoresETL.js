const axios = require('axios');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0'; // Substitua com sua chave de API
const API_URL = 'https://v3.football.api-sports.io/players?league=71&season=2022'
  
  const obterJogadoresDaAPI = async () => {
    try {
      const response = await axios.get(API_URL, {
        headers: {
          'x-apisports-key': API_KEY,
        },
      });
      return response.data.response;
    } catch (error) {
      console.error('Erro ao obter jogadores da API:', error);
      throw error;
    }
  };
  
  const mapearjogadoresParaModelo = async (jogadoresDaAPI) => {
    const jogadoresFormatadas = [];
    for (const jogador of jogadoresDaAPI) {
        // Check if jogador is not null before accessing its properties
        if (jogador !== null) {
            let height = jogador.player.height ? Number(jogador.player.height.split(' ')[0]) : 0;
            let weight = jogador.player.weight ? Number(jogador.player.weight.split(' ')[0]) : 0;
            
            jogadoresFormatadas.push({
              id: jogador.player.id,
              first_name: jogador.player.firstname,
              last_name: jogador.player.lastname,
              age: jogador.player.age,
              nationality: jogador.player.nationality,
              height,
              weight,
              id_time: jogador.statistics[0].team.id,
            });
        } else {
          console.error('jogador not found for id:', jogador_id);
        }
    }
  
    return jogadoresFormatadas;
  };
  
  const executarETLjogadores = async () => {
    try {
      const jogadoresDaAPI = await obterJogadoresDaAPI();
      const jogadoresFormatadas = await mapearjogadoresParaModelo(jogadoresDaAPI);
  
      for (const partidaFormatada of jogadoresFormatadas) {
        await prisma.jogadoresSerieA2022.create({
          data: partidaFormatada
        });
        console.log(partidaFormatada);
      }
  
      console.log('jogadores inseridas no banco de dados com sucesso!');
    } catch (error) {
      console.error('Erro ao processar os dados:', error);
    } finally {
      await prisma.$disconnect();
    }
  };
  
  executarETLjogadores();