-- file: ch06/colourderived.hs

data Colour = Red | Blue | Green | White
                deriving (Eq, Ord, Show, Read)
