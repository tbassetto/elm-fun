-- Draw a circle, rectangle, and triangle. Label each shape with their perimeter.

drawCircle color r (x, y) =
  move (x, y)
    (group [ filled color (circle r)
           , toForm (asText (truncate (2 * pi * r)))
           ])

drawRectable color w h (x, y) =
  move (x, y)
    (group [ filled color (rect w h)
           , toForm (asText (truncate (2 * (w + h))))
           ])

drawTriangle color r (x, y) =
  let side = 2 * r * sin (degrees (180 / 3)) in
  move (x, y)
    (group [ filled color (ngon 3 r)
           , toForm (asText (truncate (3 * side)))
           ])

main =
  collage 400 400
    [ drawCircle red 40 (100, 100)
    , drawRectable green 60 100 (-100, 100)
    , drawTriangle blue 40 (0, 0)
    ]
