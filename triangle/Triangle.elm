module Triangle exposing (..)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind x y z =
    if x <= 0 || y <= 0 || z <= 0 then
        (Err "Invalid lengths")
    else if x + y < z || y + z < x || z + x < y then
        (Err "Violates inequality")
    else if x == y && y == z then
        (Ok Equilateral)
    else if x == y || y == z || z == x then
        (Ok Isosceles)
    else
        (Ok Scalene)
