module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples num =
    List.range 1 (num - 1)
        |> List.filter (\n -> (List.any (\m -> n % m == 0) multiples))
        |> List.sum
