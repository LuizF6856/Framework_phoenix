defmodule Segunda_Api.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Segunda_Api.Repo,
      # Start the Telemetry supervisor
      Segunda_ApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Segunda_Api.PubSub},
      # Start the Endpoint (http/https)
      Segunda_ApiWeb.Endpoint
      # Start a worker by calling: Segunda_Api.Worker.start_link(arg)
      # {Segunda_Api.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Segunda_Api.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Segunda_ApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
