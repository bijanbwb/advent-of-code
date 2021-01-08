module Example exposing (suite)

import Main
import Test exposing (Test)
import Test.Html.Query
import Test.Html.Selector


suite : Test
suite =
    Test.describe "Main"
        [ Test.describe "main"
            [ Test.test "prints a Hello World message" <|
                \_ ->
                    let
                        message =
                            "Hello World!"
                    in
                    Main.main
                        |> Test.Html.Query.fromHtml
                        |> Test.Html.Query.has [ Test.Html.Selector.text message ]
            ]
        ]
