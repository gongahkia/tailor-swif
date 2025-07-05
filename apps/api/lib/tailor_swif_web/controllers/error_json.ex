defmodule TailorSwifWeb.ErrorJSON do
  use TailorSwifWeb, :controller

  def render("404.json", _assigns) do
    %{error: "Not Found"}
  end

  def render("500.json", _assigns) do
    %{error: "Internal Server Error"}
  end

  def render("422.json", %{errors: errors}) do
    %{errors: errors}
  end

  def render(template, _assigns) do
    %{error: Phoenix.Controller.status_message_from_template(template)}
  end
end