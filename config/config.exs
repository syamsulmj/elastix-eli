# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elastix_eli,
  ecto_repos: [ElastixEli.Repo]

# Configures the endpoint
config :elastix_eli, ElastixEliWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Xy5wHUx5bmPDYlzzmN8soVUic5UwXZxEBbMY+LVrPKVEfyAoqyMgMQwuA5yjroeC",
  render_errors: [view: ElastixEliWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElastixEli.PubSub,
  live_view: [signing_salt: "frxalkNR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Elasticsearch Config
config :elastix_eli, ElastixEli.Services.ElasticsearchCluster,
  url: "http://localhost:9200",
  username: "elastic",
  password: "changeme",
  api: Elasticsearch.API.HTTP,
  json_library: Poison,
  indexes: %{
    posts: %{
      settings: "priv/elasticsearch/posts.json",
      store: ElastixEli.Services.ElasticsearchStore,
      sources: [ElastixEli.Schema.Post],
      bulk_page_size: 5000,
      bulk_wait_interval: 15_000,
      bulk_action: "create"
    }
  }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
