import OrderDetail from "../models/OrderDetailModel.js";
import View from "../models/view_model.js";



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
    const data = await View.findAll({
      attributes: [idPedido, idProducto, idUsuario, totalPedido, descripcion]
    })
    res.json(data);
  }catch(err){
    console.log(err);
  }
}


