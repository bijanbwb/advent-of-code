module AdventOfCode.Year2015.Day03Test exposing (suite)

import AdventOfCode.Year2015.Day03 exposing (..)
import Expect
import Test exposing (Test)



{-
   > delivers presents to 2 houses: one at the starting location, and one to the east.
   ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
   ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.
-}


suite : Test
suite =
    Test.describe "Day03"
        [ shouldProduceCorrectSolution rawInput ]


shouldProduceCorrectSolution : String -> Test
shouldProduceCorrectSolution input =
    Test.test "shouldProduceCorrectSolution" <|
        \_ ->
            let
                result =
                    run input
            in
            Expect.equal result 2081
