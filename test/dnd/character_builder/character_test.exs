defmodule Dnd.CharacterBuilder.CharacterTest do
  use ExUnit.Case, async: true
  alias Dnd.CharacterBuilder.Character

  @default_character %Character{
    name: "Thorodin Ironfist",
    race: :dwarf,
    class: :cleric,
    base_abilities: %{
      str: 12,
      con: 12,
      dex: 12,
      wis: 12,
      int: 12,
      cha: 12
    }
  }

  setup :setup_character

  describe "build_character_sheet/1" do
    test "builds abilities" do
      character = Character.build_character_sheet(@default_character)

      assert character.abilities
    end
  end

  describe "base_abilities/1" do
    @tag race: :dwarf
    test "adds race bonus for dwarf", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.con == base_abilities.con + 2
    end

    @tag race: :elf
    test "adds race bonus for elf", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.dex == base_abilities.dex + 2
    end

    @tag race: :halfling
    test "adds race bonus for halfling", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.dex == base_abilities.dex + 2
    end

    @tag race: :human
    test "adds race bonus for human", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.str == base_abilities.str + 1
      assert abilities.dex == base_abilities.dex + 1
      assert abilities.con == base_abilities.con + 1
      assert abilities.int == base_abilities.int + 1
      assert abilities.wis == base_abilities.wis + 1
      assert abilities.cha == base_abilities.cha + 1
    end

    @tag race: :dragonborn
    test "adds race bonus for dragonborn", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.str == base_abilities.str + 2
      assert abilities.cha == base_abilities.cha + 1
    end

    @tag race: :gnome
    test "adds race bonus for gnome", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.int == base_abilities.int + 2
    end

    @tag race: :half_elf
    test "adds race bonus for half-elf", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.cha == base_abilities.cha + 2
    end

    @tag race: :half_orc
    test "adds race bonus for half-orc", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.str == base_abilities.str + 2
      assert abilities.con == base_abilities.con + 1
    end

    @tag race: :tiefling
    test "adds race bonus for tiefling", %{character: character} do
      %{abilities: abilities, base_abilities: base_abilities} =
        Character.build_abilities(character)

      assert abilities.int == base_abilities.int + 1
      assert abilities.cha == base_abilities.cha + 2
    end
  end

  defp setup_character(%{race: race}) do
    [character: %{@default_character | race: race}]
  end

  defp setup_character(_) do
    [character: @default_character]
  end
end
