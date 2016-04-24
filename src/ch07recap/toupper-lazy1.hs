-- file: ch07recap/toupper-lazy1.hs

import System.IO
import Data.Char(toUpper)

convToUpper :: Handle -> Handle -> IO ()
convToUpper inh outh =
    do
        inC <- hGetContents inh
        hPutStr outh (map toUpper inC)

main :: IO ()
main = do
    inh <- openFile "input.txt" ReadMode
    outh <- openFile "output-lazy.txt" WriteMode
    convToUpper inh outh
    hClose inh
    hClose outh
