import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :dnd, Dnd.Repo,
  username: "postgres",
  password: "postgres",
  database: "dnd_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :dnd, :sql_sandbox, true

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dnd, DndWeb.Endpoint,
  http: [port: 4002],
  url: [host: "localhost", port: 80],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :wallaby,
  driver: Wallaby.Chrome,
  otp_app: :dnd
