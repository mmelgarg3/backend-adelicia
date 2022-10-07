import OrderDetail from "../models/OrderDetailModel.js";
import mysqlConnection from "../db/index.js";


export const createOrderDetail = async(orderId, productId, cant, descId)=>{
    try{
        await OrderDetail.create({
            idPedido: orderId,
            idProducto: productId,
            cantidad: cant,
            idDescuento: descId
        });
    }catch(err){
        console.log(err);
    }
}


export const getView = async(req, res)=>{
  try{
    var sql = "select * from pedidos_vista1";
    mysqlConnection.query(sql, (err, rows, fields) =>{
      if(!err){
	res.json(rows);
      }
      else{
	console.log(err);
      }
    })

  }catch(err){
    console.log(err);
  }
}


