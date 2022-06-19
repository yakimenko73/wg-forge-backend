import Config

config :wg_forge,
  ip: {127, 0, 0, 1},
  port: 8080,
  max_requests: 600,
  interval_millis: 60_000

config :wg_forge, WgForge.Postgres.Repository,
  database: "wgforge",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true
