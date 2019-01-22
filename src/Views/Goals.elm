module Views.Goals exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import List
import Dict exposing (Dict)

import Views.Goal as VGoal
import Model exposing (..)
import Msgs exposing (..)

-- END IMPORTS --

view:  Model -> Html Msg
view model = 
    div [] [
        h1 [] [text "Goal List"],
        div [class "goal-box"] (List.map VGoal.goal (Dict.values model.goals))
    ]