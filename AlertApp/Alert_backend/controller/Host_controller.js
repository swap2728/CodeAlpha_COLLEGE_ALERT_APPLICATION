const jwt = require('jsonwebtoken')
const HostController = {
    loginAsHost:async function(req,res){
        try{
            // const data = req.data
            
        const { email, password } = req.body;
        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }

        // let user = await UserModel.findOne({email});

        if (email!='adsulswapnil27@gmail.com') {
            throw new Error('User does not exist');
        }
        // console.log(email)
        // console.log(password)
        // const isPasswordCorrect = await user.comparePassword(password);
        //   console.log(isPasswordCorrect)
        if (password!='123') {
            throw new Error(`Username or Password does not match`);
        }

        // Creating Token

        let tokenData;
        tokenData = { _id: '123', email: email };
        console.log(tokenData);
        const token = jwt.sign(tokenData, "secret", { expiresIn: '1h'});
        res.status(200).json({ status: true, success: "sendData", token: token ,pre:true});
            // console.log(data)
            // res.send("hello");
        }
        catch(e){
            throw e;
        }
    }
}
module.exports = HostController