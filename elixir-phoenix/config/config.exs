# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :app,
  ecto_repos: [App.Repo]

config :app_web,
  ecto_repos: [App.Repo],
  generators: [context_app: :app]

# Configures the endpoint
config :app_web, AppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rqc2iy9j2hm1uABhXAVMqGfQzVG4tocMRI0T0vF6l8Mc5jb58RH3gA4h6bMT6D9h",
  render_errors: [view: AppWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: App.PubSub,
  live_view: [signing_salt: "A698N2j1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
