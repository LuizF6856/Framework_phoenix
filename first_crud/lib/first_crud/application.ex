defmodule FirstCrud.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FirstCrud.Repo,
      # Start the Telemetry supervisor
      FirstCrudWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FirstCrud.PubSub},
      # Start the Endpoint (http/https)
      FirstCrudWeb.Endpoint
      # Start a worker by calling: FirstCrud.Worker.start_link(arg)
      # {FirstCrud.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FirstCrud.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FirstCrudWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
