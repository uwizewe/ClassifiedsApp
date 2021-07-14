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
    var p_id = req.query.p_id;
    var p_name = req.query.p_name;
    var p_cost = req.query.p_cost;


    connection.query("update product set name ='"+p_name +"',cost="+p_cost+" where id = "+ p_id,
    function(err, result) {
        if (err) {
            console.log("error while updating the data !");
        } else {
            res.send({ update:"success" });
        }
    });
});

module.exports = router;
