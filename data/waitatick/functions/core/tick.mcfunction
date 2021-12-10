
# 現在のtickの位置のデータにアクセス
scoreboard players operation #index waitatick = #current waitatick
function waitatick:core/touch

# 現在のtickのデータを移動し削除
data modify storage waitatick: data set from storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] set value {}

# 各コールバックを呼び出す
function #waitatick:core/tick

# 現在のtickのデータ位置をずらす
scoreboard players operation #current waitatick %= #65536 waitatick
scoreboard players add #current waitatick 1
