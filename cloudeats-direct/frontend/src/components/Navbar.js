import React from "react";

const Navbar = ({ cartCount }) => {
  return (
    <nav style={{ padding: "1rem", background: "#ff6347", color: "white" }}>
      <h1>Cloudeats</h1>
      <div>Cart: {cartCount}</div>
    </nav>
  );
};

export default Navbar;
