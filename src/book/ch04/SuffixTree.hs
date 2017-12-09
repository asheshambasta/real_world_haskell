-- file: ch04/SuffixTree.hs

suffixes xs@(_:xs') = xs : suffixes xs'
suffixes _          = []
