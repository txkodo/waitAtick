from waitatick import waitAtickDynamic, waitAtickStatic

### dynamic_exスケジュールの作成
# スケジュール名、待機後に実行する関数のリストを引数に取る
waitAtickDynamic('dynamic_ex',["example:dynamic_callback"])

### static_exスケジュールの作成
# スケジュール名、待機時間(チック)、待機後に実行する関数のリストを引数に取る
waitAtickStatic('static_ex',10,["example:static_callback"])