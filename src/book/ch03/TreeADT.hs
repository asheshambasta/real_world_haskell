-- file ch03/TreeADT.hs

data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)

data Tree2 a    = Node2 a (Maybe (Tree2 a)) (Maybe (Tree2 a))
                deriving (Show)

