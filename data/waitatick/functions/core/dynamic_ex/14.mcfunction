#> waitatick:core/dynamic_ex/14
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {ready:0b} run function txqueue:api/_d14.dequeue

data modify storage waitatick: IO._ set from storage waitatick: IO.id[13]
# IO.id[13] == 1b
execute if data storage waitatick: IO{_:1b} run function txqueue:api/_d13.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/dynamic_ex/13 8192t
# IO.id[13] == 0b
execute if data storage waitatick: IO{_:0b} run function waitatick:core/dynamic_ex/13

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b