-- filter as a fold
foldFilter :: (a -> Bool) -> [a] -> [a]
foldFilter pred arr = foldr step [] arr
    where step x acc =  if (pred x)
                        then x:acc
                        else acc

