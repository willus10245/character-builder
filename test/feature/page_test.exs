defmodule Dnd.Feature.CharacterTest do
  use ExUnit.Case
  use Dnd.FeatureCase

  setup do
    Hound.start_session()
  end

  describe "Given a dwarf character with a base constitution score of 10" do
    test "When a user loads the character sheet" do
      navigate_to("http://localhost:4002/character")

      h1 = find_element(:tag, "h1")
      assert inner_text(h1) =~ "Welcome to Phoenix!"
    end
  end
end
