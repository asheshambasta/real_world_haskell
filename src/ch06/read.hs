-- file ch06/read.hs

main = do
        putStrLn "enter a double: "
        inpStr <- getLine
        let inpDouble = (read inpStr)::Double
        putStrLn ("Twice " ++ show inpDouble ++ " is " ++ show (inpDouble * 2))
