# 初期化処理
scoreboard players set $_d1.len txqueue -2147483648
data modify storage txqueue:_d1 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d1 data set from storage txqueue:_d1 template

#>
# @internal
#define score_holder $_d1.len
#>
# @internal
#define storage txqueue:_d1