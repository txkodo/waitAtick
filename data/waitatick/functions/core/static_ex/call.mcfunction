#> waitatick:core/static_ex/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].static_ex[0]
data remove storage waitatick: data[0].static_ex[0]
function #waitatick:callback/static_ex
execute if data storage waitatick: data[0].static_ex[0] run function waitatick:core/static_ex/call
