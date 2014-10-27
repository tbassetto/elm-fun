{-
Write product which gets the product of a list:

product [1,2,3] == 6 product [4,4] == 16 product [] == 1
-}

product list =
  case list of
    [] -> 1
    head :: tail -> head * (product tail)

main = asText [ product [1,2,3]
              , product [4,4]
              , product []
              ]
