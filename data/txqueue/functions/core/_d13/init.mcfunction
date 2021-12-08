# 初期化処理
scoreboard players set $_d13.len txqueue -2147483648
data modify storage txqueue:_d13 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d13 data set from storage txqueue:_d13 template

#>
# @internal
#define score_holder $_d13.len
#>
# @internal
#define storage txqueue:_d13