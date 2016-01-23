-- file: ch04/ch04.exercises.hs

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (h:_) = Just h

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail xs = Just (tail xs)

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = Just (last xs)

safeInit:: [a] -> Maybe [a]
safeInit xs =   case xs of
                [] -> Nothing
                ne -> Just (init xs)

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith pred xs = splitWith' pred [] xs

splitWith' :: (a -> Bool) -> [a] -> [a] -> [[a]]
splitWith' _ acc [] = [acc]
splitWith' pred acc (x:xs)
    | not (pred x) = if null acc
        then [x] : (splitWith' pred [] xs)
        else acc : [x] : (splitWith' pred [] xs)
    | otherwise = splitWith' pred (acc ++ [x]) xs
