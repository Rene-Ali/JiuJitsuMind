defmodule Jiujitsumind.Repo do
  use Ecto.Repo,
    otp_app: :jiujitsumind,
    adapter: Ecto.Adapters.Postgres
end
