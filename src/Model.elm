module Model exposing (..)

import Html exposing (Html)
import Dict exposing (..)

import DB exposing (..)

-- END IMPORTS --

initialModel = 
    {
        goals = Dict.fromList DB.goals, 
        creating_goal = 
            {
                id = -1, 
                name = "", 
                start_date = "",
                frequency = "daily",
                end_date = ""
            },
        deleting_goal = -1,
        showing_dialog = "",
        errors = []
    }

type alias Model = 
    {
        goals: Dict GoalId Goal,
        creating_goal : Goal,
        deleting_goal : Int,
        showing_dialog : String,
        errors : List String
    }

type alias Goal = 
    {
        id : GoalId,
        name : String,
        start_date : String,
        frequency : String,
        end_date : String
    }

type alias GoalId = Int