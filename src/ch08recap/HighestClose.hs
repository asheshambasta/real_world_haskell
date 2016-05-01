import qualified Data.ByteString.Lazy as L
import Data.List.Split(splitOn)

main = readFile "prices.csv" >>=
       \contents -> return  (maximum ((map ((\ l -> read (l !! 4) :: Float) . splitOn ",") . tail . lines) contents))
