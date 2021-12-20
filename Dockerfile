FROM node:16-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
RUN yarn add env-cmd --install-env-cmd
COPY . .
EXPOSE 3000
CMD ["yarn", "start:testing"]