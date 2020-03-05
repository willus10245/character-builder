# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :dnd, DndWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NCnELO98jppcgFwZI22kbSk0zZRn+PrLrCBx7zt/lZ3tXw37y6/etpIqIskTKrRv",
  render_errors: [view: DndWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dnd.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Eh0m7tY/oRR4xFp4vMYSh6mPYUY/fEOP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
