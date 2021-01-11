module AdventOfCode.Year2015.Day03Test exposing (suite)

import AdventOfCode.Year2015.Day03 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day03"
        [ shouldWork "input" ]


shouldWork : String -> Test
shouldWork input =
    Test.test "shouldWork" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 0
