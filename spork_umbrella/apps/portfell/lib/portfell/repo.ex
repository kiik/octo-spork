defmodule Portfell.Repo do
  use Ecto.Repo,
    otp_app: :portfell,
    adapter: Ecto.Adapters.Postgres
end
