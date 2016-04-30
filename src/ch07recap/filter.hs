-- ch07recap/filter.hs

main = interact ((++) "the filtered lines are: \n" . unlines . filter (elem 'a') . lines)
