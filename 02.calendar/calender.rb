require 'date'
require 'optparse'

opt = OptionParser.new
options = { month: Date.today.mon, year: Date.today.year }

opt.on("-m [MONTH]", "Specify the month") {|month| options[:month] = month.to_i}
opt.on("-y [YEAR]", "Specify the year") {|year| options[:year] = year.to_i}
opt.parse!(ARGV)

first_date = Date.new(options[:year], options[:month], 1)
last_date = Date.new(options[:year], options[:month], -1)
month = options[:month].to_s.rjust(2)
year = options[:year].to_s.rjust(4)

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"
print "   " * first_date.wday
(first_date..last_date).each do |date|
  print date.day.to_s.rjust(2)
  print " "
  print "\n" if date.saturday?
end
