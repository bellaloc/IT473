import React from "react";

function Navbar({ cartCount }) {
  return (
    <nav style={styles.nav}>
      <h1 style={styles.title}>Cloudeats</h1>
      <div style={styles.cart}>
        🛒 Cart: {cartCount}
      </div>
    </nav>
  );
}

const styles = {
  nav: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "10px 20px",
    backgroundColor: "#007bff",
    color: "#fff"
  },
  title: { margin: 0 },
  cart: { fontWeight: "bold" }
};

export default Navbar;
