#!/usr/bin/env bash
# Script 2: FOSS Package Inspector (FIXED - macOS compatible)

PACKAGE=${1:-"git"}

echo "=========================================="
echo "        FOSS Package Inspector            "
echo "=========================================="
echo "Checking package: $PACKAGE"
echo "------------------------------------------"

# Proper cross-platform check (NOT only brew)
if command -v "$PACKAGE" >/dev/null 2>&1; then
    echo "[SUCCESS] $PACKAGE is installed."
    echo ""
    echo "--- Package Details ---"

    # Try brew info if installed via Homebrew
    if command -v brew >/dev/null 2>&1 && brew list "$PACKAGE" &>/dev/null; then
        brew info "$PACKAGE" | grep -E "stable|HEAD|license" | head -5
    fi

    # Get version safely
    VERSION=$("$PACKAGE" --version 2>/dev/null | head -1)
    [ -n "$VERSION" ] && echo "Version    : $VERSION"

    # Better than which
    echo "Location   : $(command -v "$PACKAGE")"
    echo "-----------------------"

else
    echo "[WARNING] $PACKAGE is NOT installed."
    echo "Install it with: brew install $PACKAGE"
    echo ""
    # Debian/Ubuntu : sudo apt install $PACKAGE
    # Fedora/RHEL   : sudo dnf install $PACKAGE
fi

echo ""
echo "--- Open Source Philosophy Note ---"

case $PACKAGE in
    httpd|apache2)
        echo "Apache: The web server that built the open internet,"
        echo "proving decentralised hosting works at global scale."
        ;;
    mysql)
        echo "MySQL: Open source at the heart of millions of apps,"
        echo "a lesson in dual-licensing done right."
        ;;
    git)
        echo "Git: Linus Torvalds' solution to proprietary failure —"
        echo "built in 10 days, now used by millions worldwide."
        ;;
    vlc)
        echo "VLC: The traffic cone that plays anything, built by"
        echo "Paris students defying digital borders."
        ;;
    firefox)
        echo "Firefox: A nonprofit's fight to keep the web open"
        echo "and user-centric against corporate browser dominance."
        ;;
    python3|python)
        echo "Python: Shaped entirely by community consensus —"
        echo "the PSF license ensures it stays free for everyone."
        ;;
    *)
        echo "$PACKAGE: Another brick in the vast collaborative"
        echo "wall of free and open source software."
        ;;
esac

echo "=========================================="
