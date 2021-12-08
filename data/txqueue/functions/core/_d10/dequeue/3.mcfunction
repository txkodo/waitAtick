### tail移動処理 3桁目

# 繰り上がりフラグ txqueue: borrow
execute store success storage txqueue: borrow byte 1 unless data storage txqueue:_d10 data[0][0][0][0][0][0][1]

# 繰り上がらない場合tailを削除
execute if data storage txqueue: {borrow:0b} run data remove storage txqueue:_d10 data[0][0][0][0][0][0][0]

# 繰り上がり処理
execute if data storage txqueue: {borrow:1b} run function txqueue:core/_d10/dequeue/4