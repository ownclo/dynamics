set terminal postscript enhanced color dashed
set output "plot1.eps"
set ylabel "L(R)" font "Helvetica,16"
set xlabel "Distance R, mm"  font "Helvetica,16"
r = 100
set style line 1 lt 1 lw 1 lc rgb "black"
set style line 2 lt 1 lw 2 lc rgb "blue"
set style line 3 lt 1 lw 2 lc rgb "#006400"
set style line 4 lt 1 lw 2 lc rgb "red"
set grid
plot "datalast"\
	     ind 0 u 1:2 w lp ls 3 title "l0",\
	"" ind 0 u 1:3 w lp ls 4 title "l1",\
	"" ind 0 u 1:4 w lp ls 2 title "l2",\
	"" ind 0 u 1:5 w lp lt 1 lw 2 lc rgb "brown" title "l3"

