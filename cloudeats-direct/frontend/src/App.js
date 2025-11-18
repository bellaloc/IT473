import React, { useState, useEffect } from "react";
import Navbar from "./components/Navbar";
import ProductList from "./components/ProductList";
import Cart from "./components/Cart";
import Checkout from "./components/Checkout";

function App() {
  const [products, setProducts] = useState([]);
  const [cart, setCart] = useState([]);
  const [checkoutComplete, setCheckoutComplete] = useState(false);

  useEffect(() => {
    fetch("http://inventory-service:3000/api/products")
      .then(res => res.json())
      .then(data => setProducts(data))
      .catch(err => console.error("Error fetching products:", err));
  }, []);

  const addToCart = (product) => {
    setCart(prev => [...prev, product]);
  };

  const removeFromCart = (productId) => {
    setCart(prev => prev.filter(item => item.id !== productId));
  };

  const handleCheckout = () => {
    fetch("http://order-service:3000/api/orders", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ items: cart }),
    })
      .then(res => res.json())
      .then(data => {
        console.log("Order placed:", data);
        setCart([]);
        setCheckoutComplete(true);
      })
      .catch(err => console.error("Checkout error:", err));
  };

  return (
    <div>
      <Navbar cartCount={cart.length} />
      {!checkoutComplete ? (
        <>
          <ProductList products={products} addToCart={addToCart} />
          <Cart cart={cart} removeFromCart={removeFromCart} handleCheckout={handleCheckout} />
        </>
      ) : (
        <Checkout />
      )}
    </div>
  );
}

export default App;
