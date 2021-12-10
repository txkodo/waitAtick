
# 次のtickの位置のデータにアクセス
scoreboard players operation #index waitatick = #next waitatick
function waitatick:core/touch

# data[0]: 現在tickのデータ
# data[1]: 次のtickのデータ
data remove storage waitatick: data[0]
data modify storage waitatick: data append from storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] set value {}

# 各コールバックを呼び出す
function #waitatick:core/tick

# tickを1ずらす
scoreboard players operation #current waitatick = #next waitatick
scoreboard players operation #next waitatick %= #65536 waitatick
scoreboard players add #next waitatick 1
