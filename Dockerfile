FROM node:14-alpine AS deps 
WORKDIR /app
COPY package*.json ./
COPY pages ./pages
COPY public ./public
COPY styles ./styles
RUN yarn install --frozen-lockfile

# Path: DOCKERFILE
FROM node:14-alpine AS builder
WORKDIR /app
COPY . .
COPY pages ./pages
COPY public ./public
COPY styles ./styles
COPY --from=deps /app/node_modules ./node_modules

RUN yarn build
COPY package*.json ./

# Path: DOCKERFILE
FROM node:14-alpine AS runner
WORKDIR /app
ENV NODE_ENV production
COPY --from=builder /app/ ./
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["yarn", "dev"]






