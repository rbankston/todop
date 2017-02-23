defmodule Todop.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :done, :boolean, default: false, null: false
      add :lists_id, references(:lists, on_delete: :nothing)

      timestamps()
    end
    create index(:tasks, [:lists_id])

  end
end
