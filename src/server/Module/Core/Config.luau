return {
    --// Config For Cooldown 
    COOLDOWN = {
            COOLDOWN_DURATION = 2,
    },
    --// Config For Unique ID 
    UNIQUE_ID = {
        DATA_NAME = "Data", -- The name of the Data Store where unique IDs will be stored
        EXPIRATION_TIME = 3888000, -- 45 days in seconds,

        AUTO_SAVE = {
            ENABLED = true, -- Change to true if you want to enable auto saving
            INTERVAL = 300, -- 5 minutes in seconds
            LIST = {  -- List of keys to auto save ( example.. )
                "Test1",
                "Test2"
            }
        },
        FORCE_RETRIES = {
            ENABLED = true, -- Change to true if you want to enable force retries
            MAX_FORCE_RETRIES = 3, -- The maximum number of force retries
        }
    }
}
