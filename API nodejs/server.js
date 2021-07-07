// importing modules(commonjs)
const express = require("express");
const fetch = require("./fetch/fetch");
const bodyparser = require("body-parser");

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

// Assign port number
app.listen(8080);
console.log("server is listening at port no. 8080");
