-- file: ch07recap/callingpure.hs

nameToReply :: String -> String
nameToReply name =
    "Pleased to meet you, " ++ name ++ ".\n" ++
    "Your name contains " ++ charCount ++ " characters."
    where charCount = show (length name)

main :: IO ()
main = do
    putStrLn "Greetings once again, what's your name?"
    inpStr <- getLine
    putStrLn (nameToReply inpStr)
