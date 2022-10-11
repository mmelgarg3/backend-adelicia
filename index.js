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
app.use(cookieParser());
app.use(express.json());
app.use(router);

app.listen(app.get('port'), ()=> console.log('Server running'));
