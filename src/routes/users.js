const { Router } = require('express');
const { login, signup } = require('../controllers/users');
const { validateToken } = require('../helpers/jwt');

const router = Router();

router.get('/', res.status(200).json({ message: "Hello World!"}));
router.post('/users/login', login);
router.post('/users/signup', validateToken, signup);

module.exports = router;