# Open Southeners Homebrew Tap

Homebrew formulas and casks maintained by
[Open Southeners](https://github.com/open-southeners).

## Installation

Add the tap:

```sh
brew tap open-southeners/tap
```

You can then install any available formula or cask.

### Formulas

| Package | Description | Install |
| --- | --- | --- |
| [rcomp](https://github.com/open-southeners/rcomp) | Compression and archive tool supporting multiple formats | `brew install rcomp` |

### Casks

| Package | Description | Install |
| --- | --- | --- |
| [ContainerApp](https://github.com/open-southeners/ContainerApp) | Native macOS interface for Apple's container CLI | `brew install --cask container-app` |
| [File Association Manager](https://github.com/open-southeners/fileassocmanager) | Manage default applications for file types | `brew install --cask file-assoc-manager` |

Packages can also be installed without explicitly adding the tap:

```sh
brew install open-southeners/tap/rcomp
brew install --cask open-southeners/tap/container-app
brew install --cask open-southeners/tap/file-assoc-manager
```

## Updating

Homebrew updates tapped packages as part of its normal update process:

```sh
brew update
brew upgrade
```

## Removing the Tap

```sh
brew untap open-southeners/tap
```

Installed packages are not removed automatically when the tap is removed.

## Contributing

Bug reports and pull requests are welcome. For issues specific to an
application, use that application's repository. Use this repository for
problems with installation or with a formula or cask definition.

Before submitting a change, run the relevant Homebrew checks:

```sh
brew audit --strict --online open-southeners/tap/rcomp
brew audit --strict --online --cask open-southeners/tap/container-app
brew audit --strict --online --cask open-southeners/tap/file-assoc-manager
brew test open-southeners/tap/rcomp
```

## License

This repository is licensed under the [MIT License](LICENSE).
