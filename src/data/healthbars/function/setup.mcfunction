say Loaded!

bossbar add healthbar ""
bossbar set minecraft:healthbar style notched_10

scoreboard objectives add ClosestMobHealth dummy
scoreboard objectives add ClosestMobHealthHalf dummy
scoreboard objectives add ClosestMobHealthQuarter dummy
scoreboard objectives add ClosestMobArmour dummy
scoreboard objectives add Zero dummy

scoreboard players set @a Zero 0