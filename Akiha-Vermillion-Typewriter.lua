local Main = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/Misc/refs/heads/main/TypewriterFu.lua"))()

local repetitions = 0
local maxRepetitions = 3
local delayTime = 3 -- seconds

-- Define your texts in a table
local texts = {
    'Fatal souls get corrupted for a reason.', -- Text for the 1st execution
    'The shadows whisper ancient secrets.',    -- Text for the 2nd execution
    'Darkness consumes all, eventually.'       -- Text for the 3rd execution
}

local function executeTypeWrite()
    -- Check if we have more repetitions to do
    if repetitions < maxRepetitions then
        repetitions = repetitions + 1 -- Increment before use to get 1, 2, 3

        -- Get the current text based on the repetition number
        local currentText = texts[repetitions]

        -- Ensure we have a text for this repetition, though unlikely to be nil with our setup
        if currentText then
            Main:TypeWrite(
                currentText, --// The text is now dynamic!
                Color3.new(29,0,0), --// Main color (not outline)
                Color3.new(39,0,0), --// Outline Color (aka border text color)
                "rbxassetid://5093601873", --// Voice (set to "rbxassetid://0" to remove)
                60, --// makes the text rotate (higher = slower lower = faster)
                10, --// rotate multiplier (higher = rotates more you get the point bro)
                .3, --// if you use special chars (, ! ? ; it delays by that number)
                35, --// pos rotspeed for X axis
                35, --// pos rotspeed for Y axis
                .2, --// pos multiplier for X axis
                .2 --// pos multiplier for Y axis
            )
        else
            warn("No text defined for repetition number: " .. repetitions)
        end
    end
end

-- Initial call (for the 1st text)
executeTypeWrite()

-- Subsequent calls using a loop and task.wait (for the 2nd and 3rd texts)
for i = 1, maxRepetitions - 1 do
    task.wait(delayTime)
    executeTypeWrite()
end

print("Typewriter script sequence initiated with varied texts.")
