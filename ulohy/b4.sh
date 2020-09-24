#!/bin/bash

# Select numeric code and country name from each language file,
# then merge them into one list.
tail -n+2 countrycodes_en.csv | awk 'BEGIN {FS=";"} {print $4 " " $1}' > tmp_countries
tail -n+2 kodyzemi_cz.csv | awk 'BEGIN {FS=";"} {print $1 " " $4}' >> tmp_countries

# Print the number of duplicate lines
sort tmp_countries | uniq -d | cut -d" " -f2
