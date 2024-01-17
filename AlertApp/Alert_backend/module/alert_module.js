// const { default: mongoose } = require("mongoose");

const {Schema ,model} = require('mongoose');

const alertSchema = new Schema({
    name : {type: String , require:true,default:""},
    topic : {type :String ,require:true ,default:""},
    date : {type :String,require:true,default:""},
    message : {type:String ,require:true,default:""},
    createOn:{type:Date},
    updateOn:{type:Date},
});


alertSchema.pre('save' , function(next){
    this.createOn = new Date();
    this.updateOn = new Date();
    next();
});

const AlerModel = model('alert',alertSchema);

// const p= new AlerModel({name:"swap",topic:"to go harder and harder",date:12/12/12,message:"day to liffe it very necessary to go harder becauser it ..."});
// console.log(p.date);

module.exports=AlerModel;