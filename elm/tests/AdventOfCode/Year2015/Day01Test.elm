module AdventOfCode.Year2015.Day01Test exposing (suite)

import AdventOfCode.Year2015.Day01 exposing (..)
import Expect
import Test exposing (Test)



{-
   (()) and ()() both result in floor 0.
   ((( and (()(()( both result in floor 3.
   ))((((( also results in floor 3.
   ()) and ))( both result in floor -1 (the first basement level).
   ))) and )())()) both result in floor -3.

-}


suite : Test
suite =
    Test.describe "Day01"
        [ shouldProcessEmptyInstructions ""
        , shouldProcessSingleInstruction "("
        , shouldProcessMultipleInstructions ")(((((("
        , solution rawInput
        ]


shouldProcessEmptyInstructions : String -> Test
shouldProcessEmptyInstructions input =
    Test.test "should process empty instructions" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 0


shouldProcessSingleInstruction : String -> Test
shouldProcessSingleInstruction input =
    Test.test "should process single instruction" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 1


shouldProcessMultipleInstructions : String -> Test
shouldProcessMultipleInstructions input =
    Test.test "should process multiple instructions" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 5


solution : String -> Test
solution input =
    Test.test "should produce correct solution" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 138
