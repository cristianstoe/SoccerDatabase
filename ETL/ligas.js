const { PrismaClient } = require('@prisma/client');
const axios = require('axios');
// require('dotenv').config();

const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0'; 

async function fetchLeagues() {
  const options = {
    method: 'GET',
    url: 'https://v3.football.api-sports.io/leagues',
    headers: {
      'x-apisports-key': API_KEY,
    },
  };

  try {
    const response = await axios.request(options);
    return response.data.response;
  } catch (error) {
    console.error('Error fetching leagues:', error);
    return [];
  }
}
async function main() {
  const leagues = await fetchLeagues();

  for (const leagueData of leagues) {
    const { league, country } = leagueData;
    const { name, type } = league;
    const { code } = country;

    const existingLeague = await prisma.ligas.findFirst({
      where: {
        liga_nome: name,
      },
    });

    if (!existingLeague) {
      let countryData;
      if (code) {
        countryData = await prisma.paises.findFirst({
          where: {
            pais_sigla: code,
          },
        });
      } else {
        console.log(`No country code found for league: ${name}`);
      }

      if (countryData) {
        await prisma.ligas.create({
          data: {
            liga_nome: name,
            liga_tipo: type,
            pais_id: countryData.pais_id,
          },
        });
        console.log(`Inserted: ${name}`);
      } else {
        console.log(`Failed to insert league: ${name}`);
      }
    } else {
      console.log(`League ${name} already exists.`);
    }
  }
  // console.log(leagues);
  console.log('All leagues inserted successfully.');
}


main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
