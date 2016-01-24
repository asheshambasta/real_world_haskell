
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
