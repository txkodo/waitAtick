#> waitatick:core/_/static_ex/append
# @internal

execute unless data storage waitatick: data[1].static_ex run data modify storage waitatick: data[1].static_ex set value []
data modify storage waitatick: data[1].static_ex append value {}
data modify storage waitatick: data[1].static_ex[-1]._ set from storage waitatick: IO
