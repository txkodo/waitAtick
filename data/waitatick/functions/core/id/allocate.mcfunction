#> waitatick:core/id/allocate
# @internal

### Copyright © 2021 txkodo
### This software is released under the MIT License, see LICENSE.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

### IDを新規割り当て

# ごみ掃除(抜けるとid[0]とid[-1]が丁度良いスペースになる)
function waitatick:core/id/gc

# id[0] + id[-1] / 2 を割り当てIDに取る
execute store result score #id_ waitatickID run data get storage waitatick: id[-1]
execute store result score #id_ waitatick run data get storage waitatick: id[0]
execute if score #id_ waitatickID matches 0 run scoreboard players set #id_ waitatickID 65536
scoreboard players operation #id_ waitatickID += #id_ waitatick
scoreboard players set #id_ waitatick 2
scoreboard players operation #id_ waitatickID /= #id_ waitatick

# 割り当てIDに追加
data modify storage waitatick: id append value -1
execute store result storage waitatick: id[-1] int 1 run scoreboard players get #id_ waitatickID
# 割り当てる
scoreboard players operation @s waitatickID = #id_ waitatickID