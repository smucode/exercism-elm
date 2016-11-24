module WordCount exposing (..)

import Dict exposing (..)
import Regex exposing (..)


updateCount : Maybe Int -> Maybe Int
updateCount num =
    case num of
        Nothing ->
            Nothing

        Just num ->
            Just (num + 1)


updateDict : String -> Dict String Int -> Dict String Int
updateDict word memo =
    if word == "" then
        memo
    else if Dict.member word memo then
        Dict.update word updateCount memo
    else
        Dict.insert word 1 memo


wordCount : String -> Dict String Int
wordCount sentence =
    Regex.split All (regex "\\s") sentence
        |> List.map String.toLower
        |> List.map (Regex.replace Regex.All (regex "[^a-z0-9]") (\_ -> ""))
        |> List.foldr updateDict Dict.empty
