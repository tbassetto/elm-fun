{-
Write dropTom which takes Tom out of a list:

dropTom ["Sue","Tom","Bill"] == ["Sue","Bill"] dropTom ["Sam","Peter"] == ["Sam","Peter"]
-}

dropTom list =
  filter (\n -> n /= "Tom") list

main = asText [ dropTom ["Sue","Tom","Bill"]
              , dropTom ["Sam","Peter"]
              ]
