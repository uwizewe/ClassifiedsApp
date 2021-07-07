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
    var mobile = req.query.mobile;
    var username = req.query.username;
    var name = req.query.name;
    var password = req.query.password;
    var usertype = 0; 
  
    var dateFormat = require('dateformat');
    var cdate=dateFormat(new Date(), "yyyy-mm-dd");
  
    //var password = req.query.password;
   console.log(cdate); 
  
    connection.query("SELECT * FROM user  WHERE  username='"+username+"'  or  phone='"+mobile+"'",
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



                connection.query("select max(id) maxid from user", function(err, recordsArray, fields) {
                    if (err) {
                        console.log(err)
                        console.log("note")
                    } else {

                         var id = 'BKT00'+ recordsArray[0]['maxid']
                         console.log(id); 

                        
                         
   
                         connection.query(" INSERT INTO user (regnumber, name, phone, username, password, cdate, usertype) VALUES  ('"+id+"','"+name+"',  '"+mobile+"','"+username+"','"+password+"','"+cdate+"', '"+usertype+"')",
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
 
                    }
                });

                console.log("it not working")


            }


            
        }
    });
});

module.exports = router;
