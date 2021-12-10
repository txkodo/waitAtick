from pathlib import Path
import re
import json
import shutil
from typing import Optional

path = Path(__file__).parent.absolute()
CORE_PATH = path / r'data\waitatick\functions\core\_'
API_PATH = path / r'data\waitatick\functions\api'
TAG_PATH = path / r'data\waitatick\tags\functions\callback'

INIT_TAG_PATH = path / r'data\waitatick\tags\functions\core\tick.json'

tickFuncs:set[str] = set()

for p in CORE_PATH.iterdir():
  if p.is_dir():
    shutil.rmtree(p)

shutil.rmtree(TAG_PATH,ignore_errors = True)
TAG_PATH.mkdir()
shutil.rmtree(API_PATH,ignore_errors = True)
API_PATH.mkdir()

def _waitAtick(name:str,tick:Optional[int],callbacks:list[str]=[],save_executer:bool = False,save_position:bool=False):

  def setNbt(path:str):
    result = f'''
execute unless data storage waitatick: {path}.{name} run data modify storage waitatick: {path}.{name} set value []
data modify storage waitatick: {path}.{name} append value {{}}'''
    # 実行者を保存する場合実行者にIDを割り当て保存
    if save_executer:
      result += f'''
execute unless score @s waitatickID matches 1.. run function waitatick:core/id/allocate
execute store result storage waitatick: {path}.{name}[-1].as int 1 run scoreboard players get @s waitatickID
'''
    # 実行位置を保存
    if save_position:
      result += f'''
tp cbd0197a-3299-4a12-9942-ef82cc71ecf3 ~ ~ ~
function waitatick:custom/dimension
data modify storage waitatick: {path}.{name}[-1].in set from storage waitatick: in
data modify storage waitatick: {path}.{name}[-1].pos set from entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Pos
data modify storage waitatick: {path}.{name}[-1].rot set from entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Rotation
'''
    result += f'''
data modify storage waitatick: {path}.{name}[-1]._ set from storage waitatick: IO'''
    return result

  appendFunc = f'''#> waitatick:core/_/{name}/append
# @internal

execute if score $tick waitatick matches 1 run function waitatick:core/_/{name}/append.next
execute unless score $tick waitatick matches 1 run function waitatick:core/_/{name}/append.other
''' if tick is None else f'''#> waitatick:core/_/{name}/append
# @internal

{setNbt("data[1]")}
''' if tick == 1 else f'''#> waitatick:core/_/{name}/append
# @internal

scoreboard players set $tick waitatick {tick}
function waitatick:core/trie/index
{setNbt("_[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]")}
'''

  appendNextFunc = f'''#> waitatick:core/_/{name}/append.next
# @internal

{setNbt("data[1]")}
'''

  appendOtherFunc = f'''#> waitatick:core/_/{name}/append.other
# @internal

function waitatick:core/trie/index
{setNbt("_[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2]")}
'''

  callFunc = f'''#> waitatick:core/_/{name}/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].{name}[0]._'''

  if save_executer:
    callFunc += f'''
execute store result score #id_ waitatick run data get storage waitatick: data[0].{name}[0].as'''

  if save_position:
    callFunc += f'''
data modify storage waitatick: in set from storage waitatick: data[0].{name}[-1].in
function waitatick:custom/dimension_load
data modify entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Pos set from storage waitatick: data[0].{name}[0].pos
data modify entity cbd0197a-3299-4a12-9942-ef82cc71ecf3 Rotation set from storage waitatick: data[0].{name}[0].rot'''

  if save_executer and save_position:
    callFunc += f'''
execute at cbd0197a-3299-4a12-9942-ef82cc71ecf3 as @e if score @s waitatickID = #id_ waitatick run function #waitatick:callback/{name}'''
  elif save_executer:
    callFunc += f'''
execute as @e if score @s waitatickID = #id_ waitatick run function #waitatick:callback/{name}'''
  elif save_position:
    callFunc += f'''
execute at cbd0197a-3299-4a12-9942-ef82cc71ecf3 run function #waitatick:callback/{name}'''
  else:
    callFunc += f'''
function #waitatick:callback/{name}'''

  if save_position:
    callFunc += f'''
execute in minecraft:overworld run tp cbd0197a-3299-4a12-9942-ef82cc71ecf3 0 0 0'''

  callFunc += f'''
data remove storage waitatick: data[0].{name}[0]
execute if data storage waitatick: data[0].{name}[0] run function waitatick:core/_/{name}/call
'''
  tickFunc = f'''#> waitatick:core/_/{name}/tick
# @internal
execute if data storage waitatick: data[0].{name}[0] run function waitatick:core/_/{name}/call'''

  apiFunc = f'''#> waitatick:api/{name}
# 
# @input score $tick waitatick 待機後tick
# @input storage waitatick: IO ストレージに待機後に使いたいデータを入れておく
# 
# 待機後に #waitatick:callback/{name} が呼ばれる
# 
# storage waitatick: IO ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

execute if score $tick waitatick matches 1..65536 run function waitatick:core/_/{name}/append
''' if tick is None else f'''#> waitatick:api/{name}
# 
# @input storage waitatick: IO ストレージに待機後に使いたいデータを入れておく
# 
# 待機後に #waitatick:callback/{name} が呼ばれる
# 
# storage waitatick: IO ストレージに入れたデータが待機後に同ストレージに帰ってくる
# 
# @api

function waitatick:core/_/{name}/append
'''

  tagJson = f'''{{"values": [{ ','.join(f'"{i}"' for i in callbacks)}]}}'''

  core_path = CORE_PATH / name
  core_path.mkdir(exist_ok=True)
  (core_path / f'append.mcfunction').write_text(appendFunc,encoding='utf8')
  if tick == None:
    (core_path / f'append.next.mcfunction').write_text(appendNextFunc,encoding='utf8')
    (core_path / f'append.other.mcfunction').write_text(appendOtherFunc,encoding='utf8')
  (core_path / f'call.mcfunction').write_text(callFunc,encoding='utf8')
  (core_path / f'tick.mcfunction').write_text(tickFunc,encoding='utf8')

  (TAG_PATH / f'{name}.json').write_text(tagJson,encoding='utf8')  
  (API_PATH / f'{name}.mcfunction').write_text(apiFunc,encoding='utf8')

  tickFuncs.add(f'waitatick:core/_/{name}/tick')
  INIT_TAG_PATH.write_text(json.dumps({"values":list(tickFuncs)}),encoding='utf8')


def waitAtickDynamic(name:str,callbacks:list[str]=[],save_executer:bool = False,save_position:bool=False):
  assert isinstance(name,str)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)
  _waitAtick(name,None,callbacks,save_executer,save_position)

def waitAtickStatic(name:str,tick:int,callbacks:list[str]=[],save_executer:bool = False,save_position:bool=False):
  assert isinstance(tick,int)
  assert 1 <= tick <= 65536
  assert isinstance(name,str)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)
  _waitAtick(name,tick,callbacks,save_executer,save_position)
