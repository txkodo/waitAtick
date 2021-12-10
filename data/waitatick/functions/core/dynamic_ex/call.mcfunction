#> waitatick:core/dynamic_ex/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data.dynamic_ex[0]
data remove storage waitatick: data.dynamic_ex[0]
function #waitatick:callback/dynamic_ex
execute if data storage waitatick: data.dynamic_ex[0] run function waitatick:core/dynamic_ex/call
