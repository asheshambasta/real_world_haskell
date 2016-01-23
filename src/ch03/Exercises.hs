-- file: ch03/Exercises.hs

import Data.List

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs] 

mean' [] = Nothing
mean' xs = Just ((sum xs) /(fromIntegral (length xs)))

listPalindrome xs = xs ++ (reverse xs)

isPalindrome :: [Int] -> Bool
isPalindrome xs = 
    foldl (&&) True equality
    where   zipped = zip (xs) (reverse xs)
            equality = [a == b | (a, b) <- zipped]

compareLists as bs = compare (length as) (length bs)

sortListOfLists :: [[a]] -> [[a]]
sortListOfLists xs = sortBy compareLists xs

intersperse' :: a -> [[a]] -> [a]
intersperse' s (l:[]) = l 
intersperse' s (l:ll) = l ++ [s] ++ (intersperse' s ll)
intersperse' _ [] = []

data Direction = RightTurn
                | LeftTurn
                | Straight
                deriving (Show)

data Point = Point {
    x :: Double,
    y :: Double
    } deriving (Show)

lineAngle :: Point -> Point -> Double
lineAngle a b = (atan2 (y b - y a) (x b - x a))

lineTurn :: Point -> Point -> Point -> Direction
lineTurn a b c
    | angle1 > angle2 = RightTurn
    | angle2 > angle1 = LeftTurn
    | otherwise = Straight
    where
        angle1 = lineAngle a b 
        angle2 = lineAngle b c


lineTurns (a:b:[]) = []
lineTurns (a:b:c:ds) = (lineTurn a b c) : (lineTurns ds)
lineTurns _ = []
