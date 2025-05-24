bossbar set minecraft:healthbar players @a

execute at @a store result bossbar minecraft:healthbar max run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health get
execute at @a store result score @a ClosestMobHealthHalf run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health base get 0.5
execute at @a store result score @a ClosestMobHealthQuarter run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health base get 0.25
execute at @a store result score @a ClosestMobArmour run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:armor get
execute at @a run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:armor get

execute at @a store result bossbar minecraft:healthbar value run data get entity @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] Health
execute at @a store result score @a ClosestMobHealth run data get entity @e[sort=nearest,distance=..10,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb] Health 

execute at @a[scores={ClosestMobHealth=0}] run bossbar set minecraft:healthbar visible false
execute at @a[scores={ClosestMobHealth=1..}] run bossbar set minecraft:healthbar visible true

# the below commands don't show the mob's name and i can't figure out why
# so if you're looking at this source code and know how to fix it make a fork on github or something idk

# execute as @a[scores={ClosestMobArmour=1..}] run bossbar set minecraft:healthbar name ["",{"text":"\u2764","color":"red"},{"score":{"name":"@p","objective":"ClosestMobHealth"},"color":"red"},{"text":" \ud83d\udee1","color":"gray"},{"score":{"name":"@p","objective":"ClosestMobArmour"},"color":"gray"},{"text": " "},{"selector":" @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10]"}]
# execute as @a[scores={ClosestMobArmour=0}] run bossbar set minecraft:healthbar name ["",{"text":"\u2764\ufe0f"},{"score":{"name":"@p","objective":"ClosestMobHealth"}},{"text":" \u0020"},{"selector":"@e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10]"}]

execute at @p run bossbar set minecraft:healthbar name ["",{"text":"\u2764","color":"red"},{"score":{"name":"@p","objective":"ClosestMobHealth"},"color":"red"},{"text":" \ud83d\udee1","color":"gray"},{"score":{"name":"@p","objective":"ClosestMobArmour"},"color":"gray"},{"text": " "},{"selector":"@e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10]"}]

execute as @a if score @s ClosestMobHealth > @s ClosestMobHealthHalf run bossbar set minecraft:healthbar color green
execute as @a if score @s ClosestMobHealth <= @s ClosestMobHealthHalf run bossbar set minecraft:healthbar color yellow
execute as @a if score @s ClosestMobHealth <= @s ClosestMobHealthQuarter run bossbar set minecraft:healthbar color red
