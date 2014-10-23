-- Find portraits of three people you find interesting. Show all three images, flowing from left to right.

image url = fittedImage 300 300 url

main = flow right [ image "http://elm-lang.org/yogi.jpg"
                  , image "http://elm-lang.org/shells.jpg"
                  , image "http://elm-lang.org/imgs/mario/jump/right.gif"
                  ]
