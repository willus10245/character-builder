# defmodule Dnd.Feature.CharacterTest do
#   use ExUnit.Case
#   use Dnd.FeatureCase

#   alias Dnd.CharacterBuilder

#   defp create_character(attrs) do
#     attrs = Enum.into(attrs, %{})
#     struct!(%CharacterBuilder.Character{}, attrs)
#   end

#   setup do
#     Hound.start_session()

#     :ok
#   end

#   describe "Given a dwarf character with a base constitution score of 10" do
#     setup do
#       character = create_character(race: :dwarf, abilities: %{con: 10})

#       {:ok, _} = GenServer.call(CharacterBuilder, {:test_set_character, character})
#       :ok
#     end

#     test "When a user loads the character sheet" do
#       navigate_to("http://localhost:4002/character")

#       # Then it will show a constitution score of 12
#       assert "12" =
#                "con_stat"
#                |> data_test()
#                |> (&find_element(:xpath, &1)).()
#                |> inner_text()
#     end
#   end
# end
