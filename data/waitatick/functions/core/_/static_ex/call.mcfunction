#> waitatick:core/_/static_ex/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].static_ex[0]._
execute store result score #id_ waitatick run data get storage waitatick: data[0].static_ex[0].as
execute as @e if score @s waitatickID = #id_ waitatick run function #waitatick:callback/static_ex
data remove storage waitatick: data[0].static_ex[0]
execute if data storage waitatick: data[0].static_ex[0] run function waitatick:core/_/static_ex/call
