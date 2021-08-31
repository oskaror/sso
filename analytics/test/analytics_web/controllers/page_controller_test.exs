defmodule AnalyticsWeb.PageControllerTest do
  use AnalyticsWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 307) =~ "http://lvh.me:3000"
  end
end

