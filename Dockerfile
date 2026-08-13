# Use an official, lightweight Node runtime
FROM node:20-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to speed up future builds
COPY package*.json ./

# Install only necessary production dependencies
RUN npm install --production

# Copy the rest of your bot's files
COPY . .

# Hugging Face requires port 7860 to be exposed
EXPOSE 7860
ENV PORT=7860

# Start your bot (change index.js to your actual entry file name if different)
CMD ["node", "index.js"]
