-- file: ch06/JSONClass.hs
{-# LANGUAGE TypeSynonymInstances #-}

import SimpleJSON

type JSONError = String

class JSON a where
    toJValue :: a -> JValue
    fromJValue :: JValue -> Either JSONError a

instance JSON JValue where
    toJValue = id -- try `:t id`
    fromJValue = Right -- cryptic way of saying fromJValue x = Right x

instance JSON String where
    toJValue = JString
    fromJValue (JString str)    = Right str
    fromJValue _                = Left "not a string"
