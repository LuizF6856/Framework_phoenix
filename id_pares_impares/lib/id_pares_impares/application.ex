defmodule IdParesImpares.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      IdParesImpares.Repo,
      # Start the Telemetry supervisor
      IdParesImparesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: IdParesImpares.PubSub},
      # Start the Endpoint (http/https)
      IdParesImparesWeb.Endpoint
      # Start a worker by calling: IdParesImpares.Worker.start_link(arg)
      # {IdParesImpares.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IdParesImpares.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IdParesImparesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
