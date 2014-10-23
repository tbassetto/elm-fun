-- Take the three portraits from problem 1, and add the appropriate name beneath each one. It should start to look a bit like a row in a yearbook.

student picture name = flow down [ fittedImage 300 300 picture
                                 , plainText name
                                 ]

main = flow right [ student "http://elm-lang.org/yogi.jpg" "yogi.jpg"
                  , student "http://elm-lang.org/shells.jpg" "shells.jpg"
                  , student "http://elm-lang.org/imgs/mario/jump/right.gif" "mario.gif"
                  ]

{- Alternative using `collage`
photo position url =
  move position
    (toForm (image 300 260 url))

name position text =
  move position
    (toForm (plainText text))

main = collage 900 300 [ photo (-300, 0) "http://elm-lang.org/yogi.jpg"
                       , name (-300, -140) "yogi.jpg"
                       , photo (0, 0) "http://elm-lang.org/shells.jpg"
                       , name (0, -140) "shells.jpg"
                       , photo (300, 0) "http://elm-lang.org/imgs/mario/jump/right.gif"
                       , name (300, -140) "mario.gif"
                       ]
-}
