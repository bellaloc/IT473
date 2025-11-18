import React from "react";

const Cart = ({ cart, removeFromCart, handleCheckout }) => {
  return (
    <div style={{ padding: "1rem" }}>
      <h2>Cart</h2>
      {cart.length === 0 && <p>Your cart is empty</p>}
      {cart.map(item => (
        <div key={item.id} style={{ display: "flex", justifyContent: "space-between", marginBottom: "0.5rem" }}>
          <span>{item.name} - ${item.price}</span>
          <button onClick={() => removeFromCart(item.id)}>Remove</button>
        </div>
      ))}
      {cart.length > 0 && <button onClick={handleCheckout}>Checkout</button>}
    </div>
  );
};

export default Cart;
