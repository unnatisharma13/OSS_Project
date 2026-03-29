#!/bin/bash
# Script 5: The Open Source Manifesto Generator
# Author: Unnati Sharma
# Registration: 24BCE11097
# Course: Open Source Software
# Description: Interactively generates a personal FOSS manifesto
#              based on three user inputs and saves it to a .txt file.

echo "=========================================="
echo "   The Open Source Manifesto Generator    "
echo "=========================================="
echo "Please answer three quick questions:"
echo ""

# read -p: displays a prompt and waits for user input
# answer is stored in the variable that follows
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you in computing? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# date command: formats current date as Day Month Year
DATE=$(date '+%d %B %Y')

# String concatenation: combine static text with whoami output
# to create a unique filename per user
OUTPUT="manifesto_$(whoami).txt"

# > operator: creates or clears the file before writing
> "$OUTPUT"

# >> operator: appends each line to the file without overwriting
echo "--- MY OPEN SOURCE MANIFESTO ---"            >> "$OUTPUT"
echo "Date   : $DATE"                              >> "$OUTPUT"
echo "Author : $(whoami)"                          >> "$OUTPUT"
echo ""                                            >> "$OUTPUT"

# Variables $TOOL, $FREEDOM, $BUILD are embedded directly
# into strings — this is string concatenation in bash
echo "I believe that software is more than just code; it is shared human knowledge." >> "$OUTPUT"
echo "Every day I rely on $TOOL to get my work done, standing on the shoulders"      >> "$OUTPUT"
echo "of thousands of contributors who built it freely and shared it openly."        >> "$OUTPUT"
echo "To me the ultimate promise of open source is $FREEDOM —"                       >> "$OUTPUT"
echo "the guarantee that technology serves the user, not just the vendor."           >> "$OUTPUT"
echo "If given the opportunity, I would build $BUILD and release it under GPL v2,"  >> "$OUTPUT"
echo "ensuring it remains free forever for anyone who needs it."                     >> "$OUTPUT"
echo "Code is speech. Code is power. Let it be open."                               >> "$OUTPUT"
echo "--------------------------------"                                              >> "$OUTPUT"

# Alias concept demonstrated via comment:
# To run this script quickly from anywhere, add to ~/.zshrc on macOS:
# alias manifesto='~/path/to/script5_manifesto_generator.sh'
# On Linux add the same line to ~/.bashrc

echo ""
echo "[SUCCESS] Manifesto saved to: $OUTPUT"
echo ""
echo "--- Your Manifesto ---"
echo ""

# cat: reads and displays the contents of the output file
cat "$OUTPUT"
echo "=========================================="
