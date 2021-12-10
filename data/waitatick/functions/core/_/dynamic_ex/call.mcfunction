#> waitatick:core/_/dynamic_ex/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].dynamic_ex[0]._
data modify storage waitatick: in set from storage waitatick: data[0].dynamic_ex[-1].in
function waitatick:custom/dimension_load
data modify entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Pos set from storage waitatick: data[0].dynamic_ex[0].pos
data modify entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Rotation set from storage waitatick: data[0].dynamic_ex[0].rot
execute at cbd0197a-3299-4a12-9942-ef82cc71ecf3 run function #waitatick:callback/dynamic_ex
execute in minecraft:overworld run tp cbd0197a-3299-4a12-9942-ef82cc71ecf3 0 0 0
data remove storage waitatick: data[0].dynamic_ex[0]
execute if data storage waitatick: data[0].dynamic_ex[0] run function waitatick:core/_/dynamic_ex/call
