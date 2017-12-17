function do_round(length)
	local left = current_position
	local right = current_position + length - 1
	local goal = math.ceil((right - left) / 2) + left

	if (right > #marks) then
		right = right - #marks
	end

	if (goal > #marks) then
		goal = goal - #marks
	end

	while (left ~= goal) do
		local temp = marks[left]
		marks[left] = marks[right]
		marks[right] = temp

		left = left + 1
		right = right - 1

		if (left > #marks) then
			left = left - #marks
		end

		if (right < 1) then
			right = right + #marks
		end
	end

	current_position = current_position + length + skip_size
	skip_size = skip_size + 1

	while (current_position > #marks) do
		current_position = current_position - #marks
	end
end

file = io.open("input", "r")
data = file:read()
file:close()

marks = {}

for i=1, 256 do
	table.insert(marks, i-1)
end

current_position = 1
skip_size = 0

for length in data:gmatch("%w+") do
	do_round(length)
end

print("Part 1: " .. (marks[1] * marks[2]))

file = io.open("input", "r")
data = file:read()
file:close()

marks = {}

for i=1, 256 do
	table.insert(marks, i-1)
end

current_position = 1
skip_size = 0

converted_data = {}

for i=1, #data do
	table.insert(converted_data, string.byte(data, i))
end

table.insert(converted_data, 17)
table.insert(converted_data, 31)
table.insert(converted_data, 73)
table.insert(converted_data, 47)
table.insert(converted_data, 23)

for l=1, 64 do
	for i=1, #converted_data do
		do_round(converted_data[i])
	end
end

hash = {}

for i=0, 15 do
	local value = 0

	for j=1, 16 do
		value = value ~ marks[(i*16)+j]
	end

	table.insert(hash, value)
end

result = ""

for i=1, #hash do
	result = result .. string.format("%02x", hash[i])
end

print("Part 2: " .. result)