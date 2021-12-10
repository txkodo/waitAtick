#> waitatick:core/id/gc
# @internal

### Copyright © 2021 txkodo
### This software is released under the MIT License, see LICENSE.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

### ガベージコレクタ

# 前回存在を確認したIDを移動させる
data modify storage waitatick: id append from storage waitatick: id[0]
data remove storage waitatick: id[0]

# 割り当て済みID[0]以下の最大値を取得(_ IDに入る)
execute store result score #id_ waitatick run data get storage waitatick: id[0]
scoreboard players remove #id_ waitatick 2147483647
scoreboard players set #id_ waitatickID 0
scoreboard players operation * waitatickID -= #id_ waitatick
scoreboard players operation #id_ waitatickID > * waitatickID
scoreboard players operation * waitatickID += #id_ waitatick

# 不要なデータを解放(先頭から続く基準より大きいIDは全部要らない)
scoreboard players operation #id_ waitatick >< #id_ waitatickID
execute store result score #id_ waitatickID run data get storage waitatick: id[0]
execute if score #id_ waitatickID > #id_ waitatick run function waitatick:core/id/gc_loop
scoreboard players operation #id_ waitatick >< #id_ waitatickID

# loop while x - next >= 2(prev - x) - 1 (⇔ 3x - 2prev - next + 1 >= 0)
# 2prev
execute store result score #id_ waitatick run data get storage waitatick: id[-1]
execute if score #id_ waitatick matches 0 run scoreboard players add #id_ waitatick 65536
execute if score #id_ waitatickID matches 0 run scoreboard players add #id_ waitatick 65536
execute if score #id_ waitatickID matches 0 run scoreboard players add #id_ waitatickID 65536
scoreboard players operation #id_ waitatick += #id_ waitatick
# 2prev - 2x
scoreboard players operation #id_ waitatick -= #id_ waitatickID
scoreboard players operation #id_ waitatick -= #id_ waitatickID
# 3x - 2prev
scoreboard players operation #id_ waitatickID -= #id_ waitatick
# 3x - 2prev - next
execute store result score #id_ waitatick run data get storage waitatick: id[1]
scoreboard players operation #id_ waitatickID -= #id_ waitatick
execute if score #id_ waitatickID matches -1.. run function waitatick:core/id/gc