module Anagram exposing (..)


sorted : String -> List Char
sorted str =
    String.toList str |> List.sort


stringMatchesCandidate : String -> String -> Bool
stringMatchesCandidate str can =
    let
        string =
            String.toLower str

        candidate =
            String.toLower can
    in
        if string == candidate then
            False
        else if (sorted string) /= (sorted candidate) then
            False
        else
            True


detect : String -> List String -> List String
detect string candidates =
    List.filter (stringMatchesCandidate string) candidates
