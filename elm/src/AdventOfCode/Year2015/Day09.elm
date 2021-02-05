module AdventOfCode.Year2015.Day09 exposing
    ( rawInput
    , run
    )

{-
   Santa is delivering presents to new locations. What is the shortest distance
   he can travel to achieve this?

   ## Example

   London to Dublin = 464
   London to Belfast = 518
   Dublin to Belfast = 141

   The possible routes are therefore:

   Dublin -> London -> Belfast = 982
   London -> Dublin -> Belfast = 605
   London -> Belfast -> Dublin = 659
   Dublin -> Belfast -> London = 659
   Belfast -> Dublin -> London = 605
   Belfast -> London -> Dublin = 982

   The shortest of these is London -> Dublin -> Belfast = 605, and so the
   answer is 605 in this example.

   ## Steps

   - Parse rawInput string into Nodes (Locations) and Edges (Distances).
   - Find the shortest distance that visits each node in the graph.
     - can start and end at any two different locations.
     - must visit each location exactly once.
-}
-- MODEL
-- type alias Location =
--     -- Node
--     String
-- type alias Distance =
--     -- Edge
--     Int


type alias Model =
    Int



-- RUN


run : String -> Model
run _ =
    0



-- INPUT


rawInput : String
rawInput =
    """
Tristram to AlphaCentauri = 34
Tristram to Snowdin = 100
Tristram to Tambi = 63
Tristram to Faerun = 108
Tristram to Norrath = 111
Tristram to Straylight = 89
Tristram to Arbre = 132
AlphaCentauri to Snowdin = 4
AlphaCentauri to Tambi = 79
AlphaCentauri to Faerun = 44
AlphaCentauri to Norrath = 147
AlphaCentauri to Straylight = 133
AlphaCentauri to Arbre = 74
Snowdin to Tambi = 105
Snowdin to Faerun = 95
Snowdin to Norrath = 48
Snowdin to Straylight = 88
Snowdin to Arbre = 7
Tambi to Faerun = 68
Tambi to Norrath = 134
Tambi to Straylight = 107
Tambi to Arbre = 40
Faerun to Norrath = 11
Faerun to Straylight = 66
Faerun to Arbre = 144
Norrath to Straylight = 115
Norrath to Arbre = 135
Straylight to Arbre = 127
    """
