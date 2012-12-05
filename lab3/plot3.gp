#set terminal postscript enhanced color dashed
#set output "plotplot.eps"
set ylabel "KOKOKOKO" font "Helvetica,16"
set xlabel "KOKOKOKO" font "Helvetica,16"
r = 100
set grid

set style line 1 lt 1 lw 2 lc rgb "blue"
set style line 2 lt 1 lw 2 lc rgb "#006400"
set style line 3 lt 1 lw 2 lc rgb "red"

plot "plot3.dat"\
	     ind 0 u 1:2 w p pt 7 ps 1 notitle,\
	"" ind 0 u 1:2:(r) title "KOKOK" s acs,\
	"" ind 0 u 1:3 w p pt 7 ps 1 notitle,\
	"" ind 0 u 1:3:(r) title "KOKOK" s acs,\
	"" ind 0 u 1:4 w p pt 7 ps 1 notitle,\
	"" ind 0 u 1:4:(r) title "KOKOK" s acs