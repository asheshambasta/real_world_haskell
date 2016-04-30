-- file: ch07recap/output-lazy5.hs

import Data.Char(toUpper)

main = interact (map toUpper . (++) "your data in uppercase is: \n\n")
