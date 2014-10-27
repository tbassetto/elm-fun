{-
Write everyOther which gets every other element of a list:

everyOther [1,2,3,4] == [1,3] everyOther ["Tom","Sue","Sam"] == ["Tom","Sam"] everyOther [] == []
-}

everyOther : [a] -> [a]
everyOther list =
  case list of
    [] -> []
    [x] -> [x]
    x :: y :: tail -> x :: everyOther tail

main = flow down [ asText (everyOther [1,2,3,4])
                 , asText (everyOther ["Tom","Sue","Sam"])
                 , asText (everyOther [])
                 ]
