import Window
import Text
import Graphics.Input (Input, input)
import Graphics.Input.Field as Field

backgroundImage = "https://unsplash.imgix.net/reserve/QGXfT1CkRpmvlwtPpgul_IMG_0558.jpg?q=75&fm=jpg&s=25c25f99c3faba09b92aacf40a9e9de5"
name = "DOWNLOAD"
description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec porttitor ipsum, id placerat erat. Donec lacinia maximus velit."

email : Input Field.Content
email = input Field.noContent

emailField : Field.Content -> Element
emailField fieldContent = Field.field Field.defaultStyle email.handle identity "Email here!" fieldContent

display : (Int, Int) -> Field.Content -> Element
display (w, h) fieldContent =
    let texts = content (w, h) fieldContent in
    layers
        [ background (w, h)
        , container w h middle (color darkGrey (container w (heightOf texts) midTop texts))
        --, container w h middle << color darkGrey << container w (heightOf texts) midTop <| texts
        ]

background : (Int, Int) -> Element
background (w, h) =
    fittedImage w h backgroundImage

content : (Int, Int) -> Field.Content -> Element
content (w, h) fieldContent =
    flow down
        [ width w (centered (Text.color white (Text.height 40 (toText name))))
        , width w (centered (toText description))
        , emailField fieldContent
        ]

main : Signal Element
main = lift2 display Window.dimensions email.signal
{- Alternative: `main = display <~ Window.dimensions ~ email.signal` -}
