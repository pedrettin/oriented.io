module Update exposing (update)

import Dict exposing (..)
import Maybe exposing (..)

import Msgs exposing (..)
import Model exposing (..)

-- END IMPORTS --

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        CreateGoal args ->
            create_goal args model
        DeleteGoal args ->
            delete_goal args model
        InteractGoal args ->
            interact_goal args model

create_goal : CreateGoal -> Model -> (Model, Cmd Msg)
create_goal args model = 
    case args of
        Create goal ->
            let
                errors = check_goal goal
            in
                if List.length errors > 0 then
                    ({model| errors = errors}, Cmd.none)
                else
                    ({model| 
                        goals = Dict.insert goal.id goal model.goals, 
                        errors = []
                    }, Cmd.none)
        Name name -> 
            ({model | creating_goal = (set_name name model.creating_goal) }, Cmd.none)
        Frequency frequency -> 
            ({model | creating_goal = (set_frequency frequency model.creating_goal)}, Cmd.none)

delete_goal : DeleteGoal -> Model -> (Model, Cmd Msg)
delete_goal args model =
    case args of 
        ShowDialog goal_id ->
            ({model| showing_dialog = "delete_goal", deleting_goal = goal_id}, Cmd.none)
        Delete goal_id ->
            ({model | goals = Dict.remove goal_id model.goals}, Cmd.none)
        HideDialog ->
             ({model| showing_dialog = "none", deleting_goal = -1}, Cmd.none)

interact_goal : InteractGoal -> Model -> (Model, Cmd Msg)
interact_goal args model =
    case args of 
        Flip goal_id date -> 
            (model, Cmd.none)

check_goal : Goal -> List String
check_goal goal =
    if String.length goal.name > 0 then 
        []
    else 
        ["Name should be at least 1 character long"]

set_name : String -> Goal -> Goal
set_name name goal =
    {goal| name = name}

set_frequency : String -> Goal -> Goal
set_frequency frequency goal =
    {goal| frequency = frequency}

set_end_date : String -> Goal -> Goal
set_end_date end_date goal =
    {goal| end_date = end_date}