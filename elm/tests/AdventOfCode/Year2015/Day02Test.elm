module AdventOfCode.Year2015.Day02Test exposing (suite)

import AdventOfCode.Year2015.Day02 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day02"
        [ shouldReturnAreaForSinglePresent "2x3x4"
        , shouldReturnAreaForMultiplePresents "2x3x4\n1x1x10"
        , shouldProduceCorrectSolution rawInput
        ]


shouldReturnAreaForSinglePresent : String -> Test
shouldReturnAreaForSinglePresent input =
    Test.test "shouldReturnAreaForSinglePresent" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 58


shouldReturnAreaForMultiplePresents : String -> Test
shouldReturnAreaForMultiplePresents input =
    Test.test "shouldReturnAreaForMultiplePresents" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 101


shouldProduceCorrectSolution : String -> Test
shouldProduceCorrectSolution input =
    Test.test "shouldProduceCorrectSolution" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 1586300
