-- file: ch03/Guard.hs

fromMaybe defval maybeval = 
    case maybeval of 
        Just someval -> someval
        Nothing -> defval
