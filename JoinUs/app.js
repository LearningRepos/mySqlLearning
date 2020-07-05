var faker = require("faker");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'JoinUs'
});

connection.connect();
//console.log(faker.internet.email());
