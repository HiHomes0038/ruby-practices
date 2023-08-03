# frozen_string_literal: true

score = ARGV[0]

scores = score.split(',')
shots = scores.map do |s|
  if s == 'X'
    10
  else
    s.to_i
  end
end

total_score = (1..9).sum do
  if shots[0] == 10
    shots.shift + shots[0..1].sum
  elsif shots[0..1].sum == 10
    shots.shift(2).sum + shots[0]
  else
    shots.shift(2).sum
  end
end

total_score += shots.sum
p total_score
