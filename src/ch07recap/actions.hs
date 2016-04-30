-- file ch07recap/actions.hs

strToAction :: String -> IO ()
strToAction = putStrLn

strsToActions :: [String] -> [IO ()]
strsToActions = map strToAction

numbers :: [Int]
numbers = [1..10]

strings :: [String]
strings = map show numbers

actions :: [IO ()]
actions = strsToActions strings

runall :: [IO ()] -> IO ()
runall [] = return ()
runall (fAction:remActions) =
    do
    fAction
    runall remActions

main :: IO ()
main =
    do runall ((strsToActions . map show) [1..100])
