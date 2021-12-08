from pathlib import Path
import re
from typing import Callable
from queueGenerator import genQueue

def dynaimcQueueName(tick:int) -> str:
  return f'_d{tick}'

def staticQueueName(tick:int) -> str:
  return f'_s{tick}'

# ユーザー定義キューの生成
for i in range(16):
  genQueue(dynaimcQueueName(i),io_storage='waitatick: IO')

path = Path(__file__).parent.absolute()
CORE_PATH = path / r'data\waitatick\functions\core'
API_PATH = path / r'data\waitatick\functions\api'
TAG_PATH = path / r'data\waitatick\tags\functions'

def waitAtickDynamic(name:str,callbacks:list[str]=[]):
  assert isinstance(name,str)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)

  mainFunc = f'''#> waitatick:core/{name}/main
# 
# メイン処理
# 
# @input storage waitatick: TICK
# @input storage waitatick: IO.data
# 
# @internal

# storage waitatick: IO.tick を生成
function waitatick:core/explode

# データ準備済みフラグ = true
data modify storage waitatick: ready set value 1b

data modify storage waitatick: IO._ set from storage waitatick: IO.tick[15]
# IO.id[15] == 1b
execute if data storage waitatick: IO{{_:1b}} run function txqueue:api/{dynaimcQueueName(15)}.enqueue
execute if data storage waitatick: IO{{_:1b}} run schedule function waitatick:core/{name}/15 32768t
# IO.id[15] == 0b
execute if data storage waitatick: IO{{_:0b}} run function waitatick:core/{name}/15

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b
'''

  eachFuncGen:Callable[[int],str] = lambda i: f'''#> waitatick:core/{name}/{i}
# @internal

# データ移動済みフラグ == false => キューから取得 & データ移動済みフラグ = true
execute store result storage waitatick: ready byte 1 if data storage waitatick: {{ready:0b}} run function txqueue:api/{dynaimcQueueName(i)}.dequeue

{
  f"""data modify storage waitatick: IO._ set from storage waitatick: IO.id[{i-1}]
# IO.id[{i-1}] == 1b
execute if data storage waitatick: IO{{_:1b}} run function txqueue:api/{dynaimcQueueName(i-1)}.enqueue
execute if data storage waitatick: IO{{_:1b}} run schedule function waitatick:core/{name}/{i-1} {2**(i-1)}t
# IO.id[{i-1}] == 0b
execute if data storage waitatick: IO{{_:0b}} run function waitatick:core/{name}/{i-1}"""
  if i != 0 else
  f"""function #waitatick:{name}"""
}

# データ移動済みフラグ = false
data modify storage waitatick: ready set value 0b'''
  
  apiFunc = f'''#> waitatick:api/{name}
# 
# @input storage waitatick: tick 待機時間 (int)
# @input storage waitatick: IO.data ストレージに待機後に使いたいデータを入れておく
# 
# 待機後に #waitatick:api/{name} が呼ばれる
# 
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

function waitatick:core/{name}/main
'''

  tagJson = f'''{{"values": [{ ','.join(f'"{i}"' for i in callbacks)}]}}'''

  core_path = CORE_PATH / name
  core_path.mkdir(exist_ok=True)
  (core_path / f'main.mcfunction').write_text(mainFunc,encoding='utf8')
  for i in range(16):
    (core_path / f'{i}.mcfunction').write_text(eachFuncGen(i),encoding='utf8')

  (TAG_PATH / f'{name}.json').write_text(tagJson,encoding='utf8')  
  (API_PATH / f'{name}.mcfunction').write_text(apiFunc,encoding='utf8')  

staticQueues:set[int] = set()

def waitAtickStatic(name:str,tick:int,callbacks:list[str]=[]):
  assert isinstance(name,str)
  assert isinstance(tick,int)
  assert re.match( '[a-z0-9_-]+' ,name)
  assert 0 < tick < 2 ** 16

  mainFunc = f'''#> waitatick:core/{name}/main
# 
# メイン処理
# 待機時間 3tick
# 
# @input storage waitatick: IO.data
# 
# @internal

execute if data storage waitatick: IO{{_:1b}} run function txqueue:api/{staticQueueName(tick)}.enqueue
execute if data storage waitatick: IO{{_:1b}} run schedule function waitatick:core/{name}/after {tick}t'''

  afterFunc = f'''#> waitatick:core/{name}/after
# @internal

# キューからデータを取得
function txqueue:api/{staticQueueName(tick)}.dequeue
function #waitatick:{name}'''

  apiFunc = f'''#> waitatick:api/{name}
# 
# @input storage waitatick: tick 待機時間 (int)
# 
# 待機後に #waitatick:api/{name} が呼ばれる
# 
# storage waitatick: IO.data ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

function waitatick:core/{name}/main
'''
  # 定数tick用のキューを生成存在した場合は無視
  if tick not in staticQueues:
    staticQueues.add(tick)
    genQueue(staticQueueName(tick),io_storage='waitatick: IO')

  tagJson = f'''{{"values": [{ ','.join(f'"{i}"' for i in callbacks)}]}}'''

  core_path = CORE_PATH / name
  core_path.mkdir(exist_ok=True)
  (core_path / f'main.mcfunction').write_text(mainFunc,encoding='utf8')
  (core_path / f'after.mcfunction').write_text(afterFunc,encoding='utf8')
  
  (TAG_PATH / f'{name}.json').write_text(tagJson,encoding='utf8')  
  (API_PATH / f'{name}.mcfunction').write_text(apiFunc,encoding='utf8')
