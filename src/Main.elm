module Main exposing (..)

import Browser
import Html exposing (Html)

import Model exposing (Model, initialModel)
import Msgs exposing (Msg)
import Update
import View

-- END IMPORTS --

main = Browser.document {
    init = init,
    view = View.view,
    update = Update.update,
    subscriptions = subscriptions
  }

init : () -> (Model, Cmd Msg)
init _ = (initialModel, Cmd.none) 

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none




