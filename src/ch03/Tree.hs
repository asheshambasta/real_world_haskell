-- file: ch03/Tree.hs

data Tree a =   Node a (Tree a) (Tree a)
                | Empty
                deriving (Show)

nodesAreSame (Node a _ _) (Node b _ _)
    | a == b    = Just a
nodesAreSame _ _ = Nothing

treeDepth curDepth Empty = curDepth
treeDepth curDepth (Node _ t1 t2) = max (treeDepth (curDepth + 1) t1) (treeDepth (curDepth + 1) t2)
