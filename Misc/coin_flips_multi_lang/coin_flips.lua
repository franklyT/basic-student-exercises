heads_count = 0
tails_count = 0
iterations = 1000000

for i = 0, iterations do
    if math.random(1, 2) == 1 then heads_count = heads_count + 1 else tails_count = tails_count + 1 end
end

print("Heads # ", tostring(heads_count))
print("Tails # ", tostring(tails_count))
