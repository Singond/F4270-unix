#!/usr/bin/awk -f

BEGIN {
	# Use blank lines as the record separator. A record is the whole paragraph.
	RS=""
	# Keep the field separator to be whitespace. This will make each word
	# a field.

	# The maximum number of characters per line is given by the "width"
	# variable from the command line. The default is 80.
	if (width < 1) {
		totalwidth = 80
	} else {
		totalwidth = width
	}
}

# If this is not the first record (paragraph), insert a blank line
NR > 1 {print ""}

# Reflow each record (paragraph) to a maximum of totalwidth characters.
{
	# The contents of the current output line
	line = ""

	# Append fields (words) to the line as long as totalwidth is not exceeded
	for (i = 1; i <= NF; i++) {
		if (line == "") {
			# Always print at least one word on the line
			line = $i
		} else if ((length(line) + 1 + length($i)) <= totalwidth) {
			# Word will fit into the line: append it, separated by space
			line = (line " " $i)
		} else {
			# Word will not fit into the current line:
			# print the line and start over
			print line
			line = $i
		}
	}
	# Print the last line
	print line
}
