--file: ch07/filter.hs
import Data.Char(toUpper)
main = interact (unlines . filter (elem 'a') . lines)

filtAUpper = interact (map toUpper . unlines . filter (elem 'a') . lines)
