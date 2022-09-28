import { Sequelize } from "sequelize";
import db from "../config/Database.js";


const { DataTypes } = Sequelize;


const Order = db.define('pedido', {
    id: {
        type: DataTypes.NUMBER,
        primaryKey: true
    },
    fecha: {
        type: DataTypes.DATE
    },
    idUsuario: {
        type: DataTypes.NUMBER
    },
    estado: {
        type: DataTypes.NUMBER
    },
    totalPedido: {
        type: DataTypes.DECIMAL
    }
},
{
    createdAt: false,
    updatedAt: false,
    freezeTableName: true
});

export default Order;



