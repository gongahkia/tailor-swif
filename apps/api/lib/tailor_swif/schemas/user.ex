defmodule TailorSwif.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Jason.Encoder, only: [:id, :email, :name, :role, :status, :preferred_language, :inserted_at, :updated_at]}
  schema "users" do
    field :email, :string
    field :name, :string
    field :role, :string
    field :status, :string
    field :preferred_language, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :name, :role, :status, :preferred_language])
    |> validate_required([:email, :name, :role, :status, :preferred_language])
    |> unique_constraint(:email)
  end
end