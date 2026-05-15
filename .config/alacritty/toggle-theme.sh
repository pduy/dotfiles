#!/bin/bash

THEMES_DIR="$HOME/.config/alacritty/themes/themes"
SYMLINK_PATH="$HOME/.config/alacritty/theme.toml"
STATE_FILE="$HOME/.config/theme_mode"
THEME_FILE="$HOME/.config/alacritty/current_theme"
NVIM_CS_FILE="$HOME/.config/nvim_colorscheme"
NVIM_THEME_MAP="$HOME/.config/alacritty/nvim-theme-map"

get_current_theme() {
    local target
    target=$(readlink "$SYMLINK_PATH" 2>/dev/null)
    [ -n "$target" ] && basename "$target" .toml
}

detect_mode() {
    local theme="$1"
    if [[ "$theme" =~ (_light|_latte|_dawn|_day|light_) ]]; then
        echo "light"
    else
        echo "dark"
    fi
}

map_nvim_colorscheme() {
    local theme="$1"

    # Check user override map first (lines: alacritty_name=nvim_name)
    if [ -f "$NVIM_THEME_MAP" ]; then
        local mapped
        mapped=$(grep -m1 "^${theme}=" "$NVIM_THEME_MAP" 2>/dev/null | cut -d= -f2)
        [ -n "$mapped" ] && echo "$mapped" && return
    fi

    # Auto-derive: strip _light/_dark and any trailing variant suffix
    echo "$theme" | sed -E 's/_(light|dark)(_.+)?$//'
}

apply_theme() {
    local theme="$1"
    local theme_path="$THEMES_DIR/${theme}.toml"

    if [ ! -f "$theme_path" ]; then
        echo "Theme not found: $theme" >&2
        return 1
    fi

    ln -sf "$theme_path" "$SYMLINK_PATH"
    echo "$theme" > "$THEME_FILE"
    detect_mode "$theme" > "$STATE_FILE"
    map_nvim_colorscheme "$theme" > "$NVIM_CS_FILE"
    pkill -USR1 nvim 2>/dev/null
    echo "Applied: $theme ($(cat "$STATE_FILE")) | nvim: $(cat "$NVIM_CS_FILE")"
}

find_opposite() {
    local current="$1"
    local try

    # _dark <-> _light at end of name
    if [[ "$current" == *_dark ]]; then
        try="${current%_dark}_light"
        [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
    fi
    if [[ "$current" == *_light ]]; then
        try="${current%_light}_dark"
        [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
        # Also try base name without suffix (e.g., nord_light -> nord)
        try="${current%_light}"
        [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
    fi

    # _dark_ <-> _light_ in middle (e.g., everforest_dark_hard <-> everforest_light_hard)
    if [[ "$current" == *_dark_* ]]; then
        try="${current/_dark_/_light_}"
        [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
    fi
    if [[ "$current" == *_light_* ]]; then
        try="${current/_light_/_dark_}"
        [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
    fi

    # base <-> base_light (e.g., nord -> nord_light, tokyo_night -> tokyo_night_light)
    try="${current}_light"
    [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
    try="${current}_dark"
    [ -f "$THEMES_DIR/${try}.toml" ] && echo "$try" && return
}

cmd_toggle() {
    local current
    current=$(get_current_theme)
    [ -z "$current" ] && echo "No theme set" >&2 && return 1

    local opposite
    opposite=$(find_opposite "$current")
    if [ -n "$opposite" ]; then
        apply_theme "$opposite"
    fi
}

cmd_choose() {
    local current
    current=$(get_current_theme)
    local original="$current"

    local selected
    selected=$(ls "$THEMES_DIR"/*.toml 2>/dev/null | xargs -I{} basename {} .toml | sort | \
        fzf --prompt="Theme> " \
            --header="Current: ${current:-none} | ↑↓ to preview live | Enter to apply | Esc to cancel" \
            --preview="cat '${THEMES_DIR}'/{}.toml" \
            --preview-window=right:50% \
            --bind "focus:execute-silent(ln -sf '${THEMES_DIR}'/{}.toml '${SYMLINK_PATH}')")

    if [ -n "$selected" ]; then
        apply_theme "$selected"
    elif [ -n "$original" ]; then
        # Restore original theme on cancel
        ln -sf "$THEMES_DIR/${original}.toml" "$SYMLINK_PATH"
    fi
}

cmd_list() {
    local current
    current=$(get_current_theme)

    ls "$THEMES_DIR"/*.toml 2>/dev/null | xargs -I{} basename {} .toml | sort | while read -r theme; do
        if [ "$theme" = "$current" ]; then
            echo "* $theme"
        else
            echo "  $theme"
        fi
    done
}

case "${1:-toggle}" in
    toggle)  cmd_toggle ;;
    choose)  cmd_choose ;;
    set)     [ -z "$2" ] && echo "Usage: $0 set <theme>" >&2 && exit 1; apply_theme "$2" ;;
    list)    cmd_list ;;
    *)
        echo "Usage: $(basename "$0") [command]"
        echo ""
        echo "Commands:"
        echo "  toggle  - Switch between light/dark variants (default)"
        echo "  choose  - Interactive theme picker with live preview"
        echo "  set     - Apply a specific theme by name"
        echo "  list    - List all available themes"
        ;;
esac
