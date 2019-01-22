module Views.Errors exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msgs exposing (..)
import Model exposing (..)

-- END IMPORTS --

view : Model -> Html Msg
view model =
    if List.length model.errors > 0 then
        div [style "border-bottom" "1px solid black"]  
            (List.map (\error -> text (error ++ ", ") ) model.errors)
    else
        text ""