import React from "react";

const ProductList = ({ products, addToCart }) => {
  return (
    <div style={{ display: "flex", flexWrap: "wrap", gap: "1rem", padding: "1rem" }}>
      {products.map(product => (
        <div key={product.id} style={{ border: "1px solid #ccc", padding: "1rem", width: "200px" }}>
          <h3>{product.name}</h3>
          <p>${product.price}</p>
          <button onClick={() => addToCart(product)}>Add to Cart</button>
        </div>
      ))}
    </div>
  );
};

export default ProductList;
