defmodule ShopWeb.ProductControllerTest do
  use ShopWeb.ConnCase

  test "GET /product", %{conn: conn} do
    conn = get(conn, ~p"/product")
    assert html_response(conn, 200) =~ "product list"
  end
end
