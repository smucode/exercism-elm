module Strain exposing (..)


filter : (a -> Bool) -> List a -> List a
filter fn list =
    case list of
        [] ->
            []

        x :: xs ->
            if fn (x) then
                x :: keep fn xs
            else
                keep fn xs


keep : (a -> Bool) -> List a -> List a
keep fn list =
    filter fn list


discard : (a -> Bool) -> List a -> List a
discard fn list =
    filter (\x -> not (fn (x))) list
