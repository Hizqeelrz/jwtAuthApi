defmodule JwtAuthApi.Guardian.AuthPipeline do
  use Guardian, otp_app: :jwtAuthApi,
  module: JwtAuthApi.Guardian,
  error_handler: AuthErrorHandler

  plug Guardian.Pug.VerifyHeader, realm: "Beare"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
