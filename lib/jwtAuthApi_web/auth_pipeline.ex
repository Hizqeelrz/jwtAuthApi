defmodule JwtAuthApi.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :JwtAuthApi,
  module: JwtAuthApi.Guardian,
  error_handler: JwtAuthApi.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Beare"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
