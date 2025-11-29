// src/services/api.js

// Correct Docker internal service URLs
const INVENTORY_API =
  process.env.REACT_APP_INVENTORY_SERVICE_URL ||
  "http://inventory-service:3002/api/products";

const ORDER_API =
  process.env.REACT_APP_ORDER_SERVICE_URL ||
  "http://order-service:3004/orders";

const PAYMENT_API =
  process.env.REACT_APP_PAYMENT_SERVICE_URL ||
  "http://payment-service:3005/payments";

const NOTIFICATION_API =
  process.env.REACT_APP_NOTIFICATION_SERVICE_URL ||
  "http://notification-service:3003/notifications";

const FLEET_API =
  process.env.REACT_APP_FLEET_SERVICE_URL ||
  "http://fleet-service:3001/vehicles";

/**
 * Fetch all products from Inventory Service
 */
export async function getProducts() {
  try {
    const res = await fetch(INVENTORY_API);
    if (!res.ok)
      throw new Error(`Failed to fetch products: ${res.statusText}`);
    return await res.json();
  } catch (err) {
    console.error("Inventory API error:", err);
    throw err;
  }
}

/**
 * Place an order
 */
export async function placeOrder(orderData) {
  try {
    const res = await fetch(ORDER_API, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(orderData),
    });
    if (!res.ok) throw new Error(`Order failed: ${res.statusText}`);
    return await res.json();
  } catch (err) {
    console.error("Order API error:", err);
    throw err;
  }
}

/**
 * Process payment
 */
export async function processPayment(paymentData) {
  try {
    const res = await fetch(PAYMENT_API, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(paymentData),
    });
    if (!res.ok) throw new Error(`Payment failed: ${res.statusText}`);
    return await res.json();
  } catch (err) {
    console.error("Payment API error:", err);
    throw err;
  }
}

/**
 * Send notification
 */
export async function sendNotification(notificationData) {
  try {
    const res = await fetch(NOTIFICATION_API, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(notificationData),
    });
    if (!res.ok) throw new Error(`Notification failed: ${res.statusText}`);
    return await res.json();
  } catch (err) {
    console.error("Notification API error:", err);
    throw err;
  }
}

/**
 * Track fleet updates
 */
export async function trackFleet(vehicleData) {
  try {
    const res = await fetch(FLEET_API, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(vehicleData),
    });
    if (!res.ok) throw new Error(`Fleet update failed: ${res.statusText}`);
    return await res.json();
  } catch (err) {
    console.error("Fleet API error:", err);
    throw err;
  }
}
