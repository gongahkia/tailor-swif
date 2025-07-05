FROM hexpm/elixir:1.15.7-erlang-26.2.4-alpine-3.18 AS build

ENV MIX_ENV=prod
WORKDIR /app

RUN apk add --no-cache build-base git npm

COPY mix.exs mix.lock ./
COPY config ./config
RUN mix deps.get --only prod

COPY assets ./assets
RUN cd assets && npm ci && npm run build

COPY priv ./priv
COPY lib ./lib

RUN mix compile

RUN mix phx.digest

RUN mix release

FROM alpine:3.18 AS app
RUN apk add --no-cache openssl ncurses-libs

WORKDIR /app
COPY --from=build /app/_build/prod/rel/tailor_swif ./
ENV HOME=/app
ENV MIX_ENV=prod
ENV PORT=4000

EXPOSE 4000

CMD ["bin/tailor_swif", "start"]