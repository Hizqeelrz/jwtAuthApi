# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jwtAuthApi,
  ecto_repos: [JwtAuthApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :jwtAuthApi, JwtAuthApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vQ7LuOhD6DocECATg4+sczT2cmjrUOMTSySBTncKBQHS+jSitejiX7ph+llctWTw",
  render_errors: [view: JwtAuthApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JwtAuthApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :jwtAuthApi, JwtAuthApi.Guardian,
       issuer: "jwtAuthApi",
       secret_key: "otYbdX+GxFHwHU0A+8rE4i4ugoFO04IrNaROG/no1FprgEyMAGjobO1BHH0rODsa"
