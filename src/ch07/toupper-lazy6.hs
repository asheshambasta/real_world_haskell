--file: ch07/toupper-lazy6.hs
import Data.Char(toUpper)

main = interact ((++) "uppercased data: \n\n" . map toUpper)
