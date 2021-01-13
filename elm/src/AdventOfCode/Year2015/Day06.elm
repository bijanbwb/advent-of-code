module AdventOfCode.Year2015.Day06 exposing (..)

{-

   - one million lights in a 1000x1000 grid
     - Lights in your grid are numbered from 0 to 999 in each direction
   - instructions on how to display the ideal lighting configuration
     - turn on
     - turn off
     - toggle inclusive range
       - given as coordinate pair (a, b) (c, d)
       - Each coordinate pair represents opposite corners of a rectangle

   For example:

       turn on 0,0 through 999,999 would turn on (or leave on) every light.
       toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
       turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.

   After following the instructions, how many lights are lit?
-}
-- IMPORTS

import Dict exposing (Dict)



-- MODEL


type alias Grid =
    Dict LightLocation LightState


type alias LightLocation =
    ( X, Y )


type alias X =
    Int


type alias Y =
    Int


type LightState
    = Off
    | On


initialGrid : Grid
initialGrid =
    Dict.empty
        |> Dict.insert ( 0, 0 ) Off


turnLightOn : LightLocation -> Grid -> Grid
turnLightOn lightLocation grid =
    Dict.update lightLocation (\state -> Just On) grid


turnLightOff : LightLocation -> Grid -> Grid
turnLightOff lightLocation grid =
    Dict.update lightLocation (\state -> Just Off) grid



{- RUN

   Takes in a series of instructions as a string and returns the total
   number of lights in an On state.

-}


run : String -> Int
run string =
    initialGrid
        -- |> processInstructions
        |> countNumberOfLightsOn


countNumberOfLightsOn : Grid -> Int
countNumberOfLightsOn grid =
    grid
        |> Dict.values
        |> List.filter ((==) On)
        |> List.length



-- PROCESS INPUT
-- PROCESS INSTRUCTIONS
-- INPUT


rawInput : String
rawInput =
    """
    """
