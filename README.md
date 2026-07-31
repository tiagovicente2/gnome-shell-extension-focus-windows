# Focus Windows

A small GNOME Shell extension that focuses windows GNOME would otherwise leave
in the background while displaying a **Window is ready** notification.

It responds to both windows that demand attention and windows marked as urgent.
There are no settings or background services.

> [!NOTE]
> This intentionally relaxes GNOME's focus-stealing protection. Applications
> requesting attention can interrupt your current work.

## Installation from source

Requirements: GNOME Shell 45–50, `gnome-extensions`, `make`, and Python 3.

```bash
make package
make install
```

Log out and back in after the first installation, then enable the extension:

```bash
gnome-extensions enable focus-windows@tiagovicente2.github.com
```

## Development

```bash
make check
make package
```

The extension archive is written to `dist/`.

See [PUBLISHING.md](PUBLISHING.md) for the release process.

## License

[GPL-3.0-or-later](LICENSE)
