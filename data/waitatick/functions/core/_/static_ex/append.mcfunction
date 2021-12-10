#> waitatick:core/_/static_ex/append
# @internal

scoreboard players set $tick waitatick 10
function waitatick:core/trie/index

execute unless data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].static_ex run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].static_ex set value []
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].static_ex append value {}
execute unless score @s waitatickID matches 1.. run function waitatick:core/id/allocate
execute store result storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].static_ex[-1].as int 1 run scoreboard players get @s waitatickID

data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].static_ex[-1]._ set from storage waitatick: IO
