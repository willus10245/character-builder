defmodule Dnd.FeatureCase do
  @moduledoc """
  This module defines the test case to be used for acceptance tests,
  which interact with the browser.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Plug.Conn
      import Phoenix.ConnTest
      alias DndWeb.Router.Helpers, as: Routes
      use Hound.Helpers

      @endpoint DndWeb.Endpoint
      @moduletag :feature

      def data_test(test_id), do: "//*[@data-test='#{test_id}']"
    end
  end
end
