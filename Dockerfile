FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Select a new baseImage
FROM nginx
# Copy something from a different phase
COPY --from=builder /app/build /usr/share/nginx/html

