defmodule DndWeb.CharacterView do
  use DndWeb, :view

  def display(atom) when is_atom(atom) do
    atom
    |> to_string()
    |> String.capitalize()
  end
end
