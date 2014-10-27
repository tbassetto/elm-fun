-- Starting with this example (http://elm-lang.org/edit/examples/Intermediate/Clock.elm), tweak the size and aesthetics until you end up with a nice clock.

main = lift clock (every second)

clock t = collage 400 400 [ filled black (circle 110)
                          , hand orange   100  t
                          , hand white 100 (t/60)
                          , hand white 60  (t/720) ]

hand clr len time =
  let angle = degrees (90 - 6 * inSeconds time)
  in  segment (0,0) (fromPolar (len,angle)) |> traced { defaultLine | cap <- Round, color <- clr, width <- 3 }
