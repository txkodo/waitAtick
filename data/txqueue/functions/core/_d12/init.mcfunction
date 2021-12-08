# 初期化処理
scoreboard players set $_d12.len txqueue -2147483648
data modify storage txqueue:_d12 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d12 data set from storage txqueue:_d12 template

#>
# @internal
#define score_holder $_d12.len
#>
# @internal
#define storage txqueue:_d12