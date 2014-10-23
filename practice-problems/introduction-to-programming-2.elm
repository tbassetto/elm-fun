isIncreasing a b c = a < b && b < c

main = asText [ isIncreasing 1 2 3
              , isIncreasing 1 4 9
              , isIncreasing 1 4 0 ]
