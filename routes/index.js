var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET home page. */
 router.get('/', function(req, res, next) {
   res.render('index', { title: 'Login Page' });
 });

router.post('/log', function(req, res, next){
  var username = req.body.username;
  var password = req.body.password;

  if (username && password) {
		db.query('SELECT * FROM login WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				req.session.loggedin = true;
				req.session.username = username;
				res.redirect('/products');
			} else {
				res.send('Incorrect Username and/or Password!');
			}			
			res.end();
		});
	} else {
		res.send('Please enter Username and Password!');
		res.end();
	}

  // console.log(`${username}`);
  // console.log(`${password}`);
  // if((`${username}` == 'mehedi') && (`${password}`==='123')){
  //   res.redirect('/products');
  // }else{
  //   console.log("Login failed");
  // }

  
})


module.exports = router;
