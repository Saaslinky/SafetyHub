print("SAFETY HUB IS LIVE")
-- Safety Hub Master Logic
local SafetyHub = {}

-- Adaptive Deadzone (Calculates Intent vs. Drift)
local DRIFT_THRESHOLD = 0.15 
function SafetyHub:CalculateInput(vector)
    if vector.Magnitude < DRIFT_THRESHOLD then
        return Vector2.new(0,0)
    end
    return vector
end

-- Chat Safety Monitor
game:GetService("TextChatService").MessageReceived:Connect(function(result)
    local message = result.Text:lower()
    local triggers = {"discord.gg", "how old", "snapchat", "number?"}
    for _, phrase in ipairs(triggers) do
        if string.find(message, phrase) then
            warn("[SafetyHub] Flagged Interaction: " .. message)
        end
    end
end)

return SafetyHub
