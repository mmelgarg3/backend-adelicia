import express from "express";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import cors from "cors";
import db from "./config/Database.js";
import router from "./routes/index.js";
dotenv.config();
const app = express();

try {
    await db.authenticate();
    console.log('Database Connected...');
} catch (error) {
    console.error(error);
}

app.set('port', process.env.PORT || 5000)
app.use(cors({ credentials:true, origin:'https://adelicias-front-app.azurewebsites.net' }));
// app.use(cors({ credentials:true, origin:'http://localhost:3000'}));
// app.use(function(req, res, next) {
//   res.header("Access-Control-Allow-Origin", "*");
//   res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//   res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE");
//   next();
// });
app.use(cookieParser());
app.use(express.json());
app.use(router);

app.listen(app.get('port'), ()=> console.log('Server running'));
