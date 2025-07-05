defmodule TailorSwif.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :thread_id, :binary_id, null: false
      add :sender_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false
      add :recipient_id, references(:users, type: :binary_id, on_delete: :delete_all), null: false
      add :type, :string, null: false
      add :content, :text
      add :voice_url, :string
      add :read, :boolean, default: false

      timestamps()
    end

    create index(:messages, [:thread_id])
    create index(:messages, [:sender_id])
    create index(:messages, [:recipient_id])
  end
end