-- file: ch07recap/green.hs
import Data.Char(toUpper)

isGreen :: IO Bool
isGreen =
    putStrLn "is green your favourite colour?" >>
    getLine >>=
    (\ans -> return (((head . map toUpper) ans) == 'Y'))
