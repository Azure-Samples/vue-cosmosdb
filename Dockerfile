# FROM node:6-alpine
# WORKDIR /usr/src/app
# COPY ["package.json", "npm-shrinkwrap.json*", "./"]
# RUN npm install --silent
# COPY . .
# RUN npm run build
# EXPOSE 3001
# CMD npm start


# Client App ========================================
FROM node:6-alpine as client-app
LABEL authors="John Papa"
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm install --silent
COPY . .
RUN npm run build

#Express server =======================================
FROM node:6-alpine as express-server
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv ../node_modules
COPY . .

#Final image ========================================
FROM node:6-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY --from=express-server . .
COPY --from=client-app . .

EXPOSE 3001
CMD [ "node", "index.js" ]

