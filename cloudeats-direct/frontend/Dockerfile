# Stage 1: build
FROM node:18-alpine AS build
WORKDIR /app
ENV CI=true

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm ci --legacy-peer-deps

# Copy source code
COPY public/ ./public
COPY src/ ./src

# Build-time environment variables (for React)
ARG REACT_APP_INVENTORY_SERVICE_URL
ARG REACT_APP_ORDER_SERVICE_URL
ARG REACT_APP_PAYMENT_SERVICE_URL
ARG REACT_APP_NOTIFICATION_SERVICE_URL
ARG REACT_APP_FLEET_SERVICE_URL

# Build the React app with environment variables
RUN npm run build

# Stage 2: production nginx
FROM nginx:1.28-alpine

# Copy React build to nginx
COPY --from=build /app/build /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
