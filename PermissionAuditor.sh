#!/usr/bin/env bash
# Script 3: Disk and Permission Auditor (macOS Optimized)

DIRS=("/etc" "/var/log" "/Users" "/usr/bin" "/tmp" "$HOME/.gitconfig")

echo "=========================================="
echo "        Directory Audit Report            "
echo "=========================================="

for DIR in "${DIRS[@]}"; do
    if [ -e "$DIR" ]; then

        # macOS-safe metadata extraction
        PERMS=$(stat -f "%Sp" "$DIR")
        OWNER=$(stat -f "%Su" "$DIR")
        GROUP=$(stat -f "%Sg" "$DIR")

        # Size calculation
        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')

        printf "Path: %-25s | Perms: %-10s | Owner: %-10s | Group: %-10s | Size: %s\n" \
            "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"

    else
        echo "Path: $DIR does not exist on this system."
    fi
done

echo "------------------------------------------"

# Git config check
GIT_CONF="$HOME/.gitconfig"
if [ -f "$GIT_CONF" ]; then
    echo "[GIT] Global config found: $GIT_CONF"

    PERMS=$(stat -f "%Sp" "$GIT_CONF")
    OWNER=$(stat -f "%Su" "$GIT_CONF")

    echo "Permissions: $PERMS | Owner: $OWNER"
else
    echo "[GIT] No global Git config found at $GIT_CONF"
    echo "      Run: git config --global user.name 'Your Name'"
fi

echo "=========================================="

