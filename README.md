# Haunted Homebrew tap

Install [IQOS CLI](https://github.com/hauntedfail/iqos_cli), a command-line interface for IQOS devices over Bluetooth Low Energy:

```sh
brew install hauntedfail/tap/iqos-cli
iqos --version
iqos --help
```

The formula installs the `iqos` command from the stable `v1.0.1` source archive. Homebrew verifies its SHA-256 checksum, fetches the exact dependencies recorded in `Cargo.lock`, and compiles locally with Rust. No separate Cargo installation is needed. The formula uses Homebrew's current Cargo fetch helpers; update Homebrew before installing.

The source supports macOS on Apple Silicon and Intel, and Linux. Linux builds require D-Bus and pkgconf, which the formula supplies. Bluetooth connections on Linux use the system BlueZ service and its D-Bus permissions. On macOS, allow Bluetooth access for your terminal in **System Settings → Privacy & Security → Bluetooth**. The Homebrew package does not include the unreleased USB transport work. Windows users can use the upstream release downloads.

## Validation

```sh
brew style hauntedfail/tap/iqos-cli
brew audit --strict --new --online hauntedfail/tap/iqos-cli
brew install --build-from-source hauntedfail/tap/iqos-cli
brew test hauntedfail/tap/iqos-cli
```

The formula test checks the version and rejection of an invalid command-line option. Both return before Bluetooth initialisation and do not require or contact a device.

## Updates

When packaging a new stable release, update the formula URL and SHA-256 from the downloaded source archive, confirm that `Cargo.lock` is included, and repeat the validation commands. Keep the source version pinned to a release tag. This tap does not currently publish Homebrew bottles.

IQOS CLI is distributed under GNU GPL v3.0; see the [upstream licence](https://github.com/hauntedfail/iqos_cli/blob/v1.0.1/LICENSE).
