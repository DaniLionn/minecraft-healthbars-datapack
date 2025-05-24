bossbar set minecraft:healthbar players @a

execute at @p store result bossbar minecraft:healthbar max run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health get
execute at @p store result score @a ClosestMobHealthHalf run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health base get 0.5
execute at @p store result score @a ClosestMobHealthQuarter run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:max_health base get 0.25
execute at @p store result score @a ClosestMobArmour run attribute @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] minecraft:armor get

execute at @p store result bossbar minecraft:healthbar value run data get entity @e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10] Health
execute at @p store result score @a ClosestMobHealth run data get entity @e[sort=nearest,distance=..10,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb] Health 

execute at @p[scores={ClosestMobHealth=0}] run bossbar set minecraft:healthbar visible false
execute at @p[scores={ClosestMobHealth=1..}] run bossbar set minecraft:healthbar visible true

execute as @p[scores={ClosestMobArmour=0}] run bossbar set minecraft:healthbar name ["",{"text":"\u2764","color":"red"},{"score":{"name":"@p","objective":"ClosestMobHealth"},"color":"red"},{"text":" \ud83d\udee1","color":"gray"},{"score":{"name":"@p","objective":"ClosestMobArmour"},"color":"gray"},{"text": " "},{"selector":"@e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10]"}]
execute as @p[scores={ClosestMobArmour=1..}]run bossbar set minecraft:healthbar name ["",{"text":"\u2764","color":"red"},{"score":{"name":"@p","objective":"ClosestMobHealth"},"color":"red"},{"text": " "},{"selector":"@e[sort=nearest,limit=1,type=!minecraft:item,type=!minecraft:player,type=!minecraft:experience_orb,distance=..10]"}]

execute as @p if score @s ClosestMobHealth > @p ClosestMobHealthHalf run bossbar set minecraft:healthbar color green
execute as @p if score @s ClosestMobHealth <= @p ClosestMobHealthHalf run bossbar set minecraft:healthbar color yellow
execute as @p if score @s ClosestMobHealth <= @p ClosestMobHealthQuarter run bossbar set minecraft:healthbar color red