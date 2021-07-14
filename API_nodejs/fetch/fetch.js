const conn = require("../config/db_connection");

// setting the connection object
connection = conn.getConnection();

// connect to database
connection.connect();

// import express
const express = require("express");

// create the router
let router = express.Router();

//get request
router.get("/" , function(req, res) {
    connection.query("select * from product limit 10", function(err, recordsArray, fields) {
        if (err) {
            console.log(err)
            console.log("Error occured while fetching the data !")
        } else {
            console.log(recordsArray)
            
            res.send(recordsArray);
        }
    });
});

module.exports = router;
