import Graphics.Input.Field as Field
import Graphics.Input as Input
import Window
import Text
import String

main : Signal Element
main = scene <~ Window.dimensions
              ~ lift4 form name.signal email.signal date.signal errors

-- State
state = { backgroundImage = "https://unsplash.imgix.net/reserve/QGXfT1CkRpmvlwtPpgul_IMG_0558.jpg?q=75&fm=jpg&s=25c25f99c3faba09b92aacf40a9e9de5",
          title = "JOIN THE CLOUD",
          description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec porttitor ipsum, id placerat erat. Donec lacinia maximus velit." }

-- Signals and Inputs
name   = Input.input Field.noContent
email  = Input.input Field.noContent
date   = Input.input Field.noContent
submit = Input.input ()

hasAttempted : Signal Bool
hasAttempted =
    let isPositive c = c > 0
    in  isPositive <~ count submit.signal

errors : Signal [String]
errors =
    let rawErrors = lift3 getErrors name.signal email.signal date.signal
    in keepWhen hasAttempted [] <| merge rawErrors (sampleOn submit.signal rawErrors)

getErrors : Field.Content -> Field.Content -> Field.Content -> [String]
getErrors name email date =
    let empty content = String.isEmpty content.string
        checks = [ (empty name , "Full name required.")
                 , (empty email, "Must enter your email address.")
                 , (empty date , "Must provide DoB.")
                 ]
        activeError (err,msg) = if err then Just msg else Nothing
    in
        filterMap identity <| map activeError checks

-- Display
scene : (Int, Int) -> Element -> Element
scene (w, h) form =
  layers
    [ background (w, h)
    , container w h middle (wrapper (w, h) form)
    ]

background : (Int, Int) -> Element
background (w, h) =
  fittedImage w h state.backgroundImage

wrapper : (Int, Int) -> Element -> Element
wrapper (w, h) form =
  let contentWidth = w - 200
      inner = content contentWidth form
    in container contentWidth (heightOf inner) midTop inner

content : Int -> Element -> Element
content w form =
  flow down [ title w
            , spacer w 10
            , description w
            , spacer w 10
            , positionForm form w
            ]

title : Int -> Element
title w =
  let text = width (w - 100) (centered (Text.color white (Text.height 64 (toText state.title))))
  in container w (heightOf text) middle text

description : Int -> Element
description w =
  let text = width (w - 300) (centered (Text.color white (Text.height 24 (toText state.description))))
  in container w (heightOf text) middle text

formWidth = 400

positionForm : Element -> Int -> Element
positionForm form w =
  let fields = form
  in container w (heightOf fields) middle fields

form : Field.Content -> Field.Content -> Field.Content -> [String] -> Element
form name' email' date' errors =
  flow down [ field "Enter your full name"      name.handle  name'
            , spacer formWidth 10
            , field "Enter your email address"  email.handle email'
            , spacer formWidth 10
            , field "Select your date of birth" date.handle  date'
            , spacer formWidth 10
            , showErrors errors
            , container formWidth 42 middle (size formWidth 42 (Input.button submit.handle () "Submit"))
            ]

field : String -> Input.Handle Field.Content -> Field.Content -> Element
field placeholder handle content =
  size formWidth 42 (Field.field Field.defaultStyle handle identity placeholder content)

showErrors : [String] -> Element
showErrors errs =
  flow down
    [ spacer 10 10
    , if isEmpty errs
        then spacer 0 0
        else flow down <| map (width 340 << centered << Text.color red << toText) errs
    ]
