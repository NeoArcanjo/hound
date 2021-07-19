defmodule Hound.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(options \\ []) do
    Supervisor.start_link(__MODULE__, options, name: __MODULE__)
  end

  def init(options) do
    children = [
      {Hound.ConnectionServer, [options]},
      {Hound.SessionServer, []}
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.Behaviour.html
    # for other strategies and supported options
    Supervisor.init(children, strategy: :one_for_one, name: Hound.Supervisor)
  end
end
