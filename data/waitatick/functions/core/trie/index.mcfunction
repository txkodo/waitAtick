#> waitatick:core/trie/index
# @internal

scoreboard players operation #index waitatick = #current waitatick
scoreboard players operation #index waitatick += $tick waitatick
scoreboard players remove #index waitatick 1
scoreboard players operation #index waitatick %= #65536 waitatick
function waitatick:core/trie/touch