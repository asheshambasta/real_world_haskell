-- some exercises
listLen :: [a] -> Int
listLen []      = 0
listLen (x:xs)  = 1 + listLen xs

listSum :: Num t => [t] -> t
listSum (x:xs)  = x + listSum xs
listSum []      = 0


listAvg xs
  | len > 0  =  Just ((listSum xs)/(fromIntegral len))
  | otherwise = Nothing
  where len = listLen xs


listRev (x:xs)  = listRev xs ++ [x]
listRev []      = []

listPalin xs = xs ++ listRev xs

listPalin2 xs = xs ++ listRev2 xs
  where listRev2 (x:xs) = listRev2 xs ++ [x]
        listRev2 [] = []

