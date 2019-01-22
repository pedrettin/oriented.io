module TimeLine exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import List

import Views.Goal as VGoal
import Model exposing (..)
import Msgs exposing (..)

-- END IMPORTS --

view : Model -> Html Msg
view model =
    div [] []