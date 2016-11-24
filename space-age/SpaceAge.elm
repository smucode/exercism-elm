module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Int -> Float
ageOn planet age =
    let
        earthAge =
            toFloat age / 31557600
    in
        if planet == Earth then
            earthAge
        else if planet == Mercury then
            earthAge / 0.2408467
        else if planet == Venus then
            earthAge / 0.61519726
        else if planet == Mars then
            earthAge / 1.8808158
        else if planet == Jupiter then
            earthAge / 11.862615
        else if planet == Saturn then
            earthAge / 29.447498
        else if planet == Uranus then
            earthAge / 84.016846
        else
            earthAge / 164.79132
