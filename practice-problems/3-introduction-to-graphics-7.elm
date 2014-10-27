{-
Put all of your animals in a list. Write a function coolest which finds the coolest animal.

coolest [cow, chicken, trex] == trex coolest [whale, mouse, tiger] == whale

These examples use my personal opinions of coolness. Your coolest function should decide what to do in the event of a coolness tie.
-}

type Animal = { specy:String, age:Int, coolness:String }

john : Animal
john = { specy = "fox", age = 6, coolness = "high" }
bernard : Animal
bernard = { specy = "mole", age = 1, coolness = "low" }
daniel : Animal
daniel = { specy = "dog", age = 5, coolness = "dope" }
lupin : Animal
lupin = { specy = "cat", age = 1, coolness = "over-9000" }


animals : [Animal]
animals = [john,bernard,daniel,lupin]

compareCoolness : Animal -> Animal -> Order
compareCoolness a b =
  -- WRONG, should compare on the coolness not age
  compare b.age a.age

coolest : [Animal] -> Animal
coolest list =
  head (sortWith compareCoolness list)

main = asText (coolest animals)
