module AdventOfCode.Year2015.Day06Test exposing (suite)

import AdventOfCode.Year2015.Day06 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day06"
        [ shouldProcessInstruction "turn on 0,0 through 3,3"
        , shouldProcessMultipleInstructions "turn on 0,0 through 1,1\nturn off 0,0 through 1,1\ntoggle 0,0 through 1,1"
        , shouldProduceCorrectSolution rawInput
        ]


shouldProcessInstruction : String -> Test
shouldProcessInstruction input =
    Test.test "shouldProcessInstruction" <|
        \_ ->
            input
                |> run
                |> Expect.equal 16


shouldProcessMultipleInstructions : String -> Test
shouldProcessMultipleInstructions input =
    Test.test "shouldProcessMultipleInstructions" <|
        \_ ->
            input
                |> run
                |> Expect.equal 4


shouldProduceCorrectSolution : String -> Test
shouldProduceCorrectSolution input =
    Test.test "shouldProduceCorrectSolution" <|
        \_ ->
            input
                |> run
                |> Expect.equal 400410
