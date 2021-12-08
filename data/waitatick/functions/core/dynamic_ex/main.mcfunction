#> waitatick:core/dynamic_ex/main
# 
# メイン処理
# 
# @input storage waitatick: TICK
# @input storage waitatick: IO.data
# 
# @internal

# storage waitatick: IO.tick を生成
function waitatick:core/explode

# データ準備済みフラグ = true
data modify storage waitatick: ready set value 1b

data modify storage waitatick: IO._ set from storage waitatick: IO.tick[15]
# IO.id[15] == 1b
execute if data storage waitatick: IO{_:1b} run function txqueue:api/_d15.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/dynamic_ex/15 32768t
# IO.id[15] == 0b
execute if data storage waitatick: IO{_:0b} run function waitatick:core/dynamic_ex/15

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b
