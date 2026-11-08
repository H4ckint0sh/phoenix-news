defmodule PhoenixNews.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_news,
    adapter: Ecto.Adapters.SQLite3
end
