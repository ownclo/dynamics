set terminal postscript enhanced color dashed
set output "plot4.eps"
set title "Parallel position of vibrator (Y axis)"
set ylabel "Normalized amplitude of an EMF" font "Helvetica,16"
set xlabel "x, mm" font "Helvetica,16"
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
				ind 7 u 1:3 w p pt 7 ps 1 lc rgb "blue" notitle,\
			 "" ind 7 u 1:3:(r) title "{/Symbol f} = 30" ls 1 s acs,\
			 ""	ind 8 u 1:3 w p pt 7 ps 1 lc rgb "red" notitle,\
			 "" ind 8 u 1:3:(r) title "{/Symbol f} = 60" ls 2 s acs
