import React from "react";
import ProductCard from "./ProductCard";

function ProductList({ products, addToCart }) {
  return (
    <div style={styles.container}>
      {products.length === 0 ? (
        <p>Loading products...</p>
      ) : (
        products.map((product) => (
          <ProductCard key={product.id} product={product} addToCart={addToCart} />
        ))
      )}
    </div>
  );
}

const styles = {
  container: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "center",
    margin: "20px 0"
  }
};

export default ProductList;
