set terminal postscript enhanced color dashed
set output "plots2.eps"
set ylabel "Relative Delta" font "Helvetica,16"
set xlabel "Degree" font "Helvetica,16"
set key left bottom
set ytics -1.5, 0.5
set mytics 4
r = 0.5
set xzeroaxis lw 1 lt 1 lc rgb "black"
set grid

set style line 1 lt 1 lw 1 lc rgb "black"
set style line 2 lt 1 lw 2 lc rgb "blue"
set style line 3 lt 1 lw 2 lc rgb "#006400"
set style line 4 lt 1 lw 2 lc rgb "red"

plot "./Data-2"\
				ind 2 u 1:5:3  w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 2 u 1:5:(r) title "r =   8mm" ls 2 s acs,\
			 "" ind 2 u 1:8:3  w p pt 7 ps 1 lc rgb "#006400" notitle,\
			 "" ind 2 u 1:8:(r) title "r = 16mm" ls 3 s acs,\
			 "" ind 2 u 1:11:3 w p pt 7 ps 1 lc rgb "red" notitle,\
			 "" ind 2 u 1:11:(r) title "r = 32mm" ls 4s acs

