var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('respond with a resource');
});

module.exports = router;

/*
router.post('/regi', function(req, res, next){
  var username = req.body.username;
  var email = req.body.email;
  var password = req.body.password;

    console.log(`${username}`);

//   var sql = `INSERT INTO login (username, email, password) VALUES ("${username}", "${email}", "${password}")`;  
  
//   db.query(sql, function(err, result){
//       if(err) throw err;
//       res.redirect('/index');

//   })
// })
*/