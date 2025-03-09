defmodule Jiujitsumind.Positions.Position do
  use Ecto.Schema
  import Ecto.Changeset

  schema "positions" do
    field :name, :string
    field :description, :string
    field :category, :string
    field :difficulty, :string
    field :youtube_link, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(position, attrs) do
    position
    |> cast(attrs, [:name, :description, :category, :difficulty, :youtube_link])
    |> validate_required([:name, :description, :category, :difficulty, :youtube_link])
  end
end
