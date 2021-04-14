defmodule Dnd.Feature.PageTest do
  use ExUnit.Case
  use Dnd.FeatureCase

  feature "site exists", %{session: session} do
    session
    |> visit("/")
    |> find(css("h1"))
    |> assert_text("Welcome to Phoenix!")
  end
end
