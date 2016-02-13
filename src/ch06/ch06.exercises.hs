--file: ch06/ch06.exercises.hs

import Control.Arrow
roundSecond ::  (a, Double) -> (a, Int)
roundSecond = second round
