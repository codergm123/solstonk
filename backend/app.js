var express = require('express');
var app = express();
var multer = require('multer')

const dotenv = require('dotenv');
dotenv.config();
var port = process.env.PORT;
var path = require('path');
var fs = require('fs')
var flash = require('connect-flash');
var morgan = require('morgan');
var cookieParser = require('cookie-parser');
global.moment = require('moment');

var session = require('express-session');
var cookieSession = require('cookie-session');
var bodyParser = require('body-parser');
var fileUpload = require('express-fileupload');
const expressValidator = require('express-validator');
const cors = require("cors");

console.log('----- GAME STARTED ----');

var nunjucks  = require('nunjucks');
global.now = new Date();

//for live/production
var httpsOptions = {
  key: fs.readFileSync('config/solstonks.io.key'),
  cert: fs.readFileSync('config/solstonks.io.pem')
};
var server = require('http').createServer(httpsOptions,app);

//for local
// var server = require('http').createServer(app);

io = require('socket.io')(server, {
  cors: {
    origin: "*"
  }
})

let config = require('./config/constants.js');
var Sequelize = require('sequelize');
global.Sequelize = Sequelize;
var sequelizeDB = require('./config/database.js')(Sequelize);
global.sequelize1 = sequelizeDB;
require('./config/logconfig.js');

app.use(expressValidator());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(cookieParser());
app.use(cors());
const chokidar = require('chokidar');

//view engine setup
app.use(express.static(path.join(__dirname, 'public')));
nunjucks.configure('app/views', {
  autoescape: true,
  express   : app,
  watch: true
});
app.set('view engine','html');

//set in headers in every request
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.use(cookieSession({
  name: 'session',
  keys: ["roulettecookie"],
  maxAge: 24 * 60 * 60 * 1000 
}));

app.use(flash());
app.use(fileUpload());

//Start: Load model, controller, helper, and route
var model = require('./app/models/mysql/index')(Sequelize, sequelizeDB);
var controllers = require('./app/controllers/index')(model);
require('./routes/index.js')(app, model, controllers);
global.helper = require('./app/helpers/helpers');
//End: Load model, controller, helper, and route

var socket_count=0;
io.on('connection', function (client) {
  socket_count++;
  console.log("Socket connection established, Total connect user - ",socket_count);
  io.emit('count',socket_count);
  require('./socket/index')(model, io, client);
  client.on('disconnect', function () { 
    socket_count--;
    io.emit('count',socket_count);
    console.log("Socket disconnected, Total connect user -",socket_count); 
  });
});

app.set('port', port);
server.listen(port, function(){
  console.log("(----------------------------------------)");  
  console.log("|     Solstonks Server Started at...     |");
  console.log("|         "+config.baseUrl+"         |");
  console.log("(----------------------------------------)");
});
require('./config/error.js')(app);
module.exports = {app:app, server:server}
