-- file: ch07/callingpure.hs

greetingFunc name = "wanna boogie " ++ name ++ " dawg?"

main = do
    putStrLn "Name, yo?"
    name <- getLine
    let greeting = greetingFunc name
    putStrLn greeting

