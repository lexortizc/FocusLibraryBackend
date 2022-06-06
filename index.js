const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const userRoutes = require('./src/routes/users');
const bookRoutes = require('./src/routes/books');
const requestRoutes = require('./src/routes/requests');

const app = express();
app.use(cors());
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(userRoutes);
app.use(bookRoutes);
app.use(requestRoutes);
app.use((err, req, res, next) => {
    return res.status(400).json({
        message: err.message
    })
});

app.listen(process.env.PORT || 4000);
console.log('Server on port:', process.env.PORT || 4000);