import System.Environment
import Control.Applicative
import Control.Monad
import Data.List
import Data.List.Split

type Matr a = [[a]]
type Block = Matr Double
type DBase = [Block]

-- Reader Functional
getBlock :: String -> Block
getBlock = transpose . map (map read . words) . lines

getDb :: String -> DBase
getDb xs = map getBlock . map (unlines . filter (notPrefixOf "#")  . lines)  $ splitOn "\n\n\n" xs
        where
          notPrefixOf x b = not (x `isPrefixOf` b)

-- Writer Functional
writeGP :: DBase -> String
writeGP [] = []
writeGP (x:xs) = writeGBlock (transpose x) ++ "\n\n" ++ writeGP xs

writeLT :: DBase -> String
writeLT [] = []
writeLT (x:xs) = writeLBlock x ++ "\n\n" ++  writeLT xs

writeGBlock :: Block -> String
writeGBlock = prettyWriter " " "\n"

writeLBlock :: Block -> String
writeLBlock = prettyWriter " & " "\\\\\n"

alterate :: Num a => String -> [a] -> String
alterate _ (x:[]) = show x
alterate sep (x:xs) = (show x) ++ sep ++ alterate sep xs

prettyWriter :: (Num a) => String -> String -> [[a]] -> String
prettyWriter sep term list = concat $ map (++ term) strs
                             where strs = map (alterate sep) list 
                                 

-- Processing Functional
mapBlock :: Int -> Int -> (a -> a -> a) -> Matr a -> Matr a 
mapBlock x1 x2 f block = zipWith f (block !! x1) (block !! x2) : block

core :: String -> DBase
core contents = let dBase = getDb contents
                    table = dBase !! 0 in
                          dBase

-- Testing Suite (further lab scripts)
test = do
    contents <- readFile "data"
    putStr . writeLT $ core contents

main = do
    args <- getArgs
    contents <- readFile (head args)
    print (core contents)
