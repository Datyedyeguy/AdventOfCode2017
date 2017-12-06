file = io.open("input", "r")
data = {}

for line in file:lines() do
	table.insert(data, line)
end

file:close();

index = 1
steps = 0

while (index > 0 and index <= #data) do
	movement = data[index]
	data[index] = movement + 1
	index = index + movement
	steps = steps + 1
end

print("Part 1: " .. steps)

file = io.open("input", "r")
data = {}

for line in file:lines() do
	table.insert(data, line)
end

file:close();

index = 1
steps = 0

while (index > 0 and index <= #data) do
	movement = tonumber(data[index])

	if (movement > 2) then
		data[index] = movement - 1
	else
		data[index] = movement + 1
	end
	
	index = index + movement
	steps = steps + 1
end

print("Part 2: " .. steps)