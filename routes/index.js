import express from "express";
import { getUsers, Register, Login, Logout } from "../controllers/Users.js";
import { getAllOrders, 
    RegisterOrder, 
    getOrdersByStatus, 
    changeToWaiter, 
    FinishOrder,
    cancelOrder,
    CheckOrder } from "../controllers/Orders.js";
import { getView } from "../controllers/OrderDetail.js";
import { getProducts } from "../controllers/Products.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controllers/RefreshToken.js";
import { registerInvoice } from "../controllers/Invoice.js";

const router = express.Router();

router.get('/users', verifyToken, getUsers);
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);


//routes for user
router.get('/products', getProducts);
router.get('/orders', getOrdersByStatus);
router.get('/all-info', getView);
//order routes
router.post('/create-order', RegisterOrder);
router.post('/change-status', changeToWaiter);
router.post('/finish-order', FinishOrder);
router.post('/check-order', CheckOrder);
router.get('/all-orders', getAllOrders);
router.post('/create-invoice', registerInvoice);
router.post('/cancel-order', cancelOrder);
router.get('/', (req, res)=>{
  res.json('Bienvenido a la api');
});


export default router;
