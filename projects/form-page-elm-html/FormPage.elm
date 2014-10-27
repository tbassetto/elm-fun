import Window

---- MODEL ----

---- UPDATE ----

---- VIEW ----

---- INPUTS ----

-- wire the entire application together
main : Signal Element
main = lift2 scene state Window.dimensions
