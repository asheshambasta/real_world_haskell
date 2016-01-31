
-- file: ch05/PrettyStub.hs

module PrettyStub where

import SimpleJSON

data Doc =  ToBeDefined
            deriving (Show)

text :: String -> Doc
text txt = undefined

double :: Double -> Doc
double num = undefined


(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

