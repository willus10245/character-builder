defmodule Dnd.CharacterBuilder.Character do
  @moduledoc """
  Struct representing a DnD Character
  """

  defstruct [:name, :race, :class, :base_abilities, :abilities]

  def build_character_sheet(%__MODULE__{} = character) do
    character
    |> build_abilities
  end

  def build_abilities(%__MODULE__{base_abilities: base_abilities} = character) do
    abilities =
      base_abilities
      |> add_race_bonuses(character.race)

    %{character | abilities: abilities}
  end

  defp add_race_bonuses(%{con: base_con} = base_abilities, :dwarf) do
    %{base_abilities | con: base_con + 2}
  end

  defp add_race_bonuses(base_abilities, :human) do
    base_abilities
    |> Enum.map(fn {ab, stat} -> {ab, stat + 1} end)
    |> Map.new()
  end

  defp add_race_bonuses(%{str: base_str, cha: base_cha} = base_abilities, :dragonborn) do
    %{base_abilities | str: base_str + 2, cha: base_cha + 1}
  end

  defp add_race_bonuses(%{int: base_int} = base_abilities, :gnome) do
    %{base_abilities | int: base_int + 2}
  end

  # TODO: support user chosen race bonuses for half-elf
  defp add_race_bonuses(%{cha: base_cha} = base_abilities, :half_elf) do
    %{base_abilities | cha: base_cha + 2}
  end

  defp add_race_bonuses(%{str: base_str, con: base_con} = base_abilities, :half_orc) do
    %{base_abilities | str: base_str + 2, con: base_con + 1}
  end

  defp add_race_bonuses(%{cha: base_cha, int: base_int} = base_abilities, :tiefling) do
    %{base_abilities | cha: base_cha + 2, int: base_int + 1}
  end

  defp add_race_bonuses(%{dex: base_dex} = base_abilities, race) when race in [:elf, :halfling] do
    %{base_abilities | dex: base_dex + 2}
  end
end
