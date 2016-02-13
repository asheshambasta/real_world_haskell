--file: ch07/tempfile.hs
import System.IO
import System.IO.Error(catchIOError)
import System.Directory(getTemporaryDirectory, removeFile)
import Control.Exception(finally)

withTempFile :: String -> (FilePath -> Handle -> IO a) -> IO a
withTempFile pattern func =
    do
        tempDir <- catchIOError (getTemporaryDirectory) (\_ -> return ".")
        (tempfile, temph) <- openTempFile tempDir pattern
        finally (func tempfile temph)
            (do hClose temph
                removeFile tempfile)

myAction :: FilePath -> Handle -> IO ()
myAction tempName tempH =
    do
        putStrLn $ "starting... \nTempporary file at " ++ tempName
        pos <- hTell tempH
        putStrLn $ "initial pos " ++ (show pos)
        let tempData = [1..100]
        putStrLn $ "writing a line containing " ++ show (length tempData) ++ " bytes "
        hPutStrLn tempH (show tempData)

        newPos <- hTell tempH
        putStrLn $ "pos after writing " ++ (show newPos)
        hSeek tempH AbsoluteSeek 0
        contents <- hGetContents tempH
        putStrLn $ "contents \n" ++ contents
        putStrLn $ "haskell literal: "
        print contents


main :: IO ()
main = withTempFile "mytemp.txt" myAction
