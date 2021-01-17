module AdventOfCode.Year2015.Day06Test exposing (suite)

import AdventOfCode.Year2015.Day06 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day06"
        [ shouldProcessInstruction "turn off 660,55 through 986,197"
        ]


shouldProcessInstruction : String -> Test
shouldProcessInstruction input =
    Test.test "shouldProcessInstruction " <|
        \_ ->
            let
                expectedInstruction =
                    { action = TurnOff, pair1 = Pair 660 55, pair2 = Pair 986 197 }
            in
            input
                |> run
                |> Expect.equal [ Ok expectedInstruction ]
