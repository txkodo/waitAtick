#> waitatick:core/touch_index
# @internal

scoreboard players operation #index waitatick = #current waitatick
scoreboard players operation #index waitatick += $tick waitatick
scoreboard players operation #index waitatick %= #65536 waitatick
function waitatick:core/touch