FROM node:18-alpine

# Create working directory inside container
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy everything else
COPY . .

# Build the Emergent project
RUN npm run build

# Expose the dev server port
EXPOSE 5173

# Start Emergent
CMD ["npm", "run", "dev", "--", "--host"]
