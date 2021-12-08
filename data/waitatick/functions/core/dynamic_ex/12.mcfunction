#> waitatick:core/dynamic_ex/12
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {ready:0b} run function txqueue:api/_d12.dequeue

data modify storage waitatick: IO._ set from storage waitatick: IO.id[11]
# IO.id[11] == 1b
execute if data storage waitatick: IO{_:1b} run function txqueue:api/_d11.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/dynamic_ex/11 2048t
# IO.id[11] == 0b
execute if data storage waitatick: IO{_:0b} run function waitatick:core/dynamic_ex/11

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b