FROM node:10.15.3-alpine

WORKDIR /home

COPY package.json package-lock.json ./
RUN npm ci --no-progress

COPY lerna.json ./
COPY packages/bff/package.json packages/bff/package-lock.json ./packages/bff/
COPY packages/client/package.json packages/client/package-lock.json ./packages/client/
COPY packages/common/package.json packages/common/package-lock.json ./packages/common/
RUN npx lerna bootstrap --ci --no-progress

COPY schema.json .eslintignore .eslintrc.js .prettierrc ./
COPY packages ./packages

COPY ./bin bin

RUN npx lerna run codegen --scope @anontown/client --include-filtered-dependencies \
  && npx lerna run build --scope @anontown/bff \
  && npx lerna run build --scope @anontown/client

CMD ./bin/start.sh
