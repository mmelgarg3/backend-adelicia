import OrderDetail from "../models/OrderDetailModel";



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