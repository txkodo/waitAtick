# 初期化処理
scoreboard players set $_d4.len txqueue -2147483648
data modify storage txqueue:_d4 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d4 data set from storage txqueue:_d4 template

#>
# @internal
#define score_holder $_d4.len
#>
# @internal
#define storage txqueue:_d4