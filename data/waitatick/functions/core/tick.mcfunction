
# 実行座標アンカーを召喚
execute unless entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 run summon marker 0 0 0 {UUID:[I;-875554438,848906770,-1723666558,-864949005]}

# 各コールバックを呼び出す
function #waitatick:core/tick

# 次のtickの位置のデータにアクセス
scoreboard players operation #index waitatick = #next waitatick
function waitatick:core/trie/touch

# data[0]: 現在tickのデータ
# data[1]: 次のtickのデータ
data remove storage waitatick: data[0]
data modify storage waitatick: data append from storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2] set value {}

# tickを1ずらす
scoreboard players operation #current waitatick = #next waitatick
scoreboard players add #next waitatick 1
scoreboard players operation #next waitatick %= #65536 waitatick