const mongoose = require("mongoose");
// const db = require("../config/db");
const bcrypt = require("bcrypt");
const { Schema,model } = mongoose;

const userSchema = new Schema({
  email: {
    type: String,
    lowercase: true,
    required:true,
    unique:true
  },
  password: {
    type: String,
    require: true,
  },
});


userSchema.pre("save",async function(){
    
    // if(!user.isModified("password")){
    //     return
    // }
    try{
        var user = this;
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(user.password,salt);
        user.password = hash;
    }catch(err){
        throw err;
    }
});

userSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        console.log('----------------no password',this.password);
        // @ts-ignore
        console.log(this.password)
        console.log(candidatePassword)
        const isMatch = await bcrypt.compare(candidatePassword, this.password);
        console.log(isMatch)
        return isMatch;
    } catch (error) {
        throw error;
        
    }
};

const UserModel = model("user", userSchema);

module.exports = UserModel;
  



