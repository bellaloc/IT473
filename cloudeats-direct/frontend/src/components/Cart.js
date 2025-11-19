import React from "react";

function Cart({ cart, removeFromCart, handleCheckout }) {
  const total = cart.reduce((sum, item) => sum + item.price, 0);

  return (
    <div style={styles.cart}>
      <h2>Your Cart</h2>
      {cart.length === 0 ? <p>Cart is empty.</p> : null}
      <ul>
        {cart.map((item, index) => (
          <li key={index} style={styles.item}>
            {item.name} - ${item.price.toFixed(2)}
            <button onClick={() => removeFromCart(item.id)} style={styles.removeButton}>
              Remove
            </button>
          </li>
        ))}
      </ul>
      {cart.length > 0 && (
        <>
          <h3>Total: ${total.toFixed(2)}</h3>
          <button onClick={handleCheckout} style={styles.checkoutButton}>
            Checkout
          </button>
        </>
      )}
    </div>
  );
}

const styles = {
  cart: {
    border: "1px solid #ccc",
    padding: "16px",
    margin: "20px",
    borderRadius: "8px",
    maxWidth: "400px",
    marginLeft: "auto",
    marginRight: "auto"
  },
  item: {
    display: "flex",
    justifyContent: "space-between",
    marginBottom: "8px"
  },
  removeButton: {
    backgroundColor: "#dc3545",
    color: "#fff",
    border: "none",
    borderRadius: "4px",
    padding: "4px 8px",
    cursor: "pointer"
  },
  checkoutButton: {
    backgroundColor: "#28a745",
    color: "#fff",
    border: "none",
    borderRadius: "4px",
    padding: "8px 12px",
    cursor: "pointer",
    marginTop: "10px"
  }
};

export default Cart;
