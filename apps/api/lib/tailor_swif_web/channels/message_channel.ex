defmodule TailorSwifWeb.MessageChannel do
  use Phoenix.Channel

  def join("messages:" <> _thread_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", %{"content" => content}, socket) do
    broadcast!(socket, "new_message", %{content: content})
    {:noreply, socket}
  end
end