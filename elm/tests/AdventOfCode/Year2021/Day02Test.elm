module AdventOfCode.Year2021.Day02Test exposing (suite)

import AdventOfCode.Year2021.Day02 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day02"
        [ shouldProduceCorrectSolution rawInput
        ]


shouldProduceCorrectSolution : String -> Test
shouldProduceCorrectSolution input =
    Test.test "shouldProduceCorrectSolution" <|
        \_ ->
            input
                |> run
                |> Expect.equal 1408487760
