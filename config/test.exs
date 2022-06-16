import Config

config :wg_forge,
  ip: {127, 0, 0, 1},
  port: 8080

config :wg_forge, WgForge.Postgres.Repository,
  database: "wgforge",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true
