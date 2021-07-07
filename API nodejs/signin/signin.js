// import module
const express = require("express");
 

// import connection 
let conn = require("../config/db_connection");

// getting the connection object
let connection = conn.getConnection();

// connect to database
connection.connect();

// create the module(Router)
let router = express.Router();
router.post("/", function(req, res) {
// reading the parameters from client
    var username = req.query.username;
    var password = req.query.password;

    console.log(username); 
    console.log(password);

    connection.query("SELECT * FROM `user` WHERE   username='"+username+"' and password='"+password+"'",
    function(err, result) {
        if (err) {
            console.log("note");
        } else {
            console.log(result.length);
            if(result.length>0)
            {
                console.log(result)                 
                res.send({ message:"success",result});
            }
            else {

                res.send({ message:"note" });
            }
          
        }
    });
});

module.exports = router;
