-- file: ch07recap/basicio-nodo.hs

main :: IO ()
main =
    putStrLn "what your name dawg?" >>
    getLine >>=
    (\name -> putStrLn $ "yo dawg " ++ name)
