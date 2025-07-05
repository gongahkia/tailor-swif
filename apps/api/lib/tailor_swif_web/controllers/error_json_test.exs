defmodule TailorSwifWeb.ErrorJSONTest do
  use TailorSwifWeb.ConnCase, async: true

  test "renders 404" do
    assert TailorSwifWeb.ErrorJSON.render("404.json", %{}) == %{error: "Not Found"}
  end

  test "renders 500" do
    assert TailorSwifWeb.ErrorJSON.render("500.json", %{}) == %{error: "Internal Server Error"}
  end

  test "renders 422 with errors" do
    errors = %{email: ["can't be blank"]}
    assert TailorSwifWeb.ErrorJSON.render("422.json", %{errors: errors}) == %{errors: errors}
  end

  test "renders other status" do
    assert TailorSwifWeb.ErrorJSON.render("401.json", %{}) == %{error: "Unauthorized"}
  end
end
