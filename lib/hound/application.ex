defmodule Hound.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  @doc false
  def start(_type, _args) do
    Hound.Supervisor.start_link()
  end
end
