Config = {}

Config.needCops = 0 -- How much cops.
Config.timeTruck = 5 -- Seconds.

Config.TruckRob = {
    ["plastic"] = math.random(45,60),
    ["metalscrap"] = math.random(35,55),
    ["copper"] = math.random(35,55),
    ["aluminum"] = math.random(50,60),
    ["iron"] = math.random(45,60),
    ["steel"] = math.random(45,75),
    ["rubber"] = math.random(7,18),
    ["glass"] = math.random(45,70),
    ["ruby"] = math.random(1,2)
}

Config.Var = {}
for k,v in next,Config.TruckRob do 
    Config.Var[#Config.Var + 1] = k
end