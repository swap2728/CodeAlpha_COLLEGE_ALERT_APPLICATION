const alert_route = require('express').Router();
const controller = require('../controller/alert_controller');
alert_route.get('/findalert',controller.getalertdata)
alert_route.post('/insertalert', controller.insertalert)
module.exports=alert_route;