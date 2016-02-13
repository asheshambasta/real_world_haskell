-- file: ch06/JSONClass.hs
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}

import Control.Arrow (second)

type JSONError = String

class JSON a where
    toJValue :: a -> JValue
    fromJValue :: JValue -> Either JSONError a

instance JSON JValue where
    toJValue = id -- try `:t id`
    fromJValue = Right -- cryptic way of saying fromJValue x = Right x

instance JSON String where
    toJValue                    = JString
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

newtype JAry a = JAry {
    fromJAry :: [a]
} deriving (Eq, Ord, Show)

newtype JObj a = JObj {
    fromJObj :: [(String, a)]
}

data JValue =   JString String
                | JNumber Double
                | JBool Bool
                | JNull
                | JObject (JObj JValue)
                | JArray (JAry JValue)
--                 deriving ()

whenRight :: (b -> c) -> Either a b -> Either a c
whenRight _ (Left err)  = Left err
whenRight f (Right x)   = Right (f x)

mapEithers :: (a -> Either b c) -> [a] -> Either b [c]
mapEithers f (x:xs) = case mapEithers f xs of
                        Left err    -> Left err
                        Right ys    -> case f x of
                                        Left err'   -> Left err'
                                        Right y     -> Right (y:ys)
mapEithers _ []     = Right []

jAryFromJValue :: (JSON a) => JValue -> Either JSONError (JAry a)
jAryFromJValue (JArray (JAry a)) =
    whenRight JAry (mapEithers fromJValue a)
jAryFromJValue _ = Left "not a json array"

jAryToJValue :: (JSON a) => [a] -> [JValue]
jAryToJValue = JArray . JAry . map toJValue . fromJAry

instance (JSON a) => JSON (JAry a) where
    toJValue    = jAryToJValue
    fromJValue  = jAryFromJValue

listToJValues :: (JSON a) => [a] -> JValue
listToJValues = map toJValue

jValuesToJAry :: [JValue] -> JAry JValue
jValuesToJAry   = JAry

jAryOfJValuesToJValue :: JAry JValue -> JValue
jAryOfJValuesToJValue   = JArray

instance (JSON a) => JSON (JObj a) where
    toJValue = JObject . JObj . map (second toJValue) . fromJObj

    fromJValue (JObject (JObj o)) = whenRight JObj (mapEithers unwrap o)
        where unwrap (k, v) = whenRight ((,), k) (fromJValue v)
    fromJValue _ = Left "not a json object"
-- owing to the exasperatingly confusing nature of the book in dealing with the JSON stuff,
-- I stopped wasting my time on it from this point onwards. I'm moving on to the next chapter
-- and I will stick by trying to finish the book.
