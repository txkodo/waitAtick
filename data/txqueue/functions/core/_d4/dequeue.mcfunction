# length -= 1
scoreboard players remove $_d4.len txqueue 1

# データをtailから取得
data modify storage waitatick: IO set from storage txqueue:_d4 data[0][0][0][0][0][0][0][0][0]._

# tailを次の位置にずらす
function txqueue:core/_d4/dequeue/1