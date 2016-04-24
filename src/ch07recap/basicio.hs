-- file: ch07recap/basicio.hs

main = do
    putStrLn "Greetings! What's your name?"
    inpStr <- getLine
    putStrLn $ "Welcome to Haskell, " ++ inpStr ++ "!"
