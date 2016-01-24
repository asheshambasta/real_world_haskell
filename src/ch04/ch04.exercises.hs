-- file: ch04/ch04.exercises.hs

import Data.Char (digitToInt)


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

type ErrorMessage = String
asIntFold :: String -> Either ErrorMessage Int
asIntFold ('-':xs) =    case (asIntFold xs) of
                        Right v -> Right (-v)
                        Left err -> Left err
asIntFold str
    | all (\x -> elem x ('-':['0'..'9'])) str = Right (fst t)
    | otherwise = Left "wrong digit(s)"
        where t = foldr (\x acc -> ((fst acc) + (digitToInt x) * (snd acc), (snd acc) * 10)) (0, 1) str

-- concat as foldr
concatFoldr :: [[a]] -> [a]
concatFoldr xs =    foldr step [] xs
                    where step x acc = x ++ acc

-- problem 4: takeWhile using explicit recursion
taker :: (a -> Bool) -> [a] -> [a] -> [a]
taker _ acc [] = acc
taker pred acc (x:xs)
    | pred x = taker pred (acc ++ [x]) xs
    | otherwise = acc

takeWhileExpl :: (a -> Bool) -> [a] -> [a]
takeWhileExpl pred xs = taker pred [] xs

-- problem 4: takeWhile using foldr
takeWhileFoldr :: (a -> Bool) -> [a] -> [a]
takeWhileFoldr pred xs = snd (foldr step (True, []) (reverse xs))
                    where step x (flag, acc)
                                            | flag && pred x = (True, acc ++ [x])
                                            | otherwise = (False, acc)

-- problem 5: groupBy using fold
groupByFold :: (a -> a -> Bool) -> [a] -> [[a]]
groupByFold _ [] = []
groupByFold pred (x : xs) = foldl step [[x]] xs
                            where
                            step acc x = if (all (\gx -> pred x gx) lastGroup)
                                    then previousGroups ++ [lastGroup ++ [x]]
                                    else acc ++ [[x]]
                                        where
                                        lastGroup = last acc
                                        previousGroups = init acc

-- problem 6: any using fold
anyFold :: (a -> Bool) -> [a] -> Bool
anyFold pred xs =   foldl step False xs
                    where step acc x = acc || (pred x)
