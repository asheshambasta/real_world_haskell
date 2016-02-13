--file: ch07/actions.hs

strToAction :: String -> IO ()
strToAction inp = putStrLn ("data: " ++ inp)

listToActions :: [String] -> [IO ()]
listToActions = map strToAction

numbers :: [Int]
numbers = [1..100]

strings :: [String]
strings = map show numbers

actions :: [IO ()]
actions = listToActions strings

printIt :: IO ()
printIt = runall actions

runall :: [IO ()] -> IO ()
runall [] = return ()
runall (x:xs) = do
    x
    runall xs

main = do
    strToAction "Start..."
    printIt
    strToAction "done!"
