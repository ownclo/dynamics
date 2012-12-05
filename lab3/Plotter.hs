-- This is just another simple plotting library.
-- 
-- Date: 25.09.12
-- Author: Sokolovskiy Roman

module Plotter (plot) where

plot :: String -> (Int, [Int], Int) -> String
plot fname xs = "#set terminal postscript enhanced color dashed\n" ++ 
                "#set output \"plotplot.eps\"\n" ++
                "set ylabel \"KOKOKOKO\" font \"Helvetica,16\"\n" ++
                "set xlabel \"KOKOKOKO\" font \"Helvetica,16\"\n" ++
                "r = 100\nset grid\n\n" ++
                "set style line 1 lt 1 lw 2 lc rgb \"blue\"\n" ++ 
                "set style line 2 lt 1 lw 2 lc rgb \"#006400\"\n" ++ 
                "set style line 3 lt 1 lw 2 lc rgb \"red\"\n\n" ++
                "plot " ++ "\""++fname++"\"" ++"\\\n"
                ++ plotCore xs

plotCore :: (Int, [Int], Int) -> String
plotCore (n, [x], 0) = "\t     ind 0 u " ++ show n ++ ":" ++ show x ++
                       " w p pt 7 ps 1 notitle,\\\n" ++
                       "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                       ":(r) title \"KOKOK\" s acs"

plotCore (n, [x], _) = "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                       " w p pt 7 ps 1 notitle,\\\n" ++
                       "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                       ":(r) title \"KOKOK\" s acs"

plotCore (n, (x:xs), 0) = 
                        "\t     ind 0 u " ++ show n ++ ":" ++ show x ++
                        " w p pt 7 ps 1 notitle,\\\n" ++
                        "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                        ":(r) title \"KOKOK\" s acs,\\\n" ++
                        plotCore (n, xs, 1)

plotCore (n, (x:xs), step) = 
                        "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                        " w p pt 7 ps 1 notitle,\\\n" ++
                        "\t\"\" ind 0 u " ++ show n ++ ":" ++ show x ++
                        ":(r) title \"KOKOK\" s acs,\\\n" ++
                        plotCore (n, xs, step + 1)
