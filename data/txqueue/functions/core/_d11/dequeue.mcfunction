# length -= 1
scoreboard players remove $_d11.len txqueue 1

# データをtailから取得
data modify storage waitatick: IO set from storage txqueue:_d11 data[0][0][0][0][0][0][0][0][0]._

# tailを次の位置にずらす
function txqueue:core/_d11/dequeue/1