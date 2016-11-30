module Sublist exposing (..)


version : Int
version =
    2


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


contains : List Int -> List Int -> Bool
contains a b =
    if List.length a < List.length b then
        False
    else if List.take (List.length b) a == b then
        True
    else
        contains (List.drop 1 a) b


sublist : List Int -> List Int -> ListComparison
sublist a b =
    if a == b then
        Equal
    else if contains b a then
        Sublist
    else if contains a b then
        Superlist
    else
        Unequal
