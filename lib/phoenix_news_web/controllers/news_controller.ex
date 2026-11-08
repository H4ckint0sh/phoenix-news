defmodule PhoenixNewsWeb.NewsController do
  use PhoenixNewsWeb, :controller

  def index(conn, _params) do
    # dbg(params)
    render(conn, :index)
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, id: id)
  end
end
