set terminal postscript enhanced color dashed
set output "plot4-1.eps"
set ylabel "{/Symbol q}" font "Helvetica,16"
set xlabel "d/{/Symbol l}" font "Helvetica,16"
r = 100
set grid

f(x) = a*(x**2) + b*x + c
fit f(x) 'plot4.data' index 0 u 1:2 via a, b, c

set style line 1 lt 1 lw 2 lc rgb "blue"
set style line 2 lt 1 lw 2 lc rgb "#006400"
set style line 3 lt 1 lw 2 lc rgb "red"

plot [0:1][0:] "plot4.data"\
	     ind 0 u 1:2 w lp ls 1 title "experimental points",\
         f(x) title "approximated curve" lt 1 lw 1 lc rgb "red"
#	"" ind 0 u 1:2:(r) title "KOKOK" s acs

pause -1
