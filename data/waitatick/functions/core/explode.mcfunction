#> waitatick:core/explode
# 
# intをByteArrayに分解
# 
# @input storage waitatick: TICK
# @output storage waitatick: IO.tick
# 
# @internal

execute store result score $tick waitatick run data get storage waitatick: TICK
data modify storage waitatick: IO.tick set value [0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b,0b]
execute store success storage waitatick: IO.tick[15] byte 1 if score $tick waitatick matches 32768.. run scoreboard players remove $tick waitatick 32768
execute store success storage waitatick: IO.tick[14] byte 1 if score $tick waitatick matches 16384.. run scoreboard players remove $tick waitatick 16384
execute store success storage waitatick: IO.tick[13] byte 1 if score $tick waitatick matches 8192.. run scoreboard players remove $tick waitatick 8192
execute store success storage waitatick: IO.tick[12] byte 1 if score $tick waitatick matches 4096.. run scoreboard players remove $tick waitatick 4096
execute store success storage waitatick: IO.tick[11] byte 1 if score $tick waitatick matches 2048.. run scoreboard players remove $tick waitatick 2048
execute store success storage waitatick: IO.tick[10] byte 1 if score $tick waitatick matches 1024.. run scoreboard players remove $tick waitatick 1024
execute store success storage waitatick: IO.tick[9] byte 1 if score $tick waitatick matches 512.. run scoreboard players remove $tick waitatick 512
execute store success storage waitatick: IO.tick[8] byte 1 if score $tick waitatick matches 256.. run scoreboard players remove $tick waitatick 256
execute store success storage waitatick: IO.tick[7] byte 1 if score $tick waitatick matches 128.. run scoreboard players remove $tick waitatick 128
execute store success storage waitatick: IO.tick[6] byte 1 if score $tick waitatick matches 64.. run scoreboard players remove $tick waitatick 64
execute store success storage waitatick: IO.tick[5] byte 1 if score $tick waitatick matches 32.. run scoreboard players remove $tick waitatick 32
execute store success storage waitatick: IO.tick[4] byte 1 if score $tick waitatick matches 16.. run scoreboard players remove $tick waitatick 16
execute store success storage waitatick: IO.tick[3] byte 1 if score $tick waitatick matches 8.. run scoreboard players remove $tick waitatick 8
execute store success storage waitatick: IO.tick[2] byte 1 if score $tick waitatick matches 4.. run scoreboard players remove $tick waitatick 4
execute store success storage waitatick: IO.tick[1] byte 1 if score $tick waitatick matches 2.. run scoreboard players remove $tick waitatick 2
execute store success storage waitatick: IO.tick[0] byte 1 if score $tick waitatick matches 1..
