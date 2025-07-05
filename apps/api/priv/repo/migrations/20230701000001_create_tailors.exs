defmodule TailorSwif.Repo.Migrations.CreateTailors do
  use Ecto.Migration

  def change do
    create table(:tailors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :type, :string, null: false
      add :address, :string, null: false
      add :latitude, :float
      add :longitude, :float
      add :services, {:array, :string}, default: []
      add :description, :map, null: false
      add :rating, :float, default: 0.0
      add :review_count, :integer, default: 0

      timestamps()
    end
  end
end