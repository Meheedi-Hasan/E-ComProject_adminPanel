var express = require('express');
var router = express.Router();
var db = require('../db');
//var bodyParser = require('body-parser');

//router.use(bodyParser.urlencoded({extended: true})); 

router.get('/', function(req, res, next) {
    var sql = `SELECT product_info.id,products.product_name,product_info.website_name,
    product_info.price,product_info.review,product_info.rating,
    product_info.Product_url,product_info.product_image_url 
   FROM product_info
    JOIN products ON products.product_id =product_info.product_id`;

    db.query(sql, function(err, rows, fields){
        if(err) throw err;
        //res.json(rows);

        res.render('products', { title: 'Products',products: rows });
    })

});

router.get('/create-form', function(req, res, next){
    res.render('createform',{title: 'Create Product'});
})

router.post('/create', function(req, res, next){
    var product_name = req.body.product_name;
    var price = req.body.price;
    var website_name = req.body.website_name;
    var review = req.body.review;
    var rating = req.body.rating;
    var Product_url = req.body.Product_url;
    var product_image_url = req.body.product_image_url;

    var sql =  `INSERT INTO products (product_name, website_name, price, review, rating, Product_url,product_image_url ) VALUES ("${product_name}", "${sku}", "${price}", 1, NOW())`;
    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products');

    })
})

router.get('/edit-form/:id', function(req, res, next){
    var id = req.params.id;
    var sql = `SELECT product_info.id,products.product_name,product_info.website_name,
    product_info.price,product_info.review,product_info.rating,
    product_info.Product_url,product_info.product_image_url 
   FROM product_info
    JOIN products ON products.product_id =product_info.product_id where id=${id}`;
    db.query(sql, function(err, rows, fields){
        res.render('editform',{title: 'Update Product', product: rows[0]});
    })
    
})

router.post('/edit/:id', function(req, res, next){
    var product_name = req.body.product_name;
    var price = req.body.price;
    var website_name = req.body.website_name;
    var review = req.body.review;
    var rating = req.body.rating;
    var Product_url = req.body.Product_url;
    var product_image_url = req.body.product_image_url;

    var id = req.params.id;

    var sql =  `UPDATE products SET product_name="${product_name}", sku="${sku}", price="${price}" WHERE id=${id}`;
    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products');

    })
})

router.get('/delete/:id', function(req,res,next){
    var id = req.params.id;
    var sql=`DELETE FROM product_info
    JOIN products ON products.product_id =product_info.product_id WHERE id=${id}`;
    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products');

    })
})


module.exports = router;
