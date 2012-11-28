set terminal postscript enhanced color dashed
set output "plot2.eps"
set ylabel "Alpha, dB" font "Helvetica,16"
set xlabel "Frequency, MHz" font "Helvetica,16"
#set key left bottom
#set ytics -1.5, 0.5
#set mytics 4
r = 0.5
set xzeroaxis lw 1 lt 1 lc rgb "black"
set grid

set style line 1 lt 1 lw 2 lc rgb "blue"
set style line 2 lt 1 lw 2 lc rgb "red"

plot "./init_data"\
				ind 0 u 1:13 w p pt 7 ps 1 lc rgb "red" notitle,\
			 "" ind 0 u 1:13:(r) title "Alpha exp" ls 2 s acs,\
			 ""	ind 1 u 1:7 w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 1 u 1:7:(r) title "Alpha theory" ls 1 s acs
