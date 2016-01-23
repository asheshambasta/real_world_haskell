-- file: ch02/RoundToEven.hs
isOdd n = mod n 2 == 1

roundToEven n = if (isOdd n) then n - 1 else n
