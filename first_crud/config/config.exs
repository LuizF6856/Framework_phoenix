# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :first_crud,
  ecto_repos: [FirstCrud.Repo]

# Configures the endpoint
config :first_crud, FirstCrudWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "knW27vweZvFbsWeHNxnBExTrTRlEa23eJjV/TupMebvW6aaup0x3OuM+EIfdV7O2",
  render_errors: [view: FirstCrudWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FirstCrud.PubSub,
  live_view: [signing_salt: "6p8rVeQ+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
