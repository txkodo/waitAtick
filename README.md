# waitAtick
schedule後にstorageのデータを持ち越せる、動的scheduleデータパックライブラリ

#### 静的schedule
決められた値だけtickが経った後にファンクションタグを起動する

```mcfunction
# ストレージに待機後に使いたいデータを入れておく
data modify storage waitatick: IO.data set value {foo:bar}

# ファンクションを実行
function waitatick:api/${name}

# 待機後に #waitatick:api/${name} が呼ばれる
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
```
※ ${name} はデフォルトでは static_ex

#### 動的schedule
storageの値だけtickが経った後にファンクションを起動する

```mcfunction
# ストレージに待機後に使いたいデータを入れておく
data modify storage waitatick: IO.data set value {foo:bar}

# 待機チック数を入力
data modify storage waitatick: tick set value 10

# ファンクションを実行
function waitatick:api/${name}

# 待機後に #waitatick:api/dynamic_ex が呼ばれる
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
```
※ ${name} はデフォルトでは dynamic_ex

### 依存ライブラリ
txQueue@txkodo
https://github.com/txkodo/txQueue.git
