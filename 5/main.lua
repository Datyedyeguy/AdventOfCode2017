file = io.open("input", "r")
data = {}

for line in file:lines() do
	table.insert(data, line)
end

index = 1
steps = 0

while (index > 0 and index <= #data) do
	movement = data[index]
	data[index] = movement + 1
	index = index + movement
	steps = steps + 1
end

file:close();
print("Part 1: " .. steps)