-- file: musings/listSwap.hs

swp :: (Int, Int) -> [Int] -> [Int]
swp (x1, x2) xs = [(swp' (x1, x2) x) | x <- xs]
    where
        swp' (x1, x2) x = if (x == x1) then x2 else if (x == x2) then x1 else x
