
-- file: ch05/SimpleJSON.hs

data JValue =   JString       String
                | JNumber   Double
                | JBool     Bool
                | JNull
                | JObject [(String, JValue)]
                | JArray [JValue]
                deriving (Eq, Ord, Show)

-- get an optional string from a JValue
getString :: JValue -> Maybe String
getString (JString s)   = Just s
getString _             = Nothing

-- other accessors
getInt :: JValue -> Maybe Int
getInt (JNumber n)  = Just (truncate n)
getInt _            = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber n)   = Just n
getDouble _             = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b)   = Just b
getBool _           = Nothing

getObject :: JValue -> Maybe JObject
getObject (JObject j)   = Just j
getObject _             = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray jvs)   = Just jvs
getArray _              = Nothing

isNull :: JValue -> Bool
isNull JNull    = True
isNull _        = False
