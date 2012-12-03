set terminal postscript enhanced color dashed
set output "plot1.eps"
set title "Perpendicularly positioned vibrator (Z axis)"
set ylabel "Normalized amplitude of an EMF" font "Helvetica,16"
set xlabel "z, mm" font "Helvetica,16"
#set key left bottom
#set ytics -1.5, 0.5
#set mytics 4
r = 0.5
# set xzeroaxis lw 1 lt 1 lc rgb "black"
set grid

set style line 1 lt 1 lw 2 lc rgb "blue"
set style line 2 lt 1 lw 2 lc rgb "red"
set style line 3 lt 1 lw 2 lc rgb "#006600"

plot "./data"\
				ind 0 u 1:3 w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 0 u 1:3:(r) title "{/Symbol f} = 0" ls 1 s acs,\
			 ""	ind 1 u 1:3 w p pt 7 ps 1 lc rgb "red" notitle,\
			 "" ind 1 u 1:3:(r) title "{/Symbol f} = 30" ls 2 s acs,\
			 ""	ind 2 u 1:3 w p pt 7 ps 1 lc rgb "#006600" notitle,\
			 "" ind 2 u 1:3:(r) title "{/Symbol f} = 60" ls 3 s acs
