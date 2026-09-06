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
| [lambdary](https://github.com/open-southeners/lambdary) | Local development server for AWS Lambda functions | `brew install lambdary` |
| [rcomp](https://github.com/open-southeners/rcomp) | Compression and archive tool supporting multiple formats | `brew install rcomp` |

### Casks

| Package | Description | Install |
| --- | --- | --- |
| [ContainerApp](https://github.com/open-southeners/ContainerApp) | Native macOS interface for Apple's container CLI | `brew install --cask container-app` |
| [File Association Manager](https://github.com/open-southeners/fileassocmanager) | Manage default applications for file types | `brew install --cask file-assoc-manager` |
| [GLTFQuickLook](https://github.com/open-southeners/GLTFQuickLook) | Quick Look previews and thumbnails for glTF and GLB files | `brew install --cask gltfquicklook` |
| [RComp Desktop](https://github.com/open-southeners/rcomp) | Compress and extract archives on macOS and Linux | `brew install --cask rcomp` |

Packages can also be installed without explicitly adding the tap:

```sh
brew install open-southeners/tap/lambdary
brew install open-southeners/tap/rcomp
brew install --cask open-southeners/tap/container-app
brew install --cask open-southeners/tap/file-assoc-manager
brew install --cask open-southeners/tap/gltfquicklook
brew install --cask open-southeners/tap/rcomp
```

## Updating

Homebrew updates tapped packages as part of its normal update process:

```sh
brew update
brew upgrade
```

Package versions, release URLs, and SHA-256 values are checked automatically
every six hours. Updates are proposed as pull requests and validated with
Homebrew's style and audit checks before merging. The package-to-release-asset
mapping lives in [`.github/packages.yml`](.github/packages.yml).

### Package update automation

The `Update packages` workflow can also be run manually for one manifest key.
To add another package, add its repository, formula or cask path, update
strategy, tag prefix, and ordered release asset names to the manifest. Asset
order must match the order of the `sha256` stanzas in the Ruby file.

The workflow can create pull requests with the repository `GITHUB_TOKEN` when
**Settings → Actions → General → Allow GitHub Actions to create and approve
pull requests** is enabled. For pull-request checks to trigger without manual
approval, configure a GitHub App with Contents and Pull requests read/write
access and add its credentials as `HOMEBREW_UPDATER_APP_ID` and
`HOMEBREW_UPDATER_PRIVATE_KEY` secrets.

Project release workflows may request an immediate update by sending a
`repository_dispatch` event of type `package-released` with this payload:

```json
{
  "package": "lambdary"
}
```

Cross-repository dispatches require a GitHub App installation token or another
token with access to this tap; a source repository's standard `GITHUB_TOKEN`
cannot access a different repository. The scheduled run remains the fallback
if no dispatch is configured.

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
brew audit --strict --online open-southeners/tap/lambdary
brew audit --strict --online open-southeners/tap/rcomp
brew audit --strict --online --cask open-southeners/tap/container-app
brew audit --strict --online --cask open-southeners/tap/file-assoc-manager
brew audit --strict --online --cask open-southeners/tap/gltfquicklook
brew audit --strict --online --cask open-southeners/tap/rcomp
brew test open-southeners/tap/lambdary
brew test open-southeners/tap/rcomp
```

## License

This repository is licensed under the [MIT License](LICENSE).
