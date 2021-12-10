#> waitatick:core/_touch
# List-Mapped Trie by @intsuc
# https://gist.github.com/intsuc/0901df9d487f7829d97491613a12d351
# @internal


scoreboard players operation #_index waitatick = #index waitatick

scoreboard players remove #index waitatick 1
scoreboard players operation #index waitatick *= #32768 waitatick
scoreboard players operation #index waitatick += #index waitatick

execute store result score #size waitatick if data storage waitatick: _[]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _ append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value []

scoreboard players operation #index waitatick += #index waitatick
execute store result score #size waitatick if data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][]
execute if score #size waitatick matches 3 if score #index waitatick matches 0.. run data remove storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][2]
execute if score #size waitatick matches 2 if score #index waitatick matches ..-1 run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] append value {}
