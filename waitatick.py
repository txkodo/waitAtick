from pathlib import Path
import re
import json
import shutil

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

def waitAtickDynamic(name:str,callbacks:list[str]=[]):
  assert isinstance(name,str)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)

  appendFunc = f'''#> waitatick:core/_/{name}/append
# @internal

execute if score $tick waitatick matches 1 run function waitatick:core/_/{name}/append.next
execute unless score $tick waitatick matches 1 run function waitatick:core/_/{name}/append.other
'''

  appendNextFunc = f'''#> waitatick:core/_/{name}/append.next
# @internal

execute unless data storage waitatick: data[1].{name} run data modify storage waitatick: data[1].{name} set value []
data modify storage waitatick: data[1].{name} append from storage waitatick: IO
'''

  appendOtherFunc = f'''#> waitatick:core/_/{name}/append.other
# @internal

function waitatick:core/trie/index
execute unless data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} set value []
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} append from storage waitatick: IO
'''

  callFunc = f'''#> waitatick:core/_/{name}/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].{name}[0]
data remove storage waitatick: data[0].{name}[0]
function #waitatick:callback/{name}
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
'''

  tagJson = f'''{{"values": [{ ','.join(f'"{i}"' for i in callbacks)}]}}'''

  core_path = CORE_PATH / name
  core_path.mkdir(exist_ok=True)
  (core_path / f'append.mcfunction').write_text(appendFunc,encoding='utf8')
  (core_path / f'append.next.mcfunction').write_text(appendNextFunc,encoding='utf8')
  (core_path / f'append.other.mcfunction').write_text(appendOtherFunc,encoding='utf8')
  (core_path / f'call.mcfunction').write_text(callFunc,encoding='utf8')
  (core_path / f'tick.mcfunction').write_text(tickFunc,encoding='utf8')

  (TAG_PATH / f'{name}.json').write_text(tagJson,encoding='utf8')  
  (API_PATH / f'{name}.mcfunction').write_text(apiFunc,encoding='utf8')

  tickFuncs.add(f'waitatick:core/_/{name}/tick')
  INIT_TAG_PATH.write_text(json.dumps({"values":list(tickFuncs)}),encoding='utf8')

def waitAtickStatic(name:str,tick:int,callbacks:list[str]=[]):
  assert isinstance(tick,int)
  assert 1 <= tick <= 65536
  assert isinstance(name,str)
  assert re.fullmatch( '[a-z0-9_-]+' ,name)

  appendNextFunc = f'''#> waitatick:core/_/{name}/append
# @internal

execute unless data storage waitatick: data[1].{name} run data modify storage waitatick: data[1].{name} set value []
data modify storage waitatick: data[1].{name} append from storage waitatick: IO
'''

  appendOtherFunc = f'''#> waitatick:core/_/{name}/append
# @internal

scoreboard players set $tick waitatick {tick}
function waitatick:core/trie/index
execute unless data storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} run data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} set value []
data modify storage waitatick: _[-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2][-2].{name} append from storage waitatick: IO
'''

  callFunc = f'''#> waitatick:core/_/{name}/call
# @internal

data modify storage waitatick: IO set from storage waitatick: data[0].{name}[0]
data remove storage waitatick: data[0].{name}[0]
function #waitatick:callback/{name}
execute if data storage waitatick: data[0].{name}[0] run function waitatick:core/_/{name}/call
'''
  tickFunc = f'''#> waitatick:core/_/{name}/tick
# @internal
execute if data storage waitatick: data[0].{name}[0] run function waitatick:core/_/{name}/call'''

  apiFunc = f'''#> waitatick:api/{name}
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
  (core_path / f'append.mcfunction').write_text((appendNextFunc if tick == 1 else appendOtherFunc),encoding='utf8')
  (core_path / f'call.mcfunction').write_text(callFunc,encoding='utf8')
  (core_path / f'tick.mcfunction').write_text(tickFunc,encoding='utf8')

  (TAG_PATH / f'{name}.json').write_text(tagJson,encoding='utf8')  
  (API_PATH / f'{name}.mcfunction').write_text(apiFunc,encoding='utf8')  

  tickFuncs.add(f'waitatick:core/_/{name}/tick')
  INIT_TAG_PATH.write_text(json.dumps({"values":list(tickFuncs)}),encoding='utf8')
