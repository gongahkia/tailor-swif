defmodule TailorSwif.Repo do
  use Ecto.Repo,
    otp_app: :tailor_swif,
    adapter: Ecto.Adapters.Postgres
end