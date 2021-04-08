defmodule DndWeb.CharacterController do
  use DndWeb, :controller

  alias Dnd.CharacterBuilder

  def index(conn, _params) do
    {:ok, character} = CharacterBuilder.get_character()

    render(conn, "index.html", character: character)
  end
end
