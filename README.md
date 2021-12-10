# waitAtick
schedule後にstorageのデータを持ち越せる、動的scheduleデータパックライブラリ
schedule後も実行者・実行位置schedule後も実行位置が変わらないようにもできる

### example
2つの例が同梱されている
```mcfunction
# 静的スケジュールのテスト
# 待機時間は10tick固定
# 待機後にexample:static_callbackが呼ばれ、実行者にアイテムが渡される
function example:static_example
```
```mcfunction
# 動的スケジュールのテスト
# ファンクションの中身を書き換えると待機時間を変更できる
# 待機後にexample:dynaimc_callbackが呼ばれ、実行位置にブロックが設置される
function example:dynamic_example
```

#### 静的schedule
決められた値だけtickが経った後にファンクションタグを起動する

```mcfunction
# ストレージに待機後に使いたいデータを入れておく
data modify storage waitatick: IO set value {foo:bar}

# ファンクションを実行
function waitatick:api/${name}

# 待機後に #waitatick:callback/${name} が呼ばれる
# storage waitatick: IO ストレージに入れたデータが待機後に同ストレージに帰ってくる
```
※ ${name} はデフォルトでは static_ex

#### 動的schedule
storageの値だけtickが経った後にファンクションタグを起動する

```mcfunction
# ストレージに待機後に使いたいデータを入れておく
data modify storage waitatick: IO set value {foo:bar}

# 待機チック数を入力
scoreboard players set $tick waitatick 30

# ファンクションを実行
function waitatick:api/${name}

# 待機後に #waitatick:callback/${name} が呼ばれる
# storage waitatick: IO ストレージに入れたデータが待機後に同ストレージに帰ってくる
```
※ ${name} はデフォルトでは dynamic_ex


# スケジュールの新規生成

組み込みのpythonファイルを実行することでスケジュールを増やすことができる。

```Python
main.py

from waitatick import waitAtickDynamic, waitAtickStatic

### dynamic_exスケジュールの作成
# スケジュール名、待機後に実行する関数のリスト、実行者を引き継ぐか、実行位置を引き継ぐかを引数に取る
waitAtickDynamic('dynamic_ex',["example:dynamic_callback"],False,True)

### static_exスケジュールの作成
# スケジュール名、待機時間(チック)、待機後に実行する関数のリスト、実行者を引き継ぐか、実行位置を引き継ぐかを引数に取る
waitAtickStatic('static_ex',10,["example:static_callback"],True)
```
