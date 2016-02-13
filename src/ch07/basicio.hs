-- file: ch07/basicio.hs

main = do
    putStrLn "Greetings! Your name please?"
    inpStr <- getLine
    putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!"
