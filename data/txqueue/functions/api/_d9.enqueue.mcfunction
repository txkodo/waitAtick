#> txqueue:api/_d9.enqueue
# @input storage waitatick: IO キューに追加するデータを入れる
# 
# キューにアイテムを追加
# 
# @api
execute store success storage txqueue: success byte 1 unless score $_d9.len txqueue matches 2147483647 run function txqueue:core/_d9/enqueue
