defmodule Hound.Mixfile do
  use Mix.Project

  @version "1.2.0"

  def project do
    [
      app: :hound,
      version: @version,
      elixir: ">= 1.9.0",
      description:
        "Webdriver library for integration testing and browser automation - Forked from HashNuke/hound",
      source_url: "http://192.168.0.190/rafael/hound",
      deps: deps(),
      package: package(),
      docs: [source_ref: "#{@version}", extras: ["README.md"], main: "readme"]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Hound.Application, []},
      description: 'Integration testing and browser automation library'
    ]
  end

  defp deps do
    [
      {:hackney, "~> 1.17"},
      {:jason, "~> 1.2.2"},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.16", only: :dev},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:doctor, "~> 0.18.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Leonardo Telles de Sá Ferreira","Rafael Arcanjo"],
      licenses: ["MIT"],
      links: %{
        "Git" => "http://192.168.0.190/rafael/hound",
        "Docs" => "http://hexdocs.pm/hound/"
      }
    ]
  end
end
