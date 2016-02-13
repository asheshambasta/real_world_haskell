-- file: ch07/toupper-imp.hs
import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
    inh     <- openFile "input.txt" ReadMode
    outh    <- openFile "output.txt" WriteMode
    mainLoop inh outh
    hClose inh
    hClose outh

mainLoop :: Handle -> Handle -> IO ()
mainLoop inh outh = do
    eof <- hIsEOF inh
    if eof
        then return ()
        else do inpStr <- hGetLine inh
                hPutStrLn outh (map toUpper inpStr)
                mainLoop inh outh
