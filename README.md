# Homebrew Tap for Minibox

This is the official Homebrew tap for [minibox](https://github.com/kyson-dev/sing-helm).

## Installation

```bash
brew tap kyson-dev/sing-helm
brew install sing-helm
```

## Usage

After installation:

```bash
# Check version
sing-helm version

# Start service
sudo sing-helm run

# Enable autostart
sudo sing-helm autostart on
```

## Updating

The formula is automatically updated when a new version is released.

To update manually:

```bash
brew update
brew upgrade sing-helm
```
