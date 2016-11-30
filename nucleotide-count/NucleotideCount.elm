module NucleotideCount exposing (..)


version : Int
version =
    2


type alias Nucleotides =
    { a : Int, c : Int, g : Int, t : Int }


countNucleotides : List Char -> Nucleotides -> Nucleotides
countNucleotides strand nucleotides =
    case strand of
        [] ->
            nucleotides

        nucleotide :: rest ->
            case nucleotide of
                'A' ->
                    countNucleotides rest { nucleotides | a = nucleotides.a + 1 }

                'C' ->
                    countNucleotides rest { nucleotides | c = nucleotides.c + 1 }

                'G' ->
                    countNucleotides rest { nucleotides | g = nucleotides.g + 1 }

                'T' ->
                    countNucleotides rest { nucleotides | t = nucleotides.t + 1 }

                _ ->
                    countNucleotides rest nucleotides


nucleotideCounts : String -> Nucleotides
nucleotideCounts strand =
    countNucleotides (String.toList strand) (Nucleotides 0 0 0 0)
