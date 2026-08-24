# The published site is the build output, not the repository. Copying the repo
# straight into a static server left the Vite shell asking for /src/main.tsx,
# which no browser can run, and served every source file alongside it.
FROM node:24-alpine AS build
WORKDIR /app
RUN corepack enable && corepack prepare pnpm@11.14.0 --activate
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

FROM pierrezemb/gostatic
COPY --from=build /app/dist /srv/http/
CMD ["-port","8080","-https-promote","-enable-logging"]
