set terminal postscript enhanced color dashed
set output 'data1.ps'
set title "Linear Polarization"
set polar
set grid polar
set angles degrees
set xtics 0.5
set ytics 0.3
set size square
set xrange [-1:1]
set yrange [-1:1]
plot "./data1.dat" w l lt 1 lw 2 lc rgb "red" notitle
