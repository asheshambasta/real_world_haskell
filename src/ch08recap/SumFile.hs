-- abandoning the file name comment at this point.
main = do
    contents <- getContents
    print (sumFile contents)
    where sumFile = sum . map read . words
