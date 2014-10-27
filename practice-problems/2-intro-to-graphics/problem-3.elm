-- Draw a circle, rectangle, and triangle. Choose the best colors.

main =
  collage 400 400
    [ move (100, 100) (filled red (circle 40))
    , move (-100, 100) (filled green (rect 60 100))
    , filled blue (ngon 3 40)
    ]
