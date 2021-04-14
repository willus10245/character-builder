defmodule DndWeb.CharacterControllerTest do
  use DndWeb.ConnCase

  test "GET /character", %{conn: conn} do
    conn = get(conn, "/character")
    assert html_response(conn, 200)
  end
end
