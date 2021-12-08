# 初期化処理
scoreboard players set $_d3.len txqueue -2147483648
data modify storage txqueue:_d3 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d3 data set from storage txqueue:_d3 template

#>
# @internal
#define score_holder $_d3.len
#>
# @internal
#define storage txqueue:_d3