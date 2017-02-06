-- http://exercism.io/submissions/917fac8c5b5646059c1142189758d048


module Series exposing (slices)

import String


type alias Series =
    List (List Int)


slices : Int -> String -> Result String Series
slices sliceSize digits =
    if sliceSize <= 0 then
        Err "Invalid size: 0"
    else
        digits
            |> digitsToInts
            |> Result.map (numbersToSeries [] sliceSize)


digitsToInts : String -> Result.Result String (List Int)
digitsToInts digits =
    digits
        |> String.split ""
        |> List.map String.toInt
        |> combineResults


combineResults : List (Result x a) -> Result x (List a)
combineResults =
    List.foldr (Result.map2 (::)) (Ok [])


numbersToSeries : Series -> Int -> List Int -> Series
numbersToSeries series sliceSize numbers =
    if sliceSize > List.length numbers then
        List.reverse series
    else
        numbersToSeries
            ((List.take sliceSize numbers) :: series)
            sliceSize
            (List.drop 1 numbers)
