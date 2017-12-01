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

intersperse sep []      = []
intersperse sep (x:[])  = x
intersperse sep (x:xs)  = x ++ [sep] ++ (intersperse sep xs)

data Tree a = Node a (Tree a) (Tree a)
            | Empty

treeDepth Empty     = 0
treeDepth (Node _ t1 t2)  = 1 + (max (treeDepth t1) (treeDepth t2))

data Point = Point {
    x :: Double,
    y :: Double
} deriving (Show)

data LineSlope = Slope Double
                | Inf
                deriving (Show)

pointSlope :: Point -> Point -> LineSlope
pointSlope (Point x1 y1) (Point x2 y2)
    | x1 == x2  = Inf
    | otherwise = Slope ((y2 - y1)/(x2 - x1))
