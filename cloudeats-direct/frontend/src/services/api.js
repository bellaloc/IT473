// API endpoints using Docker service names (not localhost)
const INVENTORY_API = "http://inventory-service:3000/api/products";
const ORDER_API = "http://order-service:3000/orders";
const PAYMENT_API = "http://payment-service:3000/payments";
const NOTIFICATION_API = "http://notification-service:3000/notifications";
const FLEET_API = "http://fleet-service:3000/vehicles";

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

export async function sendNotification(notificationData) {
  const res = await fetch(NOTIFICATION_API, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(notificationData),
  });
  if (!res.ok) throw new Error("Notification failed");
  return res.json();
}

export async function trackFleet(vehicleData) {
  const res = await fetch(FLEET_API, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(vehicleData),
  });
  if (!res.ok) throw new Error("Fleet update failed");
  return res.json();
}
