execute store result storage example: time int 1 run time query gametime
tellraw @a ["function dynaimcally scheduled: ",{"nbt":"IO.time","storage": "waitatick:"}," -> ",{"nbt":"time","storage": "example:"}]

setblock ~ ~ ~ stone