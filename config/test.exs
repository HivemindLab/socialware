import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :socialware, Socialware.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "socialware_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :socialware, SocialwareWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "YDjdf3eaxmwmC0cQ0HYC3fmL5yvQRMIjl0ruw6FRyLCQGOeMEF9NBa5a+f22dDa8",
  server: false

# In test we don't send emails.
config :socialware, Socialware.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
