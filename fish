local config = {
    discordID = "798895543648387102",
    optimizer = true,
    webhookURL = "https://discord.com/api/webhooks/1239292402661855232/WRdEUnFX4VnWv3uRAUUdXk2JaAZWQN1ZnHYZzIRKwKlD5mpejOCKYYElNaNQlGyWauHb",
}

local HttpService = game:GetService("HttpService")
local encodedCollection
local Collection

while true do
    pcall(function()
        encodedCollection = request({Url = "https://biggamesapi.io/api/collection/Pets", Method = "GET",Headers = {["Content-Type"] = "application/json"}})
        Collection = game:GetService("HttpService"):JSONDecode(encodedCollection.Body)
    end)
    if Collection then break end
    task.wait(5)
end

-- RECONNECT
spawn(loadstring(game:HttpGet("https://gist.githubusercontent.com/AnigamiYT/d7ef2f539343b0d16e416d5f924ddfaa/raw/gistfile1.txt")))
local vim = game:GetService('VirtualInputManager')

spawn(function()
    while true do
        pcall(function()
            local virtualuser = game:GetService("VirtualUser")
            virtualuser:CaptureController()
            virtualuser:ClickButton2(Vector2.new())
            vim:SendKeyEvent(true, Enum.KeyCode.W, false, nil)
            task.wait(1)
            vim:SendKeyEvent(false, Enum.KeyCode.W, false, nil)
            task.wait(60)
        end)
    end
end)

repeat task.wait(1) until game:GetService("Players") and game:GetService("Players").LocalPlayer and game:GetService("VirtualUser")

-- ANTI-AFK
local virtualuser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    virtualuser:CaptureController()
    virtualuser:ClickButton2(Vector2.new())
end)
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Idle Tracking"].Enabled = false
game.Players.LocalPlayer.PlayerScripts.Scripts.Core["Server Closing"].Enabled = false

local Library = require(game.ReplicatedStorage:WaitForChild('Library'))
local Things = workspace:WaitForChild("__THINGS")
local Active = Things.__INSTANCE_CONTAINER:WaitForChild("Active")
local Player = game.Players.LocalPlayer
local character = Player.Character
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
local Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local RAPValues = getupvalues(Library.DevRAPCmds.Get)[1]
local FishingRemote = Network.Instancing_InvokeCustomFromClient
local TradingCmds = require(game.ReplicatedStorage.Library.Client.TradingCmds)

-- Constant Variables
local SHOP_SHOVELS = {
    "Wooden Fishing Rod",
    "Sturdy Fishing Rod",
    "Advanced Fishing Rod",
    "Super Fishing Rod",
    "Pro Fishing Rod",
    "Platinum Fishing Rod",
    "Emerald Fishing Rod",
    "Sapphire Fishing Rod",
    "Amethyst Fishing Rod",
}

local NEXT_SHOVEL_COST = {
    ["Wooden Fishing Rod"] = 100,
    ["Sturdy Fishing Rod"] = 2500,
    ["Advanced Fishing Rod"] = 25000,
    ["Super Fishing Rod"] = 40000,
    ["Platinum Fishing Rod"] = 150000,
    ["Emerald Fishing Rod"] = 425000,
    ["Sapphire Fishing Rod"] = 2250000,
}

local NEXT_SHOVEL = {
    ["Wooden Fishing Rod"] = "Sturdy Fishing Rod",
    ["Sturdy Fishing Rod"] = "Advanced Fishing Rod",
    ["Advanced Fishing Rod"] = "Super Fishing Rod",
    ["Super Fishing Rod"] = "Platinum Fishing Rod",
    ["Platinum Fishing Rod"] = "Emerald Fishing Rod",
    ["Emerald Fishing Rod"] = "Sapphire Fishing Rod",
    ["Sapphire Fishing Rod"] = "Amethyst Fishing Rod",
}

-- Low Graphics
local function LowGraphics()
    pcall(function()
        Lighting = game:GetService("Lighting")
        local Terrain = workspace:FindFirstChildOfClass('Terrain')
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
            elseif v:IsA("Decal") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            elseif v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            end
        end
        for i,v in pairs(Lighting:GetDescendants()) do
            if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
                v.Enabled = false
            end
        end
        workspace.DescendantAdded:Connect(function(child)
            task.spawn(function()
                if child:IsA('ForceField') then
                    game.RunService.Heartbeat:Wait()
                    child:Destroy()
                elseif child:IsA('Sparkles') then
                    game.RunService.Heartbeat:Wait()
                    child:Destroy()
                elseif child:IsA('Smoke') or child:IsA('Fire') then
                    game.RunService.Heartbeat:Wait()
                    child:Destroy()
                end
            end)
        end) 
    end)

    -- Low Processing
    for i, v in workspace:GetChildren() do
        pcall(function()
            if v.Name == "animate" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "PhantrancDGtp" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "ALWAYS_RENDERING" then
                v.Parent = game.ReplicatedStorage
            end
        end)
    end

    for i, v in pairs(Things:GetChildren()) do
        pcall(function()
            if v.Name == "Sounds" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "RandomEvents" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "Flags" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "Hoverboards" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "Booths" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "ExclusiveEggs" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "ExclusiveEggPets" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "BalloonGifts" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "Sprinklers" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "Eggs" then
                v.Parent = game.ReplicatedStorage
            end
        end)
        pcall(function()
            if v.Name == "ShinyRelics" then
                v.Parent = game.ReplicatedStorage
            end
        end)
    end

    pcall(function()
        workspace.__THINGS.__INSTANCE_CONTAINER.ServerOwned.Parent = game.ReplicatedStorage
    end)

    local entities = {
        "Stats", 
        "Chat", 
        "Debris",
        "CoreGui",
    }
    for _, entity in entities do
        pcall(function()
            for i, v in game[entity]:GetDescendants() do
                pcall(function() v:Destroy() end)
            end
        end)
    end
end

local function Optimizer()
    LowGraphics()

    -- OPTIMIZE FISHING
    workspace.Gravity = 0

    local Player = game.Players.LocalPlayer
    for i, v in Player.PlayerScripts:GetChildren() do
        pcall(function()
            v:Destroy()
        end)
    end

    for i, v in workspace:GetChildren() do
        if not (v.Name == "__THINGS" or v.Name == Player.Name)  then
            pcall(function()
                v:Destroy()
            end)
        end
    end

    for i, v in workspace.__THINGS:GetChildren() do
        if not (v.Name == "__INSTANCE_CONTAINER" or v.Name == "Instances") then
            pcall(function()
                v:Destroy()
            end)
        end
    end

    local Player = game.Players.LocalPlayer
    for i, v in Player.PlayerGui:GetDescendants() do
        pcall(function() v.Enabled = false end)
    end
end

-- Delete other player characters for less processing
spawn(function()
    while true do
        task.wait(30)
        for i, v in game.Players:GetPlayers() do
            if v ~= game.Players.LocalPlayer then
                pcall(function()
                    local Character = v.Character
                    Character:Destroy()
                end)
            end
        end
    end
end)

-- Set humanoidRootPart everytime player dies
Player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
end)

-- PLAYER LIST
local Player = game.Players.LocalPlayer
local sortedPlayers = game.Players:GetPlayers()
table.sort(sortedPlayers, function(a, b)
    return a.Name:lower() < b.Name:lower()
end)
game.Players.PlayerAdded:Connect(function(player)
    table.sort(sortedPlayers, function(a, b)
        return a.Name:lower() < b.Name:lower()
    end)
end)

local function getActive() return tostring(workspace.__THINGS.__INSTANCE_CONTAINER.Active:GetChildren()[1]) end
local function getCast()
    if getActive() == "Fishing" then
        return Vector3.new(1123.921 + math.random(-10, 10), 72, -3532.623 + math.random(-10, 10))
    elseif getActive() == "AdvancedFishing" then
        return Vector3.new(1322.391 + math.random(-10, 10), 61, -4454.638 + math.random(-10, 10)) end end
local function getDiamonds() return Player.leaderstats["💎 Diamonds"].Value end
local function getFishingRank() 
    local level = 1
    pcall(function() level = Library.MasteryCmds.GetLevel({_id = "Fishing"}) end)
    return level
end
local function getDeepPool() return Active[getActive()].Interactable:FindFirstChild("DeepPool") end
local function getFishingCoins()
    local save = Library.Save.Get().Inventory
    for i, v in pairs(save.Currency) do
        if v.id == "Fishing" then
            return v._am
        end
    end
    return 0
end

local function getCurrentRod()
    local fishRank = 0
    local currentRod = nil
    for i, v in pairs(Library.Save.Get().Inventory.Misc) do
        if string.find(v.id, "Rod") then
            local rodRank = table.find(SHOP_SHOVELS, v.id)
            if v.id == "Golden Fishing Rod" then
                currentRod = SHOP_SHOVELS[6]
                fishRank = 6
            elseif v.id == "Diamond Fishing Rod" then
                currentRod = SHOP_SHOVELS[8]
                fishRank = 8
            elseif rodRank > fishRank then
                currentRod = v.id
                fishRank = rodRank
            end
        end
    end
    return currentRod, fishRank
end

local function findItem(Id)
    local save = Library.Save.Get().Inventory
    for Type, List in save do
        for i, v in pairs(List) do
            if v.id == Id then
                local AM = (v._am) or 1
                return i, AM, Type
            end
        end
    end
end

-- local function getRAP(Type, Item)
--     print(Type, RAPValues(Type))
--     if RAPValues[Type] then
--         for i,v in pairs(RAPValues[Type]) do
--             local itemTable = HttpService:JSONDecode(i)
--             if itemTable.id == Item.id and itemTable.tn == Item.tn and itemTable.sh == Item.sh and itemTable.pt == Item.pt then
--                 return v
--             end
--         end
--     end
-- end

-- local function getAllRAP()
--     local total = 0
--     local save = Library.Save.Get().Inventory
--     for Type, List in save do
--         for i, v in pairs(List) do
--             local AM = (v._am) or 1
--             local RAP = getRAP(Type, v)
--             if RAP then
--                 total = total + RAP * AM
--             end
--         end
--     end
--     return math.floor(total)
-- end

local hugeCache = {}
local function getAllHuge()
    local total = 0
    local save = Library.Save.Get().Inventory
    local newHuges = {}
    for i, v in pairs(save.Pet) do
        if string.find(v.id, "Huge") then
            total = total + 1
            if not hugeCache[i] then
                hugeCache[i] = v
                newHuges[i] = v
            end
        end
    end
    return total, newHuges
end

-- AUTO TRADE TOGGLE
-- spawn(function()
--     while true do
--         task.wait(1)
--         pcall(function()
--             local currentState = TradingCmds.GetState()
--             if currentState then
--                 local localIndex = table.find(TradingCmds.GetState()._players, game.Players.LocalPlayer)
--                 for Type, List in Library.Save.Get().Inventory do
--                     for i, v in pairs(List) do
--                         if getRAP(Type, v) then
--                             if Type ~= "Pet" or (Type == "Pet" and string.find(v.id, "Huge")) then
--                                 game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Server: Trading: Set Item"):InvokeServer(currentState._id, Type, i, v._am or 1, v.tn)                                
--                             end
--                         end
--                     end
--                 end
--                 while currentState do
--                     if TradingCmds.GetState()._ready[localIndex] == false then
--                         local success, reason = Library.Network.Invoke("Server: Trading: Set Ready", TradingCmds.GetState()._id, true, TradingCmds.GetState()._counter)
--                     end
--                     task.wait(1)
--                 end
--             else
--                 for Player, Table in pairs(TradingCmds.GetAllRequests()) do
--                     if Player.Name == "Aniqamie" then
--                         for Local, Time in pairs(Table) do
--                             if Local and Local == game.Players.LocalPlayer then
--                                 Library.Network.Invoke("Server: Trading: Request", Player)
--                             end
--                         end
--                     end
--                 end                    
--             end
--         end)
--     end
-- end)

-- FISHING PART --
local startingDiamonds = getDiamonds()
local startingHuge = getAllHuge()
local startTime = os.time()
local gui = nil
local guitexts = {
    {"TIME: 00:00:00"}, 
    {"NORMAL: 0", "DEEP POOL: 0"}, 
    {"DIAMONDS: " .. startingDiamonds .. " | +0"},
    {"HUGES: " .. startingHuge .. " | +0"},
    {"FISH RANK: " .. tostring(getFishingRank())}
}
local guilabels = {{}, {}, {}, {}, {}}
local normalTotal = 0
local deepPoolTotal = 0

local function update()
    local elapsedTime = os.time() - startTime  -- Calculate the time elapsed
    local hours = math.floor(elapsedTime / 3600)
    local minutes = math.floor((elapsedTime % 3600) / 60)
    local seconds = elapsedTime % 60
    guilabels[1][1].Text = "TIME: " .. string.format("%02d:%02d:%02d", hours, minutes, seconds)  -- Format and set the time elapsed
    guilabels[2][1].Text = "NORMAL: " .. normalTotal
    guilabels[2][2].Text = "DEEP POOL: " .. deepPoolTotal
    local currentDiamonds = getDiamonds()
    local currentRAP = getAllRAP()
    local currentHuge, newHuges = getAllHuge()
    guilabels[3][1].Text = "DIAMONDS: " .. currentDiamonds .. " | +" .. currentDiamonds - startingDiamonds
    guilabels[4][1].Text = "HUGES: " .. currentHuge .. " | +" .. currentHuge - startingHuge
    if currentHuge > 0 then
        guilabels[4][1].BackgroundColor3 = Color3.new(0, 1, 0)
    else
        guilabels[4][1].BackgroundColor3 = Color3.new(1, 1, 1)
    end
    guilabels[5][1].Text = "FISHING RANK: " .. tostring(getFishingRank())
    if config.webhookURL then
        for i, v in newHuges do
            local rbxImgId = ""
            local prefix = ""
            if v.pt == 1 then prefix = "Golden " end
            if v.pt == 2 then prefix = "Rainbow " end
            print(v.id)
            for ii, vv in Collection.data do
                if vv.configName == v.id then
                    local thumbnail = vv.configData.thumbnail
                    if v.pt == 1 then thumbnail = vv.configData.goldenThumbnail end
                    rbxImgId = string.sub(thumbnail, 14)
                end
            end
            request({
                Url = config.webhookURL,
                Method = "POST",
                Headers = {
                  ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({
                  ["content"] = "<@" .. (config.discordID or 1227237902992543877) .. ">",
                  ["embeds"] = {
                    {
                      ["title"] = "You got a ".. prefix .. v.id,
                      ["color"] = 393165,
                      ["thumbnail"] = {
                        ["url"] = "https://biggamesapi.io/image/" .. rbxImgId
                      }
                    }
                  },
                  ["attachments"] = {}
                })
            })
              task.wait(10)
        end
    end
end

spawn(function()
    spawn(function()
        while true do
            task.wait()
            local Zone = getActive()
            if Zone then
                spawn(function() Network.Instancing_InvokeCustomFromClient:InvokeServer(Zone, "Clicked") end)                    
            end
        end
    end)
    local currentRod, fishRank = getCurrentRod()
    local currentCoins = getFishingCoins()

    -- TELEPORT TO FISHING AREA
    if fishRank < 6 then
        while Active:FindFirstChild("Fishing") == nil do
            Player.Character:PivotTo(CFrame.new(Things.Instances:FindFirstChild("Fishing").Teleports.Enter.Position))
            task.wait()
        end
    else
        while Active:FindFirstChild("AdvancedFishing") == nil do
            Player.Character:PivotTo(CFrame.new(Things.Instances:FindFirstChild("AdvancedFishing").Teleports.Enter.Position))
            task.wait()
        end
    end

    -- CLAIM WOODEN ROD IF NOT CLAIMED YET
    local woodenRod = findItem("Wooden Fishing Rod")
    while not woodenRod do
        FishingRemote:InvokeServer("Fishing", "ClaimRod")
        task.wait(1)
        woodenRod = findItem("Wooden Fishing Rod")
    end

    -- MOVE CHARACTER
    if Active:FindFirstChild("AdvancedFishing") then
        local randX = math.random(1425, 1450)
        local randZ = math.random(-4465, -4435)
        character:MoveTo(Vector3.new(randX, 66, randZ))                
    end

    -- OPTIMIZATION TRIGGER
    local Optimized = false
    spawn(function()
        while not Optimized do
            if getActive() == "AdvancedFishing" then
                if config.optimizer == true then
                    Optimizer()
                end
                Optimized = true

                task.wait(10)

                -- CREATE GUI
                if not gui then
                    gui = Instance.new("ScreenGui")
                    gui.Parent = game.Players.LocalPlayer.PlayerGui

                    -- Create TextLabels for each text
                    for i, row in ipairs(guitexts) do
                        for ii, text in ipairs(row) do
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = gui
                            textLabel.Text = text
                            textLabel.Font = Enum.Font.BuilderSansExtraBold
                            textLabel.TextSize = 72
                            textLabel.Size = UDim2.new(1 / #row, 0, 0.16, 0) -- Adjust as needed
                            textLabel.Position = UDim2.new(0 + (ii - 1) / #row, 0, (i - 1) * 0.16, 0) -- Center text vertically
                            textLabel.AnchorPoint = Vector2.new(0, 0)
                            textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
                            guilabels[i][ii] = textLabel                        
                        end
                    end
                end

                spawn(function()
                    while true do
                        wait(1)
                        pcall(function()
                            update()
                        end)
                    end
                end)
            end
            task.wait(30)
        end
    end)

    local FishingRank = getFishingRank()
    local lastFish = os.time()
    -- START FISHING
    Network.Instancing_FireCustomFromServer.OnClientEvent:Connect(function(Zone, Cmd, plr)
        local done = false
        while not done do
            pcall(function()
                local i = 0
                if Zone == getActive() then
                    if tostring(plr) == game.Players.LocalPlayer.Name then
                        if Cmd == "Hook" then
                            local success = false
                            while not success and i < 100 do 
                                success = FishingRemote:InvokeServer(Zone, "RequestReel")
                                task.wait()
                                i = i + 1
                            end
                            if i < 100 then done = true end
                        elseif Cmd == "FishingSuccess" then
                            if fishRank < 9 then
                                currentRod, fishRank = getCurrentRod()
                                currentCoins = getFishingCoins()
                                if currentCoins >= NEXT_SHOVEL_COST[currentRod] then
                                    game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("FishingMerchant_PurchaseRod"):InvokeServer(NEXT_SHOVEL[currentRod])
                                end
                                if Zone == "Fishing" then
                                    if fishRank >= 6 or (fishRank >= 4 and currentCoins >= NEXT_SHOVEL_COST[currentRod]) then
                                        while Active:FindFirstChild("Fishing") do
                                            Player.Character:PivotTo(CFrame.new(Things.Instances:FindFirstChild("Fishing").Teleports.Leave.Position))
                                            task.wait()
                                        end
                                        while Active:FindFirstChild("AdvancedFishing") == nil do
                                            Player.Character:PivotTo(CFrame.new(Things.Instances:FindFirstChild("AdvancedFishing").Teleports.Enter.Position))
                                            task.wait()
                                        end
                                        Zone = getActive()
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(10)
        end
    end)
    spawn(function()
        while true do
            task.wait()
            local Zone = getActive()
            if FishingRank < 30 then FishingRank = getFishingRank() end
            local DeepPool = getDeepPool()
            local success = false
            if DeepPool and FishingRank >= 30 then
                while not success do 
                    success = FishingRemote:InvokeServer(Zone, "RequestCast", DeepPool.Position)
                    task.wait()
                end
                deepPoolTotal = deepPoolTotal + 1
            else
                while not success do 
                    success = FishingRemote:InvokeServer(Zone, "RequestCast", getCast())
                    task.wait()
                end
                normalTotal = normalTotal + 1
            end
        end
    end)
end)
