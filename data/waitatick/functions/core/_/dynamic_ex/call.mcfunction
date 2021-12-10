#> waitatick:core/_/dynamic_ex/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].dynamic_ex[0]
data remove storage waitatick: data[0].dynamic_ex[0]
function #waitatick:callback/dynamic_ex
execute if data storage waitatick: data[0].dynamic_ex[0] run function waitatick:core/_/dynamic_ex/call
