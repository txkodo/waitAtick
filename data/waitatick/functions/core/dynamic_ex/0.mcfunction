#> waitatick:core/dynamic_ex/0
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {ready:0b} run function txqueue:api/_d0.dequeue

function #waitatick:dynamic_ex

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b