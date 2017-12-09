-- file book/ch04/Exercises.hs

safeHead (x:xs) = Just x
safeHead []     = Nothing

safeTail (x:xs) = Just xs
safeTail []     = Nothing

safeLast (x:[]) = Just x
safeLast []     = Nothing
safeLast (x:xs) = safeLast xs

safeInit (x1:x2:[]) = Just [x1]
safeInit (x:xs) =
  case safeInit xs of
    Nothing -> Just [x]
    Just remInit  -> Just (x : remInit)
safeInit []     = Nothing

isEven :: Int -> Bool
isEven x = (x `mod` 2) == 0

splitWith :: (t -> Bool) -> [t] -> [[t]]
splitWith func xs =
  let (pre, sub) = break notFunc xs
  in pre : case (pre, sub) of
    (_, [])     -> []
    (_, x:[])   -> [[x]]
    ([], sub)   -> [sub]
    _     -> splitWith func sub
  where notFunc = not . func

first xs = case xs of
  []    -> Nothing
  x:[]  -> Just x
  _     -> Nothing
