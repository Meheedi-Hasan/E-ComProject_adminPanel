var express = require('express');
var router = express.Router();
var db = require('../db');
var alert = require('alert');

/* get method for fetch all products.*/

router.get('/', function(req, res, next) {
    var sql = `SELECT product_info.id,products.product_name,product_info.website_name,
    product_info.price,product_info.review,product_info.rating,
    product_info.Product_url,product_info.product_image_url 
    FROM product_info
    JOIN products ON products.product_id =product_info.product_id`;

    db.query(sql, function(err, rows, fields){
        if(err) throw err;

        res.render('products', { title: 'Products',products: rows });
    })

});

router.get('/create-form', function(req, res, next){
    res.render('createform',{title: 'Create Product'});
})

  /*post method for create product*/
router.post('/create', function(req, res, next){
    var product_name = req.body.product_name;
    var price = req.body.price;
    var website_name = req.body.website_name;
    var review = req.body.review;
    var rating = req.body.rating;
    var Product_url = req.body.Product_url;
    var product_image_url = req.body.product_image_url;

    var sql_1 = `SELECT product_id from products where product_name=${product_name}`;

    var sql =  `INSERT INTO product_info (website_name, product_id, price, review, rating, Product_url,product_image_url ) VALUES ("${website_name}", "${sql_1}", "${price}","${review}","${rating}","${Product_url}","${product_image_url}")`;

    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products')
        //alert("Created successfully!");

    })
})

router.get('/edit-form/:id', function(req, res, next){
    var id = req.params.id;
    var sql = `SELECT product_info.id,product_info.website_name,
    product_info.price,product_info.review,product_info.rating,
    product_info.Product_url,product_info.product_image_url 
   FROM product_info
    JOIN products ON products.product_id =product_info.product_id where id=${id}`;
    db.query(sql, function(err, rows, fields){
        res.render('editform',{title: 'Update Product', product: rows[0]});
    })
    
})

router.post('/edit/:id', function(req, res, next){
    //var product_name = req.body.product_name;
    var price = req.body.price;
    var website_name = req.body.website_name;
    var review = req.body.review;
    var rating = req.body.rating;
    var Product_url = req.body.Product_url;
    var product_image_url = req.body.product_image_url;

    var id = req.params.id;

    var sql =  `UPDATE product_info SET  price="${price}", website_name="${website_name}",review="${review}", rating="${rating}" , Product_url="${Product_url}" , product_image_url="${product_image_url}" WHERE id=${id}`;
    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products');
        //alert("Updated successfully!");

    })
})

router.get('/delete/:id', function(req,res,next){
    var id = req.params.id;
    var sql=`DELETE FROM product_info WHERE id=${id}`;
    db.query(sql, function(err, result){
        if(err) throw err;
        res.redirect('/products');

    })
})


module.exports = router;