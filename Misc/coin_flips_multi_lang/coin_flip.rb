# frozen_string_literal: true

heads_count = 0
tails_count = 0
max_iterations = 100_000

(0..max_iterations).each do
  rand(1..2) == 1 ? heads_count += 1 : tails_count += 1
end

puts('Heads #: ' + String(heads_count))
puts('Tails #: ' + String(tails_count))
