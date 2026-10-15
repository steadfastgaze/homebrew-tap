# Taps

## Installation

Install a formula directly from the tap:

```bash
brew install steadfastgaze/tap/<formula>
```

Alternatively, add the tap first:

```bash
brew tap steadfastgaze/tap
brew install <formula>
```

See [Homebrew's documentation](https://docs.brew.sh) for more information.

## MoEspresso

`moespresso` installs the native Rust runtime. For older DeepSeek and Ornith
packages, install the Python/MLX runtime separately:

```sh
brew install steadfastgaze/tap/moespresso@3
"$(brew --prefix moespresso@3)/bin/moespresso" --help
```

The versioned formula is keg-only, so installing it does not replace the
default `moespresso` command.
