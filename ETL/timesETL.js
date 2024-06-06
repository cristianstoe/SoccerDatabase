const { PrismaClient } = require('@prisma/client');
const axios = require('axios');
// require('dotenv').config();

const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0'; 


async function fetchTeams() {
  const options = {
    method: 'GET',
    url: 'https://v3.football.api-sports.io/teams',
    params: {
      country: 'USA',
    },
    headers: {
      'x-apisports-key': API_KEY,
    },
  };

  try {
    const response = await axios.request(options);
    return response.data.response;
  } catch (error) {
    console.error('Error fetching teams:', error);
    return [];
  }
}

async function main() {
  const teams = await fetchTeams();

  for (const teamData of teams) {
    const { team } = teamData;
    const { name, code, country } = team;

    if (!code) {
      console.log(`Team ${name} has null code, skipping...`);
      continue;
    }

    const existingTeam = await prisma.times.findFirst({
      where: {
        code: code,
      },
    });

    if (!existingTeam) {
      const countryData = await prisma.paises.findFirst({
        where: {
          pais_sigla: 'US',
        },
      });

      await prisma.times.create({
        data: {
          time_nome: name,
          code: code ? code : null,
          pais_id: countryData ? countryData.pais_id : null,
        },
      });
      console.log(`Inserted: ${name}`);
    } else {
      console.log(`Team ${name} already exists.`);
    }
  }

  console.log('All teams inserted successfully.');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
