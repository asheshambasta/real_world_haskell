--file: ch07/actions2.hs
strToMessage :: String -> String
strToMessage = (++) "data: "

strToAction :: String -> IO ()
strToAction = putStrLn . strToMessage

numbers = [1..10]

main = do
    strToAction "starting"
    mapM_ (strToAction . show) numbers
    strToAction "done."
