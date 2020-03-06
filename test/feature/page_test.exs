defmodule Dnd.Feature.PageTest do
  use ExUnit.Case
  use Dnd.FeatureCase

  setup do
    Hound.start_session()

    :ok
  end

  test "site exists" do
    navigate_to("http://localhost:4002")

    h1 = find_element(:tag, "h1")
    assert inner_text(h1) =~ "Welcome to Phoenix!"
  end
end
