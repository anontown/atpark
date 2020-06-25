#!/bin/sh -eu

npx lerna run build-and-start:watch --scope @anontown/client --stream
