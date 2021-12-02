module AdventOfCode.Year2021.Day01Test exposing (suite)

import AdventOfCode.Year2021.Day01 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day01"
        [ shouldProduceCorrectSolution rawInput
        ]

shouldProduceCorrectSolution : String -> Test
shouldProduceCorrectSolution input =
    Test.test "shouldProduceCorrectSolution" <|
        \_ ->
            input
                |> run
                |> Expect.equal 1103
