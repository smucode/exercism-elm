module RunLengthEncoding exposing (..)

import Char exposing (..)


version : Int
version =
    2


decode : String -> String
decode string =
    rlDecode "" (String.toList string)


rlDecode : String -> List Char -> String
rlDecode num string =
    case string of
        [] ->
            ""

        curr :: rest ->
            if Char.isDigit curr then
                rlDecode (num ++ String.fromChar curr) rest
            else
                String.repeat (Result.withDefault 1 (String.toInt num)) (String.fromChar curr) ++ rlDecode "" rest


encode : String -> String
encode string =
    rlEncode "" 0 (String.split "" string)


rlEncode : String -> Int -> List String -> String
rlEncode prev num string =
    case string of
        [] ->
            printNum num ++ prev

        curr :: rest ->
            if curr == prev then
                rlEncode prev (num + 1) rest
            else
                printNum num ++ prev ++ rlEncode curr 1 rest


printNum : Int -> String
printNum num =
    if num > 1 then
        toString num
    else
        ""
