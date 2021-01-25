module AdventOfCode.Year2015.Day05Test exposing (suite)

import AdventOfCode.Year2015.Day05 exposing (..)
import Expect
import Test exposing (Test)


suite : Test
suite =
    Test.describe "Day05"
        [ shouldDetectUnwantedSubstrings "ab"
        , shouldRejectStringWithUnwantedSubstrings "ab\naei11"
        , shouldDetectStringsWithThreeVowels "aei"
        , shouldKeepStringsWithThreeVowels "aei11\nxyz"
        , shouldDetectStringsWithRepeatedCharacter "11"
        , shouldKeepStringsWithRepeatedCharacters "aei11\naei"
        , shouldWorkForGivenExample "ugknbfddgicrmopn"
        , shouldWorkForGivenExample "aaa"
        , shouldWorkForGivenCounterExample "jchzalrnumimnmhp"
        , shouldWorkForGivenCounterExample "haegwjzuvuyypxyu"
        , shouldWorkForGivenCounterExample "dvszwmarrgswjxmb"
        , shouldDetectStringsWithPairOfLettersAppearingTwice "xyxy"
        , shouldDetectStringsWithPairOfLettersAppearingTwice "aabcdefgaa"

        -- , shouldRejectStringsWithOverlappingLetters "aaa"
        ]


shouldDetectUnwantedSubstrings : String -> Test
shouldDetectUnwantedSubstrings input =
    Test.test "shouldDetectUnwantedSubstrings" <|
        \_ ->
            input
                |> containsUnwantedStrings
                |> Expect.equal True


shouldRejectStringWithUnwantedSubstrings : String -> Test
shouldRejectStringWithUnwantedSubstrings input =
    Test.test "shouldRejectStringWithUnwantedSubstrings" <|
        \_ ->
            input
                |> run
                |> Expect.equal 1


shouldDetectStringsWithThreeVowels : String -> Test
shouldDetectStringsWithThreeVowels input =
    Test.test "shouldDetectStringsWithThreeVowels" <|
        \_ ->
            input
                |> containsThreeVowels
                |> Expect.equal True


shouldKeepStringsWithThreeVowels : String -> Test
shouldKeepStringsWithThreeVowels input =
    Test.test "shouldKeepStringsWithThreeVowels" <|
        \_ ->
            input
                |> run
                |> Expect.equal 1


shouldDetectStringsWithRepeatedCharacter : String -> Test
shouldDetectStringsWithRepeatedCharacter input =
    Test.test "shouldDetectStringsWithRepeatedCharacter" <|
        \_ ->
            input
                |> containsRepeatedCharacter
                |> Expect.equal True


shouldKeepStringsWithRepeatedCharacters : String -> Test
shouldKeepStringsWithRepeatedCharacters input =
    Test.test "shouldKeepStringsWithRepeatedCharacters" <|
        \_ ->
            input
                |> run
                |> Expect.equal 1


shouldWorkForGivenExample : String -> Test
shouldWorkForGivenExample input =
    Test.test ("shouldWorkForGivenExample" ++ input) <|
        \_ ->
            input
                |> run
                |> Expect.equal 1


shouldWorkForGivenCounterExample : String -> Test
shouldWorkForGivenCounterExample input =
    Test.test ("shouldWorkForGivenCounterExample" ++ input) <|
        \_ ->
            input
                |> run
                |> Expect.equal 0


shouldDetectStringsWithPairOfLettersAppearingTwice : String -> Test
shouldDetectStringsWithPairOfLettersAppearingTwice input =
    Test.test ("shouldDetectStringsWithPairOfLettersAppearingTwice" ++ input) <|
        \_ ->
            input
                |> containsPairOfLettersAppearingTwice
                |> Expect.equal True



{-
   shouldRejectStringsWithOverlappingLetters : String -> Test
   shouldRejectStringsWithOverlappingLetters input =
       Test.test ("shouldRejectStringsWithOverlappingLetters" ++ input) <|
           \_ ->
               input
                   |> containsPairOfLettersAppearingTwice
                   |> Expect.equal False
-}
