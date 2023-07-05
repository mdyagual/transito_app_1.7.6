defmodule TransitoApp.Repo do
  use Ecto.Repo,
    otp_app: :transito_app,
    adapter: Ecto.Adapters.Postgres
end
