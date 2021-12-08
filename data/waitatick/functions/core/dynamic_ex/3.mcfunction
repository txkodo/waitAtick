#> waitatick:core/dynamic_ex/3
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {ready:0b} run function txqueue:api/_d3.dequeue

data modify storage waitatick: IO._ set from storage waitatick: IO.id[2]
# IO.id[2] == 1b
execute if data storage waitatick: IO{_:1b} run function txqueue:api/_d2.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/dynamic_ex/2 4t
# IO.id[2] == 0b
execute if data storage waitatick: IO{_:0b} run function waitatick:core/dynamic_ex/2

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b