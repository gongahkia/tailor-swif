defmodule TailorSwifWeb.UserSocket do
  use Phoenix.Socket

  channel "messages:*", TailorSwifWeb.MessageChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end