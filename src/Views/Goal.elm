module Views.Goal exposing (..)

import Html as H exposing (..)
import Html.Attributes as HA exposing (..)
import Html.Events exposing (onClick, onInput)

import Msgs exposing (..)
import Model exposing (..)

-- END IMPORTS --

goal : Goal -> Html Msg
goal g = 
    div [] [
        node "link" [ rel "stylesheet", href "../style/toggle.css" ] [],
        div [class "goal-name"] [text g.name],
        show_toggle g,
        div [class "goal-delete", onClick (DeleteGoal (ShowDialog g.id))] [text "delete"],
        hr [] []
    ]

create_goal : Model -> Html Msg
create_goal model =
    div [] [
        h1 [] [text "Create Goal"],
        input [
            type_ "text", 
            placeholder "Give a short description of your goal",
            onInput <| CreateGoal << Name
        ] [],
        select [onInput <| CreateGoal << Frequency] [
            option [value "daily"] [text "Daily"],
            option [value "weekly"] [text "Weekly"],
            option [value "monthly"] [text "Monthly"],
            option [value "monthly"] [text "Yearly"]
        ],
        button [
            class "round-button small-button", 
            onClick (CreateGoal (Create model.creating_goal))
        ] [text "+"]
    ]

show_toggle : Goal -> Html Msg
show_toggle g =
    div [class "goal-toggle-flip", onClick (InteractGoal (Flip g.id "2018-10-10"))] [ 
        input [type_ "checkbox", checked False] [],
        span [class "slider round"] []
    ]

deleted_goal: Model -> Html Msg
deleted_goal model =
    div [] [
        h1 [] [text "Delete Goal"],
        button [onClick (DeleteGoal (Delete model.deleting_goal))] [text "this instance"],
        button [onClick (DeleteGoal HideDialog)] [text "x"]
    ]