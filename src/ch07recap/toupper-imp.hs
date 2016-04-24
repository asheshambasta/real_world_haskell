import System.IO
import Data.Char(toUpper)

main :: IO ()
main = do
    inh <- openFile "input.txt" ReadMode
    outh <- openFile "output.txt" WriteMode
    outToUpper inh outh
    hClose inh
    hClose outh

outToUpper :: Handle -> Handle -> IO ()
outToUpper inh outh = do
    ineof <- hIsEOF inh
    if ineof
        then return ()
        else do
            inpStr <- hGetLine inh
            hPutStrLn outh (map toUpper inpStr)
            outToUpper inh outh

