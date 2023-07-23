# frozen_string_literal: true

# コマンドライン引数からスコアを受け取る
score = ARGV[0]
# 1投ごとに分割する
scores = score.split(',')
# 数字に変換する
shots = []
scores.each do |s|
  shots << if s == 'X'
             10
           else
             s.to_i
           end
end

# 変数を準備
# トータルスコアを保持するための変数
total_score = 0

# 加算処理
# 10フレームは固定のため10回の繰り返し処理を定義
(1..10).each do |frame_index|
  # 9フレーム目までの加算処理
  if frame_index < 10
    # ストライクの場合
    if shots[0] == 10
      # ストライク分のスコアと次の2投分のスコアを加算
      total_score += 10 + shots[1] + shots[2]
      # このフレームのスコアをshotsから削除
      shots.shift
    # スペアの場合
    elsif shots[0] + shots[1] == 10
      # スペア分と次の1投分のスコアを加算
      total_score += 10 + shots[2]
      # このフレームのスコアをshotsから削除
      shots.shift(2)
    else
      # 1フレーム分（2投分）のスコアを加算
      total_score += shots[0] + shots[1]
      # このフレームのスコアをshotsから削除
      shots.shift(2)
    end
  # 10フレーム目の加算処理
  else
    # shotsに残ったスコアをすべて加算
    total_score += shots.sum
  end
end

p total_score
