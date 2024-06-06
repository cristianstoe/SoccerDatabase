const { PrismaClient } = require('@prisma/client');
const axios = require('axios');
// require('dotenv').config();

const prisma = new PrismaClient();

const API_KEY = '4213bcc936eacead7ab736b4799218d0';
// const API_URL = 'https://v3.football.api-sports.io/players?league=71&season=2022'


async function fetchCountries() {
  const options = {
    method: 'GET',
    url: 'https://v3.football.api-sports.io/countries',
    headers: {
      'x-apisports-key': API_KEY,
    },
  };

  try {
    const response = await axios.request(options);
    return response.data.response;
  } catch (error) {
    console.error('Error fetching countries:', error);
    return [];
  }
}

async function main() {
  const countries = await fetchCountries();

  for (const country of countries) {
    const { name, code } = country;
    await prisma.paises.create({
      data: {
        pais_nome: name,
        pais_sigla: code,
      },
    });
    console.log(`Inserted: ${name} (${code})`);
  }

  console.log('All countries inserted successfully.');
}

main()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
