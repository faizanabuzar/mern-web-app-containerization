FROM node:18.9.1-alpine

WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

RUN npm ci --only=production

# Copy source code
COPY . .

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001
USER nodejs

EXPOSE 5050

CMD ["npm", "start"]