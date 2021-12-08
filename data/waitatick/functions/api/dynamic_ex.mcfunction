#> waitatick:api/dynamic_ex
# 
# @input storage waitatick: tick 待機時間 (int)
# @input storage waitatick: IO.data ストレージに待機後に使いたいデータを入れておく
# 
# 待機後に #waitatick:api/dynamic_ex が呼ばれる
# 
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

function waitatick:core/dynamic_ex/main
