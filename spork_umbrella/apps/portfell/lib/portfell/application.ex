defmodule Portfell.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PortfellWeb.Telemetry,
      Portfell.Repo,
      {DNSCluster, query: Application.get_env(:portfell, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Portfell.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Portfell.Finch},
      # Start a worker by calling: Portfell.Worker.start_link(arg)
      # {Portfell.Worker, arg},
      # Start to serve requests, typically the last entry
      PortfellWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Portfell.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PortfellWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
