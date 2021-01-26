module AdventOfCode.Year2015.Day08Test exposing (suite)

import AdventOfCode.Year2015.Day08 exposing (..)
import Expect
import Test exposing (Test)



{-

      ## TODO

   ### Handle Hex Escape Sequences

      Handle hex escape sequences (\x plus two hex characters e.g. \x12)
      "\x27" is 6 characters of code, but the string itself contains just one - an
      apostrophe ('), escaped using hexadecimal notation.

   ### Test calls to run

      given the four strings above, the total number of characters of
      string code (2 + 5 + 10 + 6 = 23) minus the total number of characters in
      memory for string values (0 + 3 + 7 + 1 = 11) is 23 - 11 = 12.

-}


suite : Test
suite =
    Test.describe "Day08"
        [ shouldCountTotalCharactersForEmptyLine ""
        , shouldCountStringCharactersForEmptyLine ""
        , shouldCountTotalCharactersForSimpleLine "abc"
        , shouldCountStringCharactersForSimpleLine "abc"
        , shouldCountTotalCharactersForLineWithEscapeSequence "aaa\"aaa"
        , shouldCountStringCharactersForLineWithEscapeSequence "aaa\"aaa"

        -- , shouldCountTotalCharactersForLineWithHexCharacter "'"
        ]


shouldCountTotalCharactersForEmptyLine : String -> Test
shouldCountTotalCharactersForEmptyLine input =
    Test.test "shouldCountTotalCharactersForEmptyLine" <|
        \_ ->
            input
                |> countTotalCharacters
                |> Expect.equal 2


shouldCountStringCharactersForEmptyLine : String -> Test
shouldCountStringCharactersForEmptyLine input =
    Test.test "shouldCountStringCharactersForEmptyLine" <|
        \_ ->
            input
                |> countStringCharacters
                |> Expect.equal 0


shouldCountTotalCharactersForSimpleLine : String -> Test
shouldCountTotalCharactersForSimpleLine input =
    Test.test "shouldCountTotalCharactersForSimpleLine" <|
        \_ ->
            input
                |> countTotalCharacters
                |> Expect.equal 5


shouldCountStringCharactersForSimpleLine : String -> Test
shouldCountStringCharactersForSimpleLine input =
    Test.test "shouldCountStringCharactersForSimpleLine" <|
        \_ ->
            input
                |> countStringCharacters
                |> Expect.equal 3


shouldCountTotalCharactersForLineWithEscapeSequence : String -> Test
shouldCountTotalCharactersForLineWithEscapeSequence input =
    Test.test "shouldCountTotalCharactersForLineWithEscapeSequence" <|
        \_ ->
            input
                |> countTotalCharacters
                |> Expect.equal 10


shouldCountStringCharactersForLineWithEscapeSequence : String -> Test
shouldCountStringCharactersForLineWithEscapeSequence input =
    Test.test "shouldCountStringCharactersForLineWithEscapeSequence" <|
        \_ ->
            input
                |> countStringCharacters
                |> Expect.equal 7



{-
   shouldCountTotalCharactersForLineWithHexCharacter : String -> Test
   shouldCountTotalCharactersForLineWithHexCharacter input =
       Test.test "shouldCountTotalCharactersForLineWithHexCharacter" <|
           \_ ->
               input
                   |> countTotalCharacters
                   |> Expect.equal 6
-}
