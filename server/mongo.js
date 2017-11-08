const mongoose = require('mongoose');
/**
 * Set to Node.js native promises
 * Per http://mongoosejs.com/docs/promises.html
 */
mongoose.Promise = global.Promise;

const env = require('./env/' + (process.env.NODE_ENV || 'development'));
const dbSettings = {
  accountName: env.cosmos.accountName,
  key: env.cosmos.key,
  port: env.cosmos.port,
  databaseName: env.cosmos.databaseName
};

// Cosmos DB Connection String
// eslint-disable-next-line max-len
const mongoUri = `mongodb://${dbSettings.accountName}:${dbSettings.key}@${dbSettings.accountName}.documents.azure.com:${dbSettings.port}/${dbSettings.databaseName}?ssl=true`; //&replicaSet=globaldb`;

// Local MongoDB Connection String
// const mongoUri = `mongodb://localhost:27017/connect-heroes`;

function connect() {
  mongoose.set('debug', true);
  return mongoose.connect(mongoUri, { useMongoClient: true });
}

module.exports = {
  connect,
  mongoose
};
