defmodule Jiujitsumind.Positions do
  import Ecto.Query, warn: false
  alias Jiujitsumind.Repo
  alias Jiujitsumind.Positions.Position

  def list_positions do
    Repo.all(Position)
  end

  def search_positions(query) do
    Repo.all(from p in Position, where: ilike(p.name, ^"%#{query}%"))
  end
end
