#!/usr/bin/env bash
# Custom mode for `rofi`, including box art images, with frequency tracking and sorting.
# Usage: rofi -modi games:/path/to/rgd_rofi.sh -show games -show-icons -kb-custom-1 'Control+Shift+space'

freq_file="$HOME/local/.rgd_freq"
mkdir -p "$(dirname "$freq_file")"
touch "$freq_file"

if ! command -v rgd >/dev/null 2>&1; then
    echo "Error: rgd command not found" >&2
    exit 1
fi

# Produce a stable alphanumeric key from a game title to avoid
# special-character issues in grep/awk pattern matching.
make_key() {
    printf '%s' "$1" | md5sum | cut -d' ' -f1
}

increment_frequency() {
    local game="$1"
    local key
    key=$(make_key "$game")
    local tmp_file="${freq_file}.tmp"

    if grep -q "^${key}"$'\t' "$freq_file"; then
        awk -F'\t' -v k="$key" -v g="$game" '
            BEGIN { OFS="\t" }
            $1 == k { $3 = $3 + 1; print; next }
            { print }
            END { }
        ' "$freq_file" > "$tmp_file"
        mv "$tmp_file" "$freq_file"
    else
        # key TAB title TAB count
        printf '%s\t%s\t1\n' "$key" "$game" >> "$freq_file"
    fi
}

get_frequency() {
    local key
    key=$(make_key "$1")
    local line
    line=$(grep "^${key}"$'\t' "$freq_file")
    if [ -n "$line" ]; then
        printf '%s' "$line" | cut -f3
    else
        echo "0"
    fi
}

rofi_list() {
    rgd list --fields="title,path-box-art,launch-command,path-game-dir" 2>/dev/null \
        | grep -Pv $'\t\t' \
        | while IFS=$'\t' read -r title icon cmd dir; do
            [ -z "$title" ] && continue
            freq=$(get_frequency "$title")
            # Encode title for safe transport through the sort stage using
            # base64 so newlines/tabs inside a title cannot break field parsing.
            title_b64=$(printf '%s' "$title" | base64 -w0)
            printf '%d\t%s\t%s\t%s\t%s\n' "$freq" "$title_b64" "$icon" "$cmd" "$dir"
        done \
        | sort -k1,1nr -k2,2 \
        | cut -f2- \
        | while IFS=$'\t' read -r title_b64 icon cmd dir; do
            title=$(printf '%s' "$title_b64" | base64 -d)
            printf '%s\000icon\037%s\037info\037%s\t%s\t%s\n' \
                "$title" "$icon" "$title" "$cmd" "$dir"
        done
}

case $ROFI_RETV in
    0)
        echo -en "\000use-hot-keys\037true\n"
        rofi_list
        ;;
    1)
        if [ -n "$ROFI_INFO" ]; then
            title=$(printf '%s' "$ROFI_INFO" | cut -d$'\t' -f1)
            cmd=$(printf '%s'   "$ROFI_INFO" | cut -d$'\t' -f2)
            increment_frequency "$title"
            [ -n "$cmd" ] && coproc sh -c "$cmd" > /dev/null 2>&1
        fi
        exit
        ;;
    10)
        if [ -n "$ROFI_INFO" ]; then
            dir=$(printf '%s' "$ROFI_INFO" | cut -d$'\t' -f3)
            if [ -n "$dir" ] && [ -d "$dir" ]; then
                coproc xdg-open "$dir" > /dev/null 2>&1
            else
                rofi_list
            fi
        fi
        exit
        ;;
    *) rofi_list ;;
esac
