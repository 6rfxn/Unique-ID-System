# 🌟 Unique ID System (22/11/25)

Also known as the **[Serial Number System](https://devforum.roblox.com/t/-/3192994)**.  
A lightweight and improved way to generate unique serial IDs. <br>
This is a very basic system, so please don’t expect anything advanced.. <br>
# NOTE : USE RBXL format I forgot to commit the rest 

---

## 📘 How to Use

Configure the system before using it:

```lua
return {
    --// Cooldown Configuration
    COOLDOWN = {
        COOLDOWN_DURATION = 2,
    },

    --// Unique ID Configuration
    UNIQUE_ID = {
        DATA_NAME = "SerialNumberData", -- DataStore name for storing unique IDs
        EXPIRATION_TIME = 3888000,      -- 45 days in seconds

        AUTO_SAVE = {
            ENABLED = true,             -- Enable/disable auto-saving
            INTERVAL = 300,             -- Auto-save every 5 minutes
            LIST = {                    -- Keys to auto-save
                "Test1",
                "Test2"
            }
        },

        FORCE_RETRIES = {
            ENABLED = true,             -- Retry on failure
            MAX_FORCE_RETRIES = 3,      -- Max retry attempts
        }
    }
}
```

## 🔧 API
```
local Unique = require(path.to.module)
Unique("Hi") --> Returns a Number or nil
```


