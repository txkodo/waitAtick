#> waitatick:core/_/dynamic_ex/append.next
# @internal

execute unless data storage waitatick: data[1].dynamic_ex run data modify storage waitatick: data[1].dynamic_ex set value []
data modify storage waitatick: data[1].dynamic_ex append value {}
data modify storage waitatick: data[1].dynamic_ex[-1]._ set from storage waitatick: IO
