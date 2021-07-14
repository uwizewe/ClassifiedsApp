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
    var id = req.query.id;
    var name = req.query.name;
    var cost = req.query.cost;

    console.log(req.query);
    console.log(name);
    console.log(cost); 
    connection.query("insert into product (id, name, cost) values('"+id+"','"+name+"', '"+cost+"')",
        function (err, result) {
        if (err) {
            console.log(id);

            console.log(err);
            console.log("error while inserting the object!")
        } else {
            res.send({ insert:"success" });
        }
    });
});

module.exports = router;
