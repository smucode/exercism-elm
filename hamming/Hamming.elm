module Hamming exposing (..)


distance : String -> String -> Maybe Int
distance x y =
    if String.length x /= String.length y then
        Nothing
    else
        List.map2 (\x y -> ( x, y )) (String.toList x) (String.toList y)
            |> List.filter (\( x, y ) -> x /= y)
            |> List.length
            |> Just
