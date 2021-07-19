# TODO

* alias start_session and end_session to Hound.Session helpers
* find_element and find_all_element: is it timeout_in_seconds or retries
* Window size, position, maximize, close window, focus frame
* Mouse
* Geo location
* Local storage
* Session storage
* Session log
* Application cache status

## Just using this as a dumping ground

``` elixir
defmodule Hound.JsonDriver.Ime do
  @moduledoc false
  # import Hound.JsonDriver.Utils

  # @doc "List available IME engines"
  # @spec available_ime_engines() :: Dict.t
  # def available_ime_engines()

  # @doc "Get name of active IME engine"
  # @spec active_ime_engine() :: String.t
  # def active_ime_engine()

  # @doc "Checks if the IME input is currently active"
  # @spec ime_active?() :: Boolean.t
  # def ime_active?()

  # @doc "Activate IME engine"
  # @spec activate_ime_engine(String.t) :: :ok
  # def activate_ime_engine(engine_name)

  # @doc "Deactivate currently active IME engine"
  # @spec deactivate_current_img_engine() :: :ok
  # def deactivate_current_ime_engine()
end
```
