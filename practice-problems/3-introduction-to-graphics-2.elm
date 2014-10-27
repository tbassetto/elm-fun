{-
Write squareAll which squares every member of a list:

squareAll [1,2,3] == [1,4,9]
-}

squareAll list =
  map (\n -> n^2) list

main = asText (squareAll [1,2,3])
