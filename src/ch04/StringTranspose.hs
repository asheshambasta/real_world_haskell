-- file: ch04/StringTranspose.hs

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

myFunction = transposeText

transposeText :: String -> String
transposeText text = unlines (transpose' (lines text))

transpose' :: [String] -> [String]
transpose' sentences
    | not (all null sentences) = currentLine : (transpose' (map tail nonEmptySts))
    | otherwise = []
    where   currentLine = [x | x:_ <- nonEmptySts]
            nonEmptySts = filter (not.null) sentences
