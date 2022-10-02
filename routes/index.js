import express from "express";
import { getUsers, Register, Login, Logout } from "../controllers/Users.js";
import { getAllOrders, RegisterOrder, getOrdersByStatus, changeToWaiter, FinishOrder } from "../controllers/Orders.js";
import { getProducts } from "../controllers/Products.js";
import { verifyToken } from "../middleware/VerifyToken.js";
import { refreshToken } from "../controllers/RefreshToken.js";

const router = express.Router();

router.get('/users', verifyToken, getUsers);
router.post('/users', Register);
router.post('/login', Login);
router.get('/token', refreshToken);
router.delete('/logout', Logout);


//routes for user
router.get('/products', getProducts);
router.get('/orders', getOrdersByStatus);
//order routes
router.post('/create-order', RegisterOrder);
router.post('/change-status', changeToWaiter);
router.post('/finish-order', FinishOrder);
router.get('/all-orders', getAllOrders);


export default router;