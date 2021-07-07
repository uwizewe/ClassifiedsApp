// import
const express = require("express");

// import connection moule
let conn = require("../config/db_connection");

// getting the connection object
let connection = conn.getConnection();

// connect to database
connection.connect();

let router = express.Router();
router.post("/", function(req, res) {
//reading the parameters from client
 
    var name = req.query.name;
    var price = req.query.price;
    var info = req.query.info;
    var exdate = req.query.exdate;
    var categorys=  req.query.categorys;
  
    var dateFormat = require('dateformat');
    var cdate=dateFormat(new Date(), "yyyy-mm-dd");
  
    //var password = req.query.password;
   console.log(cdate); 
  
    connection.query("SELECT * FROM `product` WHERE name='"+name+"' ",
        function (err, result,fields) {
        if (err) {
            
            console.log(err);
            console.log("note")
        } else {

            console.log(result.length);
          
            if(result.length>0)
            {

                console.log("dublicate")
     
                res.send("duplicate");
        

            }
            else 
            {

                         connection.query("INSERT INTO product(name, price, images,  info, exdate, categorys) VALUES ( '"+name+"',  '"+price+"', 'image.jpg',    '"+info+"',  '"+exdate+"',  '"+categorys+"')",
                         function (err, results) {
                         if (err) {
                             console.log(id);
                 
                             console.log(err);
                             console.log("note")
                         } else {
                            console.log(results);
                             console.log('sucess');
                             res.send( "success");
                         }
                     });
 
                  

                console.log("note")


            }


            
        }
    });
});

module.exports = router;
