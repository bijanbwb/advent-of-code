module AdventOfCode.Year2020.Day01Test exposing (suite)

import AdventOfCode.Year2020.Day01 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day01"
        [ shouldProcessInput "1\n2\n3"
        , shouldFindTwoEntriesThatSumTo2020 "1\n2\n3\n2019"
        , shouldFindThreeEntriesThatSumTo2020 "1\n1999\n20"
        , shouldProduceCorrectSolutionForPartI rawInput
        , shouldProduceCorrectSolutionForPartII rawInput
        ]


shouldProcessInput : String -> Test
shouldProcessInput input =
    Test.test "shouldProcessInput" <|
        \_ ->
            let
                result =
                    processInput input
            in
            Expect.equal result [ 1, 2, 3 ]


shouldFindTwoEntriesThatSumTo2020 : String -> Test
shouldFindTwoEntriesThatSumTo2020 input =
    Test.test "shouldFindTwoEntriesThatSumTo2020" <|
        \_ ->
            let
                result =
                    input
                        |> processInput
                        |> findTwoEntriesThatSumTo2020
            in
            Expect.equal result (Just ( 1, 2019 ))


shouldFindThreeEntriesThatSumTo2020 : String -> Test
shouldFindThreeEntriesThatSumTo2020 input =
    Test.test "shouldFindThreeEntriesThatSumTo2020" <|
        \_ ->
            let
                result =
                    input
                        |> processInput
                        |> findThreeEntriesThatSumTo2020
            in
            Expect.equal result (Just ( 1, 1999, 20 ))


shouldProduceCorrectSolutionForPartI : String -> Test
shouldProduceCorrectSolutionForPartI input =
    Test.test "shouldProduceCorrectSolutionForPartI" <|
        \_ ->
            let
                result =
                    run 2 input
            in
            Expect.equal result 776064


shouldProduceCorrectSolutionForPartII : String -> Test
shouldProduceCorrectSolutionForPartII input =
    Test.test "shouldProduceCorrectSolutionForPartII" <|
        \_ ->
            let
                result =
                    run 3 input
            in
            Expect.equal result 6964490
