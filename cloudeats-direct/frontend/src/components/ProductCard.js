import React from "react";

function ProductCard({ product, addToCart }) {
  return (
    <div style={styles.card}>
      <img src={product.image || "https://via.placeholder.com/150"} alt={product.name} style={styles.image} />
      <h3>{product.name}</h3>
      <p>${product.price.toFixed(2)}</p>
      <button onClick={() => addToCart(product)} style={styles.button}>
        Add to Cart
      </button>
    </div>
  );
}

const styles = {
  card: {
    border: "1px solid #ccc",
    borderRadius: "8px",
    padding: "16px",
    margin: "8px",
    width: "200px",
    textAlign: "center",
    boxShadow: "0 2px 5px rgba(0,0,0,0.1)"
  },
  image: { width: "100%", height: "150px", objectFit: "cover", marginBottom: "8px" },
  button: {
    padding: "8px 12px",
    backgroundColor: "#007bff",
    color: "#fff",
    border: "none",
    borderRadius: "4px",
    cursor: "pointer"
  }
};

export default ProductCard;
