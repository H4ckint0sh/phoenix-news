defmodule PhoenixNewsWeb.NewsControllerTest do
  use PhoenixNewsWeb.ConnCase

  test "GET /news", %{conn: conn} do
    conn = get(conn, ~p"/news")
    assert html_response(conn, 200) =~ "news list"
    assert html_response(conn, 200) =~ "Phoenix News"
  end

  test "GET /news/:id", %{conn: conn} do
    conn = get(conn, ~p"/news/123")
    assert html_response(conn, 200) =~ "News Details: 123"
  end
end
