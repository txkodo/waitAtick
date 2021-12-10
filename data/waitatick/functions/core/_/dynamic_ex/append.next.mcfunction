#> waitatick:core/_/dynamic_ex/append.next
# @internal


execute unless data storage waitatick: data[1].dynamic_ex run data modify storage waitatick: data[1].dynamic_ex set value []
data modify storage waitatick: data[1].dynamic_ex append value {}
tp cbd0197a-3299-4a12-9942-ef82cc71ecf3 ~ ~ ~
function waitatick:custom/dimension
data modify storage waitatick: data[1].dynamic_ex[-1].in set from storage waitatick: in
data modify storage waitatick: data[1].dynamic_ex[-1].pos set from entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Pos
data modify storage waitatick: data[1].dynamic_ex[-1].rot set from entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Rotation

data modify storage waitatick: data[1].dynamic_ex[-1]._ set from storage waitatick: IO
