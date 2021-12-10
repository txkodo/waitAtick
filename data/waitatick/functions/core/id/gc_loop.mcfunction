#> waitatick:core/id/gc_loop
# @internal

### Copyright © 2021 txkodo
### This software is released under the MIT License, see LICENSE.
### Copyright © 2020 赤石愛
### This software is released under the MIT License, see LICENSE.

### 割り当て解放

# 割り当て済みIDを削除
data remove storage waitatick: id[0]
# 不要なデータを解放(先頭から続く基準より大きいIDは全部要らない)
execute store result score #id_ waitatickID run data get storage waitatick: id[0]
execute if score #id_ waitatickID > #id_ waitatick run function waitatick:core/id/gc_loop
