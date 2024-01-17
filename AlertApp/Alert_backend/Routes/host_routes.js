const HostRoute = require('express').Router()
const HostController = require('..//controller/Host_controller')
HostRoute.post('/Host',HostController.loginAsHost)
module.exports = HostRoute