-- file: ch03/MaybeTree.hs

data Tree a =   Node a (Maybe (Tree a)) (Maybe (Tree a))
                deriving (Show)
