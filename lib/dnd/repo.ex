defmodule Dnd.Repo do
  use Ecto.Repo,
    otp_app: :dnd,
    adapter: Ecto.Adapters.Postgres
end
