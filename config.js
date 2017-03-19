// RethinkDB settings
exports.host = '${RETHINKDB_HOST}';    // RethinkDB host
exports.port = ${RETHINKDB_PORT};          // RethinkDB driver port
exports.authKey = '${RETHINKDB_AUTH_KEY}';          // Authentification key (leave an empty string if you did not set one)

// Express settings
exports.expressPort = 3000;    // Port used by express
exports.debug = true;          // Debug mode
exports.network = '0.0.0.0'  // Network the node app will run on
