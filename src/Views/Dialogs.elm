module Views.Dialogs exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

import Model exposing (..)
import Views.Goal as VGoal
import Msgs exposing (..)

view: Model -> Html Msg
view model =
    case model.showing_dialog of
        "delete_goal" -> VGoal.deleted_goal model 
        _ -> div [] []