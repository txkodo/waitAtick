# 初期化処理
scoreboard players set $_d14.len txqueue -2147483648
data modify storage txqueue:_d14 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d14 data set from storage txqueue:_d14 template

#>
# @internal
#define score_holder $_d14.len
#>
# @internal
#define storage txqueue:_d14