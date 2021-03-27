{:ok, _} = Application.ensure_all_started(:wallaby)
Application.put_env(:wallaby, :base_url, "http://localhost:4002")
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Dnd.Repo, :manual)
