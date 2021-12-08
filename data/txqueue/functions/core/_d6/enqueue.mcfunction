# length += 1
scoreboard players add $_d6.len txqueue 1

# データをheadに設定
data modify storage txqueue:_d6 data[-1][-1][-1][-1][-1][-1][-1][-1][-1]._ set from storage waitatick: IO

# headを次の位置にずらす
function txqueue:core/_d6/enqueue/1
