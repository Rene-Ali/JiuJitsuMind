defmodule Jiujitsumind.Repo.Migrations.CreatePositions do
  use Ecto.Migration

  def change do
    create table(:positions) do
      add :name, :string
      add :description, :text
      add :category, :string
      add :difficulty, :string
      add :youtube_link, :string

      timestamps(type: :utc_datetime)
    end
  end
end
