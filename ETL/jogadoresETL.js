const axios = require('axios');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();
const API_KEY = '4213bcc936eacead7ab736b4799218d0';

async function fetchAndSavePlayers(season, leagueId) {
    try {
        const response = await axios.get('https://v3.football.api-sports.io/players', {
            params: {
                season: season,
                league: leagueId
            },
            headers: {
                'x-apisports-key': API_KEY
            }
        });

        const playersData = response.data.response;

        for (const playerData of playersData) {
            const player = playerData.player;
            const statistics = playerData.statistics[0];

            let countryId;
            const countryResponse = await prisma.paises.findFirst({
                where: {
                    pais_nome: player.birth.country
                }
            });
            if (countryResponse) {
                countryId = countryResponse.pais_id;
            } else {
                console.error(`País não encontrado: ${player.birth.country}`);
                continue; 
            }

            let cityId;
            const cityResponse = await prisma.cidades.findFirst({
                where: {
                    cidade_nome: player.birth.place
                }
            });
            if (cityResponse) {
                cityId = cityResponse.cidade_id;
            } else {
                console.error(`Cidade não encontrada: ${player.birth.place}`);
                continue; 
            }

            const seasonId = parseInt(season);

            const leagueIdFromAPI = statistics.league.id;

            const teamIdFromAPI = statistics.team.id;

            let jogadorNascimento;
            const jogadorNascimentoResponse = await prisma.jogadores_nascimentos.findFirst({
                where: {
                    jogador_nascimento_data: new Date(player.birth.date),
                    pais_id: countryId,
                    cidade_id: cityId
                }
            });
            if (jogadorNascimentoResponse) {
                jogadorNascimento = {
                    connect: { jogador_nascimento_id: jogadorNascimentoResponse.jogador_nascimento_id }
                };
            } else {
                console.error(`Registro de nascimento não encontrado para jogador: ${player.name}`);
                continue; 
            }

            const createdPlayer = await prisma.jogadores.create({
                data: {
                    jogador_primeiro_nome: player.firstname,
                    jogador_segundo_nome: player.lastname,
                    jogador_idade: player.age.toString(),
                    jogadores_nascimentos: jogadorNascimento,
                    ligas_x_times_x_temporadas_x_jogadores: {
                        create: {
                            ligas: {
                                connect: { liga_id: leagueIdFromAPI }
                            },
                            times: {
                                connect: { time_id: teamIdFromAPI }
                            },
                            temporadas: {
                                connect: { temporada_id: seasonId }
                            }
                        }
                    }
                }
            });

            console.log('Player saved:', createdPlayer);
        }
    } catch (error) {
        console.error('Error fetching or saving players:', error);
    } finally {
        await prisma.$disconnect();
    }
}

fetchAndSavePlayers('2020', 71);

