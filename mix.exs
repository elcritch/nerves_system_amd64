defmodule NervesSystemRpi3.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_amd64,
     version: @version,
     elixir: "~> 1.4",
     compilers: Mix.compilers ++ [:nerves_package],
     description: description(),
     package: package(),
     deps: deps(),
     aliases: ["deps.precompile": ["nerves.env", "deps.precompile"]]]
  end

  def application do
   []
  end

  defp deps do
    [{:nerves, "~> 0.7.1", runtime: false },
     {:nerves_system_br, "~> 0.13.3", runtime: false },
     {:nerves_toolchain_x86_64_unknown_linux_gnu, "~> 0.10.0", runtime: false}]
  end

  defp description do
   """
   Nerves System - NanoPi Neo
   """
  end

  defp package do
    [maintainers: [ "Jaremy Creechley <creechley@gmail.com>" ],
    files: [
        "rootfs-additions",
        "LICENSE",
        "mix.exs",
        "nerves_defconfig",
        "nerves.exs",
        "README.md",
        "VERSION",
        "fwup.conf",
        "post-createfs.sh",
        "uboot-script.cmd",
        "linux",
        ],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/elcritch/nerves_system_amd64"}]
  end
end
