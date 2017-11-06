const serverPort = process.env.SERVER_PORT || 3001;
const publicWeb = process.env.PUBLICWEB;

const cosmos = {
  name: process.env.COSMOSDB_NAME,
  key: process.env.COSMOSDB_KEY,
  port: process.env.COSMOSDB_PORT
};

module.exports = {
  publicWeb,
  serverPort,
  cosmos
};
