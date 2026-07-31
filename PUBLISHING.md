# Publishing

The extension UUID is `focus-windows@tiagovicente2.github.com`. Do not change
it after the first GNOME Extensions submission.

## Release checklist

1. Update `version` in `metadata.json` to a new integer.
2. Update `version-name` to the matching semantic version.
3. Run `make clean check package`.
4. Install the archive and test link activation and an urgent window on GNOME.
5. Commit the release and create a matching tag, such as `v1.0.0`.
6. Push the branch and tag. GitHub Actions creates a GitHub release containing
   the extension archive.
7. Download the archive from the release and upload it at
   <https://extensions.gnome.org/upload/>.
8. Complete the GNOME Extensions review and update the README with the public
   extension page URL after approval.

## Submission notes

The archive contains only `metadata.json` and `extension.js`. The extension
uses GNOME Shell APIs, performs no network requests, collects no data, and has
no bundled dependencies or generated code.
