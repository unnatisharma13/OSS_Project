#!/bin/bash
# Script 4: Log File Analyzer
# Author: Somya Neema
# Registration: 24BCE10486
# Course: Open Source Software
# Description: Reads a log file line by line, counts keyword
#              matches, and displays the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh [logfile] [keyword]
# Example: ./script4_log_analyzer.sh /var/log/system.log error

# Parameter expansion: use defaults if no arguments are passed
# macOS system log is at /var/log/system.log
# Linux equivalent default would be /var/log/syslog
LOGFILE=${1:-"/var/log/system.log"}
KEYWORD=${2:-"error"}
COUNT=0

echo "=========================================="
echo "           Log File Analyzer              "
echo "=========================================="
echo "Target File : $LOGFILE"
echo "Keyword     : '$KEYWORD'"
echo "------------------------------------------"

# if-then: validate that the file exists (-f = is a regular file)
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found or inaccessible."
    echo "Tip: Try running with sudo for protected log files."
    echo "     sudo ./script4_log_analyzer.sh $LOGFILE $KEYWORD"
    exit 1
fi

# if-then: check the file is not empty (-s = file has size > 0)
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: $LOGFILE exists but is empty."
    exit 0
fi

echo "Scanning..."
echo ""

# while-read loop: reads the file one line at a time
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash characters being interpreted
while IFS= read -r LINE; do

    # if-then inside loop: grep -iq does case-insensitive silent match
    if echo "$LINE" | grep -iq "$KEYWORD"; then

        # Arithmetic expansion: increment counter by 1
        COUNT=$((COUNT + 1))
    fi

done < "$LOGFILE"   # < redirects file as input to the while loop

echo "Result  : '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# Only show matches if at least one was found
if [ $COUNT -gt 0 ]; then
    echo "--- Last 5 matching lines ---"

    # grep -i = case insensitive search
    # tail -n 5 = show only the last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    echo "-----------------------------"
fi

echo "=========================================="
