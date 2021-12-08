#> waitatick:core/static_ex/main
# 
# メイン処理
# 待機時間 3tick
# 
# @input storage waitatick: IO.data
# 
# @internal

execute if data storage waitatick: IO{_:1b} run function txqueue:api/_s3.enqueue
execute if data storage waitatick: IO{_:1b} run schedule function waitatick:core/static_ex/after 3t