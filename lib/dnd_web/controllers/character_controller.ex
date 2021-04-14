defmodule DndWeb.CharacterController do
  use DndWeb, :controller

  alias Dnd.CharacterBuilder

  def index(conn, _params) do
    {:ok, character} = CharacterBuilder.get_character_sheet()

    render(conn, "index.html", character: character)
  end
end
