-- file: ch07/basicio-nodo.hs

main =
    putStrLn "yo name dawg?" >>
    getLine >>= (\name -> putStrLn $ "yo " ++ name ++ " dawg")
