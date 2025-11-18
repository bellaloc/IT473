// src/services/api.js
const INVENTORY_API = "http://localhost:3002/api/products";
const ORDER_API = "http://localhost:3004/orders";
const PAYMENT_API = "http://localhost:3005/payments";
const NOTIFICATION_API = "http://localhost:3003/notifications";
const FLEET_API = "http://localhost:3001/vehicles";

export async function getProducts() {
  const res = await fetch(INVENTORY_API);
  if (!res.ok) throw new Error("Failed to fetch products");
  return res.json();
}

export async function placeOrder(orderData) {
  const res = await fetch(ORDER_API, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(orderData),
  });
  if (!res.ok) throw new Error("Order failed");
  return res.json();
}

export async function processPayment(paymentData) {
  const res = await fetch(PAYMENT_API, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(paymentData),
  });
  if (!res.ok) throw new Error("Payment failed");
  return res.json();
}
