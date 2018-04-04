# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :script,
  ecto_repos: [Script.Repo]

# Configures the endpoint
config :script, ScriptWeb.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "qLot0KuSkHAdtB/W9hEyCBXDYYlAoVFyBFUtmNdPNs01Kbw39Ao5GUlHs3Um+VN9",
  render_errors: [view: ScriptWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Script.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
