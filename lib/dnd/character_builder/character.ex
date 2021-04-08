defmodule Dnd.CharacterBuilder.Character do
  @moduledoc """
  Struct representing a DnD Character
  """

  defstruct [:name, :race, :class, :base_abilities, :abilities]
end
