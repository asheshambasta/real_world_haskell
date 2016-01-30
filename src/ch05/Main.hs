module Main where

import SimpleJSON

main = print (JObject [("foo", JNumber 19), ("bar", JBool False)])
