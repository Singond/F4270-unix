#!/bin/bash
input="$1"
output="${1}-list.tex"

cat <<EOF > "$output"
\documentclass{article}
\begin{document}
Abecední seznam slov použitých v souboru \texttt{apollo}:
\begin{itemize}
EOF

grep -o '[A-Za-z]*' "$input" | tr "[A-Z]" "[a-z]" | sort | uniq | \
awk '{print "\\item{" $0 "}"}
	END {print "\\end{itemize}\nPočet jedinečných slov: " NR "."}' \
>> "$output"

cat <<EOF >> "$output"
\end{document}
EOF
