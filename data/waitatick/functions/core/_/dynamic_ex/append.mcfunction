#> waitatick:core/_/dynamic_ex/append
# @internal

execute if score $tick waitatick matches 1 run function waitatick:core/_/dynamic_ex/append.next
execute unless score $tick waitatick matches 1 run function waitatick:core/_/dynamic_ex/append.other
