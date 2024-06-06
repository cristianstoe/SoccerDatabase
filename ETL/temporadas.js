const { PrismaClient } = require('@prisma/client');
const axios = require('axios');
// require('dotenv').config();

const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0'; 

async function fetchSeasons() {
  const options = {
    method: 'GET',
    url: 'https://v3.football.api-sports.io/leagues/seasons',
    headers: {
      'x-apisports-key': API_KEY,
    },
  };

  try {
    const response = await axios.request(options);
    return response.data.response;
  } catch (error) {
    console.error('Error fetching seasons:', error);
    return [];
  }
}

async function main() {
  const seasons = await fetchSeasons();

  for (const season of seasons) {
    await prisma.temporadas.create({
      data: {
        temporada_ano: season,
      },
    });
    console.log(`Inserted: ${season}`);
  }

  console.log('All seasons inserted successfully.');
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
