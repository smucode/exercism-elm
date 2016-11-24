module Pangram exposing (..)

import String exposing (contains, fromChar, toUpper)
import Char exposing (fromCode)
import List exposing (map, all)


alphabet : List Char
alphabet =
    map fromCode (List.range 65 90)


containsChar : String -> Char -> Bool
containsChar str char =
    contains (char |> fromChar) (str |> toUpper)


isPangram : String -> Bool
isPangram str =
    all (containsChar str) alphabet
