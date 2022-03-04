set term postscript eps enhanced color
set output "00.eps"
set size ratio -1
set xrange [-178:1253]
set yrange [-943:489]
set xlabel "x [m]"
set ylabel "y [m]"
plot "00.txt" using 1:2 lc rgb "#FF0000" title 'Ground Truth' w lines,"00.txt" using 3:4 lc rgb "#0000FF" title 'Radar Odometry' w lines,"< head -1 00.txt" using 1:2 lc rgb "#000000" pt 4 ps 1 lw 2 title 'Sequence Start' w points
