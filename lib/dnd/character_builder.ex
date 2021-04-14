defmodule Dnd.CharacterBuilder do
  @moduledoc """
  GenServer for keeping track of character state
  """

  use GenServer
  alias Dnd.CharacterBuilder.Character

  @character %Character{
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

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def get_character do
    GenServer.call(__MODULE__, :get_character)
  end

  def get_character_sheet do
    GenServer.call(__MODULE__, :get_character_sheet)
  end

  # Callbacks

  def init(_) do
    {:ok, @character}
  end

  def handle_call(:get_character, _from, character) do
    {:reply, {:ok, character}, character}
  end

  def handle_call(:get_character_sheet, _from, character) do
    {:reply, {:ok, Character.build_character_sheet(character)}, character}
  end

  if Mix.env() == :test do
    def handle_call({:test_set_character, character}, _from, _old) do
      {:reply, {:ok, character}, character}
    end
  end
end
