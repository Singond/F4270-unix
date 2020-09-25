set style data histograms
set style histogram gap 1
set style fill solid 2
set xtics in rotate by 45 right
set title "Výskyt nejčetnějších slov v textu"
set ylabel "Počet výskytů"
set key off

set term pngcairo

plot "/dev/stdin" u 2:xtic(1)
