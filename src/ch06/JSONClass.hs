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

doubleToJValue :: (Double -> a) -> JValue -> Either JSONError a
doubleToJValue f (JNumber v)    = Right (f v)
doubleToJValue _ _              = Left "not a json number"

instance JSON Int where
    toJValue    =   JNumber . realToFrac
    fromJValue  =   doubleToJValue round

instance JSON Integer where
    toJValue    =   JNumber . realToFrac
    fromJValue  =   doubleToJValue round

instance JSON Double where
    toJValue    =   JNumber
    fromJValue  =   doubleToJValue id
