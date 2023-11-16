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
  
  const mapearEstatisticasParaModelo = async (jogadoresDaAPI) => {
    const estatisticasFormatadas = [];
    for (const jogador of jogadoresDaAPI) {
        // Check if jogador is not null before accessing its properties
        if (jogador !== null) {
          estatisticasFormatadas.push({
            id_jogador: jogador.player.id,
            qtd_partidas_titular: jogador.statistics[0].games.appearences ?? 0,
            gols: jogador.statistics[0].goals.total ?? 0,
            passes: jogador.statistics[0].passes.total ?? 0,
            faltas: jogador.statistics[0].fouls.committed ?? 0,
            cartao_amarelo: jogador.statistics[0].cards.yellow ?? 0,
            cartao_vermelho: jogador.statistics[0].cards.red ?? 0,
            penaltis_marcados: jogador.statistics[0].penalty.scored ?? 0,
            penaltis_perdidos: jogador.statistics[0].penalty.missed ?? 0,
          });
        } else {
          console.error('jogador not found for id:', jogador_id);
        }
    }
  
    return estatisticasFormatadas;
  };
  
  const executarETLjogadores = async () => {
    try {
      const jogadoresDaAPI = await obterJogadoresDaAPI();
      const jogadoresFormatadas = await mapearEstatisticasParaModelo(jogadoresDaAPI);
  
      for (const partidaFormatada of jogadoresFormatadas) {
        await prisma.estatisticasJogadoresSerieA2022.create({
          data: partidaFormatada
        });
        console.log(partidaFormatada);
      }
  
      console.log('Estatíticas inseridas no banco de dados com sucesso!');
    } catch (error) {
      console.error('Erro ao processar os dados:', error);
    } finally {
      await prisma.$disconnect();
    }
  };
  
  executarETLjogadores();