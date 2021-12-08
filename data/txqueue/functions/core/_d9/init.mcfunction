# 初期化処理
scoreboard players set $_d9.len txqueue -2147483648
data modify storage txqueue:_d9 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d9 data set from storage txqueue:_d9 template

#>
# @internal
#define score_holder $_d9.len
#>
# @internal
#define storage txqueue:_d9