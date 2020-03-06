import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dnd, DndWeb.Endpoint,
  http: [port: 4002],
  url: [host: "localhost", port: 80],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :hound,
  driver: "chrome_driver",
  browser: "chrome_headless",
  retry_time: 500
