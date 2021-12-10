#> waitatick:core/static_ex/append
# @internal

execute unless data storage waitatick: data[1].static_ex run data modify storage waitatick: data[1].static_ex set value []
data modify storage waitatick: data[1].static_ex append from storage waitatick: IO
