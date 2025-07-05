defmodule TailorSwifWeb.ErrorView do
  use TailorSwifWeb, :view

  def render("404.json", _assigns), do: %{error: "Not Found"}
  def render("500.json", _assigns), do: %{error: "Internal Server Error"}
  def render(template, _assigns), do: %{error: Phoenix.Controller.status_message_from_template(template)}
end