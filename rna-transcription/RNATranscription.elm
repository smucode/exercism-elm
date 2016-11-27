module RNATranscription exposing (..)

import Dict exposing (..)


dnaToRna : Char -> Result Char String
dnaToRna dna =
    case dna of
        'G' ->
            Ok "C"

        'C' ->
            Ok "G"

        'T' ->
            Ok "A"

        'A' ->
            Ok "U"

        invalid ->
            Err invalid


concatOrErr memo item =
    Result.map2 (++) memo item


toRNA : String -> Result Char String
toRNA dna =
    String.toList dna
        |> List.map dnaToRna
        |> List.foldr concatOrErr (Ok "")
