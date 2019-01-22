module DB exposing (..) 

import Dict 

goals = 
    [
        (0, {
            id = 0,
            name = "Morning Meditation",
            start_date = "2018-10-10",
            frequency = "daily",
            end_date = ""
        }),
        (1, {
            id = 1,
            name = "Read News",
            start_date = "2018-10-10",
            frequency = "daily",
            end_date = ""
        }),
        (2, {
            id = 2,
            name = "Guitar",
            start_date = "2018-10-10",
            frequency = "weekly",
            end_date = ""
        })
    ]

goal_dates = Dict.fromList [(0, ["2018-10-10", "2018-10-11"])]