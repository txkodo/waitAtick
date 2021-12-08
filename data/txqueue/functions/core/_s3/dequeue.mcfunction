# length -= 1
scoreboard players remove $_s3.len txqueue 1

# データをtailから取得
data modify storage waitatick: IO set from storage txqueue:_s3 data[0][0][0][0][0][0][0][0][0]._

# tailを次の位置にずらす
function txqueue:core/_s3/dequeue/1