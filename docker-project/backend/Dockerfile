FROM node:20
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install
ENV DB_HOST="databasecnt"
CMD ["node", "index.js"]
