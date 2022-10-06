import { Sequelize } from "sequelize";
import db from "../config/Database.js";



const { DataTypes } = Sequelize;


const OrderDetail = db.define('detallepedido', {
    idDetallePedido: {
        type: DataTypes.NUMBER,
        primaryKey: true
    },
    idPedido: {
        type: DataTypes.NUMBER,
    },
    idProducto: {
        type: DataTypes.NUMBER
    },
    cantidad: {
        type: DataTypes.NUMBER
    },
    idDescuento: {
        type: DataTypes.NUMBER
    }
},{
    createdAt: false,
    updatedAt: false,
    freezeTableName: true
});

export default OrderDetail;