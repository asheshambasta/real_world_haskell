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

