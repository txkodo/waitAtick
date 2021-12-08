# 初期化処理
scoreboard players set $_d6.len txqueue -2147483648
data modify storage txqueue:_d6 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d6 data set from storage txqueue:_d6 template

#>
# @internal
#define score_holder $_d6.len
#>
# @internal
#define storage txqueue:_d6