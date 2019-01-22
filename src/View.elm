module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msgs exposing (..)
import Model exposing (..)
import Views.Goals as VGoals
import Views.Goal as VGoal
import Views.Dialogs  as VDialogs
import Views.Errors as VErrors

-- END IMPORTS --

type alias Document msg =
    { 
        title : String,
        body : List (Html msg)
    }

view: Model -> Document Msg
view model = 
    {
        title = "Main view",
        body =  [
            div [] [
                VErrors.view model,
                VGoals.view model,
                VGoal.create_goal model
            ],
            VDialogs.view model
        ] 
    } 