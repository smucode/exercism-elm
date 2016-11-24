module ScrabbleScore exposing (..)

import Dict exposing (..)


pairs : Int -> String -> List ( String, Int )
pairs num str =
    List.map (\c -> ( c, num )) (String.split "" str)


scores =
    fromList
        ((pairs 1 "AEIOULNRST")
            ++ (pairs 2 "DG")
            ++ (pairs 3 "BCMP")
            ++ (pairs 4 "FHVWY")
            ++ (pairs 5 "K")
            ++ (pairs 8 "XJ")
            ++ (pairs 10 "QZ")
        )


score c =
    Maybe.withDefault 0 (Dict.get c scores)


scoreWord : String -> Int
scoreWord word =
    String.toUpper word
        |> String.split ""
        |> List.map score
        |> List.sum
