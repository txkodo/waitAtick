# 初期化処理
scoreboard players set $_d7.len txqueue -2147483648
data modify storage txqueue:_d7 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d7 data set from storage txqueue:_d7 template

#>
# @internal
#define score_holder $_d7.len
#>
# @internal
#define storage txqueue:_d7