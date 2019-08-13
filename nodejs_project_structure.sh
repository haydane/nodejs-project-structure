#!/bin/sh
mkdir -p config/;
mkdir -p api/swagger/;
mkdir routes;
touch config/database.js;
touch api/swagger/swagger.json;
touch routes/ex.router.js;
touch server.js;

VAR="const express = require('express'); \n
const bdps = require('body-parser'); \n
const app = express(); \n
const tempRouter = require('./routes/temp'); \n 
const swaggerUi = require('swagger-ui-express'), swaggerDoc = require('./api/swagger/swagger.json'); \n
const PORT = 3000; \n

// parse with form-data \n
app.use(bdps.urlencoded({extended: false})); \n
// parse with application/JSON \n
app.use(bdps.json());  \n

// setup swagger \n
app.use('/api-docs',swaggerUi.serve,swaggerUi.setup(swaggerDoc)); \n 
app.get('/api/v1/api-docs',(req,res) => { \n
    res.send(swaggerDoc); \n
}); \n

app.use('/api', tempRouter); \n 
 
app.listen(PORT,() => console.log(\`server.js is listening on port ${PORT}\`));"; 

echo ${VAR} > server.js; 

