import OrderDetail from "../models/OrderDetailModel.js";
import mysqlConnection from "../db/index.js";


export const createOrderDetail = async(orderId, productId, cant, descId)=>{
  var values = [[orderId, productId, cant, descId]];
  var sql = "insert into detallepedido(idPedido, idProducto, cantidad, idDescuento) values ?";
  mysqlConnection.query(sql, [values], (result, err)=>{
    if(err) console.log(err);
    else{
      console.log(result);
    }
  })
}


export const getView = async(req, res)=>{
  try{
    // var sql = "select * from pedidos_vista1";
    var sql = "SELECT complementodetalle.idPedido, pedido.fecha,complementodetalle.idProducto, usuario.nombre AS 'Usuario', pedido.totalPedido, producto.descripcion, usuario.id, producto.nombre FROM `complementodetalle` INNER JOIN pedido ON complementodetalle.idPedido = pedido.id INNER JOIN producto ON complementodetalle.idProducto = producto.id INNER JOIN usuario ON pedido.idUsuario = usuario.id;";
    mysqlConnection.query(sql, (err, rows, fields) =>{
      if(!err){
	console.log(rows);
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


