### 初期化
data modify storage txqueue: load set value 1b
data modify storage txqueue: data set value [[[[[[{}]]]]]]
#>
# @internal
scoreboard objectives add txqueue dummy
function #txqueue:init

#define storage txqueue:
#>
# @internal
#define objective txqueue