defmodule TailorSwifWeb.Telemetry do
  use Supervisor

  def start_link(_arg) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      {Telemetry.Metrics, metrics: metrics()}
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end

  defp metrics do
    [
      # Add custom metrics here as needed
      # Example: Telemetry.Metrics.counter("phoenix.endpoint.stop.duration")
    ]
  end
end