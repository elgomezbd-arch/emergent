FROM node:18-bullseye

# Install system build tools required for some NPM packages
RUN apt-get update && apt-get install -y python3 make g++ && apt-get clean

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
