module AdventOfCode.Year2015.Day09Test exposing (suite)

import AdventOfCode.Year2015.Day09 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day09"
        [ shouldParseLine "Tristram to AlphaCentauri = 34" ]


shouldParseLine : String -> Test
shouldParseLine input =
    Test.test "shouldParseLine" <|
        \_ ->
            input
                |> run
                |> Expect.equal 0
