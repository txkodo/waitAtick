from waitatick import waitAtickDynamic, waitAtickStatic

# デフォルトのmainスケジュールの作成
waitAtickDynamic('dynamic_ex',["example:dynamic_callback"])

waitAtickStatic('static_ex',10,["example:static_callback"])