#> txqueue:api/_s3.dequeue
# @output storage waitatick: IO キューから取り出されたデータが入る
# 
# キューからアイテムを取得
# 
# @api
execute store success storage txqueue: success byte 1 unless score $_s3.len txqueue matches -2147483648 run function txqueue:core/_s3/dequeue
