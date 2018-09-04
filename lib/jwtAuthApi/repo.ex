defmodule JwtAuthApi.Repo do
  use Ecto.Repo,
    otp_app: :jwtAuthApi,
    adapter: Ecto.Adapters.Postgres
end
