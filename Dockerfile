FROM node:24-alpine

WORKDIR /app

COPY package.json .
COPY package-lock.json .
RUN npm install


# Copy the rest of the application code to the working directory
COPY . .

CMD ["npm", "start"]

