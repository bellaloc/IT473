# Stage 1: build
FROM node:18-alpine AS build
WORKDIR /app
ENV CI=true
COPY package.json package-lock.json ./
RUN npm ci --legacy-peer-deps
COPY public/ ./public
COPY src/ ./src
# Pass REACT_APP_* at build time (docker compose or GH actions)
ARG REACT_APP_INVENTORY_SERVICE_URL
ARG REACT_APP_ORDER_SERVICE_URL
ARG REACT_APP_PAYMENT_SERVICE_URL
ARG REACT_APP_NOTIFICATION_SERVICE_URL
ARG REACT_APP_FLEET_SERVICE_URL
# Build with env replacements available via build args (create .env.production if needed)
RUN npm run build

# Stage 2: production nginx
FROM nginx:1.28-alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose port used by docker-compose mapping (container listens 80)
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
