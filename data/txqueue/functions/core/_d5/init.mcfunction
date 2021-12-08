# 初期化処理
scoreboard players set $_d5.len txqueue -2147483648
data modify storage txqueue:_d5 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d5 data set from storage txqueue:_d5 template

#>
# @internal
#define score_holder $_d5.len
#>
# @internal
#define storage txqueue:_d5