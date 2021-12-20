# Install dependencies only when needed
FROM node:16-alpine AS development
ENV NODE_ENV development
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.

# Versions
RUN npm -v
RUN node -v

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
RUN yarn add env-cmd --install-env-cmd

# Rebuild the source code only when needed
FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
COPY --from=development /app/node_modules ./node_modules
# COPY ./build ./build


EXPOSE 3000

# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry.
# RUN npx next telemetry disable

CMD ["yarn", "start"]