# 初期化処理
scoreboard players set $_d0.len txqueue -2147483648
data modify storage txqueue:_d0 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d0 data set from storage txqueue:_d0 template

#>
# @internal
#define score_holder $_d0.len
#>
# @internal
#define storage txqueue:_d0