# build environment
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
RUN yarn add env-cmd --install-env-cmd
COPY . .

# Build the app
RUN yarn build


# server environment
# Bundle static assets with nginx
FROM nginx:1.21.0-alpine as deploy
#ENV NODE_ENV production
# Copy built assets from builder
COPY --from=builder /app/build /usr/share/nginx/html
# Add your nginx.conf
COPY nginx.conf /etc/nginx/conf.d/configfile.template
# Expose port
ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080
# Start nginx
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"