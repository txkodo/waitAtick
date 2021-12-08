# 初期化処理
scoreboard players set $_d10.len txqueue -2147483648
data modify storage txqueue:_d10 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_d10 data set from storage txqueue:_d10 template

#>
# @internal
#define score_holder $_d10.len
#>
# @internal
#define storage txqueue:_d10