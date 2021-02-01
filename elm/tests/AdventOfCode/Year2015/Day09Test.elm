module AdventOfCode.Year2015.Day09Test exposing (suite)

import AdventOfCode.Year2015.Day09 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day09"
        [ shouldWork "" ]


shouldWork : String -> Test
shouldWork input =
    Test.test "shouldWork" <|
        \_ ->
            input
                |> run
                |> Expect.equal 0
