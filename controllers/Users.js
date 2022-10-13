import Users from "../models/UserModel.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const getUsers = async(req, res) => {
    try {
        const users = await Users.findAll({
            attributes:['id','nombre','correo']
        });
        res.json(users);
    } catch (error) {
        console.log(error);
    }
}

export const Register = async(req, res) => {
    const { name, surname,email, password,  role } = req.body;
    // const salt = await bcrypt.genSalt(10);
    // console.log("password to save:" +  password);
    // const hashPassword = await bcrypt.hash(password, salt);
    try {
        await Users.create({
            nombre: name,
            apellido: surname,
            correo: email,
            contra: password,
            idTipoUsuario: role
        });
        res.json({msg: "Register"});
    } catch (error) {
        console.log(error);
    }
}

export const Login = async(req, res) => {
    try {
	// res.json(req.body.email);
	
        const user = await Users.findAll({
            where:{
                correo: req.body.email,
            }
        });

        console.log("id: " +  user[0].idTipoUsuario + " role: " + req.body.role);
        if(user[0].idTipoUsuario != req.body.role) return res.status(400).json({msg: "This is not your role"});
        if(user[0].contra !== req.body.password) return res.status(400).json({msg: "Wrong password"});
        const userId = user[0].id;
        const name = user[0].nombre;
        const email = user[0].correo;
	res.json({userId, name, email});
    } catch (error) {
        console.log(error);
	res.json("Debes colocar tu Correo no tu usuario");
    }
}

export const Logout = async(req, res) => {
    const refreshToken = req.cookies.refreshToken;
    if(!refreshToken) return res.sendStatus(204);
    const user = await Users.findAll({
        where:{
            refresh_token: refreshToken
        }
    });
    if(!user[0]) return res.sendStatus(204);
    const userId = user[0].id;
    await Users.update({refresh_token: null},{
        where:{
            id: userId
        }
    });
    res.clearCookie('refreshToken');
    return res.sendStatus(200);
}
