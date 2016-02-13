--file: ch07/return2.hs
import Data.Char(toUpper)

isYes :: String -> Bool
isYes str = (toUpper . head $ str) == 'Y'

isGreen :: IO Bool
isGreen = putStrLn "green your favourite colour dawg?" >>
    getLine >>= (\str -> return (isYes str))

