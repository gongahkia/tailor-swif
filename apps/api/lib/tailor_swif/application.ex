defmodule TailorSwif.Application do
  use Application

  def start(_type, _args) do
    children = [
      TailorSwif.Repo,
      TailorSwifWeb.Telemetry,
      {Phoenix.PubSub, name: TailorSwif.PubSub},
      TailorSwifWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: TailorSwif.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    TailorSwifWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end