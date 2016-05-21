import qualified Data.ByteString.Lazy as L
import Data.List.Split(splitOn)
import qualified Data.ByteString.Lazy.Char8 as LC

ugly = readFile "prices.csv" >>=
       \contents -> return  (maximum ((map ((\ l -> read (l !! 4) :: Float) . splitOn ",") . tail . lines) contents))

closing = readPrice . (!!4) . LC.split ','
readPrice :: LC.ByteString -> Maybe Int
readPrice str =
    case LC.readInt str of
        Nothing     -> Nothing
        Just (dollars, rest) ->
            case LC.readInt (LC.tail rest) of
                Nothing -> Nothing
                Just(cents, more) -> Just (dollars * 100 + cents)

highestClose = maximum . (Nothing:) . map closing . LC.lines

highestCloseFrom path = do
    contents <- LC.readFile path
    print (highestClose contents)
