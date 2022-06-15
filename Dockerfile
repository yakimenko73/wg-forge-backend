FROM elixir:latest

WORKDIR /app

COPY . .

RUN mix local.hex --force
RUN mix deps.get
RUN mix local.rebar --force

CMD mix run --no-halt