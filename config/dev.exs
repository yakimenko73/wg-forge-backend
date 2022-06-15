import Config

config :wg_forge, WgForge.Postgres.Repository,
  adapter: Ecto.Adapters.Postgres,
  database: "wgforge",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  ip: {127, 0, 0, 1},
  port: 8080
