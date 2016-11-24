module Bob exposing (..)

import Regex

numbersOnly : String
numbersOnly = "^[1-9\\s,]*$"

uppercaseQuestion : String
uppercaseQuestion = "^[A-Z\\s,]*\\?$"

whitespace : String
whitespace = "^[\\s]*$"

equals : String -> String -> Bool
equals regex msg =
  Regex.contains (Regex.regex regex) msg == True

hey : String -> String
hey msg =
  if equals whitespace msg then
    "Fine. Be that way!"
  else if equals numbersOnly msg then
    "Whatever."
  else if not(equals uppercaseQuestion msg) && String.endsWith "?" msg then
    "Sure."
  else if String.toUpper msg == msg then
    "Whoa, chill out!"
  else
    "Whatever."
