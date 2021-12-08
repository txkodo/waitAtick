#> txqueue:api/_s15.dequeue
# @output storage waitatick: IO キューから取り出されたデータが入る
# 
# キューからアイテムを取得
# 
# @api
execute store success storage txqueue: success byte 1 unless score $_s15.len txqueue matches -2147483648 run function txqueue:core/_s15/dequeue
