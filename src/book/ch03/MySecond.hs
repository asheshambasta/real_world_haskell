-- file ch03/MySecond.hs

secondElem x:(x2:xs)    = Just x2
secondElem _            = Nothing
