#> waitatick:api/static_ex
# 
# @input storage waitatick: tick 待機時間 (int)
# 
# 待機後に #waitatick:api/static_ex が呼ばれる
# 
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

function waitatick:core/static_ex/main
