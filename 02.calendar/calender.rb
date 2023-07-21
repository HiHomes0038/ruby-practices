require 'date'
require 'optparse'

# 引数を受け取るためのOptionParserオブジェクトを生成
opt = OptionParser.new

# 西暦と月を管理するためのハッシュ
options = {}

# オプションの設定
opt.on("-m [MONTH]", "Specify the month") {|month| options[:month] = month.to_i}
opt.on("-y [YEAR]", "Specify the year") {|year| options[:year] = year.to_i}

# オプションが指定されていない場合は現在の月と年を取得するため、デフォルト値として設定
today = Date.today
options[:month] = today.mon
options[:year] = today.year

# 引数の解析
# 引数の設定がある場合は、上のoptions[:month]とoptions[:year]の値が上書きされる
opt.parse!(ARGV)

# カレンダー出力で必要な情報を作る（表示する月の初日と最終日のDateオブジェクト）
first_day_of_month = Date.new(options[:year], options[:month], 1)
last_day_of_month = Date.new(options[:year], options[:month], -1)

# 出力用の西暦と月の情報を作る
month = options[:month].to_s.rjust(2)
year = options[:year].to_s.rjust(4)

# 最初のMM月YYYY年を出力
puts "      #{month}月 #{year}      "

# カレンダーに曜日を表示する
puts " 日 月 火 水 木 金 土"

# 初日までのスペースを表示
print "   " * first_day_of_month.wday

# 日付を表示していく
(first_day_of_month..last_day_of_month).each do |date|
  print date.day.to_s.rjust(3)
  print "\n" if date.wday == 6
end
