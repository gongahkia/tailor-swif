defmodule TailorSwif.Repo.Migrations.CreateReviews do
  use Ecto.Migration

  def change do
    create table(:reviews, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :tailor_id, references(:tailors, type: :binary_id, on_delete: :delete_all), null: false
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false
      add :rating, :integer, null: false
      add :comment, :text, null: false
      add :status, :string, null: false
      add :language, :string, null: false

      timestamps()
    end

    create index(:reviews, [:tailor_id])
    create index(:reviews, [:user_id])
  end
end