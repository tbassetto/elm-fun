fibonacci n =
  if | n == 0 -> 0
     | n == 1 -> 1
     | otherwise -> fibonacci (n - 1) + fibonacci (n - 2)

main = asText [ fibonacci 0
              , fibonacci 1
              , fibonacci 2
              , fibonacci 3
              , fibonacci 4
              , fibonacci 5
              , fibonacci 6 ]
-- The result should be [0,1,1,2,3,5,8]
