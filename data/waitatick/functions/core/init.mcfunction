### 初期化
data modify storage waitatick: load set value 1b
scoreboard objectives add waitatick dummy

#define storage waitatick:
#define objective waitatick
#define score_holder $tick
