FROM node:6-alpine
WORKDIR /usr/src/app
COPY . .
RUN npm install --silent
RUN npm run build
EXPOSE 3001
CMD npm start
