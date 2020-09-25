#!/bin/bash
input="$1"

grep -o '[A-Za-z]*' "$input" | tr "[A-Z]" "[a-z]" | \
sort | uniq -c | sort -k1,1rn | head -n20 | \
awk '{print $2 " " $1}'
