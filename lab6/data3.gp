set terminal postscript enhanced color dashed
set output 'data3.ps'
set title "Ellyptic coefficient"
set xlabel "{/Symbol Y}"
set ylabel "r"
plot "./data3.dat" u 1:4 w l lt 1 lw 2 lc rgb "red" title "r=f({/Symbol Y})"
