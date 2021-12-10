### 初期化
data modify storage waitatick: load set value 1b
data modify storage waitatick: _ set value [[],[]]
data modify storage waitatick: _[] set value [[],[]]
data modify storage waitatick: _[][] set value [[],[]]
data modify storage waitatick: _[][][] set value [[],[]]
data modify storage waitatick: _[][][][] set value [[],[]]
data modify storage waitatick: _[][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][][][][][] set value [[],[]]
data modify storage waitatick: _[][][][][][][][][][][][][][][] set value [{},{}]

data modify storage waitatick: data set value [{},{}]
data modify storage waitatick: id set value [0]

scoreboard objectives add waitatickID dummy
scoreboard objectives add waitatick dummy
scoreboard players set #current waitatick 0
scoreboard players set #next waitatick 1
scoreboard players set #65536 waitatick 65536
scoreboard players set #32768 waitatick 32768

#define storage waitatick:
#define objective waitatick
#define score_holder $tick
#define score_holder #65536
#define score_holder #current
#define score_holder #size
#define score_holder #index
#define score_holder #_index
#define score_holder #_index
#define score_holder #id_
