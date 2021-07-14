// importing modules(commonjs)
const express = require("express");
const fetch = require("./fetch/fetch");
const bodyparser = require("body-parser"); 
var fs = require('fs');
var multer = require('multer'); 

// create app instance
let app = express();
app.use("/fetch", fetch);

// set JSON as MIME type
app.use(bodyparser.json());

// check for form data
app.use(bodyparser.urlencoded({ extended:false }));

var insert = require("./insert/insert");
app.use("/insert",insert);

// update
let update = require("./update/update");
app.use("/update", update);

// delete
let remove = require("./delete/delete");
app.use("/delete", remove);

// delete
let register = require("./register/register");
app.use("/register", register);

let signin = require("./signin/signin");
app.use("/signin", signin);

let addproduct = require("./addproduct/addproduct");
app.use("/addproduct", addproduct);

 
app.use(express.static('public'));  
app.use('/images', express.static('images')); 


var express = require('express');
var fs = require('fs');
var multer = require('multer'); // v1.0.5

var app = express();
app.use(express.static('./public'));

var upload = multer(); // for parsing multipart/form-data

app.post('/testFormData', upload.array(), function(req, res) {
    var base64Data = req.body.testdot;
    console.log('writing file...', base64Data);
    fs.writeFile(__dirname + "/upload/out.png", base64Data, 'base64', function(err) {
        if (err) console.log(err);
        fs.readFile(__dirname + "/upload/out.png", function(err, data) {
            if (err) throw err;
            console.log('reading file...', data.toString('base64'));
            res.send(data);
        });
    });
});

 

// Assign port number
app.listen(8080);
console.log("server is listening at port no. 8080");
