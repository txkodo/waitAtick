#> txqueue:api/_d13.dequeue
# @output storage waitatick: IO キューから取り出されたデータが入る
# 
# キューからアイテムを取得
# 
# @api
execute store success storage txqueue: success byte 1 unless score $_d13.len txqueue matches -2147483648 run function txqueue:core/_d13/dequeue
