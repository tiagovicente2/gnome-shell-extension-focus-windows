UUID := focus-windows@tiagovicente2.github.com
ZIP := dist/$(UUID).shell-extension.zip

.PHONY: check package install uninstall clean

check:
	python3 -m json.tool metadata.json >/dev/null
	python3 -c 'import json; data = json.load(open("metadata.json")); assert data["uuid"] == "$(UUID)"; assert data["version"] > 0'
	@test -s extension.js
	@echo "Metadata and source checks passed"

package: check
	rm -rf dist
	mkdir -p dist
	gnome-extensions pack --force --out-dir dist .
	@test -f "$(ZIP)"
	@echo "Built $(ZIP)"

install: package
	gnome-extensions install --force "$(ZIP)"
	@echo "Log out and back in if GNOME Shell has not seen this UUID before."
	@echo "Then run: gnome-extensions enable $(UUID)"

uninstall:
	-gnome-extensions disable "$(UUID)"
	rm -rf "$(HOME)/.local/share/gnome-shell/extensions/$(UUID)"

clean:
	rm -rf dist
