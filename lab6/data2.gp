#set term push
#set term table
#set out "data2-smooth.txt"
#plot "data2.dat" u 1:2:(500) s acs
#set out
set terminal postscript enhanced color dashed
set output 'data2.1.ps'
set title "Ellipse Polarization"
set polar
set grid polar
set angles degrees
set xtics 0.5
set ytics 0.3
set size square
set xrange [-1:1]
set yrange [-1:1]
plot "./data2.dat" u 1:3 w l lt 1 lw 1 lc rgb "red" title "+30%"
set output "data2.2.ps"
set title "Ellipse Polarization"
plot "./data2.dat" u 1:2 w l lt 1 lw 1 lc rgb "blue" title "-30%"
