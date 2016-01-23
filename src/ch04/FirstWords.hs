-- file: ch04/FirstWords.hs

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)

main = mainWith myFunction
    where mainWith function = do
            args <- getArgs
            case args of
                [input, output] -> interactWith function input output
                _ -> putStrLn "error"

myFunction = firstWords

firstWords :: String -> String
firstWords text = unwords (map firstWord (lines text))

firstWord :: String -> String
firstWord line = case (words line) of
                [] -> ""
                x:_ -> x
