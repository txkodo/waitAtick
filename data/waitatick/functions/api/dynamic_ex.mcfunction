#> waitatick:api/dynamic_ex
# 
# @input score $tick waitatick 待機後tick
# @input storage waitatick: IO ストレージに待機後に使いたいデータを入れておく
# 
# 待機後に #waitatick:callback/dynamic_ex が呼ばれる
# 
# storage waitatick: IO ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

execute if score $tick waitatick matches 1..65536 run function waitatick:core/_/dynamic_ex/append
