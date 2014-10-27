{-
Write factorial without using if

factorial 0 == 1 factorial 1 == 1 factorial 2 == 2 factorial 3 == 6 factorial 4 == 24
-}

factorial : Int -> Int
factorial n =
  case n of
    0 -> 1
    x -> n * factorial (x - 1)

main = flow down [ asText (factorial 0)
                 , asText (factorial 1)
                 , asText (factorial 2)
                 , asText (factorial 3)
                 , asText (factorial 4)
                 ]
