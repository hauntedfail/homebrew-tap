class IqosCli < Formula
  desc "Command-line interface for IQOS devices over Bluetooth Low Energy"
  homepage "https://github.com/hauntedfail/iqos_cli"
  url "https://github.com/hauntedfail/iqos_cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "a47f2e6fbdcbf4b86ae0533e74ee12e4379aadc2443620a21962a51c023ed558"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "dbus"
  end

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
    mv bin/"iqos_cli", bin/"iqos"
  end

  def caveats
    <<~EOS
      To connect to a device on macOS, allow Bluetooth access for your terminal
      in System Settings > Privacy & Security > Bluetooth.
      On Linux, enable the system Bluetooth service and ensure your user can
      access BlueZ over D-Bus. A running Homebrew D-Bus service is not required.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/iqos --version").strip
    assert_match "unexpected argument", shell_output("#{bin}/iqos --homebrew-invalid-option 2>&1", 2)
  end
end
