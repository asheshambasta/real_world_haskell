--file: ch02/myDrop.hs
myDrop :: Int -> [a] -> [a]
myDrop _ [] = []
myDrop n xs =   if n <= 0 
                then xs
                else myDrop (n - 1) (tail xs)
