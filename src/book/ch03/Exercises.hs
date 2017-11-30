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


isListPalin xs = check1By1 xs (rev2 xs)
  where rev2 (x:xs) = rev2 xs ++ [x]
        rev2 []     = []
        check1By1 (x1:x1s) (x2:x2s) = (x1 == x2) && check1By1 x1s x2s
        check1By1 [] []             = True
        check1By1 _ []              = False
        check1By1 [] _              = False

