defmodule Hound.ConnectionServer do
  @moduledoc false

  use Agent

  def start_link(options \\ []) do
    driver = options[:driver] || Application.get_env(:hound, :driver, "selenium")

    {default_port, default_path_prefix, default_browser} =
      case driver do
        "chrome_driver" ->
          {9515, nil, "chrome"}

        "phantomjs" ->
          {8910, nil, "phantomjs"}

        "selenium" ->
          {4444, "wd/hub/", "firefox"}

        # assume selenoid
        _ ->
          {4444, "wd/hub/", "chrome"}
      end

    browser = options[:browser] || Application.get_env(:hound, :browser, default_browser)
    host = options[:host] || Application.get_env(:hound, :host, "http://localhost")
    port = options[:port] || Application.get_env(:hound, :port, default_port)

    path_prefix =
      options[:path_prefix] || Application.get_env(:hound, :path_prefix, default_path_prefix)

    driver_info = %{
      :driver => driver,
      :browser => browser,
      :host => host,
      :port => port,
      :path_prefix => path_prefix
    }

    configs = %{
      :host => options[:app_host] || Application.get_env(:hound, :app_host, "http://localhost"),
      :port => options[:app_port] || Application.get_env(:hound, :app_port, 4001),
      :temp_dir => options[:temp_dir] || Application.get_env(:hound, :temp_dir, File.cwd!())
    }

    state = %{sessions: [], driver_info: driver_info, configs: configs}
    Agent.start_link(fn -> state end, name: __MODULE__)
  end

  def driver_info do
    {:ok, Agent.get(__MODULE__, & &1.driver_info, 60_000)}
  end

  def driver_info(data) do
    Agent.update(__MODULE__, fn item -> item |> Map.replace!(:driver_info, data) end)
  end

  def driver_edit_host(data) when is_map(data) or is_list(data) do
    Agent.update(__MODULE__, fn item ->
      driver_info = Map.get(item, :driver_info)

      host = data[:host] || driver_info[:host]
      port = data[:port] || driver_info[:port]

      new_driver_info = Map.merge(driver_info, %{host: host, port: port})

      item |> Map.replace!(:driver_info, new_driver_info)
    end)
  end

  def configs do
    {:ok, Agent.get(__MODULE__, & &1.configs, 60_000)}
  end
end
