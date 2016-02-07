-- file: ch06/Newtype.hs

data DataInt = D Int
    deriving (Eq, Ord, Show)

newtype NewTypeInt = N Int
    deriving (Eq, Ord, Show)
