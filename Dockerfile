# Written by blitz.cloud for this project. It is yours now: blitz.cloud
# builds from it as it is, and you can change it like any other file.
FROM node:22-alpine

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev

COPY server.js ./
COPY src ./src
COPY dashboard.html ./
COPY render.yaml ./
COPY Procfile ./

RUN mkdir -p /app/data && chown -R 1000:1000 /app

ENV PORT=8080
ENV NODE_ENV=production
EXPOSE 8080

USER 1000:1000

CMD ["node", "--no-warnings", "server.js"]
