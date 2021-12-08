from pathlib import Path
from typing import Callable
import json
import re

path = Path(__file__).parent.absolute()
CORE_PATH = path / r'data\txqueue\functions\core'
API_PATH = path / r'data\txqueue\functions\api'
TAG_PATH = path / r'data\txqueue\tags\functions'


def genQueue(name: str,base:int = 4,index:int = 8,io_storage:str = 'txqueue: IO'):
  """
  ユーザー定義キューを追加するプログラム

  ------
  name :str
    キューの名前
    : a-z0-9-_ のみ使用可能
  base :int
    サブキューのサイズ
    : 小さい方がデータ移動回数が減る代わりにコマンド実行数が増える
    : 2以上 デフォルト4
  index :int
    サブキューのネスト数
    : baseのindex乗をスタックのサイズの目安にすると良い (それ以上格納も可能)
    : 1以上 デフォルト8
  """
  assert isinstance(name,str)
  assert isinstance(base,int)
  assert isinstance(index,int)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)
  assert 1 < base
  assert 0 < index

  initFunc = f'''# 初期化処理
scoreboard players set ${name}.len txqueue -2147483648
data modify storage txqueue:{name} template set value {"["* (index + 1) }{{}}{"]"* (index + 1) }
data modify storage txqueue:{name} data set from storage txqueue:{name} template

#>
# @internal
#define score_holder ${name}.len
#>
# @internal
#define storage txqueue:{name}'''

  enqueueFunc = f'''# length += 1
scoreboard players add ${name}.len txqueue 1

# データをheadに設定
data modify storage txqueue:{name} data[-1]{"[-1]"*index}._ set from storage {io_storage}

# headを次の位置にずらす
function txqueue:core/{name}/enqueue/1
'''

  dequeueFunc = f'''# length -= 1
scoreboard players remove ${name}.len txqueue 1

# データをtailから取得
data modify storage {io_storage} set from storage txqueue:{name} data[0]{"[0]"*index}._

# tailを次の位置にずらす
function txqueue:core/{name}/dequeue/1'''

  enqueueEachFuncGen: Callable[[int], str] = lambda x: f'''### head移動処理 {x + 1}桁目

# 繰り上がりフラグ txqueue: borrow
execute store success storage txqueue: borrow byte 1 if data storage txqueue:{name} data{"[-1]"*(index - x)}[{base - 1}]

# 繰り上がらない場合headの位置を後にずらす
execute if data storage txqueue: {{borrow:0b}} run data modify storage txqueue:{name} data{"[-1]"*(index - x)} append from storage txqueue:{name} template{"[-1]"*(index - x)}[-1]

# 繰り上がり処理
{
  f"execute if data storage txqueue: {{borrow:1b}} run function txqueue:core/{name}/enqueue/{x+2}"
  if x != index - 1 else
  f"execute if data storage txqueue: {{borrow:1b}} run data modify storage txqueue:{name} data append from storage txqueue:{name} template[-1]"
}'''

  dequeueEachFuncGen: Callable[[int], str] = lambda x: f'''### tail移動処理 {x + 1}桁目

# 繰り上がりフラグ txqueue: borrow
execute store success storage txqueue: borrow byte 1 unless data storage txqueue:{name} data{"[0]"*(index - x)}[1]

# 繰り上がらない場合tailを削除
execute if data storage txqueue: {{borrow:0b}} run data remove storage txqueue:{name} data{"[0]"*(index - x)}[0]

# 繰り上がり処理
{
  f"execute if data storage txqueue: {{borrow:1b}} run function txqueue:core/{name}/dequeue/{x + 2}"
  if x != index - 1 else
  f"execute if data storage txqueue: {{borrow:1b}} run data remove storage txqueue:{name} data[0]"
}'''

  apiEnqueueFunc = f'''#> txqueue:api/{name}.enqueue
# @input storage {io_storage} キューに追加するデータを入れる
# 
# キューにアイテムを追加
# 
# @api
execute store success storage txqueue: success byte 1 unless score ${name}.len txqueue matches 2147483647 run function txqueue:core/{name}/enqueue
'''

  apiDequeueFunc = f'''#> txqueue:api/{name}.dequeue
# @output storage {io_storage} キューから取り出されたデータが入る
# 
# キューからアイテムを取得
# 
# @api
execute store success storage txqueue: success byte 1 unless score ${name}.len txqueue matches -2147483648 run function txqueue:core/{name}/dequeue
'''

  enqueueTag = f'{{"values": ["txqueue:api/{name}.enqueue"]}}'
  dequeueTag = f'{{"values": ["txqueue:api/{name}.dequeue"]}}'

  corePath = CORE_PATH / name
  corePath.mkdir(exist_ok=True)

  (corePath/'init.mcfunction').write_text(initFunc,encoding='utf8')
  (corePath/'enqueue.mcfunction').write_text(enqueueFunc,encoding='utf8')
  (corePath/'dequeue.mcfunction').write_text(dequeueFunc,encoding='utf8')

  (API_PATH/f'{name}.enqueue.mcfunction').write_text(apiEnqueueFunc,encoding='utf8')
  (API_PATH/f'{name}.dequeue.mcfunction').write_text(apiDequeueFunc,encoding='utf8')
  (TAG_PATH/f'{name}.enqueue.json').write_text(enqueueTag,encoding='utf8')
  (TAG_PATH/f'{name}.dequeue.json').write_text(dequeueTag,encoding='utf8')

  enqueuePath = corePath / 'enqueue'
  enqueuePath.mkdir(exist_ok=True)
  dequeuePath = corePath / 'dequeue'
  dequeuePath.mkdir(exist_ok=True)

  for i in range(index):
    (dequeuePath/f'{i + 1}.mcfunction').write_text(dequeueEachFuncGen(i),encoding='utf8')
    (enqueuePath/f'{i + 1}.mcfunction').write_text(enqueueEachFuncGen(i),encoding='utf8')
  
  initjson = json.loads((TAG_PATH/'init.json').read_text(encoding='utf8'))
  initFuncs = set(initjson['values'])
  initFuncs.add(f"txqueue:core/{name}/init")
  initjson['values'] = list(initFuncs)
  (TAG_PATH/'init.json').write_text(json.dumps(initjson),encoding='utf8')