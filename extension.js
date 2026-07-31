/*
 * SPDX-FileCopyrightText: 2026 Tiago Vicente <tiagovicente2@gmail.com>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import {Extension} from 'resource:///org/gnome/shell/extensions/extension.js';

export default class FocusWindowsExtension extends Extension {
    enable() {
        const focusWindow = (_display, window) => {
            if (window && !window.skip_taskbar)
                Main.activateWindow(window, global.get_current_time());
        };

        this._signalIds = [
            global.display.connect('window-demands-attention', focusWindow),
            global.display.connect('window-marked-urgent', focusWindow),
        ];
    }

    disable() {
        for (const signalId of this._signalIds)
            global.display.disconnect(signalId);

        this._signalIds = null;
    }
}
