defmodule PhoenixNews.Application do
  # See https://elixir.hexdocs.pm/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixNewsWeb.Telemetry,
      PhoenixNews.Repo,
      {Ecto.Migrator,
       repos: Application.fetch_env!(:phoenix_news, :ecto_repos), skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:phoenix_news, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixNews.PubSub},
      # Start a worker by calling: PhoenixNews.Worker.start_link(arg)
      # {PhoenixNews.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixNewsWeb.Endpoint
    ]

    # See https://elixir.hexdocs.pm/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixNews.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixNewsWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") == nil
  end
end
