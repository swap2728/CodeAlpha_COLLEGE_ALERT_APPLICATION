const express = require('express');
const Alert = require('./Routes/alert_routes');
const User = require('./Routes/user_routes');
const Host =require('./Routes/host_routes')
// const xxx = require('./module/alert_module')
const cors = require('cors')
const helmet = require('helmet')
const morgan = require('morgan')
const app = express();
const port = 5000;
app.listen(port,()=>{ console.log("connected to port 5000")});


const mongoos = require("mongoose");
mongoos.connect('mongodb://127.0.0.1:27017/alertdb')


const bodyParse = require('body-parser')
app.use(bodyParse.json());   
app.use(helmet());
app.use(cors());
app.use(morgan('dev'));
app.use(bodyParse.urlencoded({extended:false})); 
app.get('/', (req,res)=> { res.send("hello world")});
app.use('/api',User);
app.use('/api',Host)
app.use('/',Alert);

module.exports=app



