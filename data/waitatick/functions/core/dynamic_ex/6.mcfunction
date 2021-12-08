#> waitatick:core/dynamic_ex/6
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {ready:0b} run function txqueue:api/_d6.dequeue

data modify storage waitatick: IO._ set from storage waitatick: IO.id[5]
# IO.id[5] == 1b
execute if data storage waitatick: IO{_:1b} run function txqueue:api/_d5.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/dynamic_ex/5 32t
# IO.id[5] == 0b
execute if data storage waitatick: IO{_:0b} run function waitatick:core/dynamic_ex/5

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b