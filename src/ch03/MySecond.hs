-- file: ch03/MySecond.hs

safeSecond (_:s:_) = Just s
safeSecond _ = Nothing
