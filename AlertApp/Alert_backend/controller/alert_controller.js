
const AlerModel = require('../module/alert_module')
// const express=require("express");
// const bodyParser = require('body-parser');
// const app=express();
// app.use(bodyParser.json()); 
// app.use(bodyParser.urlencoded({ extended: true }));

// app.use(express.json());

let day = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

const AlertController = {
    getalertdata:async function(req,res){
        try{
            const data = await AlerModel.find().sort({createdOn:-1});
            console.log(data);
            return res.json({success:true,"data":data});
        }
        catch(e){
            return console.log(e);
        }
    },

    insertalert:async function(req,res){
        try{
            const {name,topic,data,message}=req.body;                
            const modules = new AlerModel({name,topic,data,message});
            // console.log(day[modules.date.getDay()]);
            console.log(topic)
            await modules.save();
            return res.json({success:true,data:modules});
        }
        catch(e){
            throw e;
        }
    }
}   
module.exports = AlertController
