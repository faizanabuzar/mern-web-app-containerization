# -------- Stage 1: Build --------
FROM node:18.9.1-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build  # assumes it outputs to /app/dist

# -------- Stage 2: Run on distroless --------
FROM gcr.io/distroless/nodejs18

WORKDIR /app

COPY --from=builder /app/dist .

EXPOSE 5173  # ✅ Exposing the same port as your dev Dockerfile

CMD ["server.js"]  # replace with your actual entry point
