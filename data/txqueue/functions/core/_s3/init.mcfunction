# 初期化処理
scoreboard players set $_s3.len txqueue -2147483648
data modify storage txqueue:_s3 template set value [[[[[[[[[{}]]]]]]]]]
data modify storage txqueue:_s3 data set from storage txqueue:_s3 template

#>
# @internal
#define score_holder $_s3.len
#>
# @internal
#define storage txqueue:_s3