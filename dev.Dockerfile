FROM node:10.15.3-alpine

ENV WORKDIR=/workdir
WORKDIR $WORKDIR

USER node
