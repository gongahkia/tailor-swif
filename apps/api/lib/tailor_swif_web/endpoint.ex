defmodule TailorSwifWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :tailor_swif

  socket "/socket", TailorSwifWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :tailor_swif,
    gzip: false,
    only: ~w(favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
    plug Phoenix.Ecto.CheckRepoStatus, otp_app: :tailor_swif
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, store: :cookie, key: "_tailor_swif_key", signing_salt: "randomsalt"
  plug TailorSwifWeb.Router
end