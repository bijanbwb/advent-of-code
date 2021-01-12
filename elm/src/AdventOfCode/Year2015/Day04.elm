module AdventOfCode.Year2015.Day04 exposing
    ( rawInput
    , run
    )

-- IMPORTS

import MD5



-- INPUT


rawInput : String
rawInput =
    "yzbqklnj"



{- numberOfAttemptsToRun

   Number of brute force attempts to use to generate results.
-}


numberOfAttemptsToRun : List Int
numberOfAttemptsToRun =
    List.range 1 1000000



-- RUN


run : List ( Int, String )
run =
    numberOfAttemptsToRun
        |> List.map generateAttempt
        |> List.map MD5.hex
        |> addIndices
        |> List.filter startsWithSixZeros



{-
   Each attempt is the input and a stringified integer.
   For example: "yzbqklnj" ++ "1"
-}


generateAttempt : Int -> String
generateAttempt =
    String.fromInt
        >> String.append rawInput


startsWithFiveZeros : ( Int, String ) -> Bool
startsWithFiveZeros ( _, result ) =
    String.startsWith "00000" result


startsWithSixZeros : ( Int, String ) -> Bool
startsWithSixZeros ( _, result ) =
    String.startsWith "000000" result


addIndices : List String -> List ( Int, String )
addIndices =
    List.indexedMap Tuple.pair
        >> List.map incrementIndex


incrementIndex : ( Int, String ) -> ( Int, String )
incrementIndex ( index, result ) =
    ( index + 1, result )



{- NOTES

   (1962625,"0000004b347bf4b398b3f62ace7cd301") Too low
-}
