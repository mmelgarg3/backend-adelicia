import { Sequelize } from "sequelize";
import db from "../config/Database.js";



const { DataTypes } =  Sequelize;


const View = db.define('pedidos_vista1',{
  idPedido:{
    type: DataTypes.NUMBER
  },
  idProducto: {
    type: DataTypes.NUMBER
  },
  idUsuario: {
    type: DataTypes.NUMBER
  },
  totalPedido: {
    type: DataTypes.DECIMAL
  },
  descripcion: {
    type: DataTypes.STRING
  }

}, {
  createdAt: false,
  updatedAt: false,
  freezeTableName: false,
  primaryKey: false
});

export default View;

