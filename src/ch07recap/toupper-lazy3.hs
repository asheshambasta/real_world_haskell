import Data.Char(toUpper)

main :: IO ()
main = do
    inpStr <- readFile "input.txt"
    writeFile "output-lazy3.txt" (map toUpper inpStr)
