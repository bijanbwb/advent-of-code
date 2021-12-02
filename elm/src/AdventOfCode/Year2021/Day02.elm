module AdventOfCode.Year2021.Day02 exposing
    ( rawInput
    , run
    )

-- IMPORTS

import Parser exposing ((|.), (|=), DeadEnd, Parser)



-- MODEL


type alias Input =
    String


type alias State =
    { aim : Int
    , depth : Int
    , position : Int
    }


initialState : State
initialState =
    { aim = 0
    , depth = 0
    , position = 0
    }



-- RUN


run : Input -> Int
run =
    processInput
        >> processInstructions
        >> applyInstructionsToState initialState
        >> calculateResults



-- CALCULATE RESULTS


calculateResults : State -> Int
calculateResults state =
    state.depth * state.position



-- APPLY INSTRUCTIONS


applyInstructionsToState : State -> List (Result (List DeadEnd) Instruction) -> State
applyInstructionsToState =
    List.foldl applyInstructionToState


applyInstructionToState : Result (List DeadEnd) Instruction -> State -> State
applyInstructionToState instruction state =
    case instruction of
        Ok { action, magnitude } ->
            applyAction action magnitude state

        Err error ->
            let
                _ =
                    Debug.log "error" error
            in
            state



-- APPLY ACTIONS


applyAction : Action -> Magnitude -> State -> State
applyAction action magnitude state =
    case action of
        Down ->
            down magnitude state

        Forward ->
            forward magnitude state

        Up ->
            up magnitude state


down : Magnitude -> State -> State
down magnitude state =
    { state | aim = state.aim + magnitude }


forward : Magnitude -> State -> State
forward magnitude state =
    { state
        | position = state.position + magnitude
        , depth = state.depth + (state.aim * magnitude)
    }


up : Magnitude -> State -> State
up magnitude state =
    { state | aim = state.aim - magnitude }



-- PROCESS INPUT


processInput : String -> List String
processInput =
    String.trim
        >> String.lines



-- PROCESS INSTRUCTIONS


processInstructions : List String -> List (Result (List DeadEnd) Instruction)
processInstructions =
    List.map parseInstruction



-- PARSING


type alias Instruction =
    { action : Action
    , magnitude : Magnitude
    }


type Action
    = Down
    | Forward
    | Up


type alias Magnitude =
    Int


parseInstruction : String -> Result (List DeadEnd) Instruction
parseInstruction =
    Parser.run instructionParser


instructionParser : Parser Instruction
instructionParser =
    Parser.succeed Instruction
        |= actionParser
        |. Parser.spaces
        |= magnitudeParser


actionParser : Parser Action
actionParser =
    Parser.oneOf
        [ Parser.map (\_ -> Down) (Parser.keyword "down")
        , Parser.map (\_ -> Forward) (Parser.keyword "forward")
        , Parser.map (\_ -> Up) (Parser.keyword "up")
        ]


magnitudeParser : Parser Magnitude
magnitudeParser =
    Parser.int



-- INPUT


rawInput : String
rawInput =
    """
forward 4
down 8
down 8
up 2
up 7
forward 5
forward 5
up 7
down 6
down 3
down 1
forward 5
forward 9
up 2
down 9
forward 4
up 5
forward 7
down 2
forward 7
down 2
forward 4
up 3
down 9
up 8
down 2
down 6
up 1
forward 3
down 6
down 2
forward 9
up 1
forward 5
down 1
forward 2
up 2
forward 4
down 3
down 8
up 2
down 3
up 4
down 8
forward 7
forward 9
down 7
down 1
forward 5
up 3
down 6
down 6
forward 1
down 9
forward 6
forward 9
forward 2
forward 5
forward 7
down 1
up 6
up 7
forward 8
forward 6
forward 2
down 5
up 3
up 4
down 9
up 4
down 9
up 4
down 5
forward 3
down 8
up 2
down 2
forward 7
down 7
forward 6
down 2
forward 5
down 1
forward 9
down 9
down 5
forward 2
forward 3
forward 6
forward 1
down 8
forward 2
forward 1
forward 9
down 8
forward 8
up 1
up 2
forward 2
forward 7
down 2
up 9
forward 5
forward 5
up 5
down 1
up 8
forward 3
up 5
forward 2
up 8
up 7
forward 4
down 6
up 1
up 6
forward 5
down 8
forward 4
down 7
forward 5
down 4
down 9
forward 2
down 5
down 2
down 3
forward 8
down 8
down 2
down 5
down 6
up 8
down 1
up 7
up 4
up 1
up 6
forward 6
forward 6
forward 8
up 5
forward 4
forward 5
forward 3
down 8
forward 9
forward 6
forward 6
up 1
up 8
forward 2
up 9
down 1
up 7
up 3
down 3
forward 2
down 5
up 8
forward 3
up 5
down 3
down 3
up 7
forward 2
forward 3
forward 6
forward 9
up 3
forward 1
up 9
down 8
forward 5
down 8
forward 9
down 1
forward 7
forward 9
forward 2
down 6
up 6
down 2
down 1
forward 7
down 3
forward 3
down 3
forward 1
forward 6
forward 1
down 4
down 4
down 5
forward 3
forward 1
up 8
forward 7
down 6
up 6
down 5
up 6
down 3
down 8
down 9
forward 2
up 8
forward 1
forward 2
forward 7
forward 5
up 6
down 9
up 9
forward 7
forward 6
forward 7
down 8
down 6
forward 5
down 2
down 5
down 3
down 4
up 5
down 5
forward 7
forward 2
down 1
forward 6
up 8
down 3
down 5
down 3
forward 3
up 2
forward 9
forward 2
up 4
down 3
down 7
forward 9
forward 6
up 1
up 2
down 5
up 8
forward 9
forward 2
down 3
down 6
up 3
down 9
down 2
up 4
down 3
up 7
forward 3
up 9
down 3
down 9
down 1
down 1
forward 7
down 9
forward 3
up 6
down 8
down 3
forward 7
forward 1
up 4
forward 8
forward 1
forward 9
up 9
forward 4
up 2
down 6
down 5
down 8
down 2
down 4
forward 5
down 8
down 1
forward 5
forward 9
down 4
forward 5
forward 4
forward 4
up 6
down 7
down 2
forward 8
down 7
forward 7
forward 7
forward 3
down 3
forward 6
down 5
down 5
forward 3
down 7
up 3
up 6
forward 8
down 3
down 6
forward 5
forward 4
down 4
down 3
down 1
down 4
down 2
forward 1
forward 5
down 9
forward 8
down 7
forward 4
down 5
down 5
forward 7
forward 9
down 5
down 8
up 9
forward 1
down 9
up 1
down 8
forward 4
up 8
up 7
down 4
forward 2
forward 9
up 9
forward 4
forward 5
forward 5
forward 4
forward 4
down 8
forward 3
forward 3
forward 1
forward 7
forward 7
up 2
forward 9
down 8
forward 3
down 3
down 3
down 4
forward 9
forward 9
forward 7
forward 9
down 6
forward 6
down 4
forward 7
down 3
forward 2
down 9
down 9
up 2
down 7
down 6
up 5
forward 6
forward 5
down 9
forward 8
down 9
forward 9
down 7
up 8
forward 5
forward 1
down 5
forward 1
down 4
up 6
up 1
down 5
forward 3
down 1
up 7
down 8
up 5
down 8
up 6
forward 6
down 8
up 2
forward 5
down 5
down 7
down 7
forward 8
forward 6
forward 2
forward 3
forward 3
forward 9
down 7
up 8
up 1
forward 8
down 5
down 7
forward 2
down 9
down 5
down 5
forward 6
forward 1
forward 8
down 3
down 3
down 7
up 3
down 3
down 5
down 1
forward 3
forward 2
forward 4
forward 1
forward 3
forward 6
down 6
down 4
forward 2
down 8
up 1
down 7
down 6
down 3
down 6
forward 8
up 7
down 7
up 7
down 1
forward 2
forward 9
up 8
down 2
down 3
down 7
down 2
up 2
down 1
down 7
up 6
down 4
forward 9
down 8
down 1
forward 5
forward 1
up 7
up 9
up 9
down 5
down 7
down 2
down 6
down 3
forward 8
forward 4
up 3
down 9
up 3
down 6
up 8
forward 7
down 7
up 5
down 1
down 3
up 4
forward 2
down 7
down 3
down 7
up 1
forward 8
down 3
forward 7
down 8
forward 5
forward 8
down 8
up 4
up 8
forward 3
down 7
up 6
down 9
forward 4
forward 4
forward 3
up 4
down 4
down 7
forward 6
down 7
down 8
up 5
down 4
up 6
up 6
up 4
down 7
forward 7
up 4
down 2
up 2
forward 6
down 5
down 1
forward 2
up 1
down 4
up 2
down 7
down 5
up 5
forward 6
up 2
forward 2
up 9
up 4
down 1
down 3
up 7
up 5
down 9
down 2
forward 9
down 1
up 9
down 4
down 8
forward 3
forward 1
forward 4
forward 9
down 5
down 5
down 8
up 4
up 1
down 9
up 4
forward 9
up 1
forward 7
down 4
up 2
down 1
forward 9
down 9
down 2
forward 8
up 2
forward 6
down 1
up 9
down 3
down 2
down 8
down 2
forward 8
forward 2
forward 8
down 3
up 6
forward 5
forward 4
forward 7
forward 1
down 8
forward 7
down 9
up 7
up 5
forward 1
down 6
down 6
up 9
up 9
up 1
forward 1
forward 5
up 1
forward 2
down 8
up 9
forward 2
forward 8
down 2
up 5
up 9
down 5
forward 2
forward 4
forward 2
up 7
down 9
forward 5
down 1
down 6
up 1
forward 8
down 1
down 7
up 2
forward 4
down 2
up 6
forward 6
forward 3
down 3
forward 2
down 2
up 9
forward 2
up 1
down 9
down 4
up 8
forward 3
down 9
down 9
forward 9
forward 8
up 8
down 8
up 8
forward 4
down 9
up 5
forward 8
up 6
forward 7
up 6
down 2
down 3
forward 9
forward 5
down 6
forward 9
down 5
down 9
down 7
down 9
down 3
forward 4
forward 2
down 2
down 7
down 7
up 2
up 3
forward 6
up 7
forward 4
down 3
forward 2
down 1
down 8
forward 5
down 3
up 9
forward 2
forward 7
down 4
forward 1
forward 8
forward 9
forward 5
down 4
up 3
up 9
forward 6
forward 4
forward 9
down 3
forward 1
forward 9
down 9
down 5
forward 9
forward 4
down 3
down 9
down 5
up 6
up 5
forward 5
up 8
down 3
forward 7
up 3
forward 9
down 8
forward 2
forward 1
forward 9
down 9
forward 1
down 6
forward 7
up 3
forward 7
up 3
down 1
forward 5
forward 5
up 3
forward 2
down 3
forward 8
up 9
forward 7
down 7
forward 5
up 4
forward 8
down 1
up 4
down 2
forward 2
down 5
down 5
up 2
forward 1
down 3
down 8
forward 6
forward 6
down 5
up 4
down 7
down 9
up 9
forward 7
forward 4
down 7
down 5
down 2
down 9
down 6
down 7
up 6
up 7
up 6
down 4
forward 9
down 8
down 7
down 8
down 4
forward 5
forward 1
up 5
forward 5
forward 4
down 3
forward 8
down 7
down 9
up 1
down 1
up 8
up 6
down 9
up 9
down 9
forward 7
down 3
forward 6
down 6
forward 6
down 9
down 7
up 1
down 2
up 2
down 3
down 1
up 4
forward 3
down 3
up 8
down 3
forward 3
forward 6
forward 6
forward 6
forward 7
up 2
forward 6
forward 1
up 4
up 7
down 5
down 9
forward 6
down 4
forward 6
down 7
down 2
up 9
up 3
forward 8
forward 5
down 1
down 6
down 7
down 5
up 3
up 9
forward 2
forward 5
down 3
down 2
up 2
forward 6
forward 3
down 8
forward 7
up 6
forward 4
down 8
forward 6
down 7
forward 9
forward 6
forward 2
forward 4
up 5
up 1
forward 3
forward 2
up 3
down 4
down 3
down 1
up 8
forward 6
down 4
down 9
down 3
up 8
down 5
forward 2
down 3
up 7
down 3
up 1
up 1
up 2
up 1
forward 4
forward 1
forward 4
forward 3
forward 8
down 8
up 5
down 4
down 4
down 6
down 9
down 7
forward 5
forward 3
up 3
forward 6
forward 5
forward 2
forward 6
up 4
forward 2
up 3
down 2
forward 3
down 8
forward 1
forward 2
down 3
down 5
forward 6
forward 3
forward 6
up 3
forward 5
forward 3
forward 5
down 6
down 4
down 4
forward 3
forward 3
up 6
up 8
forward 5
forward 1
down 3
down 8
down 9
up 3
down 7
forward 4
forward 2
down 2
up 6
down 1
down 8
forward 3
up 1
down 7
down 7
down 5
forward 3
down 8
forward 3
down 7
down 5
up 2
forward 9
down 8
down 5
forward 3
forward 2
forward 7
up 8
down 2
down 5
down 8
down 9
down 9
down 1
up 4
forward 5
up 1
up 4
forward 1
down 1
down 7
up 9
up 7
down 5
down 9
down 9
down 8
forward 7
down 3
up 4
down 7
down 8
forward 7
forward 4
up 9
down 2
up 7
forward 5
down 3
forward 3
forward 5
forward 5
down 2
down 2
down 7
up 8
up 9
down 1
forward 9
forward 3
up 3
forward 9
up 2
down 7
down 3
forward 4
down 5
down 3
up 5
forward 4
    """
