-- file: ch06/eqclasses.hs

class BasicEq a where
    isEqual :: a -> a -> Bool
