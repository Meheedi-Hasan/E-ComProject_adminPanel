var express = require('express');
var router = express.Router();
var db = require('../db');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Login Page' });
});

router.post('/login', function(req, res, next){
  var username = req.body.username;
  var password = req.body.password;

    if (username=='mehedi' && password == 'mypassword') {
       res.redirect('/products');
    } else { 
      console.log("Login failed");
    }

});


module.exports = router;
