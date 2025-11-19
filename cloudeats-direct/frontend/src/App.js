// src/App.js
import { useState, useEffect } from "react";
import Navbar from "./components/Navbar";
import ProductList from "./components/ProductList";
import Cart from "./components/Cart";
import Checkout from "./components/Checkout";
import { getProducts, placeOrder } from "./services/api";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

function App() {
  const [products, setProducts] = useState([]);
  const [cart, setCart] = useState([]);
  const [checkoutComplete, setCheckoutComplete] = useState(false);

  // Fetch products on component mount
  useEffect(() => {
    getProducts()
      .then((data) => setProducts(data))
      .catch((err) => {
        console.error("Error fetching products:", err);
        toast.error("Failed to load products. Try again.");
      });
  }, []);

  // Add product to cart
  const addToCart = (product) => {
    setCart((prev) => [...prev, product]);
    toast.success(`${product.name} added to cart!`);
  };

  // Remove product from cart
  const removeFromCart = (productId) => {
    setCart((prev) => prev.filter((item) => item.id !== productId));
    toast.info("Item removed from cart");
  };

  // Checkout handler
  const handleCheckout = async () => {
    if (cart.length === 0) {
      toast.warning("Cart is empty!");
      return;
    }

    // Format items for API
    const orderData = {
      items: cart.map((item) => ({ productId: item.id, quantity: 1 })),
    };

    try {
      await placeOrder(orderData);
      toast.success("Order placed successfully!");
      setCart([]);
      setCheckoutComplete(true);
    } catch (err) {
      console.error("Checkout error:", err);
      toast.error("Error placing order. Try again.");
    }
  };

  return (
    <div>
      <Navbar cartCount={cart.length} />
      {!checkoutComplete ? (
        <>
          <ProductList products={products} addToCart={addToCart} />
          <Cart
            cart={cart}
            removeFromCart={removeFromCart}
            handleCheckout={handleCheckout}
          />
        </>
      ) : (
        <Checkout />
      )}
      <ToastContainer position="top-right" autoClose={3000} />
    </div>
  );
}

export default App;
