--file: ch06/ch06.exercises.hs

import Control.Arrow

-- #1
roundSecond ::  (a, Double) -> (a, Int)
roundSecond = second round

-- #2
mkPair :: a -> b -> (a, b)
mkPair = (,)

mkTriple :: a -> b -> c -> (a, b, c)
mkTriple = (,,)
