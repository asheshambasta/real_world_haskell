module Paths_realworldhaskell (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/asheshambasta/Library/Haskell/bin"
libdir     = "/Users/asheshambasta/Library/Haskell/ghc-7.10.3-x86_64/lib/realworldhaskell-1.0"
datadir    = "/Users/asheshambasta/Library/Haskell/share/ghc-7.10.3-x86_64/realworldhaskell-1.0"
libexecdir = "/Users/asheshambasta/Library/Haskell/libexec"
sysconfdir = "/Users/asheshambasta/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "realworldhaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "realworldhaskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "realworldhaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "realworldhaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "realworldhaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
