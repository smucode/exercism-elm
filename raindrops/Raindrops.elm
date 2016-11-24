module Raindrops exposing (..)


pling : Int -> ( Int, String )
pling num =
    if num % 3 == 0 then
        ( num, "Pling" )
    else
        ( num, "" )


plang : ( Int, String ) -> ( Int, String )
plang ( num, res ) =
    if num % 5 == 0 then
        ( num, res ++ "Plang" )
    else
        ( num, res )


plong : ( Int, String ) -> String
plong ( num, res ) =
    if num % 7 == 0 then
        res ++ "Plong"
    else if res == "" then
        toString num
    else
        res


raindrops : Int -> String
raindrops num =
    num
        |> pling
        |> plang
        |> plong
