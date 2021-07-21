defmodule Hound do
  @moduledoc false

  @doc false
  def configs do
    Hound.ConnectionServer.configs()
  end

  @doc "See `Hound.Helpers.Session.start_session/1`"
  defdelegate start_session, to: Hound.Helpers.Session
  defdelegate start_session(opts), to: Hound.Helpers.Session

  defdelegate driver_info, to: Hound.ConnectionServer
  defdelegate driver_edit_host(data), to: Hound.ConnectionServer

  @doc "See `Hound.Helpers.Session.end_session/1`"
  defdelegate end_session, to: Hound.Helpers.Session
  defdelegate end_session(pid), to: Hound.Helpers.Session

  @doc false
  defdelegate current_session_id, to: Hound.Helpers.Session
end
