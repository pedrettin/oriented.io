module Msgs exposing (..)

import Model exposing (..)

-- END IMPORTS --

type Msg 
    = CreateGoal CreateGoal
    | DeleteGoal DeleteGoal
    | InteractGoal InteractGoal
   

type CreateGoal
    = Create Goal
    | Name String
    | Frequency String

type DeleteGoal
    = ShowDialog GoalId
    | Delete GoalId
    | HideDialog

type InteractGoal
    = Flip GoalId String