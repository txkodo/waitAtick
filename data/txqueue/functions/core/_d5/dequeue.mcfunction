# length -= 1
scoreboard players remove $_d5.len txqueue 1

# データをtailから取得
data modify storage waitatick: IO set from storage txqueue:_d5 data[0][0][0][0][0][0][0][0][0]._

# tailを次の位置にずらす
function txqueue:core/_d5/dequeue/1