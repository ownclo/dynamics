set terminal postscript enhanced color dashed
set output "plot1.eps"
set ylabel "V" font "Helvetica,16"
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
				ind 0 u 1:14 w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 0 u 1:14:(r) title "V_gr exp" ls 1 s acs,\
			 "" ind 0 u 1:15  w p pt 7 ps 1 lc rgb "red" notitle,\
			 "" ind 0 u 1:15:(r) title "V_ph exp" ls 2 s acs,\
			 ""	ind 1 u 1:4 w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 1 u 1:4:(r) title "V_gr theory" ls 1 s acs,\
			 "" ind 1 u 1:5  w p pt 7 ps 1 lc rgb "#006600" notitle,\
			 "" ind 1 u 1:5:(r) title "V_ph theory" ls 2 s acs
