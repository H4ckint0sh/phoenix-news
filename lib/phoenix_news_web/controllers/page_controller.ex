defmodule PhoenixNewsWeb.PageController do
  use PhoenixNewsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
