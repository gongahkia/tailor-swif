defmodule TailorSwif.Contexts.UserContext do
  import Ecto.Query, warn: false
  alias TailorSwif.Repo
  alias TailorSwif.Schemas.User

  def get_user!(id), do: Repo.get!(User, id)

  def list_users, do: Repo.all(User)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user), do: Repo.delete(user)
end