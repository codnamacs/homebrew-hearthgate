# homebrew-hearthgate

Homebrew tap for [HearthGate](https://hearthgate.codnamacs.com) — a secure SSH+VNC gateway for macOS.

## Install

```sh
brew tap codnamacs/hearthgate
brew install --cask hearthgate
```

## Update

```sh
brew upgrade --cask hearthgate
```

## Uninstall

```sh
brew uninstall --cask hearthgate          # remove the app
brew uninstall --zap --cask hearthgate    # also remove config, caches, audit logs
```

---

## Maintainer notes (release checklist)

Each release, update [`Casks/hearthgate.rb`](Casks/hearthgate.rb):

1. Bump `version`.
2. Replace `sha256` with the new DMG hash:
   ```sh
   shasum -a 256 HearthGate-<version>.dmg | cut -d' ' -f1
   ```
   (The `notarize.sh` script already prints this after notarization.)
3. Commit + push. Users get it within ~5 min via `brew upgrade --cask hearthgate`.

`brew livecheck hearthgate` reads the Sparkle appcast and reports the latest version automatically.
