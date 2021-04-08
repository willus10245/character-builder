defmodule Dnd.Feature.CharacterTest do
  use ExUnit.Case
  use Dnd.FeatureCase

  alias Dnd.CharacterBuilder

  @character %CharacterBuilder.Character{
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

  describe "Given a dwarf character with a base constitution score of 10" do
    setup do
      {:ok, _} = GenServer.call(CharacterBuilder, {:test_set_character, @character})
      :ok
    end

    feature "When a user loads the character sheet", %{session: session} do
      con_stat = data_test("con_stat")

      session
      |> visit("/character")
      |> find(con_stat)
      |> assert_text("12")
    end
  end
end
