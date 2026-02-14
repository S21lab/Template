FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application
COPY dist ./dist

# Expose port
EXPOSE 3000

# Start application
CMD ["node", "dist/main.js"]
