var express = require('express');
var router = express.Router();
var db = require('../db');
var md5 = require('md5');

/* GET home page. */
 router.get('/', function(req, res, next) {
   res.render('index', { title: 'Login Page' });
 });

router.post('/log', function(req, res, next){
  var email = req.body.email;
  var password = md5(req.body.password);
  //var password = md5(n_password);

//   console.log('Normal password : ', n_password)
//   console.log('Hashed password : ', password)

  if (email && password) {
		db.query('SELECT * FROM login WHERE email = ? AND password = ?', [email, password], function(error, results, fields) {
			if (results.length > 0) {
				req.session.loggedin = true;
				req.session.email = email;
				res.redirect('/products');
			} else {
				res.send('Incorrect email and/or Password!');
			}			
			res.end();
		});
	} else {
		res.send('Please enter email and Password!');
		res.end();
	}

})


module.exports = router;
