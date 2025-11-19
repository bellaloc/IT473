import React from "react";

function Checkout() {
  return (
    <div style={styles.container}>
      <h2>Thank you for your order!</h2>
      <p>Your order has been successfully placed and is being processed.</p>
    </div>
  );
}

const styles = {
  container: {
    textAlign: "center",
    marginTop: "50px",
    padding: "20px",
    border: "1px solid #ccc",
    borderRadius: "8px",
    maxWidth: "500px",
    marginLeft: "auto",
    marginRight: "auto",
    boxShadow: "0 2px 5px rgba(0,0,0,0.1)"
  }
};

export default Checkout;
