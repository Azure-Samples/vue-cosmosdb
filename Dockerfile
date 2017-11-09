FROM node:6-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY ["package.json", "npm-shrinkwrap.json*", "./"]
# RUN npm install --production --silent && mv node_modules ../
RUN npm install --silent && mv node_modules ../
RUN npm run build
COPY . .
EXPOSE 3001
CMD npm start
