var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ecommerce_product'
});

connection.connect(function(err){
    if(err) throw err;
    console.log('connected!');
})

module.exports = connection;