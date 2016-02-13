-- file: ch07/toupper-lazy1.hs
import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
    inH <- openFile "input.txt" ReadMode
    outH <- openFile "output2.txt" WriteMode
    inpStr <- hGetContents inH
    let result = processData inpStr
    hPutStr outH result
    hClose inH
    hClose outH

processData :: String -> String
processData = map toUpper
