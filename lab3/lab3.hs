import LabParser
import Plotter
import System.IO

normalize :: Double -> Double -> Double -> Double
normalize term = (\x y -> x/term)

laffki = "roma - kisulia"

core :: String -> DBase
core contents = let db = getDb contents
                    t3 = db !! 0 in
                        ((t3 !! 0) : (drop 5 $ 
                         t3 -: mapBlock 1 2 (\x y -> x/50) -: 
                               mapBlock 2 3 (\x y -> x/50) -: 
                               mapBlock 3 4 (\x y -> x/50) -: 
                               mapBlock 4 4 (\x y -> x/50))) : db

core2 :: String -> DBase
core2 contents = let db = getDb contents
                     t2 = db !! 1 in
                          [(head t2) : (drop 4 $
                           t2 -: mapBlock 1 1 (normalize 9.0) -:
                                 mapBlock 2 2 (normalize 29.0) -:
                                 mapBlock 3 3 (normalize 24.0))]

latexs = do
            contents <- readFile "data"
            writeFile "latexs.dat" (writeLT (getDb contents))

main = do
        -- contents <- readFile "rotDb"
        contents <- readFile "data"
        -- rotDb <- readFile "rotDb"
        -- writeFile "plot1.gp" (Plotter.plot "rotDb" (1, [2,3,4,5], 0))
        writeFile "plot3.dat" (writeGP $ core2 contents)
        writeFile "plot3.gp" (plot "plot3.dat" (1, [2,3,4], 0))
        writeFile "plot4-1.gp" (plot "plot4.dat" (1, [2], 0)) 
        writeFile "plot4-2.gp" (plot "plot4.dat" (1, [2], 0)) 
