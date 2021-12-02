module AdventOfCode.Year2015.Day10Test exposing (suite)

import AdventOfCode.Year2015.Day10 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day10"
        [ shouldWork "" ]


shouldWork : String -> Test
shouldWork input =
    Test.test "shouldWork" <|
        \_ ->
            0
                |> Expect.equal 0
